From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 13:26:53 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-chips: remove package
Message-ID: <20130105124708.2CC7E9A63B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0de14499a18c037a87c44924894e0795cd4a7dd2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-video-chips/Config.in   |   10 ----------
 .../xdriver_xf86-video-chips.mk                    |   12 ------------
 3 files changed, 0 insertions(+), 23 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 7a7666e..8c6a659 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -181,7 +181,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-ark/Config.in
 		source package/x11r7/xdriver_xf86-video-ast/Config.in
 		source package/x11r7/xdriver_xf86-video-ati/Config.in
-		source package/x11r7/xdriver_xf86-video-chips/Config.in
 		source package/x11r7/xdriver_xf86-video-cirrus/Config.in
 		source package/x11r7/xdriver_xf86-video-dummy/Config.in
 		source package/x11r7/xdriver_xf86-video-fbdev/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-chips/Config.in b/package/x11r7/xdriver_xf86-video-chips/Config.in
deleted file mode 100644
index 29a99ec..0000000
--- a/package/x11r7/xdriver_xf86-video-chips/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS
-	bool "xf86-video-chips"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Chips and Technologies video driver
diff --git a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
deleted file mode 100644
index 9856ecb..0000000
--- a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-chips -- Chips and Technologies video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_CHIPS_VERSION = 1.2.3
-XDRIVER_XF86_VIDEO_CHIPS_SOURCE = xf86-video-chips-$(XDRIVER_XF86_VIDEO_CHIPS_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-
-$(eval $(autotools-package))
