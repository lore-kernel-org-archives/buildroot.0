From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:50:49 +0200
Subject: [Buildroot] [git commit] skeleton: PAGER without blank and unset at
 end of for loop
Message-ID: <20180605164929.7524783B44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=903b8446a8db2aff042cdefd398d3598023bed0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The PAGER environment variable is including a blank character at the
end. Remove this.
A for loop has been unsetting the variable inside the loop, this is only
needed once at the end of the loop.

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 system/skeleton/etc/profile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index 3a97427fdf..1255d23ff4 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -8,7 +8,7 @@ if [ "$PS1" ]; then
 	fi
 fi
 
-export PAGER='/bin/more '
+export PAGER='/bin/more'
 export EDITOR='/bin/vi'
 
 # Source configuration files from /etc/profile.d
@@ -16,5 +16,5 @@ for i in /etc/profile.d/*.sh ; do
 	if [ -r "$i" ]; then
 		. $i
 	fi
-	unset i
 done
+unset i
