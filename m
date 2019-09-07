From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 21:58:04 +0200
Subject: [Buildroot] [git commit] system/skeleton: drop PAGER from
 /etc/profile
Message-ID: <20190907195416.562CB8CA21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40322675073dc17590c4d2dce067ca3f1fee96ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We couldn't track down the reason why the profile sets $PAGER other
than that it has always been there.

However, it defeats pager autodetection by various tool (systemctl,
nmcli, etc.) that would otherwise prefer less to more, in case both
were available.

Let's drop it. My desktop Linux distro (Fedora) doesn't seem to set it
either and the universe doesn't seem to have collapsed yet.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
