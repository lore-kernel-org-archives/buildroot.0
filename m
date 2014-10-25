From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 18:40:36 +0200
Subject: [Buildroot] [git commit] skeleton/etc/profile: drop aliases
Message-ID: <20141025164228.D26F3AF43D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bca37ec97d06c2209007ef1c91328bb2cffc669f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They all depend on having a custom busybox config and/or fully featured
utilities which depend on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/profile |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index 640f6f1..3812dda 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -33,17 +33,6 @@ if [ "$PS1" ]; then
     export INPUTRC=/etc/inputrc
     export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
 
-    ### Some aliases
-    alias ps2='ps facux '
-    alias ps1='ps faxo "%U %t %p %a" '
-    alias af='ps af'
-    alias cls='clear'
-    alias df='df -h'
-    alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75 -lp -npcs -npsl -nsc -nsob -nss -ts4 '
-    #alias bc='bc -l'
-    alias minicom='minicom -c on'
-    alias calc='calc -Cd '
-    alias bc='calc -Cd '
 fi;
 
 # Source configuration files from /etc/profile.d
