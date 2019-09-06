From: Lubomir Rintel <lkundrak@v3.sk>
Date: Fri,  6 Sep 2019 11:25:09 +0200
Subject: [Buildroot] [PATCH] skeleton: drop PAGER
Message-ID: <20190906092509.2610241-1-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There doesn't seem to be possible to track down the reason why the  profile
sets $PAGER other than that it has always been there.

However, it defeats pager autodetection by various tool (systemctl, nmcli,
etc.) that would otherwise prefer less to more, in case both were available.

Let's drop it. My desktop Linux distro (Fedora) doesn't seem to set it
either and the universe doesn't seem to have collapsed yet.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 system/skeleton/etc/profile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index db29e44920..0545277086 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -8,7 +8,6 @@ if [ "$PS1" ]; then
 	fi
 fi
 
-export PAGER='/bin/more'
 export EDITOR='/bin/vi'
 
 # Source configuration files from /etc/profile.d
-- 
2.21.0
