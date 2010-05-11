From: Paul Jones <Paul.Jones@iwtech.com.au>
Date: Tue, 11 May 2010 09:02:07 +0200
Subject: [Buildroot] [git commit master] xvkbd: bump version
Message-ID: <20100511070254.799E58D479@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=18f72f97309b83f1d3c43115b83a79743602ebd2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And fix dependencies while we're at it.

Signed-off-by: Paul Jones <paul@pauljones.id.au>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 +-
 package/xvkbd/Config.in |    1 +
 package/xvkbd/xvkbd.mk  |    4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 70ae9d7..12702a4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 	libxcb, mplayer, pciutils, xdriver_xf86-video-openchrome,
 	usb_modeswitch, usbutils, wpa_supplicant, xapp_bdftopcf,
 	xapp_mkfontdir, xfont_encodings, xlib_libX11, xlib_libXfont,
-	xlib_xtrans, xproto_fontcacheproto, xproto_fontsproto.
+	xlib_xtrans, xproto_fontcacheproto, xproto_fontsproto, xvkbd
 
 	Removed packages: vice
 
diff --git a/package/xvkbd/Config.in b/package/xvkbd/Config.in
index 888367a..8a4b847 100644
--- a/package/xvkbd/Config.in
+++ b/package/xvkbd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XVKBD
 	bool "xvkbd"
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  on-screen keyboard for X
 
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 8f02021..b7da396 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -3,7 +3,7 @@
 # xvkbd
 #
 #############################################################
-XVKBD_VERSION = 2.8
+XVKBD_VERSION = 3.2
 XVKBD_SOURCE = xvkbd-$(XVKBD_VERSION).tar.gz
 XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
 XVKBD_AUTORECONF = NO
@@ -15,7 +15,7 @@ XVKBD_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_CC) \
 
 XVKBD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-XVKBD_DEPENDENCIES = xserver_xorg-server
+XVKBD_DEPENDENCIES = xserver_xorg-server xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package,xvkbd))
 
-- 
1.6.3.3
