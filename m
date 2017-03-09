From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:27:51 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-wsfb: remove broken
	package
Message-ID: <20170309212905.1D30E80339@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ed93d709aa9cc7b40cb6e10b5795ecc6763361a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package has been marked as broken since 2010. No need for legacy
handling.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                                    |  1 -
 package/x11r7/xdriver_xf86-video-wsfb/Config.in            | 10 ----------
 .../xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.hash   |  2 --
 .../xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk     | 14 --------------
 4 files changed, 27 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 21d0c98..4510871 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -187,7 +187,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-vesa/Config.in
 		source package/x11r7/xdriver_xf86-video-vmware/Config.in
 		source package/x11r7/xdriver_xf86-video-voodoo/Config.in
-		source package/x11r7/xdriver_xf86-video-wsfb/Config.in
 	endmenu
 	endif
 	menu "X11R7 Fonts"
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/Config.in b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
deleted file mode 100644
index 968ee10..0000000
--- a/package/x11r7/xdriver_xf86-video-wsfb/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB
-	bool "xf86-video-wsfb"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	depends on BROKEN # Fails to build. Actually this is OpenBSD/NetBSD stuff.
-	help
-	  WSFB based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.hash b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.hash
deleted file mode 100644
index 1258b71..0000000
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://lists.x.org/archives/xorg-announce/2012-January/001786.html
-sha256	975ce3e5a063168ec6fe8f3fac50c30d0fae6cc6d81dc260f00bb4cb4f1a2843	xf86-video-wsfb-0.4.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
deleted file mode 100644
index c2d7d4d..0000000
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-wsfb
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_WSFB_VERSION = 0.4.0
-XDRIVER_XF86_VIDEO_WSFB_SOURCE = xf86-video-wsfb-$(XDRIVER_XF86_VIDEO_WSFB_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_WSFB_LICENSE = MIT
-XDRIVER_XF86_VIDEO_WSFB_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(autotools-package))
