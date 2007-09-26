From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 26 Sep 2007 16:20:49 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91rm9200df
Message-ID: <20070926232049.F0B67A475A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-26 16:20:49 -0700 (Wed, 26 Sep 2007)
New Revision: 20049

Log:
Remove graphic applications from AT91RM9200 defconfig root fs (no LCD)

Modified:
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df-linux-2.6.22.1.config
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df-linux-2.6.22.1.config
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df-linux-2.6.22.1.config	2007-09-26 22:22:55 UTC (rev 20048)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df-linux-2.6.22.1.config	2007-09-26 23:20:49 UTC (rev 20049)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.22.1
-# Wed Sep 26 23:46:17 2007
+# Thu Sep 27 00:56:28 2007
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -803,40 +803,13 @@
 #
 # CONFIG_DISPLAY_SUPPORT is not set
 # CONFIG_VGASTATE is not set
-CONFIG_FB=m
-# CONFIG_FIRMWARE_EDID is not set
-# CONFIG_FB_DDC is not set
-CONFIG_FB_CFB_FILLRECT=m
-CONFIG_FB_CFB_COPYAREA=m
-CONFIG_FB_CFB_IMAGEBLIT=m
-# CONFIG_FB_SYS_FILLRECT is not set
-# CONFIG_FB_SYS_COPYAREA is not set
-# CONFIG_FB_SYS_IMAGEBLIT is not set
-# CONFIG_FB_SYS_FOPS is not set
-CONFIG_FB_DEFERRED_IO=y
-# CONFIG_FB_SVGALIB is not set
-# CONFIG_FB_MACMODES is not set
-# CONFIG_FB_BACKLIGHT is not set
-# CONFIG_FB_MODE_HELPERS is not set
-# CONFIG_FB_TILEBLITTING is not set
+# CONFIG_FB is not set
 
 #
-# Frame buffer hardware drivers
-#
-# CONFIG_FB_S1D15605 is not set
-CONFIG_FB_S1D13XXX=m
-# CONFIG_FB_VIRTUAL is not set
-
-#
 # Console display driver support
 #
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_DUMMY_CONSOLE=y
-# CONFIG_FRAMEBUFFER_CONSOLE is not set
-CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
-CONFIG_LOGO_LINUX_CLUT224=y
 
 #
 # Sound

Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2007-09-26 22:22:55 UTC (rev 20048)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2007-09-26 23:20:49 UTC (rev 20049)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Thu Sep 27 00:11:05 2007
+# Thu Sep 27 01:10:32 2007
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -544,26 +544,24 @@
 #
 BR2_PACKAGE_NCURSES=y
 # BR2_PACKAGE_NCURSES_TARGET_HEADERS is not set
-BR2_PACKAGE_NEWT=y
-BR2_PACKAGE_SLANG=y
+# BR2_PACKAGE_NEWT is not set
+# BR2_PACKAGE_SLANG is not set
 
 #
 # text rendering applications
 #
-BR2_PACKAGE_DIALOG=y
+# BR2_PACKAGE_DIALOG is not set
 
 #
 # graphic libraries
 #
-BR2_PACKAGE_DIRECTFB=y
-BR2_PACKAGE_DIRECTFB_MULTI=y
-BR2_PACKAGE_LINUX_FUSION=y
+# BR2_PACKAGE_DIRECTFB is not set
 # BR2_PACKAGE_IMAGEMAGICK is not set
-BR2_PACKAGE_JPEG=y
-BR2_PACKAGE_LIBPNG=y
-BR2_PACKAGE_LIBUNGIF=y
-BR2_PACKAGE_SDL=y
-BR2_PACKAGE_TIFF=y
+# BR2_PACKAGE_JPEG is not set
+# BR2_PACKAGE_LIBPNG is not set
+# BR2_PACKAGE_LIBUNGIF is not set
+# BR2_PACKAGE_SDL is not set
+# BR2_PACKAGE_TIFF is not set
 
 #
 # busybox graphic applications
@@ -572,8 +570,8 @@
 #
 # --> (May be broken in busybox)
 #
-BR2_PACKAGE_FBV=y
-BR2_PACKAGE_FBSET=y
+# BR2_PACKAGE_FBV is not set
+# BR2_PACKAGE_FBSET is not set
 
 #
 # other GUIs
@@ -594,9 +592,9 @@
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBGLIB12 is not set
 # BR2_PACKAGE_LIBGLIB2 is not set
-BR2_PACKAGE_FONTCONFIG=y
-BR2_PACKAGE_FREETYPE=y
-BR2_PACKAGE_TSLIB=y
+# BR2_PACKAGE_FONTCONFIG is not set
+# BR2_PACKAGE_FREETYPE is not set
+# BR2_PACKAGE_TSLIB is not set
 
 #
 # X Window managers
@@ -613,9 +611,8 @@
 BR2_PACKAGE_MPLAYER=y
 BR2_COMPRESSOR_SUPPORT=y
 BR2_PACKAGE_GZIP=y
-BR2_PACKAGE_LZO=y
-BR2_PACKAGE_LZMA_TARGET=y
-# BR2_PACKAGE_LZMA_TARGET_HEADERS is not set
+# BR2_PACKAGE_LZO is not set
+# BR2_PACKAGE_LZMA_TARGET is not set
 BR2_PACKAGE_LZMA_HOST=y
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
