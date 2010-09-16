From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 Sep 2010 09:56:16 +0200
Subject: [Buildroot] [git commit master 1/1] fs/skeleton: remove ancient
	.bashrc
Message-ID: <20100916075849.4BA4D8A666@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c106fdbd100f36fe3329360af8f656566937f00a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It contains a bunch of semi-random aliases confusing users, and sets
a bunch of environment variables which are already provided by bash by
default.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/root/.bashrc |   48 ----------------------------------------------
 1 files changed, 0 insertions(+), 48 deletions(-)
 delete mode 100644 fs/skeleton/root/.bashrc

diff --git a/fs/skeleton/root/.bashrc b/fs/skeleton/root/.bashrc
deleted file mode 100644
index d13c8f9..0000000
--- a/fs/skeleton/root/.bashrc
+++ /dev/null
@@ -1,48 +0,0 @@
-# ~/.bashrc: executed by bash(1) for non-login interactive shells.
-
-export PATH=\
-/bin:\
-/sbin:\
-/usr/bin:\
-/usr/sbin:\
-/usr/bin/X11:\
-/usr/local/bin
-
-# If running interactively, then:
-if [ "$PS1" ]; then
-
-    if [ "$BASH" ]; then
-	export PS1="[\u@\h \W]\\$ "
-    else
-      if [ "`id -u`" -eq 0 ]; then 
-	export PS1='# '
-      else
-	export PS1='$ '
-      fi
-    fi
-
-    export USER=`id -un`
-    export LOGNAME=$USER
-    export HOSTNAME=`/bin/hostname`
-    export HISTSIZE=1000
-    export HISTFILESIZE=1000
-    export PAGER='/bin/more '
-    export EDITOR='/bin/vi'
-    export INPUTRC=/etc/inputrc
-    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
-    export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
-
-    ### Some aliases
-    alias ps2='ps facux '
-    alias ps1='ps faxo "%U %t %p %a" '
-    alias af='ps af'
-    alias cls='clear'
-    alias ll='/bin/ls --color=tty -laFh'
-    alias ls='/bin/ls --color=tty -F'
-    alias df='df -h'
-    alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75 -lp -npcs -npsl -nsc -nsob -nss -ts4 '
-    #alias bc='bc -l'
-    alias minicom='minicom -c on'
-    alias calc='calc -Cd '
-    alias bc='calc -Cd '
-fi;
-- 
1.7.1
