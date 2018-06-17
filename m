From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:19:52 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] skeleton: PAGER without
 blank and unset at end of for loop
Message-ID: <20180617155626.31CA381070@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c751db3610f33449cf6ff5bb1826a22e95aef81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The PAGER environment variable is including a blank character at the
end. Remove this.
A for loop has been unsetting the variable inside the loop, this is only
needed once at the end of the loop.

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 903b8446a8db2aff042cdefd398d3598023bed0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
