From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:39 +0100
Subject: [Buildroot] [PATCH 04/20] xdriver_xf86-input-acecad: remove package
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <75191ec8b2c6334739b06b4c29bd0fcb196893e7.1357125961.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This X.org driver has been removed from upstream X.org releases and is
related to a very specific type of hardware that isn't likely to be used
in a Buildroot context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-input-acecad/Config.in  |    8 --------
 .../xdriver_xf86-input-acecad.mk                   |   12 ------------
 3 files changed, 21 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-input-acecad/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 9e08e3f..7713d67 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -170,7 +170,6 @@ endmenu
 	endmenu
 	if BR2_PACKAGE_XSERVER_xorg
 	menu "X11R7 Drivers"
-		source package/x11r7/xdriver_xf86-input-acecad/Config.in
 		source package/x11r7/xdriver_xf86-input-aiptek/Config.in
 		source package/x11r7/xdriver_xf86-input-evdev/Config.in
 		source package/x11r7/xdriver_xf86-input-joystick/Config.in
diff --git a/package/x11r7/xdriver_xf86-input-acecad/Config.in b/package/x11r7/xdriver_xf86-input-acecad/Config.in
deleted file mode 100644
index 7e1838e..0000000
--- a/package/x11r7/xdriver_xf86-input-acecad/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_ACECAD
-	bool "xf86-input-acecad"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Acecad Flair input driver
diff --git a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
deleted file mode 100644
index dd020a8..0000000
--- a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-acecad -- Acecad Flair input driver
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_ACECAD_VERSION = 1.4.0
-XDRIVER_XF86_INPUT_ACECAD_SOURCE = xf86-input-acecad-$(XDRIVER_XF86_INPUT_ACECAD_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_ACECAD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-
-$(eval $(autotools-package))
-- 
1.7.9.5
