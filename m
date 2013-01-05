From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 13:26:48 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-apm: remove package
Message-ID: <20130105124708.04B2A9A63B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd09ff8da0092a2b4aafe3397b44d929b1d74e8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-video-apm/Config.in     |   12 ------------
 .../xdriver_xf86-video-apm.mk                      |   12 ------------
 3 files changed, 0 insertions(+), 25 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 985b72f..7a7666e 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -178,7 +178,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-input-tslib/Config.in
 		source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
 		source package/x11r7/xdriver_xf86-input-void/Config.in
-		source package/x11r7/xdriver_xf86-video-apm/Config.in
 		source package/x11r7/xdriver_xf86-video-ark/Config.in
 		source package/x11r7/xdriver_xf86-video-ast/Config.in
 		source package/x11r7/xdriver_xf86-video-ati/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-apm/Config.in b/package/x11r7/xdriver_xf86-video-apm/Config.in
deleted file mode 100644
index dea5258..0000000
--- a/package/x11r7/xdriver_xf86-video-apm/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM
-	bool "xf86-video-apm"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86RUSHPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Alliance ProMotion video driver
diff --git a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
deleted file mode 100644
index d0317f5..0000000
--- a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-apm -- Alliance ProMotion video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_APM_VERSION = 1.2.3
-XDRIVER_XF86_VIDEO_APM_SOURCE = xf86-video-apm-$(XDRIVER_XF86_VIDEO_APM_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_APM_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_APM_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86rushproto xproto_xproto
-
-$(eval $(autotools-package))
