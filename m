From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 13:42:48 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-s3virge: remove package
Message-ID: <20130105124709.5710A9A63B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43e95a4e19228fde8611621229c41fdedbdf963a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xdriver_xf86-video-s3virge/Config.in |   11 -----------
 .../xdriver_xf86-video-s3virge.mk                  |   12 ------------
 2 files changed, 0 insertions(+), 23 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-s3virge/Config.in b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
deleted file mode 100644
index 6f31864..0000000
--- a/package/x11r7/xdriver_xf86-video-s3virge/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE
-	bool "xf86-video-s3virge"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  S3 ViRGE video driver
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
deleted file mode 100644
index a3fd480..0000000
--- a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-s3virge -- S3 ViRGE video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_S3VIRGE_VERSION = 1.10.4
-XDRIVER_XF86_VIDEO_S3VIRGE_SOURCE = xf86-video-s3virge-$(XDRIVER_XF86_VIDEO_S3VIRGE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_S3VIRGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_S3VIRGE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(autotools-package))
