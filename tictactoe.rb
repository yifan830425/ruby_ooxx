WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6]
]
 

def play(board,counter)


puts " 請輸入位置 1~9 "
input = gets.chomp

position = input.to_i - 1
board[position] = player(counter)
display_board(board)
  
end


def display_board(board)
  
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def round(board)
  counter = 1
  while counter <=9  && !won?(board)
    puts "第 #{counter}回合 輪到#{player(counter)}"
    play(board,counter)
    counter = counter + 1
  end
    
  if won?(board)
      puts "#{player(counter)} 贏了！"
    else
      puts "平手！沒有人贏！"
    end

  puts "遊戲結束"

end
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" ) || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O" )
      return win_combo
    end
  end
  return false

end
  


def player(counter)
  
  if counter % 2 == 0
    return "X"

  else 
    return "O"
  end

end

# def winner(board)
#   win_combo = won?(board)
#   if win_combo
#     winner = board[win_combo[0]]
#     return winner
#   end
# end
############################

puts "初始位置圖"
display_board([1,2,3,4,5,6,7,8,9])

board = [" "," "," "," "," "," "," "," "," "]

round(board)