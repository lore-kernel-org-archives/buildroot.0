From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 13:43:06 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-suncg3: remove package
Message-ID: <20130105124710.90B2A9A63B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01eeab0c4b200ea9b57362c2e7340c9168f52dc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-video-suncg3/Config.in  |    9 ---------
 .../xdriver_xf86-video-suncg3.mk                   |   12 ------------
 3 files changed, 0 insertions(+), 22 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 3a6fabd..84b44bb 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -199,7 +199,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-savage/Config.in
 		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
 		source package/x11r7/xdriver_xf86-video-sis/Config.in
-		source package/x11r7/xdriver_xf86-video-suncg3/Config.in
 		source package/x11r7/xdriver_xf86-video-suncg6/Config.in
 		source package/x11r7/xdriver_xf86-video-sunffb/Config.in
 		source package/x11r7/xdriver_xf86-video-sunleo/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/Config.in b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
deleted file mode 100644
index 539a95a..0000000
--- a/package/x11r7/xdriver_xf86-video-suncg3/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3
-	bool "xf86-video-suncg3"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  CG3 video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
deleted file mode 100644
index 971cf90..0000000
--- a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-suncg3 -- CG3 video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNCG3_VERSION = 1.1.1
-XDRIVER_XF86_VIDEO_SUNCG3_SOURCE = xf86-video-suncg3-$(XDRIVER_XF86_VIDEO_SUNCG3_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNCG3_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNCG3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-
-$(eval $(autotools-package))
