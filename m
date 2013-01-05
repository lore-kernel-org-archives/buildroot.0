From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 13:43:12 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-suntcx: remove package
Message-ID: <20130105124711.75F5A9A36D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d34c909f8edb94dfa03407bd53a90ca291a886b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-video-suntcx/Config.in  |    9 ---------
 .../xdriver_xf86-video-suntcx.mk                   |   12 ------------
 3 files changed, 0 insertions(+), 22 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index dd04781..b03531e 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -201,7 +201,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-sis/Config.in
 		source package/x11r7/xdriver_xf86-video-suncg6/Config.in
 		source package/x11r7/xdriver_xf86-video-sunffb/Config.in
-		source package/x11r7/xdriver_xf86-video-suntcx/Config.in
 		source package/x11r7/xdriver_xf86-video-tdfx/Config.in
 		source package/x11r7/xdriver_xf86-video-tga/Config.in
 		source package/x11r7/xdriver_xf86-video-trident/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/Config.in b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
deleted file mode 100644
index 3c82739..0000000
--- a/package/x11r7/xdriver_xf86-video-suntcx/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX
-	bool "xf86-video-suntcx"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  TCX video driver
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
deleted file mode 100644
index edca7fe..0000000
--- a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-suntcx -- TCX video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNTCX_VERSION = 1.1.1
-XDRIVER_XF86_VIDEO_SUNTCX_SOURCE = xf86-video-suntcx-$(XDRIVER_XF86_VIDEO_SUNTCX_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNTCX_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNTCX_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-
-$(eval $(autotools-package))
