From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Oct 2010 20:59:07 +0200
Subject: [Buildroot] [git commit master 1/1] xapp_xmore: remove double
	libXprintUtil dependency
Message-ID: <20101014185921.E78448CA6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0eacc81fa20847e5fd1dc4977549d77c1006c9a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |    2 +-
 package/x11r7/xapp_xmore/Config.in     |    1 -
 package/x11r7/xapp_xmore/xapp_xmore.mk |    2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 19fff54..3451a12 100644
--- a/CHANGES
+++ b/CHANGES
@@ -44,7 +44,7 @@
 	speex, sqlite, squashfs, strace, sylpheed, taglib, tcpdump,
 	thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount, usbutils,
 	vsftpd, vtun, which, wpa_supplicant, xapp_twm,
-	xapp_xbacklight, xapp_xcursorgen, xapp_xinput,
+	xapp_xbacklight, xapp_xcursorgen, xapp_xinput, xapp_xmore,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/x11r7/xapp_xmore/Config.in b/package/x11r7/xapp_xmore/Config.in
index 877d6fb..e64b99f 100644
--- a/package/x11r7/xapp_xmore/Config.in
+++ b/package/x11r7/xapp_xmore/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XAPP_XMORE
 	bool "xmore"
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	help
 	  plain text display program for the X Window System
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index 8471ebb..ffb49e7 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -8,6 +8,6 @@ XAPP_XMORE_VERSION = 1.0.1
 XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
 XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMORE_AUTORECONF = NO
-XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil xlib_libXprintUtil
+XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xmore))
-- 
1.7.1
