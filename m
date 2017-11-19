From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Sun, 19 Nov 2017 17:56:45 +0100
Subject: [Buildroot] [PATCH] package/directfb: fixes detection of tslib
 version during configure
Message-ID: <1511110605-18646-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 ...007-fix-tslib-version-detection-during-configure.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/directfb/0007-fix-tslib-version-detection-during-configure.patch

diff --git a/package/directfb/0007-fix-tslib-version-detection-during-configure.patch b/package/directfb/0007-fix-tslib-version-detection-during-configure.patch
new file mode 100644
index 0000000..e257558
--- /dev/null
+++ b/package/directfb/0007-fix-tslib-version-detection-during-configure.patch
@@ -0,0 +1,15 @@
+Fixes autodetection of required tslib version during configure.
+
+Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
+
+--- directfb-1.7.7/configure.in	2017-11-19 17:36:59.222299771 +0100
++++ directfb-1.7.7.mod/configure.in	2017-11-19 09:51:31.428595000 +0100
+@@ -2459,7 +2459,7 @@
+ 
+ enable_tslib=no
+ if test "$checkfor_tslib" = "yes"; then
+-  PKG_CHECK_MODULES([TSLIB], [tslib-1.0 >= 1.0.0], [enable_tslib=yes], [enable_tslib=no])
++  PKG_CHECK_MODULES([TSLIB], [tslib >= 1.0.0], [enable_tslib=yes], [enable_tslib=no])
+   if test "$enable_tslib" = "no"; then
+      PKG_CHECK_MODULES([TSLIB], [tslib-0.0], [enable_tslib=yes], [enable_tslib=no
+        AC_MSG_WARN([*** no tslib -- tslib driver will not be built.])])
-- 
2.1.4
