From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 Oct 2015 16:53:22 +0200
Subject: [Buildroot] [PATCH v4 3/3] skeleton: Pretty fixes for /etc/profile
In-Reply-To: <1443884002-13585-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443884002-13585-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1443884002-13585-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix indent and put PATH on a single line.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 system/skeleton/etc/profile | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

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
-- 
2.5.3
