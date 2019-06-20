From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 21:39:03 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_mkfontdir: remove
 package
Message-ID: <20190620194002.39A0E815DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff74bb88fd202aa753cb64fae9e9cfc2c6aea403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

app_mkfontscale now includes the mkfontdir script:
https://lists.x.org/archives/xorg-announce/2019-March/002988.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                 |  9 +++++++++
 package/x11r7/Config.in                          |  1 -
 package/x11r7/xapp_mkfontdir/Config.in           |  5 -----
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash |  2 --
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk   | 16 ----------------
 5 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9d54026899..7a7f8814ed 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2019.08"
 
+config BR2_PACKAGE_XAPP_MKFONTDIR
+	bool "mkfontdir is now included in xapp_mkfontscale"
+	select BR2_PACKAGE_XAPP_MKFONTSCALE
+	select BR2_LEGACY
+	help
+	  xapp_mkfontscale now includes the mkfontdir script previously
+	  distributed separately for compatibility with older X11
+	  versions.
+
 config BR2_GDB_VERSION_8_0
 	bool "gdb 8.0.x has been removed"
 	select BR2_LEGACY
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index f1396bbf0f..b891fb42ce 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -69,7 +69,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_ico/Config.in
 		source package/x11r7/xapp_listres/Config.in
 		source package/x11r7/xapp_luit/Config.in
-		source package/x11r7/xapp_mkfontdir/Config.in
 		source package/x11r7/xapp_mkfontscale/Config.in
 		source package/x11r7/xapp_oclock/Config.in
 		source package/x11r7/xapp_rgb/Config.in
diff --git a/package/x11r7/xapp_mkfontdir/Config.in b/package/x11r7/xapp_mkfontdir/Config.in
deleted file mode 100644
index 155772d13b..0000000000
--- a/package/x11r7/xapp_mkfontdir/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_MKFONTDIR
-	bool "mkfontdir"
-	select BR2_PACKAGE_XAPP_MKFONTSCALE
-	help
-	  create an index of X font files in a directory
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash
deleted file mode 100644
index 7a218b98c3..0000000000
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://lists.x.org/archives/xorg-announce/2012-February/001818.html
-sha256	56d52a482df130484e51fd066d1b6eda7c2c02ddbc91fe6e2be1b9c4e7306530	mkfontdir-1.0.7.tar.bz2
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
deleted file mode 100644
index f2227bdfdd..0000000000
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xapp_mkfontdir
-#
-################################################################################
-
-XAPP_MKFONTDIR_VERSION = 1.0.7
-XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
-XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_MKFONTDIR_LICENSE = MIT
-XAPP_MKFONTDIR_LICENSE_FILES = COPYING
-XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
-HOST_XAPP_MKFONTDIR_DEPENDENCIES = host-xapp_mkfontscale
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
