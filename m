From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:14 +0100
Subject: [Buildroot] [PATCH 02/28] x11r7: remove useless depends on of X.org
	drivers
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20d29fed0daf0228d11c9cfca4c3b692d80343a4.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All X.org server drivers are already enclosed in a if
BR2_PACKAGE_XSERVER_xorg .. endif block. Now that this option is only
set if a X.org server is enabled, there is no need for each individual
driver to depend on BR2_PACKAGE_XSERVER_XORG.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    1 -
 .../x11r7/xdriver_xf86-input-joystick/Config.in    |    1 -
 .../x11r7/xdriver_xf86-input-keyboard/Config.in    |    1 -
 package/x11r7/xdriver_xf86-input-mouse/Config.in   |    1 -
 .../x11r7/xdriver_xf86-input-synaptics/Config.in   |    1 -
 package/x11r7/xdriver_xf86-input-tslib/Config.in   |    1 -
 package/x11r7/xdriver_xf86-input-vmmouse/Config.in |    1 -
 package/x11r7/xdriver_xf86-input-void/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-ark/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-ati/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-cirrus/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-dummy/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-fbdev/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-geode/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-glide/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-glint/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-i128/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    1 -
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-mga/Config.in     |    1 -
 .../x11r7/xdriver_xf86-video-neomagic/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-newport/Config.in |    1 -
 package/x11r7/xdriver_xf86-video-nv/Config.in      |    1 -
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-r128/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-savage/Config.in  |    1 -
 .../xdriver_xf86-video-siliconmotion/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-sis/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-tga/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-trident/Config.in |    1 -
 package/x11r7/xdriver_xf86-video-v4l/Config.in     |    1 -
 package/x11r7/xdriver_xf86-video-vesa/Config.in    |    1 -
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-voodoo/Config.in  |    1 -
 package/x11r7/xdriver_xf86-video-wsfb/Config.in    |    1 -
 36 files changed, 36 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index 248be7e..798fffc 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	bool "xf86-input-evdev"
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
diff --git a/package/x11r7/xdriver_xf86-input-joystick/Config.in b/package/x11r7/xdriver_xf86-input-joystick/Config.in
index 4a7439a..ff9f25f 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/Config.in
+++ b/package/x11r7/xdriver_xf86-input-joystick/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK
 	bool "xf86-input-joystick"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/Config.in b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
index 481c763..0a03524 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/Config.in
+++ b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
 	bool "xf86-input-keyboard"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_KBPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
diff --git a/package/x11r7/xdriver_xf86-input-mouse/Config.in b/package/x11r7/xdriver_xf86-input-mouse/Config.in
index c8e39b0..20e1803 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-mouse/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
 	bool "xf86-input-mouse"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/Config.in b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
index 258dee2..9c214b7 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/Config.in
+++ b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS
 	bool "xf86-input-synaptics"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index 5185273..f0ea132 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_TSLIB
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
index b2284cd..de989eb 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE
 	bool "xf86-input-vmmouse"
 	depends on BR2_i386 || BR2_x86_64
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
diff --git a/package/x11r7/xdriver_xf86-input-void/Config.in b/package/x11r7/xdriver_xf86-input-void/Config.in
index ab4230b..d6fdef2 100644
--- a/package/x11r7/xdriver_xf86-input-void/Config.in
+++ b/package/x11r7/xdriver_xf86-input-void/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
 	bool "xf86-input-void"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
diff --git a/package/x11r7/xdriver_xf86-video-ark/Config.in b/package/x11r7/xdriver_xf86-video-ark/Config.in
index d9703de..cecedde 100644
--- a/package/x11r7/xdriver_xf86-video-ark/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ark/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK
 	bool "xf86-video-ark"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 107a57b..19bed3c 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/Config.in b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
index 31ed634..11c9df8 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/Config.in
+++ b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS
 	bool "xf86-video-cirrus"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-dummy/Config.in b/package/x11r7/xdriver_xf86-video-dummy/Config.in
index 2a172cc..00f7e1d 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/Config.in
+++ b/package/x11r7/xdriver_xf86-video-dummy/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY
 	bool "xf86-video-dummy"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/Config.in b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
index 8907fe1..9f7c540 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/Config.in
+++ b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV
 	bool "xf86-video-fbdev"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index c60b62c..2d2e5bc 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	bool "xf86-video-geode"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-glide/Config.in b/package/x11r7/xdriver_xf86-video-glide/Config.in
index ea9abd7..413acce 100644
--- a/package/x11r7/xdriver_xf86-video-glide/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glide/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE
 	bool "xf86-video-glide"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-glint/Config.in b/package/x11r7/xdriver_xf86-video-glint/Config.in
index 782b6da..bd92788 100644
--- a/package/x11r7/xdriver_xf86-video-glint/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glint/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
 	bool "xf86-video-glint"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
diff --git a/package/x11r7/xdriver_xf86-video-i128/Config.in b/package/x11r7/xdriver_xf86-video-i128/Config.in
index a66fda6..30b240c 100644
--- a/package/x11r7/xdriver_xf86-video-i128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-i128/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128
 	bool "xf86-video-i128"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 9a1d6cf..595eae5 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	bool "xf86-video-intel"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
index f2464e7..31f4c58 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	bool "xf86-video-mach64"
 	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-mga/Config.in b/package/x11r7/xdriver_xf86-video-mga/Config.in
index 40c6f3a..2fc3837 100644
--- a/package/x11r7/xdriver_xf86-video-mga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mga/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
 	bool "xf86-video-mga"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/Config.in b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
index 2e028a7..f8c8c47 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/Config.in
+++ b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC
 	bool "xf86-video-neomagic"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-newport/Config.in b/package/x11r7/xdriver_xf86-video-newport/Config.in
index e2effe8..d9c89b1 100644
--- a/package/x11r7/xdriver_xf86-video-newport/Config.in
+++ b/package/x11r7/xdriver_xf86-video-newport/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT
 	bool "xf86-video-newport"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-nv/Config.in b/package/x11r7/xdriver_xf86-video-nv/Config.in
index 943bc14..8898f56 100644
--- a/package/x11r7/xdriver_xf86-video-nv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nv/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV
 	bool "xf86-video-nv"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index 4a69246..24b74bc 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	bool "xf86-video-openchrome"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBX11
diff --git a/package/x11r7/xdriver_xf86-video-r128/Config.in b/package/x11r7/xdriver_xf86-video-r128/Config.in
index 96bd8d7..07e3142 100644
--- a/package/x11r7/xdriver_xf86-video-r128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-r128/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	bool "xf86-video-r128"
 	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-savage/Config.in b/package/x11r7/xdriver_xf86-video-savage/Config.in
index a9c8f6c..93a731e 100644
--- a/package/x11r7/xdriver_xf86-video-savage/Config.in
+++ b/package/x11r7/xdriver_xf86-video-savage/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
 	bool "xf86-video-savage"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
index db15116..727004a 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION
 	bool "xf86-video-siliconmotion"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
index ac2b632..e184505 100644
--- a/package/x11r7/xdriver_xf86-video-sis/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sis/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	bool "xf86-video-sis"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/Config.in b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
index 57bb411..811eba2 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
 	bool "xf86-video-tdfx"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
diff --git a/package/x11r7/xdriver_xf86-video-tga/Config.in b/package/x11r7/xdriver_xf86-video-tga/Config.in
index 800a8f6..9d03db3 100644
--- a/package/x11r7/xdriver_xf86-video-tga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tga/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
 	bool "xf86-video-tga"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-trident/Config.in b/package/x11r7/xdriver_xf86-video-trident/Config.in
index 4a7a477..15ac3ea 100644
--- a/package/x11r7/xdriver_xf86-video-trident/Config.in
+++ b/package/x11r7/xdriver_xf86-video-trident/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT
 	bool "xf86-video-trident"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-v4l/Config.in b/package/x11r7/xdriver_xf86-video-v4l/Config.in
index 3bb41fc5..6d85c17 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/Config.in
+++ b/package/x11r7/xdriver_xf86-video-v4l/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L
 	bool "xf86-video-v4l"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
diff --git a/package/x11r7/xdriver_xf86-video-vesa/Config.in b/package/x11r7/xdriver_xf86-video-vesa/Config.in
index 865f52c..98f4347 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vesa/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA
 	bool "xf86-video-vesa"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-vmware/Config.in b/package/x11r7/xdriver_xf86-video-vmware/Config.in
index 9093b38..2ab70e3 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vmware/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
 	bool "xf86-video-vmware"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/Config.in b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
index 9b770be..f531676 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/Config.in
+++ b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO
 	bool "xf86-video-voodoo"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/Config.in b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
index 3b3d406..968ee10 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB
 	bool "xf86-video-wsfb"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
-- 
1.7.9.5
