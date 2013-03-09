From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 22:08:04 +0100
Subject: [Buildroot] [PATCH 2/2] Fix PS1
In-Reply-To: <1362737490-26398-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
 (Jan Viktorin's message of "Fri, 8 Mar 2013 11:11:30 +0100")
References: <1362737490-26398-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1362737490-26398-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <87k3pg1du3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Viktorin <xvikto03@stud.fit.vutbr.cz> writes:

 Jan> Change prompt when switching to root by su.

A more detailed commit message would be good.

The problem with \$ is that busybox (ash) only supports it if
CONFIG_FEATURE_EDITING_FANCY_PROMPT is enabled, so that's not really
nice.

 Jan> Signed-off-by: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
 Jan> ---
 Jan>  system/skeleton/etc/profile |    6 +-----
 Jan>  1 files changed, 1 insertions(+), 5 deletions(-)

 Jan> diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
 Jan> index 31d3180..7586f39 100644
 Jan> --- a/system/skeleton/etc/profile
 Jan> +++ b/system/skeleton/etc/profile
 Jan> @@ -17,11 +17,7 @@ if [ "$PS1" ]; then
 Jan>  	alias ls='/bin/ls --color=tty -F'
 Jan>  	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
 Jan>      else
 Jan> -      if [ "`id -u`" -eq 0 ]; then 
 Jan> -	export PS1='# '
 Jan> -      else
 Jan> -	export PS1='$ '
 Jan> -      fi
 Jan> +	export PS1='\$ '
 Jan>      fi
 
 Jan>      export USER=`id -un`
 Jan> -- 
 Jan> 1.7.1

 Jan> _______________________________________________
 Jan> buildroot mailing list
 Jan> buildroot at busybox.net
 Jan> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
