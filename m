From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 13:42:45 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-s3: remove package
Message-ID: <20130105124709.3465F9A63B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bbdbacad851e0f0b697fead5cb87453cd8ea93e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    2 --
 package/x11r7/xdriver_xf86-video-s3/Config.in      |   11 -----------
 .../xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk |   12 ------------
 3 files changed, 0 insertions(+), 25 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index a6be745..ee5fb04 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -196,8 +196,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-nv/Config.in
 		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
 		source package/x11r7/xdriver_xf86-video-r128/Config.in
-		source package/x11r7/xdriver_xf86-video-s3/Config.in
-		source package/x11r7/xdriver_xf86-video-s3virge/Config.in
 		source package/x11r7/xdriver_xf86-video-savage/Config.in
 		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
 		source package/x11r7/xdriver_xf86-video-sis/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-s3/Config.in b/package/x11r7/xdriver_xf86-video-s3/Config.in
deleted file mode 100644
index 1091028..0000000
--- a/package/x11r7/xdriver_xf86-video-s3/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3
-	bool "xf86-video-s3"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org driver for s3 cards
diff --git a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
deleted file mode 100644
index b2cf5cf..0000000
--- a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-s3 -- X.Org driver for s3 cards
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_S3_VERSION = 0.6.3
-XDRIVER_XF86_VIDEO_S3_SOURCE = xf86-video-s3-$(XDRIVER_XF86_VIDEO_S3_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_S3_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_S3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(autotools-package))
