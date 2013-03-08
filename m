From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Fri,  8 Mar 2013 11:11:30 +0100
Subject: [Buildroot] [PATCH 2/2] Fix PS1
In-Reply-To: <1362737490-26398-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
References: <1362737490-26398-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <1362737490-26398-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change prompt when switching to root by su.

Signed-off-by: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
---
 system/skeleton/etc/profile |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index 31d3180..7586f39 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -17,11 +17,7 @@ if [ "$PS1" ]; then
 	alias ls='/bin/ls --color=tty -F'
 	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
     else
-      if [ "`id -u`" -eq 0 ]; then 
-	export PS1='# '
-      else
-	export PS1='$ '
-      fi
+	export PS1='\$ '
     fi
 
     export USER=`id -un`
-- 
1.7.1
