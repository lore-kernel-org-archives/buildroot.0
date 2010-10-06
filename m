From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 10:04:20 +0200
Subject: [Buildroot] [git commit master 1/1] xapp_twm: needs
	libX11/Xext/Xt/Xmu
Message-ID: <20101006080433.ABC288B91E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a82675239c4125340938299aa729d4d83558ad72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                            |    1 +
 package/x11r7/xapp_twm/Config.in   |    4 ++++
 package/x11r7/xapp_twm/xapp_twm.mk |    1 +
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index d93e9e1..2fc43b0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -43,6 +43,7 @@
 	shared-mime-info, speex, sqlite, squashfs, strace, sylpheed,
 	taglib, tcpdump, thttpd, tiff, tn5250, udev, udpcast,
 	usbmount, usbutils, vsftpd, vtun, which, wpa_supplicant,
+	xapp_twm,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/x11r7/xapp_twm/Config.in b/package/x11r7/xapp_twm/Config.in
index 77f8554..25bf800 100644
--- a/package/x11r7/xapp_twm/Config.in
+++ b/package/x11r7/xapp_twm/Config.in
@@ -1,4 +1,8 @@
 config BR2_PACKAGE_XAPP_TWM
 	bool "twm"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXMU
 	help
 	  No description available
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 28fc225..bc35293 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -8,5 +8,6 @@ XAPP_TWM_VERSION = 1.0.3
 XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_AUTORECONF = NO
+XAPP_TWM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_twm))
-- 
1.7.1
