From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:27:46 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-glide: remove broken
	package
Message-ID: <20170309212905.134B582552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39cf0941de1e50315fec93ac3fb45ca7da14b692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package has been marked as broken since 2010. No need for legacy
handling.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                                    |  1 -
 package/x11r7/xdriver_xf86-video-glide/Config.in           | 10 ----------
 .../xdriver_xf86-video-glide/xdriver_xf86-video-glide.hash |  2 --
 .../xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk   | 14 --------------
 4 files changed, 27 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index c40a643..21d0c98 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -164,7 +164,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-fbdev/Config.in
 		source package/x11r7/xdriver_xf86-video-fbturbo/Config.in
 		source package/x11r7/xdriver_xf86-video-geode/Config.in
-		source package/x11r7/xdriver_xf86-video-glide/Config.in
 		source package/x11r7/xdriver_xf86-video-glint/Config.in
 		source package/x11r7/xdriver_xf86-video-i128/Config.in
 		source package/x11r7/xdriver_xf86-video-imx/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-glide/Config.in b/package/x11r7/xdriver_xf86-video-glide/Config.in
deleted file mode 100644
index 413acce..0000000
--- a/package/x11r7/xdriver_xf86-video-glide/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE
-	bool "xf86-video-glide"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	depends on BROKEN # needs glide library from http://glide.sourceforge.net/
-	help
-	  video driver for glide device
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.hash b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.hash
deleted file mode 100644
index e5b344a..0000000
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002323.html
-sha256	9eb04477ee559cd114917936916303f4ded95695163fae1cc10058d2a7d94aed	xf86-video-glide-1.2.2.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
deleted file mode 100644
index 3518789..0000000
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-glide
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_GLIDE_VERSION = 1.2.2
-XDRIVER_XF86_VIDEO_GLIDE_SOURCE = xf86-video-glide-$(XDRIVER_XF86_VIDEO_GLIDE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_GLIDE_LICENSE = MIT
-XDRIVER_XF86_VIDEO_GLIDE_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-
-$(eval $(autotools-package))
