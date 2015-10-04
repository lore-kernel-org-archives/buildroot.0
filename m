From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 15:53:07 +0100
Subject: [Buildroot] [git commit] skeleton: Pretty fixes for /etc/profile
Message-ID: <20151004145339.38A637FDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a92b886a034ef49945c5ae2858becb35b590d99e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix indent and put PATH on a single line.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/profile |   24 ++++++++++--------------
 1 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index e44e568..3a97427 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -1,15 +1,11 @@
-export PATH=\
-/bin:\
-/sbin:\
-/usr/bin:\
-/usr/sbin
+export PATH=/bin:/sbin:/usr/bin:/usr/sbin
 
 if [ "$PS1" ]; then
-    if [ "`id -u`" -eq 0 ]; then
-        export PS1='# '
-    else
-        export PS1='$ '
-    fi
+	if [ "`id -u`" -eq 0 ]; then
+		export PS1='# '
+	else
+		export PS1='$ '
+	fi
 fi
 
 export PAGER='/bin/more '
@@ -17,8 +13,8 @@ export EDITOR='/bin/vi'
 
 # Source configuration files from /etc/profile.d
 for i in /etc/profile.d/*.sh ; do
-    if [ -r "$i" ]; then
-        . $i
-    fi
-    unset i
+	if [ -r "$i" ]; then
+		. $i
+	fi
+	unset i
 done
