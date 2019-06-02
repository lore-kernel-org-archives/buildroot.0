From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Jun 2019 12:45:19 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/x11r7/xapp_mkfontdir: remove
 package
In-Reply-To: <20190602104519.7789-1-bernd.kuhls@t-online.de>
References: <20190602104519.7789-1-bernd.kuhls@t-online.de>
Message-ID: <20190602104519.7789-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

app_mkfontscale now includes the mkfontdir script:
https://lists.x.org/archives/xorg-announce/2019-March/002988.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                 | 11 +++++++++++
 package/x11r7/Config.in                          |  1 -
 package/x11r7/xapp_mkfontdir/Config.in           |  5 -----
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash |  2 --
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk   | 16 ----------------
 5 files changed, 11 insertions(+), 24 deletions(-)
 delete mode 100644 package/x11r7/xapp_mkfontdir/Config.in
 delete mode 100644 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash
 delete mode 100644 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index c13399acda..0a4f3c27ed 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,17 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2019.08"
+
+config BR2_PACKAGE_XAPP_MKFONTDIR
+	bool "mkfontdir is now included in xapp_mkfontscale"
+	select BR2_PACKAGE_XAPP_MKFONTSCALE
+	select BR2_LEGACY
+	help
+	  xapp_mkfontscale now includes the mkfontdir script previously
+	  distributed separately for compatibility with older X11
+	  versions.
+
 comment "Legacy options removed in 2019.05"
 
 config BR2_CSKY_DSP
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
-- 
2.20.1
