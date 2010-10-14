From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Oct 2010 20:46:49 +0200
Subject: [Buildroot] [git commit master 1/1] xapp_xinput: needs libXi
Message-ID: <20101014184703.322868CA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ab6925eabfa553732a3e7723b8d3d4c2af2806e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    2 +-
 package/x11r7/xapp_xinput/Config.in      |    1 +
 package/x11r7/xapp_xinput/xapp_xinput.mk |    2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7edbda8..2cd70f7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -44,7 +44,7 @@
 	speex, sqlite, squashfs, strace, sylpheed, taglib, tcpdump,
 	thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount, usbutils,
 	vsftpd, vtun, which, wpa_supplicant, xapp_twm,
-	xapp_xbacklight,
+	xapp_xbacklight, xapp_xinput,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/x11r7/xapp_xinput/Config.in b/package/x11r7/xapp_xinput/Config.in
index 55c47ac..2505dd3 100644
--- a/package/x11r7/xapp_xinput/Config.in
+++ b/package/x11r7/xapp_xinput/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XINPUT
 	bool "xinput"
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXI
 	help
 	  xinput
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 20d23f2..423c7c2 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -8,6 +8,6 @@ XAPP_XINPUT_VERSION = 1.5.0
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINPUT_AUTORECONF = NO
-XAPP_XINPUT_DEPENDENCIES = xlib_libX11
+XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xinput))
-- 
1.7.1
