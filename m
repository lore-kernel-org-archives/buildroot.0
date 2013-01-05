From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 13:27:03 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-rendition: remove
	package
Message-ID: <20130105124708.B52ED9A63B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2601c7f721c252204d8e6fb843c679cd5ce31a48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    1 -
 .../x11r7/xdriver_xf86-video-rendition/Config.in   |   10 ----------
 .../xdriver_xf86-video-rendition.mk                |   12 ------------
 3 files changed, 0 insertions(+), 23 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 2f890da..a6be745 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -196,7 +196,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-nv/Config.in
 		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
 		source package/x11r7/xdriver_xf86-video-r128/Config.in
-		source package/x11r7/xdriver_xf86-video-rendition/Config.in
 		source package/x11r7/xdriver_xf86-video-s3/Config.in
 		source package/x11r7/xdriver_xf86-video-s3virge/Config.in
 		source package/x11r7/xdriver_xf86-video-savage/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-rendition/Config.in b/package/x11r7/xdriver_xf86-video-rendition/Config.in
deleted file mode 100644
index 9238aec..0000000
--- a/package/x11r7/xdriver_xf86-video-rendition/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION
-	bool "xf86-video-rendition"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Rendition video driver
diff --git a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
deleted file mode 100644
index d83a1ef..0000000
--- a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-rendition -- Rendition video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_RENDITION_VERSION = 4.2.4
-XDRIVER_XF86_VIDEO_RENDITION_SOURCE = xf86-video-rendition-$(XDRIVER_XF86_VIDEO_RENDITION_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_RENDITION_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_RENDITION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(autotools-package))
