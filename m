From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 Oct 2015 16:14:24 +0200
Subject: [Buildroot] [PATCH v3 3/3] skeleton: Pretty fixes for /etc/profile
In-Reply-To: <1443881664-9100-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443881664-9100-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1443881664-9100-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix indent and put PATH on a single line.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 system/skeleton/etc/profile | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index c40a311..df0be7f 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -1,13 +1,9 @@
-export PATH=\
-/bin:\
-/sbin:\
-/usr/bin:\
-/usr/sbin
+export PATH=/bin:/sbin:/usr/bin:/usr/sbin
 
 if [ "`id -u`" -eq 0 ]; then
-    export PS1='# '
+	export PS1='# '
 else
-    export PS1='$ '
+	export PS1='$ '
 fi
 
 export PAGER='/bin/more '
@@ -15,8 +11,8 @@ export EDITOR='/bin/vi'
 
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
