From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Oct 2014 20:30:57 -0300
Subject: [Buildroot] [PATCH 3/3] skeleton/etc/profile: drop aliases
In-Reply-To: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413761457-25565-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They all depend on having a custom busybox config and/or fully featured
utilities which depend on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/skeleton/etc/profile | 11 -----------
 1 file changed, 11 deletions(-)

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
-- 
2.0.4
