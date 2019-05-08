From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Thu,  9 May 2019 00:09:34 +0200
Subject: [Buildroot] [PATCH 10/13] package/openrc: change /run/lock from
 root:uucp to root:daemon
In-Reply-To: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
Message-ID: <20190508220937.23200-10-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On gentoo /run/lock is owned by uucp group because of historical
reasons. However uucp does not exist on buildroot by default, and
it makes more sense that 'daemon' group should own this directory.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 ....in-change-run-lock-from-root-uucp-t.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch

diff --git a/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch b/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
new file mode 100644
index 0000000000..66bbba42ba
--- /dev/null
+++ b/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
@@ -0,0 +1,34 @@
+From 5ae8209afad9a4284723712b46d8685e7f7fd72c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
+Date: Mon, 6 May 2019 00:06:39 +0200
+Subject: [PATCH] sh/init.sh.Linux.in: change /run/lock from root:uucp to
+ root:daemon
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On gentoo /run/lock is owned by uucp group because of historical
+reasons. However uucp does not exist on buildroot by default, and
+it makes more sense that 'daemon' group should own this directory.
+
+Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
+---
+ sh/init.sh.Linux.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sh/init.sh.Linux.in b/sh/init.sh.Linux.in
+index 222bbd3b..7f1a88db 100644
+--- a/sh/init.sh.Linux.in
++++ b/sh/init.sh.Linux.in
+@@ -85,7 +85,7 @@ fi
+ 
+ [ -x /sbin/restorecon ] && /sbin/restorecon -rF /run
+ checkpath -d $RC_SVCDIR
+-checkpath -d -m 0775 -o root:uucp /run/lock
++checkpath -d -m 0775 -o root:daemon /run/lock
+ 
+ # Try to mount xenfs as early as possible, otherwise rc_sys() will always
+ # return RC_SYS_XENU and will think that we are in a domU while it's not.
+-- 
+2.18.1
+
-- 
2.18.1
