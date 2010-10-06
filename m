From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 10:18:48 +0200
Subject: [Buildroot] [git commit master 1/1] xapp_xbacklight: needs
	libXrandr/Xrender
Message-ID: <20101006081908.84C168B87E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=73a1f4ba5f53f69173c7e63ae07bb3d5984c68d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                          |    2 +-
 package/x11r7/xapp_xbacklight/Config.in          |    2 ++
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2fc43b0..c979607 100644
--- a/CHANGES
+++ b/CHANGES
@@ -43,7 +43,7 @@
 	shared-mime-info, speex, sqlite, squashfs, strace, sylpheed,
 	taglib, tcpdump, thttpd, tiff, tn5250, udev, udpcast,
 	usbmount, usbutils, vsftpd, vtun, which, wpa_supplicant,
-	xapp_twm,
+	xapp_twm, xapp_xbacklight,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/x11r7/xapp_xbacklight/Config.in b/package/x11r7/xapp_xbacklight/Config.in
index 3d727e2..9756235 100644
--- a/package/x11r7/xapp_xbacklight/Config.in
+++ b/package/x11r7/xapp_xbacklight/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XBACKLIGHT
 	bool "xbacklight"
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXRENDER
 	help
 	  xbacklight
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 03f62b1..9da0c65 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -8,6 +8,6 @@ XAPP_XBACKLIGHT_VERSION = 1.1.1
 XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
 XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBACKLIGHT_AUTORECONF = NO
-XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11
+XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xbacklight))
-- 
1.7.1
