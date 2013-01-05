From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 13:26:40 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-input-aiptek: remove package
Message-ID: <20130105124707.D5A1C9A63B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b0a9b258cb0f78839682ffc8c12f470bb01dadf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-input-aiptek/Config.in  |    8 --------
 .../xdriver_xf86-input-aiptek.mk                   |   12 ------------
 3 files changed, 0 insertions(+), 21 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 7713d67..985b72f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -170,7 +170,6 @@ endmenu
 	endmenu
 	if BR2_PACKAGE_XSERVER_xorg
 	menu "X11R7 Drivers"
-		source package/x11r7/xdriver_xf86-input-aiptek/Config.in
 		source package/x11r7/xdriver_xf86-input-evdev/Config.in
 		source package/x11r7/xdriver_xf86-input-joystick/Config.in
 		source package/x11r7/xdriver_xf86-input-keyboard/Config.in
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/Config.in b/package/x11r7/xdriver_xf86-input-aiptek/Config.in
deleted file mode 100644
index 87fe5b3..0000000
--- a/package/x11r7/xdriver_xf86-input-aiptek/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_AIPTEK
-	bool "xf86-input-aiptek"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Aiptek USB Digital Tablet Input Driver for Linux
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
deleted file mode 100644
index 5e48a74..0000000
--- a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-aiptek -- Aiptek USB Digital Tablet Input Driver for Linux
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_AIPTEK_VERSION = 1.3.1
-XDRIVER_XF86_INPUT_AIPTEK_SOURCE = xf86-input-aiptek-$(XDRIVER_XF86_INPUT_AIPTEK_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-
-$(eval $(autotools-package))
