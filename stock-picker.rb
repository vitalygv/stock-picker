def stock_picker(arr)
  res_arr = []
  for i in 0..arr.length-1 do
    income_curr = arr.reduce(Array.new) do |diff, curr_num|
      if arr.index(curr_num) > arr.index(arr[i]) && curr_num - arr[i] > 0
        diff << [arr.index(arr[i]), arr.index(curr_num), curr_num - arr[i]]
      end
      diff
    end
    res_arr << income_curr
  end

  if res_arr.flatten.empty?
    puts 'Bear market'
  else
    fin = res_arr.flatten(1).uniq.sort_by { |num| num.last }
    profit = fin.last.last
    fin = fin.last.first(2)
    p "Best day to buy is day #{fin.first}, best day to sell is day #{fin.last} with profit of #{profit}"
  end
end

stock_picker([17,3,6,9,15,8,6,1,10])

stock_picker([17, 16, 15, 14, 13, 8, 6, 3, 2])
