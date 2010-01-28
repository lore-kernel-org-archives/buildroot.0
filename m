From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 28 Jan 2010 17:33:03 +0100
Subject: [Buildroot] [git commit master] directfb: some cleanup in config
	file
Message-ID: <20100128163327.18CB37774D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=74d7fab112fc7090b4d8116ad251da3dadca2193
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in |   24 ++++--------------------
 1 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index fd1f766..7c41cdf 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -5,113 +5,97 @@ config BR2_PACKAGE_DIRECTFB
 	help
 	  http://www.directfb.org/
 
+if BR2_PACKAGE_DIRECTFB
+
 config BR2_PACKAGE_DIRECTFB_MULTI
 	bool "directfb multi application"
-	depends on BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_LINUX_FUSION
 	help
 	  Enable use of multiple concurrent DirectFB applications
 
 config BR2_PACKAGE_DIRECTFB_DEBUG
 	bool "directfb debugging"
-	depends on BR2_PACKAGE_DIRECTFB
 	help
 	  Compile DirectFB with lots of debug output
 
 config BR2_PACKAGE_DIRECTFB_TRACE
 	bool "directfb call trace support"
-	depends on BR2_PACKAGE_DIRECTFB
 	help
 	  Enable call tracing for DirectFB applications
 
 config BR2_PACKAGE_DIRECTFB_XSERVER
 	bool "build with X server backend"
-	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_DIRECTFB_UNIQUE
 	bool "enable unique window manager"
-	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_UNIMPLEMENTED
 
 config BR2_PACKAGE_DIRECTFB_ATI128
 	bool "compile ati128 graphics driver"
-	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_DIRECTFB_CLE266
 	bool "compile cle266 graphics driver"
 	default y
-	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_DIRECTFB_MATROX
 	bool "compile matrox graphics driver"
-	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_DIRECTFB_PXA3XX
 	bool "compile pxa3xx graphics driver"
-	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_arm
 
 config BR2_PACKAGE_DIRECTFB_UNICHROME
 	bool "compile unichrome graphics driver"
 	default y
-	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_DIRECTFB_I830
 	bool "compile i830 graphics driver"
-	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_DIRECTFB_LINUXINPUT
 	bool "compile /dev/input/eventX input driver"
 	default y
-	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_KEYBOARD
 	bool "compile keyboard input driver"
 	default y
-	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_PS2MOUSE
 	bool "compile PS2 mouse input driver"
 	default y
-	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 	bool "compile serial mouse input driver"
 	default y
-	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
 	default y
-	depends on BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_TSLIB
 
 config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
 	default y
-	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_JPEG
 	bool "enable JPEG support"
 	default y
-	depends on BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_JPEG
 
 config BR2_PACKAGE_DIRECTFB_PNG
 	bool "enable PNG support"
 	default y
-	depends on BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_LIBPNG
 
 config BR2_PACKAGE_DIRECTB_DITHER_RGB16
 	bool "enable advanced dithering of RGB16 surfaces"
-	depends on BR2_PACKAGE_DIRECTFB
 	help
 	  Enable dithering when loading images to RGB16 surfaces.
 	  This increases the data section by 64 KBytes.
+
+endif # BR2_PACKAGE_DIRECTFB
-- 
1.6.3.3
