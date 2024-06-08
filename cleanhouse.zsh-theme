#Author : CleanHouse <Jew> https://github.com/yotsaphonliu/cleanhouse.git

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}「%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[white]」%}"
ZSH_THEME_GIT_PROMPT_DIRTY="∅"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local local_time="%*"

local host_name="%{$fg[green]%} ${(C)${(%):-%n}[1]}${${(%):-%n}[2,-1]}"
local time_string="%{$fg[white]%}${local_time}"

PROMPT='[%F{blue} %~%f]$(git_prompt_info)%{$reset_color%} 
${host_name}${hosr}%{$reset_color%} %{$fg[white]%}❯%{$reset_color%} '

RPROMPT='~ ${time_string} %{$reset_color%}[%F{green} $(get_ip_address)%f]'

get_ip_address() {
  if [[ -n "$(networksetup -getinfo Wi-Fi | grep 'Subnet mask: ')" ]]; then
    echo "%{$fg[green]%}$(ifconfig en0 | awk '/inet / {print $2}')%{$reset_color%}"
  else
    echo "%{$fg[red]%}No IP%{$reset_color%}"
  fi
}

