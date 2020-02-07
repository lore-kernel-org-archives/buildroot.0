From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  7 Feb 2020 15:50:25 +0100
Subject: [Buildroot] [PATCH 10/10] package/gstreamer/*: remove packages
In-Reply-To: <20200207145026.28384-1-peter@korsgaard.com>
References: <20200207145026.28384-1-peter@korsgaard.com>
Message-ID: <20200207145026.28384-11-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gstreamer 0.10 has been deprecated upstream since 2012 and is missing a lot
of features and (security) fixes compared to gstreamer1, so remove it.

All gstreamer-0.10 sub packages depends on gstreamer, so we only need to add
a legacy entry for that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                              |   8 +
 DEVELOPERS                                    |   1 -
 package/gstreamer/Config.in                   |  13 -
 package/gstreamer/gst-ffmpeg/0001-gcc47.patch |  65 --
 ...arm-avoid-using-the-movw-instruction.patch |  41 --
 package/gstreamer/gst-ffmpeg/Config.in        |  30 -
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash  |   6 -
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk    | 103 ---
 .../0001-gplay-add-missing-include.patch      |  23 -
 ...0002-Fix-bashism-in-configure-script.patch |  48 --
 .../0003-Use-proper-objdump.patch             |  36 --
 ...nkage-add-lrt-for-shared-memory-func.patch |  46 --
 ...-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch |  69 --
 package/gstreamer/gst-fsl-plugins/Config.in   | 105 ----
 .../gst-fsl-plugins/gst-fsl-plugins.hash      |   4 -
 .../gst-fsl-plugins/gst-fsl-plugins.mk        |  40 --
 package/gstreamer/gst-omapfb/Config.in        |   7 -
 package/gstreamer/gst-omapfb/gst-omapfb.hash  |   2 -
 package/gstreamer/gst-omapfb/gst-omapfb.mk    |  20 -
 .../gst-plugin-x170/0001-correct-CFLAGS.patch |  28 -
 package/gstreamer/gst-plugin-x170/Config.in   |  16 -
 .../gst-plugin-x170/gst-plugin-x170.hash      |   2 -
 .../gst-plugin-x170/gst-plugin-x170.mk        |  18 -
 ...s-jpegformat-unbreak-non-debug-build.patch |  78 ---
 .../0002-fix-dfb-example.patch                |  22 -
 ...03-drop-buggy-libvpx-legacy-handling.patch |  44 --
 package/gstreamer/gst-plugins-bad/Config.in   | 334 ----------
 .../gst-plugins-bad/gst-plugins-bad.hash      |   5 -
 .../gst-plugins-bad/gst-plugins-bad.mk        | 593 ------------------
 .../gst-plugins-base/0001-tremor.patch        | 139 ----
 ...x-build-on-x86-if-emmintrin.h-is-ava.patch |  38 --
 ...-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch |  27 -
 package/gstreamer/gst-plugins-base/Config.in  | 110 ----
 .../gst-plugins-base/gst-plugins-base.hash    |   5 -
 .../gst-plugins-base/gst-plugins-base.mk      | 196 ------
 .../gst-plugins-good/0001-linux36.patch       |  37 --
 ...ilation-against-newer-kernel-headers.patch |  30 -
 package/gstreamer/gst-plugins-good/Config.in  | 234 -------
 .../gst-plugins-good/gst-plugins-good.hash    |   4 -
 .../gst-plugins-good/gst-plugins-good.mk      | 394 ------------
 package/gstreamer/gst-plugins-ugly/Config.in  |  53 --
 .../gst-plugins-ugly/gst-plugins-ugly.hash    |   6 -
 .../gst-plugins-ugly/gst-plugins-ugly.mk      |  90 ---
 package/gstreamer/gstreamer.mk                |   1 -
 package/gstreamer/gstreamer/0001-bison3.patch |  24 -
 package/gstreamer/gstreamer/Config.in         |  38 --
 package/gstreamer/gstreamer/gstreamer.hash    |   5 -
 package/gstreamer/gstreamer/gstreamer.mk      |  36 --
 48 files changed, 8 insertions(+), 3266 deletions(-)
 delete mode 100644 package/gstreamer/Config.in
 delete mode 100644 package/gstreamer/gst-ffmpeg/0001-gcc47.patch
 delete mode 100644 package/gstreamer/gst-ffmpeg/0002-arm-avoid-using-the-movw-instruction.patch
 delete mode 100644 package/gstreamer/gst-ffmpeg/Config.in
 delete mode 100644 package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash
 delete mode 100644 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
 delete mode 100644 package/gstreamer/gst-fsl-plugins/0001-gplay-add-missing-include.patch
 delete mode 100644 package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch
 delete mode 100644 package/gstreamer/gst-fsl-plugins/0003-Use-proper-objdump.patch
 delete mode 100644 package/gstreamer/gst-fsl-plugins/0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
 delete mode 100644 package/gstreamer/gst-fsl-plugins/0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
 delete mode 100644 package/gstreamer/gst-fsl-plugins/Config.in
 delete mode 100644 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash
 delete mode 100644 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
 delete mode 100644 package/gstreamer/gst-omapfb/Config.in
 delete mode 100644 package/gstreamer/gst-omapfb/gst-omapfb.hash
 delete mode 100644 package/gstreamer/gst-omapfb/gst-omapfb.mk
 delete mode 100644 package/gstreamer/gst-plugin-x170/0001-correct-CFLAGS.patch
 delete mode 100644 package/gstreamer/gst-plugin-x170/Config.in
 delete mode 100644 package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash
 delete mode 100644 package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
 delete mode 100644 package/gstreamer/gst-plugins-bad/0001-opus-jpegformat-unbreak-non-debug-build.patch
 delete mode 100644 package/gstreamer/gst-plugins-bad/0002-fix-dfb-example.patch
 delete mode 100644 package/gstreamer/gst-plugins-bad/0003-drop-buggy-libvpx-legacy-handling.patch
 delete mode 100644 package/gstreamer/gst-plugins-bad/Config.in
 delete mode 100644 package/gstreamer/gst-plugins-bad/gst-plugins-bad.hash
 delete mode 100644 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
 delete mode 100644 package/gstreamer/gst-plugins-base/0001-tremor.patch
 delete mode 100644 package/gstreamer/gst-plugins-base/0002-audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
 delete mode 100644 package/gstreamer/gst-plugins-base/0003-audioresample-It-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch
 delete mode 100644 package/gstreamer/gst-plugins-base/Config.in
 delete mode 100644 package/gstreamer/gst-plugins-base/gst-plugins-base.hash
 delete mode 100644 package/gstreamer/gst-plugins-base/gst-plugins-base.mk
 delete mode 100644 package/gstreamer/gst-plugins-good/0001-linux36.patch
 delete mode 100644 package/gstreamer/gst-plugins-good/0002-v4l2-fix-compilation-against-newer-kernel-headers.patch
 delete mode 100644 package/gstreamer/gst-plugins-good/Config.in
 delete mode 100644 package/gstreamer/gst-plugins-good/gst-plugins-good.hash
 delete mode 100644 package/gstreamer/gst-plugins-good/gst-plugins-good.mk
 delete mode 100644 package/gstreamer/gst-plugins-ugly/Config.in
 delete mode 100644 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
 delete mode 100644 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
 delete mode 100644 package/gstreamer/gstreamer.mk
 delete mode 100644 package/gstreamer/gstreamer/0001-bison3.patch
 delete mode 100644 package/gstreamer/gstreamer/Config.in
 delete mode 100644 package/gstreamer/gstreamer/gstreamer.hash
 delete mode 100644 package/gstreamer/gstreamer/gstreamer.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index e9725d30b3..563f6d39e3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_GSTREAMER
+	bool "gstreamer-0.10 removed"
+	select BR2_LEGACY
+	help
+	  Gstreamer-0.10 package was removed. It has been deprecated
+	  upstream since 2012, and is missing a lot of features and
+	  fixes compared to gstreamer-1.x.
+
 config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS
 	bool "nvidia-tegra23 binaries gstreamer 0.10.x support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 3520072034..cb13035bc4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -237,7 +237,6 @@ F:	package/arp-scan/
 F:	package/dehydrated/
 F:	package/freescale-imx/firmware-imx/
 F:	package/freescale-imx/imx-lib/
-F:	package/gstreamer/gst-fsl-plugins/
 F:	package/libpagekite/
 F:	package/lua-bit32/
 F:	package/owfs/
diff --git a/package/gstreamer/Config.in b/package/gstreamer/Config.in
deleted file mode 100644
index e922437f22..0000000000
--- a/package/gstreamer/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-# Gstreamer 0.10.x & Plugins
-source "package/gstreamer/gstreamer/Config.in"
-
-if BR2_PACKAGE_GSTREAMER
-source "package/gstreamer/gst-plugins-base/Config.in"
-source "package/gstreamer/gst-plugins-good/Config.in"
-source "package/gstreamer/gst-plugins-bad/Config.in"
-source "package/gstreamer/gst-plugins-ugly/Config.in"
-source "package/gstreamer/gst-ffmpeg/Config.in"
-source "package/gstreamer/gst-fsl-plugins/Config.in"
-source "package/gstreamer/gst-omapfb/Config.in"
-source "package/gstreamer/gst-plugin-x170/Config.in"
-endif
diff --git a/package/gstreamer/gst-ffmpeg/0001-gcc47.patch b/package/gstreamer/gst-ffmpeg/0001-gcc47.patch
deleted file mode 100644
index 16744abae3..0000000000
--- a/package/gstreamer/gst-ffmpeg/0001-gcc47.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-gst-ffmpeg libav: Fixes compiling gst-ffmpeg with gcc-4.7
-
-Fetch from: http://www.slackware.com/~alien/slackbuilds/gst-plugins-ffmpeg/build/gst-ffmpeg-0.10.13_gcc47.patch
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
----
-Submitted By: Andrew Benton <andy@benton.eu.com>
-Date: 2012-06-15
-Initial Package Version: 0.10.13
-Upstream Status: From upstream
-Origin:
-http://git.videolan.org/?p=ffmpeg.git;a=patch;h=5f654897e325349dacf2546674e0510bb72ecb50
-
-Description: Fixes compiling gst-ffmpeg with gcc-4.7
-
-libavcodec/x86/h264_qpel_mmx.c: Assembler messages:
-libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
-libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
-make[5]: *** [libavcodec/x86/dsputil_mmx.o] Error 1
-
-Index: gst-ffmpeg-0.10.13/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c
-===================================================================
---- gst-ffmpeg-0.10.13.orig/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:39:41.324522051 -0700
-+++ gst-ffmpeg-0.10.13/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:54:08.152564075 -0700
-@@ -398,7 +398,7 @@
-             "2:                         \n\t"\
-             \
-             : "+a"(src), "+c"(dst)\
--            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
-+            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
-             : "memory"\
-         );\
-         src += 4-(h+5)*srcStride;\
-@@ -446,7 +446,7 @@
-             QPEL_H264HV(%%mm3, %%mm4, %%mm5, %%mm0, %%mm1, %%mm2, 15*48)\
-             "2:                     \n\t"\
-             : "+a"(src)\
--            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)\
-+            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)\
-             : "memory"\
-             );\
-         tmp += 4;\
-@@ -823,7 +823,7 @@
-         "2:                          \n\t"\
-         \
-         : "+a"(src), "+c"(dst)\
--        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
-+        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
-         : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3", \
-                        "%xmm4", "%xmm5", "%xmm6", "%xmm7",)\
-           "memory"\
-@@ -878,7 +878,7 @@
-             QPEL_H264HV_XMM(%%xmm3, %%xmm4, %%xmm5, %%xmm0, %%xmm1, %%xmm2, 15*48)
-             "2:                         \n\t"
-             : "+a"(src)
--            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)
-+            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)
-             : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3",
-                            "%xmm4", "%xmm5", "%xmm6", "%xmm7",)
-               "memory"
diff --git a/package/gstreamer/gst-ffmpeg/0002-arm-avoid-using-the-movw-instruction.patch b/package/gstreamer/gst-ffmpeg/0002-arm-avoid-using-the-movw-instruction.patch
deleted file mode 100644
index 288dc3d6e8..0000000000
--- a/package/gstreamer/gst-ffmpeg/0002-arm-avoid-using-the-movw-instruction.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Date: Mon, 1 Aug 2011 20:21:04 +0300
-Subject: [libavcodec] arm: Avoid using the movw instruction needlessly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-This fixes building for ARM11 without Thumb2.
-
-Signed-off-by: Martin Storsj? <martin@martin.st>
-
-[Arnout: backported to gst-ffmpeg, from ffmpeg 9a83adaf3]
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S b/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S
-index d3058ff..b6aee86 100644
---- a/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S
-+++ b/gst-libs/ext/libav/libavcodec/arm/ac3dsp_armv6.S
-@@ -37,7 +37,7 @@ function ff_ac3_bit_alloc_calc_bap_armv6, export=1
-         ldrb            r10, [r4], #1
- 1:
-         ldrsh           r9,  [r0], #2                   @ mask[band]
--        movw            r8,  #0x1fe0
-+        mov             r8,  #0xff0
-         sub             r9,  r9,  r12                   @   - snr_offset
-         mov             r11, r10
-         ldrb            r10, [r4], #1                   @ band_start_tab[band++]
-@@ -44,7 +44,7 @@ function ff_ac3_bit_alloc_calc_bap_armv6, export=1
-         subs            r9,  r9,  r5                    @   - floor
-         movlt           r9,  #0
-         cmp             r10, r3                         @   - end
--        and             r9,  r9,  r8                    @   & 0x1fe0
-+        and             r9,  r9,  r8, lsl #1            @   & 0x1fe0
-         subgt           r8,  r3,  r11
-         suble           r8,  r10, r11
-         add             r9,  r9,  r5                    @   + floor => m
---
-1.7.10.4
-
diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
deleted file mode 100644
index 32bfdd53c6..0000000000
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ /dev/null
@@ -1,30 +0,0 @@
-config BR2_PACKAGE_GST_FFMPEG
-	bool "gst-ffmpeg"
-	# Unsupported for MIPS R6. It bundles a version of libav which
-	# doesn't have support for MIPS R6.
-	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
-	# triggers https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65151 on sh
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_sh
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	help
-	  GStreamer plugin containing one plugin with a set of
-	  elements using the Libav library. It contains most popular
-	  decoders as well as colorspace conversion elements.
-
-	  This package is configured to use an internal copy of the
-	  Libav library.
-
-	  http://gstreamer.freedesktop.org/modules/gst-ffmpeg.html
-
-if BR2_PACKAGE_GST_FFMPEG
-
-config BR2_PACKAGE_GST_FFMPEG_GPL
-	bool "Enable GPL code"
-	help
-	  Allow use of GPL code. The resulting libs and binaries will
-	  be under GPL.
-
-endif
-
-comment "gst-ffmpeg needs a toolchain w/ gcc >= 5"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash
deleted file mode 100644
index c83c051b48..0000000000
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From http://gstreamer.freedesktop.org/src/gst-ffmpeg/gst-ffmpeg-0.10.13.tar.bz2.md5
-md5	7f5beacaf1312db2db30a026b36888c4	gst-ffmpeg-0.10.13.tar.bz2
-# Locally computed
-sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING.LIB
-sha256  03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  gst-libs/ext/libav/COPYING.LGPLv2.1
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  gst-libs/ext/libav/COPYING.LGPLv3
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
deleted file mode 100644
index 0d584a15b1..0000000000
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ /dev/null
@@ -1,103 +0,0 @@
-################################################################################
-#
-# gst-ffmpeg
-#
-################################################################################
-
-GST_FFMPEG_VERSION = 0.10.13
-GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
-GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
-GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
-
-ifeq ($(BR2_PACKAGE_GST_FFMPEG_GPL),y)
-GST_FFMPEG_CONF_OPTS += --disable-lgpl
-GST_FFMPEG_LICENSE = GPL-2.0+ (gst-ffmpeg), GPL-2.0+/GPL-3.0+ (libav)
-GST_FFMPEG_LICENSE_FILES = COPYING gst-libs/ext/libav/COPYING.GPLv2 gst-libs/ext/libav/COPYING.GPLv3
-else
-GST_FFMPEG_CONF_OPTS += --enable-lgpl
-GST_FFMPEG_LICENSE = LGPL-2.0+ (gst-ffmpeg), LGPL-2.1+/LGPL-3.0+ (libav)
-GST_FFMPEG_LICENSE_FILES = COPYING.LIB gst-libs/ext/libav/COPYING.LGPLv2.1 gst-libs/ext/libav/COPYING.LGPLv3
-endif
-
-GST_FFMPEG_CONF_EXTRA_OPTS = \
-	--cross-prefix=$(TARGET_CROSS) \
-	--target-os=linux \
-	--pkg-config='$(PKG_CONFIG_HOST_BINARY)'
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --enable-zlib
-GST_FFMPEG_DEPENDENCIES += zlib
-else
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-zlib
-endif
-
-ifeq ($(BR2_PACKAGE_BZIP2),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --enable-bzlib
-GST_FFMPEG_DEPENDENCIES += bzip2
-else
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-bzlib
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --enable-yasm
-GST_FFMPEG_DEPENDENCIES += host-yasm
-else
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-yasm
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-mmx
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --enable-sse
-else
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-sse
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --enable-ssse3
-else
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-ssse3
-endif
-
-# Explicitly disable everything that doesn't match for ARM
-# FFMPEG "autodetects" by compiling an extended instruction via AS
-# This works on compilers that aren't built for generic by default
-ifeq ($(BR2_ARM_CPU_ARMV4),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv5te
-endif
-ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --enable-armv6
-else
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
-endif
-ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --enable-neon
-endif
-
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --enable-altivec
-else
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-altivec
-endif
-
-# libav configure script misdetects the VIS optimizations as being
-# available, so forcefully disable them.
-ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-vis
-endif
-
-ifeq ($(BR2_STATIC_LIBS),)
-GST_FFMPEG_CONF_EXTRA_OPTS += --enable-pic
-endif
-
-GST_FFMPEG_CFLAGS = $(TARGET_CFLAGS)
-
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-GST_FFMPEG_CONF_EXTRA_OPTS += --disable-optimizations
-GST_FFMPEG_CFLAGS += -O0
-endif
-
-GST_FFMPEG_CONF_ENV += CFLAGS="$(GST_FFMPEG_CFLAGS)"
-GST_FFMPEG_CONF_OPTS += --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPTS)"
-
-$(eval $(autotools-package))
diff --git a/package/gstreamer/gst-fsl-plugins/0001-gplay-add-missing-include.patch b/package/gstreamer/gst-fsl-plugins/0001-gplay-add-missing-include.patch
deleted file mode 100644
index 19753bc787..0000000000
--- a/package/gstreamer/gst-fsl-plugins/0001-gplay-add-missing-include.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From ed649ccb8ddc724546172d329fca39b23c49b804 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Mon, 17 Dec 2012 17:58:28 +0100
-Subject: [PATCH] gplay: add missing include
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- tools/gplay/gst_snapshot.c |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/gplay/gst_snapshot.c b/tools/gplay/gst_snapshot.c
-index 40dbb6f..596f399 100755
---- a/tools/gplay/gst_snapshot.c
-+++ b/tools/gplay/gst_snapshot.c
-@@ -22,6 +22,7 @@
- 
- #include <gst/gst.h>
- #include <string.h>
-+#include <stdio.h>
- #include "gst_snapshot.h"
- 
- static void
--- 
diff --git a/package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch b/package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch
deleted file mode 100644
index 471c48364d..0000000000
--- a/package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 83b4f84b1c490b9bb816e1ecbc743d80d48cc06d Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Tue, 18 Dec 2012 12:05:22 +0100
-Subject: [PATCH] Fix bashism in configure script.
-
-The configure script uses +=, which is not POSIX. Debians that
-have the default dash as /bin/sh define a variable ending with
-+ instead of appending to it.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- configure.ac | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5968eb6..1a31a06 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -152,7 +152,7 @@ AC_SUBST(GST_PLUGINS_BASE_LIBS)
- AC_CHECK_HEADERS([vpu_lib.h], [HAVE_VPU_LIB=yes], [HAVE_VPU_LIB=no])
- if test "x$HAVE_VPU_LIB" = "xyes"; then
-     VPU_LIBS=`$PKG_CONFIG --libs libfslvpuwrap 2>/dev/null`
--    VPU_LIBS+=" -lvpu"
-+    VPU_LIBS="$VPU_LIBS -lvpu"
- fi
- AC_SUBST(VPU_LIBS)
- 
-@@ -176,14 +176,14 @@ AC_SUBST(RT_CFLAGS)
- AC_SUBST(RT_LIBS)
- 
- FSL_MM_CORE_CFLAGS=`$PKG_CONFIG --cflags libfslaudiocodec 2>/dev/null`
--FSL_MM_CORE_CFLAGS+=`$PKG_CONFIG --cflags libfslvideocodec 2>/dev/null`
--FSL_MM_CORE_CFLAGS+=`$PKG_CONFIG --cflags libfslparser 2>/dev/null`
--FSL_MM_CORE_CFLAGS+=`$PKG_CONFIG --cflags libfslvpuwrap 2>/dev/null`
-+FSL_MM_CORE_CFLAGS="$FSL_MM_CORE_CFLAGS `$PKG_CONFIG --cflags libfslvideocodec 2>/dev/null`"
-+FSL_MM_CORE_CFLAGS="$FSL_MM_CORE_CFLAGS `$PKG_CONFIG --cflags libfslparser 2>/dev/null`"
-+FSL_MM_CORE_CFLAGS="$FSL_MM_CORE_CFLAGS `$PKG_CONFIG --cflags libfslvpuwrap 2>/dev/null`"
- AC_SUBST(FSL_MM_CORE_CFLAGS)
- 
- FSL_MM_CORE_LIBS=`$PKG_CONFIG --libs libfslaudiocodec 2>/dev/null`
--FSL_MM_CORE_LIBS+=`$PKG_CONFIG --libs libfslvideocodec 2>/dev/null`
--FSL_MM_CORE_LIBS+=`$PKG_CONFIG --libs libfslparser 2>/dev/null`
-+FSL_MM_CORE_LIBS="$FSL_MM_CORE_LIBS `$PKG_CONFIG --libs libfslvideocodec 2>/dev/null`"
-+FSL_MM_CORE_LIBS="$FSL_MM_CORE_LIBS `$PKG_CONFIG --libs libfslparser 2>/dev/null`"
- AC_SUBST(FSL_MM_CORE_LIBS)
- 
- EXTRAPLATFORMCFLAGS="-DARM -D_GNUC_"
--- 
diff --git a/package/gstreamer/gst-fsl-plugins/0003-Use-proper-objdump.patch b/package/gstreamer/gst-fsl-plugins/0003-Use-proper-objdump.patch
deleted file mode 100644
index b7b8c9f740..0000000000
--- a/package/gstreamer/gst-fsl-plugins/0003-Use-proper-objdump.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c58b658a93b1b6d6e94ba0306d58de845012cef6 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Tue, 18 Dec 2012 12:22:52 +0100
-Subject: [PATCH] Use proper objdump
-
-If the OBJDUMP environment variable is set, that should be used rather
-than the objdump in PATH.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- configure.ac |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1a31a06..cc7557d 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -17,7 +17,7 @@ AC_DEFUN([FIND_PARSER_SONAME],
-     AC_MSG_CHECKING([for lib_$1_parser_$2_elinux.3.0.so soname])
-     path=`$PKG_CONFIG --variable=libdir libfslparser`
-     SONAME=$( $CC -print-file-name=$PKG_CONFIG_SYSROOT_DIR$path/lib_$1_parser_$2_elinux.so | \
--	    while read output; do objdump -p $output | \
-+	    while read output; do $OBJDUMP -p $output | \
- 	    grep "SONAME" | \
- 	    sed -e 's/ \+SONAME \+//'; done 2> /dev/null )
-     if [[ -z "$SONAME" ]]; then
-@@ -36,7 +36,7 @@ AC_DEFUN([FIND_ACODEC_SONAME],
-     AC_MSG_CHECKING([for lib_$1_wrap_$2_elinux.so soname])
-     path=`$PKG_CONFIG --variable=libdir libfslaudiocodec`
-     SONAME=$( $CC -print-file-name=$PKG_CONFIG_SYSROOT_DIR$path/wrap/lib_$1_wrap_$2_elinux.so | \
--	    while read output; do objdump -p $output | \
-+	    while read output; do $OBJDUMP -p $output | \
- 	    grep "SONAME" | \
- 	    sed -e 's/ \+SONAME \+//'; done 2> /dev/null )
-     if [[ -z "$SONAME" ]]; then
--- 
diff --git a/package/gstreamer/gst-fsl-plugins/0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch b/package/gstreamer/gst-fsl-plugins/0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
deleted file mode 100644
index 763703c27c..0000000000
--- a/package/gstreamer/gst-fsl-plugins/0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 1ca4251d1284f2cb56e31aaec4d369809e2139c9 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 24 Feb 2014 16:30:39 +0100
-Subject: [PATCH] Fix libgstfsl linkage (add -lrt for shared memory functions).
-
-Fixes runtime failure of gst-fsl-plugins, e.g.:
-(gst-plugin-scanner:1700): GStreamer-WARNING **: Failed to load
-	plugin '/usr/lib/gstreamer-0.10/libmfw_vpu.so':
-	/usr/lib/libgstfsl-0.10.so.0: undefined symbol: shm_open)
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac     | 3 +++
- libs/Makefile.am | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a5d1655..7b5a7a6 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -170,6 +170,9 @@ AC_CHECK_LIB(ipu, mxc_ipu_lib_task_init, [IPU_LIBS=-lipu], [echo "No libipu arou
- AC_SUBST(IPU_CFLAGS)
- AC_SUBST(IPU_LIBS)
- 
-+AC_SEARCH_LIBS([shm_open], [rt], [SHM_LIBS="-lrt"])
-+AC_SUBST(SHM_LIBS)
-+
- dnl of the POSIX Real-Time Extensions.
- AC_CHECK_LIB(rt, clock_gettime)
- AC_SUBST(RT_CFLAGS)
-diff --git a/libs/Makefile.am b/libs/Makefile.am
-index 2f56bba..5b30657 100755
---- a/libs/Makefile.am
-+++ b/libs/Makefile.am
-@@ -42,7 +42,7 @@ libgstfsl_ at GST_MAJORMINOR@_la_CFLAGS  += -DIPULIB
- endif
- 
- libgstfsl_ at GST_MAJORMINOR@_la_LDFLAGS = -version-info @GSTMXLIBS_VERSION@
--libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(RT_LIBS)
-+libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(RT_LIBS) $(SHM_LIBS)
- 
- libgstfsl_ at GST_MAJORMINOR@includedir = $(includedir)/gstreamer- at GST_MAJORMINOR@/gst/imx-mm
- libgstfsl_ at GST_MAJORMINOR@include_HEADERS = \
--- 
-1.8.1.4
-
diff --git a/package/gstreamer/gst-fsl-plugins/0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch b/package/gstreamer/gst-fsl-plugins/0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
deleted file mode 100644
index 56352753a0..0000000000
--- a/package/gstreamer/gst-fsl-plugins/0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From ce90794a3458af0aed43b8570cf44cd87900185d Mon Sep 17 00:00:00 2001
-From: Gary Bisson <bisson.gary@gmail.com>
-Date: Fri, 25 Jul 2014 16:44:53 -0700
-Subject: [PATCH] Remove use of obsolete VIDIOC_DBG_G_CHIP_IDENT
-
-This ioctl should never be used in application as
-stated in videodev2.h header.
-Moreover, its use in this plugin was very limited.
-
-Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
----
- src/misc/tvsrc/src/mfw_gst_tvsrc.c       | 8 --------
- src/misc/v4l_source/src/mfw_gst_v4lsrc.c | 7 -------
- 2 files changed, 15 deletions(-)
-
-diff --git a/src/misc/tvsrc/src/mfw_gst_tvsrc.c b/src/misc/tvsrc/src/mfw_gst_tvsrc.c
-index 67e0cd2..f495b6f 100755
---- a/src/misc/tvsrc/src/mfw_gst_tvsrc.c
-+++ b/src/misc/tvsrc/src/mfw_gst_tvsrc.c
-@@ -450,7 +450,6 @@ mfw_gst_tvsrc_capture_setup (MFWGstTVSRC * v4l_src)
-   struct v4l2_format fmt;
-   struct v4l2_control ctrl;
-   struct v4l2_streamparm parm;
--  struct v4l2_dbg_chip_ident chip;
-   gint fd_v4l = 0;
-   struct v4l2_mxc_offset off;
-   gint in_width = 0, in_height = 0;
-@@ -461,13 +460,6 @@ mfw_gst_tvsrc_capture_setup (MFWGstTVSRC * v4l_src)
-     return 0;
-   }
- 
--  if (ioctl (fd_v4l, VIDIOC_DBG_G_CHIP_IDENT, &chip)) {
--    g_print ("VIDIOC_DBG_G_CHIP_IDENT failed.\n");
--  } else
--    g_print ("sensor chip is %s\n", chip.match.name);
--
--
--
-   if (ioctl (fd_v4l, VIDIOC_G_STD, &id) < 0) {
-     g_print ("VIDIOC_G_STD failed\n");
-     close (fd_v4l);
-diff --git a/src/misc/v4l_source/src/mfw_gst_v4lsrc.c b/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
-index 2c2e838..85e7ff0 100755
---- a/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
-+++ b/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
-@@ -464,7 +464,6 @@ mfw_gst_v4lsrc_capture_setup (MFWGstV4LSrc * v4l_src)
-   struct v4l2_format fmt = {0};
-   struct v4l2_control ctrl = {0};
-   struct v4l2_streamparm parm = {0};
--  struct v4l2_dbg_chip_ident chip = {0};
-   struct v4l2_frmsizeenum fszenum = {0};
-   gint input;
-   gint fd_v4l = 0;
-@@ -476,12 +475,6 @@ mfw_gst_v4lsrc_capture_setup (MFWGstV4LSrc * v4l_src)
-     return 0;
-   }
- 
--  if (ioctl (fd_v4l, VIDIOC_DBG_G_CHIP_IDENT, &chip)) {
--    GST_ERROR ("VIDIOC_DBG_G_CHIP_IDENT failed.");
--  } else
--    GST_INFO ("sensor chip is %s", chip.match.name);
--
--
-   if (v4l_src->crop_pixel) {
-     in_width = v4l_src->capture_width - (2 * v4l_src->crop_pixel);
-     in_height = v4l_src->capture_height - (2 * v4l_src->crop_pixel);
--- 
-2.0.1
-
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
deleted file mode 100644
index a2ff11ec3e..0000000000
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ /dev/null
@@ -1,105 +0,0 @@
-comment "gst-fsl-plugins needs an imx-specific Linux kernel to be built"
-	depends on BR2_arm && !BR2_LINUX_KERNEL
-
-comment "gst-fsl-plugins needs a glibc toolchain"
-	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
-config BR2_PACKAGE_GST_FSL_PLUGINS
-	bool "gst-fsl-plugins"
-	depends on BR2_LINUX_KERNEL
-	depends on BR2_arm # Only relevant for i.MX
-	depends on BR2_TOOLCHAIN_USES_GLIBC # imx-codec
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	select BR2_PACKAGE_IMX_VPUWRAP if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
-	select BR2_PACKAGE_IMX_LIB
-	select BR2_PACKAGE_IMX_PARSER
-	select BR2_PACKAGE_IMX_CODEC
-	select BR2_PACKAGE_FREESCALE_IMX
-	help
-	  GStreamer plugins for hardware-accelerated audio and video
-	  parsers and codecs on i.MX platforms. It requires a kernel
-	  that includes the i.MX specific headers to be built.
-
-	  To use the VPU, its firmware blob must be installed as
-	  well. This can be found in the firmware-imx package in the
-	  "Hardware handling" menu.
-
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream. Pengutronix maintains gst-fsl-plugins at
-	  git://git.pengutronix.de/git/imx/gst-plugins-fsl-vpu.git but
-	  it diverges heavily from Freescale's original
-	  implementation.
-
-if BR2_PACKAGE_GST_FSL_PLUGINS
-choice
-	prompt "i.MX platform"
-	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX25 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
-	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX27 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
-	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX37 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
-	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX50 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
-	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX51 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
-	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX53 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
-	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX6  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX233
-	bool "imx233"
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX25
-	bool "imx25"
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX27
-	bool "imx27"
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX28
-	bool "imx28"
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX31
-	bool "imx31"
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX35
-	bool "imx35"
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX37
-	bool "imx37"
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX50
-	bool "imx50"
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX51
-	bool "imx51"
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX53
-	bool "imx53"
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX5X
-	bool "imx5X"
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX5X
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX6
-	bool "imx6"
-	select BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
-
-endchoice
-
-config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM
-	string
-	default "MX233" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX233
-	default "MX25" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX25
-	default "MX27" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX27
-	default "MX28" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX28
-	default "MX31" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX31
-	default "MX35" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX35
-	default "MX37" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX37
-	default "MX50" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX50
-	default "MX51" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX51
-	default "MX53" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX53
-	default "MX5X" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX5X
-	default "MX6" if BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX6
-endif
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash
deleted file mode 100644
index 338ef33fe7..0000000000
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# locally computed
-sha256  568883b2a1d8d32e4004cb3f123790d0b4286c91c1fac38c9dc8e20bd1250764  gst-fsl-plugins-4.0.3.tar.gz
-sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING-LGPL-2.1
-sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING-LGPL-2
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
deleted file mode 100644
index 5933efa533..0000000000
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-################################################################################
-#
-# gst-fsl-plugins
-#
-################################################################################
-
-GST_FSL_PLUGINS_VERSION = 4.0.3
-GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
-
-# Most is LGPL-2.0+, but some sources are copied from upstream and are
-# LGPL-2.1+, which essentially makes it LGPL-2.1+
-GST_FSL_PLUGINS_LICENSE = LGPL-2.0+, LGPL-2.1+, PROPRIETARY (asf.h)
-GST_FSL_PLUGINS_LICENSE_FILES = COPYING-LGPL-2.1 COPYING-LGPL-2
-
-GST_FSL_PLUGINS_INSTALL_STAGING = YES
-GST_FSL_PLUGINS_AUTORECONF = YES
-
-GST_FSL_PLUGINS_DEPENDENCIES += host-pkgconf gstreamer gst-plugins-base \
-	imx-lib imx-parser imx-codec
-
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_HAS_VPU),y)
-GST_FSL_PLUGINS_DEPENDENCIES += imx-vpuwrap
-endif
-
-GST_FSL_PLUGINS_CONF_ENV = \
-	PLATFORM=$(BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM) \
-	CROSS_ROOT="$(STAGING_DIR)"
-
-# needs access to imx-specific kernel headers
-GST_FSL_PLUGINS_DEPENDENCIES += linux
-GST_FSL_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(LINUX_DIR)/include/uapi"
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-GST_FSL_PLUGINS_DEPENDENCIES += xlib_libX11
-GST_FSL_PLUGINS_CONF_OPTS += --enable-x11
-else
-GST_FSL_PLUGINS_CONF_OPTS += --disable-x11
-endif
-
-$(eval $(autotools-package))
diff --git a/package/gstreamer/gst-omapfb/Config.in b/package/gstreamer/gst-omapfb/Config.in
deleted file mode 100644
index cfe5bba6bc..0000000000
--- a/package/gstreamer/gst-omapfb/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_GST_OMAPFB
-	bool "gst-omapfb"
-	depends on BR2_cortex_a8
-	help
-	  GStreamer plug-in to use OMAP framebuffer.
-
-	  http://github.com/felipec/gst-omapfb
diff --git a/package/gstreamer/gst-omapfb/gst-omapfb.hash b/package/gstreamer/gst-omapfb/gst-omapfb.hash
deleted file mode 100644
index 89a3ada696..0000000000
--- a/package/gstreamer/gst-omapfb/gst-omapfb.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256 56c719584d7a7ede5fc2053e8d1060f623b226a60672de0faba46fad646658a4  gst-omapfb-1.0.tar.gz
diff --git a/package/gstreamer/gst-omapfb/gst-omapfb.mk b/package/gstreamer/gst-omapfb/gst-omapfb.mk
deleted file mode 100644
index d37e77577e..0000000000
--- a/package/gstreamer/gst-omapfb/gst-omapfb.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# gst-omapfb
-#
-################################################################################
-
-GST_OMAPFB_VERSION = 1.0
-GST_OMAPFB_SITE = $(call github,felipec,gst-omapfb,v$(GST_OMAPFB_VERSION))
-
-define GST_OMAPFB_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
-endef
-
-define GST_OMAPFB_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
-endef
-
-GST_OMAPFB_DEPENDENCIES = gstreamer
-
-$(eval $(generic-package))
diff --git a/package/gstreamer/gst-plugin-x170/0001-correct-CFLAGS.patch b/package/gstreamer/gst-plugin-x170/0001-correct-CFLAGS.patch
deleted file mode 100644
index 9c32e46cce..0000000000
--- a/package/gstreamer/gst-plugin-x170/0001-correct-CFLAGS.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-The configure script is correctly getting the CFLAGS needed to compile a plugin
-for gstreamer and storing them in GST_BASE_CFLAGS but the Makefiles are never
-making use of those.
-
-We actually have to use AM_CPPFLAGS as AM_CFLAGS is used everywhere but on the
-real compiling rule...
-
-Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
----
- src/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 8cb51d1..6af5d91 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -5,6 +5,8 @@
- ##############################################################################
- plugin_LTLIBRARIES = libgstx170.la
- 
-+AM_CPPFLAGS = @GST_BASE_CFLAGS@
-+
- ##############################################################################
- # for the next set of variables, rename the prefix if you renamed the .la,   #
- #  e.g. libgstplugin_la_SOURCES => libmysomething_la_SOURCES                 #
--- 
-1.8.1.2
-
diff --git a/package/gstreamer/gst-plugin-x170/Config.in b/package/gstreamer/gst-plugin-x170/Config.in
deleted file mode 100644
index d0ba763a22..0000000000
--- a/package/gstreamer/gst-plugin-x170/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_GST_PLUGIN_X170
-	bool "gst-plugin-x170"
-	depends on BR2_arm926t
-	# glibc toolchain includes WCHAR and threading for libglib2
-	depends on BR2_TOOLCHAIN_USES_GLIBC # on2-8170-libs
-	depends on BR2_LINUX_KERNEL # on2-8170-libs
-	select BR2_PACKAGE_ON2_8170_LIBS
-	help
-	  GStreamer plug-in to use the Hantro X170 video decoder
-	  present on ATMEL AT91SAM9M10 SoC.
-
-	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
-
-comment "gst-plugin-x170 needs a glibc toolchain and a Linux kernel to be built"
-	depends on BR2_arm926t
-	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash
deleted file mode 100644
index 527c461656..0000000000
--- a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256 734ded3618246d946b53c2c8c7ab5a0961287485aaef5fb9bf874f93e3caa342  gst-plugin-x170-1.0.tar.gz
diff --git a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
deleted file mode 100644
index 378cd7a817..0000000000
--- a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# gst-plugin-x170
-#
-################################################################################
-
-GST_PLUGIN_X170_VERSION = 1.0
-GST_PLUGIN_X170_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec
-
-GST_PLUGIN_X170_LICENSE = BSD-1c
-#A license file is included but it is just a placeholder
-
-# There is no generated configure script in the tarball.
-GST_PLUGIN_X170_AUTORECONF = YES
-GST_PLUGIN_X170_AUTORECONF_OPTS = -Im4/
-GST_PLUGIN_X170_DEPENDENCIES = gstreamer libglib2 on2-8170-libs
-
-$(eval $(autotools-package))
diff --git a/package/gstreamer/gst-plugins-bad/0001-opus-jpegformat-unbreak-non-debug-build.patch b/package/gstreamer/gst-plugins-bad/0001-opus-jpegformat-unbreak-non-debug-build.patch
deleted file mode 100644
index 2c98c3e102..0000000000
--- a/package/gstreamer/gst-plugins-bad/0001-opus-jpegformat-unbreak-non-debug-build.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 1725e702a3622cb45c8142622dd419fa0c410ac9 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Wed, 12 Sep 2012 09:10:35 +0200
-Subject: [PATCH] gst-plugins-bad: opus + jpegformat: unbreak non-debug build
-
-opus + jpegformat plugin builds fail when gstreamer is configured with
---disable-gst-debug as they are checking the GST_DISABLE_DEBUG symbol
-instead of GST_DISABLE_GST_DEBUG.
-
-Submitted upstream as https://bugzilla.gnome.org/show_bug.cgi?id=683850
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- ext/opus/gstopusdec.c         |    2 +-
- ext/opus/gstopusenc.c         |    4 ++--
- gst/jpegformat/gstjpegparse.c |    4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/ext/opus/gstopusdec.c b/ext/opus/gstopusdec.c
-index 0e2805c..ab7221d 100644
---- a/ext/opus/gstopusdec.c
-+++ b/ext/opus/gstopusdec.c
-@@ -357,7 +357,7 @@ opus_dec_chain_parse_data (GstOpusDec * dec, GstBuffer * buffer)
- 
-     GST_DEBUG_OBJECT (dec, "Creating decoder with %d channels, %d Hz",
-         dec->n_channels, dec->sample_rate);
--#ifndef GST_DISABLE_DEBUG
-+#ifndef GST_DISABLE_GST_DEBUG
-     gst_opus_common_log_channel_mapping_table (GST_ELEMENT (dec), opusdec_debug,
-         "Mapping table", dec->n_channels, dec->channel_mapping);
- #endif
-diff --git a/ext/opus/gstopusenc.c b/ext/opus/gstopusenc.c
-index 240a2cb..d991795 100644
---- a/ext/opus/gstopusenc.c
-+++ b/ext/opus/gstopusenc.c
-@@ -589,7 +589,7 @@ gst_opus_enc_setup_channel_mappings (GstOpusEnc * enc,
-       }
-     }
- 
--#ifndef GST_DISABLE_DEBUG
-+#ifndef GST_DISABLE_GST_DEBUG
-     GST_INFO_OBJECT (enc,
-         "Mapping tables built: %d channels, %d stereo streams", enc->n_channels,
-         enc->n_stereo_streams);
-@@ -654,7 +654,7 @@ gst_opus_enc_setup (GstOpusEnc * enc)
- {
-   int error = OPUS_OK;
- 
--#ifndef GST_DISABLE_DEBUG
-+#ifndef GST_DISABLE_GST_DEBUG
-   GST_DEBUG_OBJECT (enc,
-       "setup: %d Hz, %d channels, %d stereo streams, family %d",
-       enc->sample_rate, enc->n_channels, enc->n_stereo_streams,
-diff --git a/gst/jpegformat/gstjpegparse.c b/gst/jpegformat/gstjpegparse.c
-index f984a52..b4af9ed 100644
---- a/gst/jpegformat/gstjpegparse.c
-+++ b/gst/jpegformat/gstjpegparse.c
-@@ -545,7 +545,7 @@ gst_jpeg_parse_skip_marker (GstJpegParse * parse,
-   if (!gst_byte_reader_get_uint16_be (reader, &size))
-     return FALSE;
- 
--#ifndef GST_DISABLE_DEBUG
-+#ifndef GST_DISABLE_GST_DEBUG
-   /* We'd pry the id of the skipped application segment */
-   if (marker >= APP0 && marker <= APP15) {
-     const gchar *id_str = NULL;
-@@ -561,7 +561,7 @@ gst_jpeg_parse_skip_marker (GstJpegParse * parse,
- #else
-   GST_DEBUG_OBJECT (parse, "unhandled marker %x skiping %u bytes", marker,
-       size);
--#endif // GST_DISABLE_DEBUG
-+#endif // GST_DISABLE_GST_DEBUG
- 
-   if (!gst_byte_reader_skip (reader, size - 2))
-     return FALSE;
--- 
-1.7.10
-
diff --git a/package/gstreamer/gst-plugins-bad/0002-fix-dfb-example.patch b/package/gstreamer/gst-plugins-bad/0002-fix-dfb-example.patch
deleted file mode 100644
index b2057484cd..0000000000
--- a/package/gstreamer/gst-plugins-bad/0002-fix-dfb-example.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix dfb-example
-
-Order of inclusion gives a strange effect on the definition of
-gst_debug_log. Swapping the include statements solve it.
-
-Not upstreamed since there will be no more updates to this version
-of gst-plugins-bad.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
-diff -rup gst-plugins-bad-0.10.23/ext/directfb/dfb-example.c gst-plugins-bad-0.10.23.fixed/ext/directfb/dfb-example.c
---- gst-plugins-bad-0.10.23/ext/directfb/dfb-example.c	2011-12-11 19:49:11.000000000 +0100
-+++ gst-plugins-bad-0.10.23.fixed/ext/directfb/dfb-example.c	2013-05-13 00:32:00.507469138 +0200
-@@ -1,7 +1,7 @@
- 
--#include <directfb.h>
- #include <stdio.h>
- #include <gst/gst.h>
-+#include <directfb.h>
- 
- static IDirectFB *dfb = NULL;
- static IDirectFBSurface *primary = NULL;
diff --git a/package/gstreamer/gst-plugins-bad/0003-drop-buggy-libvpx-legacy-handling.patch b/package/gstreamer/gst-plugins-bad/0003-drop-buggy-libvpx-legacy-handling.patch
deleted file mode 100644
index 780b5e38e6..0000000000
--- a/package/gstreamer/gst-plugins-bad/0003-drop-buggy-libvpx-legacy-handling.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-[PATCH] vp8: drop buggy libvpx legacy handling
-
-Legacy handling for older libvpx versions were added back in 2010, but this
-was unfortunately buggy as these symbols are enums and not defines - So they
-are never defined and the legacy symbols always used.
-
-Now that the legacy symbols are completely removed from libvpx from v1.4.0
-onwards this breaks.  Fix it by simply dropping the legacy handling, nobody
-should be using libvpx versions from before 2010 (or gstreamer 0.10 for that
-matter) any more.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- ext/vp8/gstvp8utils.h |   17 -----------------
- 1 file changed, 17 deletions(-)
-
-Index: gst-plugins-bad-0.10.23/ext/vp8/gstvp8utils.h
-===================================================================
---- gst-plugins-bad-0.10.23.orig/ext/vp8/gstvp8utils.h
-+++ gst-plugins-bad-0.10.23/ext/vp8/gstvp8utils.h
-@@ -25,23 +25,6 @@
- 
- G_BEGIN_DECLS
- 
--/* Some compatibility defines for older libvpx versions */
--#ifndef VPX_IMG_FMT_I420
--#define VPX_IMG_FMT_I420 IMG_FMT_I420
--#endif
--
--#ifndef VPX_PLANE_Y
--#define VPX_PLANE_Y PLANE_Y
--#endif
--
--#ifndef VPX_PLANE_U
--#define VPX_PLANE_U PLANE_U
--#endif
--
--#ifndef VPX_PLANE_V
--#define VPX_PLANE_V PLANE_V
--#endif
--
- const char * gst_vpx_error_name (vpx_codec_err_t status);
- 
- G_END_DECLS
diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
deleted file mode 100644
index c96ceb69c4..0000000000
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ /dev/null
@@ -1,334 +0,0 @@
-menuconfig BR2_PACKAGE_GST_PLUGINS_BAD
-	bool "gst-plugins-bad"
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	help
-	  A set of plug-ins for GStreamer that may be of poor quality or
-	  lacking some features.
-
-	  http://gstreamer.freedesktop.org/
-
-if BR2_PACKAGE_GST_PLUGINS_BAD
-
-comment "dependency-less plugins"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMDEC
-	bool "adpcmdec"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMENC
-	bool "adpcmenc"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFF
-	bool "aiff"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX
-	bool "asfmux"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT
-	bool "autoconvert"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS
-	bool "audiovisualizers"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER
-	bool "bayer"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN
-	bool "camerabin"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN2
-	bool "camerabin2"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE
-	bool "cdxaparse"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLOREFFECTS
-	bool "coloreffects"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLORSPACE
-	bool "colorspace"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DATAURISRC
-	bool "dataurisrc"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP
-	bool "dccp"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS
-	bool "debugutils"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DECKLINK
-	bool "decklink"
-	depends on BR2_INSTALL_LIBSTDCPP
-
-comment "decklink needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF
-	bool "dtmf"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
-	bool "dvdsuboverlay"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU
-	bool "dvdspu"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FACEOVERLAY
-	bool "faceoverlay"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL
-	bool "festival"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FIELDANALYSIS
-	bool "fieldanalysis"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEVERB
-	bool "freeverb"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
-	bool "freeze"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R
-	bool "frei0r"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS
-	bool "gaudieffects"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM
-	bool "geometrictransform"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GSETTINGS
-	bool "gsettings"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE
-	bool "h264parse"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HDVPARSE
-	bool "hdvparse"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HLS
-	bool "hls"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ID3TAG
-	bool "id3tag"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTER
-	bool "inter"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE
-	bool "interlace"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_IVFPARSE
-	bool "ivfparse"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR
-	bool "jp2kdecimator"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JPEGFORMAT
-	bool "jpegformat"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE
-	bool "legacyresample"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB
-	bool "librfb"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LINSYS
-	bool "linsys"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIVEADDER
-	bool "liveadder"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGDEMUX
-	bool "mpegdemux"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGPSMUX
-	bool "mpegpsmux"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
-	bool "mpegtsdemux"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX
-	bool "mpegtsmux"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGVIDEOPARSE
-	bool "mpegvideoparse"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MVE
-	bool "mve"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MXF
-	bool "mxf"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NSF
-	bool "nsf"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NUVDEMUX
-	bool "nuvdemux"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PATCHDETECT
-	bool "patchdetect"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE
-	bool "pcapparse"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PNM
-	bool "pnm"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE
-	bool "rawparse"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL
-	bool "real"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REMOVESILENCE
-	bool "removesilence"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX
-	bool "rtpmux"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPVP8
-	bool "rtpvp8"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO
-	bool "scaletempo"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDI
-	bool "sdi"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP
-	bool "sdp"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SEGMENTCLIP
-	bool "segmentclip"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN
-	bool "siren"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SMOOTH
-	bool "smooth"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED
-	bool "speed"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO
-	bool "stereo"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC
-	bool "subenc"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA
-	bool "tta"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOFILTERS
-	bool "videofilters"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMAXRATE
-	bool "videomaxrate"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMEASURE
-	bool "videomeasure"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOPARSERS
-	bool "videoparsers"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL
-	bool "videosignal"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC
-	bool "vmnc"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_Y4M
-	bool "y4m"
-
-comment "plugins with external dependencies (there may be more available)"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2
-	bool "bz2"
-	select BR2_PACKAGE_BZIP2
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO
-	bool "cdaudio"
-	depends on !BR2_nios2 # libcdaudio
-	select BR2_PACKAGE_LIBCDAUDIO
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL
-	bool "curl"
-	select BR2_PACKAGE_LIBCURL
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
-	bool "directfb"
-	default y
-	depends on BR2_PACKAGE_DIRECTFB
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
-	bool "dvb"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV
-	bool "fbdev"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD
-	bool "faad"
-	select BR2_PACKAGE_FAAD2
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS
-	bool "libmms"
-	depends on BR2_USE_WCHAR # libmms -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libmms -> libglib2
-	select BR2_PACKAGE_LIBMMS
-
-comment "libmms needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MUSEPACK
-	bool "musepack"
-	select BR2_PACKAGE_MUSEPACK
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON
-	bool "neon"
-	select BR2_PACKAGE_NEON
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OPUS
-	bool "opus"
-	select BR2_PACKAGE_OPUS
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG
-	bool "rsvg"
-	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # librsvg -> pango -> harfbuzz
-	select BR2_PACKAGE_LIBRSVG
-
-comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
-	bool "sdl"
-	select BR2_PACKAGE_SDL
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SNDFILE
-	bool "sndfile"
-	select BR2_PACKAGE_LIBSNDFILE
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
-	bool "vcd"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VP8
-	bool "vp8"
-	select BR2_PACKAGE_LIBVPX
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
-	bool "zbar"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # zbar-> libv4l
-	depends on BR2_USE_MMU # zbar-> libv4l
-	depends on BR2_INSTALL_LIBSTDCPP # zbar-> libv4l
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # zbar -> libv4l
-	select BR2_PACKAGE_ZBAR
-
-comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-
-endif
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.hash b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.hash
deleted file mode 100644
index 6448acc4cc..0000000000
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-0.10.23.tar.xz.md5
-md5	e4822fa2cc933768e2998311a1565979	gst-plugins-bad-0.10.23.tar.xz
-# Locally computed
-sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING.LIB
-sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
deleted file mode 100644
index a98eac4235..0000000000
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ /dev/null
@@ -1,593 +0,0 @@
-################################################################################
-#
-# gst-plugins-bad
-#
-################################################################################
-
-GST_PLUGINS_BAD_VERSION = 0.10.23
-GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
-GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
-# COPYING.LIB is in fact v2, but most of the code is v2.1+
-GST_PLUGINS_BAD_LICENSE = LGPL-2.1+, GPL-2.0+
-GST_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB COPYING
-
-GST_PLUGINS_BAD_CONF_OPTS = \
-	--disable-apexsink \
-	--disable-examples \
-	--disable-spandsp
-
-GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer
-
-ifeq ($(BR2_PACKAGE_ORC),y)
-GST_PLUGINS_BAD_DEPENDENCIES += orc
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMDEC),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-adpcmdec
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-adpcmdec
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMENC),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-adpcmenc
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-adpcmenc
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFF),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-aiff
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-aiff
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-asfmux
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-asfmux
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-audiovisualizers
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-audiovisualizers
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-autoconvert
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-autoconvert
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-bayer
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-bayer
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-camerabin
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-camerabin
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN2),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-camerabin2
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-camerabin2
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-cdxaparse
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-cdxaparse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-coloreffects
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-coloreffects
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLORSPACE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-colorspace
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-colorspace
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DATAURISRC),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-dataurisrc
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-dataurisrc
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-dccp
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-dccp
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-debugutils
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-debugutils
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DECKLINK),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-decklink
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-decklink
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-dtmf
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-dtmf
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-dvbsuboverlay
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-dvbsuboverlay
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-dvdspu
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-dvdspu
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FACEOVERLAY),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-faceoverlay
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-faceoverlay
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-festival
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-festival
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FIELDANALYSIS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-fieldanalysis
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-fieldanalysis
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-freeze
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-freeze
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEVERB),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-freeverb
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-freeverb
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-frei0r
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-frei0r
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-gaudieffects
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-gaudieffects
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-geometrictransform
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-geometrictransform
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GSETTINGS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-gsettings
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-gsettings
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-h264parse
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-h264parse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HDVPARSE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-hdvparse
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-hdvparse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HLS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-hls
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-hls
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ID3TAG),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-id3tag
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-id3tag
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTER),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-inter
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-inter
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-interlace
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-interlace
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_IVFPARSE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-ivfparse
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-ivfparse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-jp2kdecimator
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-jp2kdecimator
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JPEGFORMAT),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-jpegformat
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-jpegformat
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-legacyresample
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-legacyresample
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-librfb
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-librfb
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LINSYS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-linsys
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-linsys
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIVEADDER),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-liveadder
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-liveadder
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGDEMUX),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-mpegdemux
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-mpegdemux
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGPSMUX),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-mpegpsmux
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-mpegpsmux
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-mpegtsdemux
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-mpegtsdemux
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-mpegtsmux
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-mpegtsmux
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGVIDEOPARSE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-mpegvideoparse
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-mpegvideoparse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MVE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-mve
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-mve
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MXF),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-mxf
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-mxf
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NSF),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-nsf
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-nsf
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NUVDEMUX),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-nuvdemux
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-nuvdemux
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PATCHDETECT),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-patchdetect
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-patchdetect
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-pcapparse
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-pcapparse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PNM),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-pnm
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-pnm
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-rawparse
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-rawparse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-real
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-real
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REMOVESILENCE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-removesilence
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-rtpmux
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-rtpmux
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPVP8),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-rtpvp8
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-rtpvp8
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-scaletempo
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-scaletempo
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDI),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-sdi
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-sdi
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-sdp
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-sdp
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SEGMENTCLIP),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-segmentclip
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-segmentclip
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-siren
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-siren
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SMOOTH),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-smooth
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-smooth
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-speed
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-speed
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-subenc
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-subenc
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-stereo
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-stereo
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-tta
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-tta
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOFILTERS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-videofilters
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-videofilters
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMAXRATE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-videomaxrate
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-videomaxrate
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMEASURE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-videomeasure
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-videomeasure
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOPARSERS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-videoparsers
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-videoparsers
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-videosignal
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-videosignal
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-vmnc
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-vmnc
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_Y4M),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-y4m
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-y4m
-endif
-
-# plugins with deps
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-bz2
-GST_PLUGINS_BAD_DEPENDENCIES += bzip2
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-bz2
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-cdaudio
-GST_PLUGINS_BAD_DEPENDENCIES += libcdaudio
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-cdaudio
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-curl
-GST_PLUGINS_BAD_DEPENDENCIES += libcurl
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-curl
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-directfb
-GST_PLUGINS_BAD_DEPENDENCIES += directfb
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-directfb
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-dvb
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-dvb
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-faad
-GST_PLUGINS_BAD_DEPENDENCIES += faad2
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-faad
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-fbdev
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-fbdev
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-libmms
-GST_PLUGINS_BAD_DEPENDENCIES += libmms
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-libmms
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MUSEPACK),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-musepack
-GST_PLUGINS_BAD_DEPENDENCIES += musepack
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-musepack
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-neon
-GST_PLUGINS_BAD_DEPENDENCIES += neon
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-neon
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OPUS),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-opus
-GST_PLUGINS_BAD_DEPENDENCIES += opus
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-opus
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-rsvg
-GST_PLUGINS_BAD_DEPENDENCIES += librsvg
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-rsvg
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL),y)
-GST_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
-GST_PLUGINS_BAD_CONF_OPTS += --enable-sdl
-GST_PLUGINS_BAD_DEPENDENCIES += sdl
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-sdl
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SNDFILE),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-sndfile
-GST_PLUGINS_BAD_DEPENDENCIES += libsndfile
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-sndfile
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-vcd
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-vcd
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VP8),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-vp8
-GST_PLUGINS_BAD_DEPENDENCIES += libvpx
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-vp8
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR),y)
-GST_PLUGINS_BAD_CONF_OPTS += --enable-zbar
-GST_PLUGINS_BAD_DEPENDENCIES += zbar
-else
-GST_PLUGINS_BAD_CONF_OPTS += --disable-zbar
-endif
-
-$(eval $(autotools-package))
diff --git a/package/gstreamer/gst-plugins-base/0001-tremor.patch b/package/gstreamer/gst-plugins-base/0001-tremor.patch
deleted file mode 100644
index fa8785bed4..0000000000
--- a/package/gstreamer/gst-plugins-base/0001-tremor.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 0088753651350de3060ece22c1be4153b6009515 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Wed, 25 Jan 2012 23:53:04 +0100
-Subject: [PATCH] base: vorbisdeclib: support modern Tremor versions
-
-Reported upstream as https://bugzilla.gnome.org/show_bug.cgi?id=668726
-
-Tremor changed to use standard libogg rather than its own incompatible
-copy back in Aug 2010 (r17375), causing gst-plugin-base build to fail.
-
-Tremolo so far unfortunately hasn't been updated. Restructure
-vorbisdeclib.h so the legacy _ogg_packet_wrapper code is only used for
-Tremolo.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- ext/vorbis/gstvorbisdeclib.h |   77 ++++++++++++++++++++++-------------------
- 1 files changed, 41 insertions(+), 36 deletions(-)
-
-diff --git a/ext/vorbis/gstvorbisdeclib.h b/ext/vorbis/gstvorbisdeclib.h
-index ca00af9..e147591 100644
---- a/ext/vorbis/gstvorbisdeclib.h
-+++ b/ext/vorbis/gstvorbisdeclib.h
-@@ -29,11 +29,6 @@
- 
- #ifndef TREMOR
- 
--#include <vorbis/codec.h>
--
--typedef float                          vorbis_sample_t;
--typedef ogg_packet                     ogg_packet_wrapper;
--
- #define GST_VORBIS_DEC_DESCRIPTION "decode raw vorbis streams to float audio"
- 
- #define GST_VORBIS_DEC_SRC_CAPS \
-@@ -47,6 +42,42 @@ typedef ogg_packet                     ogg_packet_wrapper;
- 
- #define GST_VORBIS_DEC_GLIB_TYPE_NAME      GstVorbisDec
- 
-+#else /* TREMOR */
-+
-+#define GST_VORBIS_DEC_DESCRIPTION "decode raw vorbis streams to integer audio"
-+
-+#define GST_VORBIS_DEC_SRC_CAPS \
-+    GST_STATIC_CAPS ("audio/x-raw-int, "   \
-+        "rate = (int) [ 1, MAX ], "        \
-+        "channels = (int) [ 1, 6 ], "      \
-+        "endianness = (int) BYTE_ORDER, "  \
-+        "width = (int) { 16, 32 }, "       \
-+        "depth = (int) 16, "               \
-+        "signed = (boolean) true")
-+
-+#define GST_VORBIS_DEC_DEFAULT_SAMPLE_WIDTH           (16)
-+
-+/* we need a different type name here */
-+#define GST_VORBIS_DEC_GLIB_TYPE_NAME      GstIVorbisDec
-+
-+/* and still have it compile */
-+typedef struct _GstVorbisDec               GstIVorbisDec;
-+typedef struct _GstVorbisDecClass          GstIVorbisDecClass;
-+
-+#endif /* TREMOR */
-+
-+#ifndef USE_TREMOLO
-+
-+#ifdef TREMOR
-+ #include <tremor/ivorbiscodec.h>
-+ typedef ogg_int32_t                    vorbis_sample_t;
-+#else
-+ #include <vorbis/codec.h>
-+ typedef float                          vorbis_sample_t;
-+#endif
-+
-+typedef ogg_packet                     ogg_packet_wrapper;
-+
- static inline guint8 *
- gst_ogg_packet_data (ogg_packet * p)
- {
-@@ -72,17 +103,11 @@ gst_ogg_packet_from_wrapper (ogg_packet_wrapper * packet)
-   return packet;
- }
- 
--#else
--
--#ifdef USE_TREMOLO
--  #include <Tremolo/ivorbiscodec.h>
--  #include <Tremolo/codec_internal.h>
--  typedef ogg_int16_t                    vorbis_sample_t;
--#else
--  #include <tremor/ivorbiscodec.h>
--  typedef ogg_int32_t                    vorbis_sample_t;
--#endif
-+#else /* USE_TREMOLO */
- 
-+#include <Tremolo/ivorbiscodec.h>
-+#include <Tremolo/codec_internal.h>
-+typedef ogg_int16_t                    vorbis_sample_t;
- typedef struct _ogg_packet_wrapper     ogg_packet_wrapper;
- 
- struct _ogg_packet_wrapper {
-@@ -91,26 +116,6 @@ struct _ogg_packet_wrapper {
-   ogg_buffer          buf;
- };
- 
--#define GST_VORBIS_DEC_DESCRIPTION "decode raw vorbis streams to integer audio"
--
--#define GST_VORBIS_DEC_SRC_CAPS \
--    GST_STATIC_CAPS ("audio/x-raw-int, "   \
--        "rate = (int) [ 1, MAX ], "        \
--        "channels = (int) [ 1, 6 ], "      \
--        "endianness = (int) BYTE_ORDER, "  \
--        "width = (int) { 16, 32 }, "       \
--        "depth = (int) 16, "               \
--        "signed = (boolean) true")
--
--#define GST_VORBIS_DEC_DEFAULT_SAMPLE_WIDTH           (16)
--
--/* we need a different type name here */
--#define GST_VORBIS_DEC_GLIB_TYPE_NAME      GstIVorbisDec
--
--/* and still have it compile */
--typedef struct _GstVorbisDec               GstIVorbisDec;
--typedef struct _GstVorbisDecClass          GstIVorbisDecClass;
--
- /* compensate minor variation */
- #define vorbis_synthesis(a, b)             vorbis_synthesis (a, b, 1)
- 
-@@ -154,7 +159,7 @@ gst_ogg_packet_from_wrapper (ogg_packet_wrapper * packet)
-   return &(packet->packet);
- }
- 
--#endif
-+#endif /* USE_TREMOLO */
- 
- typedef void (*CopySampleFunc)(vorbis_sample_t *out, vorbis_sample_t **in,
-                            guint samples, gint channels, gint width);
--- 
-1.7.8.3
-
diff --git a/package/gstreamer/gst-plugins-base/0002-audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch b/package/gstreamer/gst-plugins-base/0002-audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
deleted file mode 100644
index eabea4f8ca..0000000000
--- a/package/gstreamer/gst-plugins-base/0002-audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From daa194b71ea6f9e8ee522ab02e8c56150b7e62b3 Mon Sep 17 00:00:00 2001
-From: Antoine Jacoutot <ajacoutot@gnome.org>
-Date: Mon, 20 Jan 2014 15:44:09 +0100
-Subject: [PATCH] audioresample: Fix build on x86 if emmintrin.h is available
- but can't be used
-
-On i386, EMMINTRIN is defined but not usable without SSE so check for
-__SSE__ and __SSE2__ as well.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=670690
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- gst/audioresample/resample.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gst/audioresample/resample.c b/gst/audioresample/resample.c
-index 98d006c..481fa01 100644
---- a/gst/audioresample/resample.c
-+++ b/gst/audioresample/resample.c
-@@ -77,13 +77,13 @@
- #define EXPORT G_GNUC_INTERNAL
- 
- #ifdef _USE_SSE
--#ifndef HAVE_XMMINTRIN_H
-+#if !defined(__SSE__) || !defined(HAVE_XMMINTRIN_H)
- #undef _USE_SSE
- #endif
- #endif
- 
- #ifdef _USE_SSE2
--#ifndef HAVE_EMMINTRIN_H
-+#if !defined(__SSE2__) || !defined(HAVE_XMMINTRIN_H)
- #undef _USE_SSE2
- #endif
- #endif
--- 
-2.1.4
-
diff --git a/package/gstreamer/gst-plugins-base/0003-audioresample-It-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch b/package/gstreamer/gst-plugins-base/0003-audioresample-It-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch
deleted file mode 100644
index e67531d2f7..0000000000
--- a/package/gstreamer/gst-plugins-base/0003-audioresample-It-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 4e3d101aa854cfee633a9689efeb75e5001baa5e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Mon, 20 Jan 2014 16:11:04 +0100
-Subject: [PATCH] audioresample: It's HAVE_EMMINTRIN_H, not HAVE_XMMINTRIN_H
- for SSE2
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- gst/audioresample/resample.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/audioresample/resample.c b/gst/audioresample/resample.c
-index 481fa01..4410bdd 100644
---- a/gst/audioresample/resample.c
-+++ b/gst/audioresample/resample.c
-@@ -83,7 +83,7 @@
- #endif
- 
- #ifdef _USE_SSE2
--#if !defined(__SSE2__) || !defined(HAVE_XMMINTRIN_H)
-+#if !defined(__SSE2__) || !defined(HAVE_EMMINTRIN_H)
- #undef _USE_SSE2
- #endif
- #endif
--- 
-2.1.4
-
diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
deleted file mode 100644
index d784bcdd39..0000000000
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ /dev/null
@@ -1,110 +0,0 @@
-menuconfig BR2_PACKAGE_GST_PLUGINS_BASE
-	bool "gst-plugins-base"
-	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXV if BR2_PACKAGE_XORG7
-	help
-	  A basic set of well-supported plug-ins for GStreamer.
-
-	  http://gstreamer.freedesktop.org/
-
-if BR2_PACKAGE_GST_PLUGINS_BASE
-
-comment "dependency-less plugins"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER
-	bool "adder"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
-	bool "app"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
-	bool "audioconvert (mandatory for audio playback)"
-	default y
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORATE
-	bool "audiorate"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
-	bool "audioresample (mandatory for audio playback)"
-	default y
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC
-	bool "audiotestsrc"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ENCODING
-	bool "encoding"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE
-	bool "ffmpegcolorspace (mandatory for video playback)"
-	default y
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_GDP
-	bool "gdp"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK
-	bool "playback (mandatory)"
-	default y
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TCP
-	bool "tcp"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TYPEFIND
-	bool "typefind (mandatory)"
-	default y
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC
-	bool "videotestsrc"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEORATE
-	bool "videorate"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOSCALE
-	bool "videoscale (mandatory for video playback)"
-	default y
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VOLUME
-	bool "volume (mandatory for audio playback)"
-	default y
-
-comment "plugins with external dependencies (there may be more available)"
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA
-	bool "alsa (mandatory for audio playback)"
-	select BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_ALSA_LIB_MIXER
-	select BR2_PACKAGE_ALSA_LIB_PCM
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
-	bool "ogg (*.ogg audio/video)"
-	select BR2_PACKAGE_LIBOGG
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO
-	bool "pango font renderer"
-	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
-	select BR2_PACKAGE_PANGO
-
-comment "pango plugin needs a toolchain w/ C++, gcc => 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE
-	bool "subparse"
-	select BR2_PACKAGE_LIBXML2
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
-	bool "theora (*.ogg video)"
-	select BR2_PACKAGE_LIBTHEORA
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TREMOR
-	bool "tremor"
-	select BR2_PACKAGE_TREMOR
-
-config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS
-	bool "vorbis (*.ogg audio)"
-	select BR2_PACKAGE_LIBVORBIS
-
-endif
diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.hash b/package/gstreamer/gst-plugins-base/gst-plugins-base.hash
deleted file mode 100644
index f71f8dfb2b..0000000000
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-0.10.36.tar.xz.md5
-md5	3d2337841b132fe996e5eb2396ac9438	gst-plugins-base-0.10.36.tar.xz
-# Locally computed
-sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
-sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING.LIB
diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
deleted file mode 100644
index 735314365d..0000000000
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
+++ /dev/null
@@ -1,196 +0,0 @@
-################################################################################
-#
-# gst-plugins-base
-#
-################################################################################
-
-GST_PLUGINS_BASE_VERSION = 0.10.36
-GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
-GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
-GST_PLUGINS_BASE_INSTALL_STAGING = YES
-GST_PLUGINS_BASE_LICENSE = GPL-2.0+, LGPL-2.0+
-GST_PLUGINS_BASE_LICENSE_FILES = COPYING COPYING.LIB
-
-# freetype is only used by examples, but if it is not found
-# and the host has a freetype-config script, then the host
-# include dirs are added to the search path causing trouble
-GST_PLUGINS_BASE_CONF_ENV = \
-	FT2_CONFIG=/bin/false \
-	ac_cv_header_stdint_t="stdint.h"
-
-GST_PLUGINS_BASE_CONF_OPTS = \
-	--disable-examples \
-	--disable-oggtest \
-	--disable-vorbistest \
-	--disable-freetypetest
-
-GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
-
-ifeq ($(BR2_PACKAGE_XORG7),y)
-GST_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
-GST_PLUGINS_BASE_CONF_OPTS += \
-	--enable-x \
-	--enable-xshm \
-	--enable-xvideo
-else
-GST_PLUGINS_BASE_CONF_OPTS += \
-	--disable-x \
-	--disable-xshm \
-	--disable-xvideo
-endif
-
-ifeq ($(BR2_PACKAGE_ORC),y)
-GST_PLUGINS_BASE_DEPENDENCIES += orc
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA),y)
-GST_PLUGINS_BASE_DEPENDENCIES += alsa-lib
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-alsa
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-adder
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-adder
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-app
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-app
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOCONVERT),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-audioconvert
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-audioconvert
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORATE),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-audiorate
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-audiorate
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-audioresample
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-audioresample
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-audiotestsrc
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-audiotestsrc
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ENCODING),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-encoding
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-encoding
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-ffmpegcolorspace
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-ffmpegcolorspace
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_GDP),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-gdp
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-gdp
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-playback
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-playback
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-subparse
-GST_PLUGINS_BASE_DEPENDENCIES += libxml2
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-subparse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TCP),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-tcp
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-tcp
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TYPEFIND),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-typefind
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-typefind
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-videotestsrc
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-videotestsrc
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEORATE),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-videorate
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-videorate
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOSCALE),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-videoscale
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-videoscale
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VOLUME),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-volume
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-volume
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-ogg
-GST_PLUGINS_BASE_DEPENDENCIES += libogg
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-ogg
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-pango
-GST_PLUGINS_BASE_DEPENDENCIES += pango
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-pango
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-theora
-GST_PLUGINS_BASE_DEPENDENCIES += libtheora
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-theora
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TREMOR),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-ivorbis
-GST_PLUGINS_BASE_DEPENDENCIES += tremor
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-ivorbis
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS),y)
-GST_PLUGINS_BASE_CONF_OPTS += --enable-vorbis
-GST_PLUGINS_BASE_DEPENDENCIES += libvorbis
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-vorbis
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-GST_PLUGINS_BASE_DEPENDENCIES += zlib
-else
-GST_PLUGINS_BASE_CONF_OPTS += --disable-zlib
-endif
-
-$(eval $(autotools-package))
diff --git a/package/gstreamer/gst-plugins-good/0001-linux36.patch b/package/gstreamer/gst-plugins-good/0001-linux36.patch
deleted file mode 100644
index 5d7cd932ed..0000000000
--- a/package/gstreamer/gst-plugins-good/0001-linux36.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Fix building with Linux headers 3.6
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-
-From bfb1ac952b4c3caaba0297bbe7dc73ea92f9b292 Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Thu, 09 Aug 2012 07:35:23 +0000
-Subject: v4l2: fix build with recent kernels, the v4l2_buffer input field was removed
-
-This was unused apparently and removed in the kernel in commit:
-
- From 2b719d7baf490e24ce7d817c6337b7c87fda84c1 Mon Sep 17 00:00:00 2001
- From: Sakari Ailus <sakari.ailus@iki.fi>
- Date: Wed, 2 May 2012 09:40:03 -0300
- Subject: [PATCH] [media] v4l: drop v4l2_buffer.input and V4L2_BUF_FLAG_INPUT
-
- Remove input field in struct v4l2_buffer and flag V4L2_BUF_FLAG_INPUT which
- tells the former is valid. The flag is used by no driver currently.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=681491
----
-(limited to 'sys/v4l2/gstv4l2bufferpool.c')
-
-diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
-index 2e3a563..5aaed5a 100644
---- a/sys/v4l2/gstv4l2bufferpool.c
-+++ b/sys/v4l2/gstv4l2bufferpool.c
-@@ -182,7 +182,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool, guint index, GstCaps * caps)
-     GST_LOG_OBJECT (pool->v4l2elem, "  MMAP offset:  %u",
-         ret->vbuffer.m.offset);
-   GST_LOG_OBJECT (pool->v4l2elem, "  length:    %u", ret->vbuffer.length);
--  GST_LOG_OBJECT (pool->v4l2elem, "  input:     %u", ret->vbuffer.input);
- 
-   ret->mmap_length = ret->vbuffer.length;
-   data = (guint8 *) v4l2_mmap (0, ret->vbuffer.length,
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/gstreamer/gst-plugins-good/0002-v4l2-fix-compilation-against-newer-kernel-headers.patch b/package/gstreamer/gst-plugins-good/0002-v4l2-fix-compilation-against-newer-kernel-headers.patch
deleted file mode 100644
index 62c3bb24e6..0000000000
--- a/package/gstreamer/gst-plugins-good/0002-v4l2-fix-compilation-against-newer-kernel-headers.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 8e633d2059cb835448021cf79becb487aff10975 Mon Sep 17 00:00:00 2001
-From: Bastien Nocera <hadess@hadess.net>
-Date: Mon, 18 Mar 2013 14:59:35 +0000
-Subject: [PATCH] v4l2: fix compilation against newer kernel headers as on
- FC19
-
----
- sys/v4l2/v4l2_calls.c |    4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/sys/v4l2/v4l2_calls.c b/sys/v4l2/v4l2_calls.c
-index 07d390a..4c10f4f 100644
---- a/sys/v4l2/v4l2_calls.c
-+++ b/sys/v4l2/v4l2_calls.c
-@@ -291,8 +291,12 @@ gst_v4l2_fill_lists (GstV4l2Object * v4l2object)
-         break;
-       case V4L2_CID_HFLIP:
-       case V4L2_CID_VFLIP:
-+#ifndef V4L2_CID_PAN_RESET
-       case V4L2_CID_HCENTER:
-+#endif
-+#ifndef V4L2_CID_TILT_RESET
-       case V4L2_CID_VCENTER:
-+#endif
- #ifdef V4L2_CID_PAN_RESET
-       case V4L2_CID_PAN_RESET:
- #endif
--- 
-1.7.10.4
-
diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
deleted file mode 100644
index 3b2a99f5b4..0000000000
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ /dev/null
@@ -1,234 +0,0 @@
-menuconfig BR2_PACKAGE_GST_PLUGINS_GOOD
-	bool "gst-plugins-good"
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	help
-	  A set of well-supported plug-ins for GStreamer under the
-	  preferred license.
-
-	  http://gstreamer.freedesktop.org/
-
-if BR2_PACKAGE_GST_PLUGINS_GOOD
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG
-	bool "jpeg (JPEG support)"
-	select BR2_PACKAGE_JPEG
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PNG
-	bool "png (PNG support)"
-	select BR2_PACKAGE_LIBPNG
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_BZ2
-	bool "bz2 support"
-	depends on BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
-	select BR2_PACKAGE_BZIP2
-	help
-	  Enable bz2 support for the following plugins:
-	  matroska
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_ZLIB
-	bool "zlib support"
-	depends on BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ISOMP4 || BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX || BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
-	select BR2_PACKAGE_ZLIB
-	help
-	  Enable zlib support for the following plugins:
-	  id3demux, isomp4, matroska
-
-comment "dependency-less plugins"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ALPHA
-	bool "alpha"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_APETAG
-	bool "apetag"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOFX
-	bool "audiofx"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS
-	bool "audioparsers"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUPARSE
-	bool "auparse"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUTODETECT
-	bool "autodetect"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AVI
-	bool "avi (*.avi video)"
-	default y
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CUTTER
-	bool "cutter"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUGUTILS
-	bool "debugutils"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEINTERLACE
-	bool "deinterlace"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EFFECTV
-	bool "effectv"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EQUALIZER
-	bool "equalizer"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLV
-	bool "flv"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX
-	bool "flx"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM
-	bool "goom"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM2K1
-	bool "goom2k1"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX
-	bool "id3demux (*.mp3 audio)"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ICYDEMUX
-	bool "icydemux"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE
-	bool "imagefreeze"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_INTERLEAVE
-	bool "interleave"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ISOMP4
-	bool "isomp4"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LAW
-	bool "law"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LEVEL
-	bool "level"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
-	bool "matroska"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE
-	bool "monoscope"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIFILE
-	bool "multifile"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIPART
-	bool "multipart"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_REPLAYGAIN
-	bool "replaygain"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTP
-	bool "rtp"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTPMANAGER
-	bool "rtpmanager"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTSP
-	bool "rtsp"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SHAPEWIPE
-	bool "shapewipe"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SMPTE
-	bool "smpte"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM
-	bool "spectrum"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP
-	bool "udp"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX
-	bool "videobox"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOCROP
-	bool "videocrop"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER
-	bool "videofilter"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOMIXER
-	bool "videomixer"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVENC
-	bool "wavenc"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE
-	bool "wavparse (*.wav audio)"
-	default y
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_Y4M
-	bool "y4m"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_V4L2
-	bool "v4l2"
-
-comment "plugins with external dependencies"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX
-	bool "annodex (XML Library)"
-	select BR2_PACKAGE_LIBXML2
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CAIRO
-	bool "cairo"
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_CAIRO_PNG
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
-	bool "flac (libFLAC)"
-	depends on BR2_USE_WCHAR # flac
-	select BR2_PACKAGE_FLAC
-
-comment "flac needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
-	bool "gdkpixbuf"
-	depends on BR2_USE_WCHAR # gdk-pixbuf -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf -> libglib2
-	select BR2_PACKAGE_GDK_PIXBUF
-
-comment "gdkpixbuf needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
-	bool "ossaudio (OSS audio)"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
-	bool "oss4 (Open Sound System 4)"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
-	bool "pulseaudio"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
-	depends on BR2_USE_MMU # pulseaudio
-	depends on !BR2_STATIC_LIBS # pulseaudio
-	depends on BR2_USE_WCHAR # pulseaudio
-	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC # pulseaudio
-	select BR2_PACKAGE_PULSEAUDIO
-
-comment "pulseaudio support needs a toolchain w/ threads, wchar, dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_USE_WCHAR
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
-	bool "souphttpsrc (http client)"
-	depends on BR2_USE_WCHAR # libsoup -> glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libsoup -> glib2
-	select BR2_PACKAGE_LIBSOUP
-
-comment "souphttpsrc needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX
-	bool "speex"
-	select BR2_PACKAGE_SPEEX
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPACK
-	bool "wavpack (*.wv audio)"
-	select BR2_PACKAGE_WAVPACK
-
-endif
diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good.hash b/package/gstreamer/gst-plugins-good/gst-plugins-good.hash
deleted file mode 100644
index 1b8b474207..0000000000
--- a/package/gstreamer/gst-plugins-good/gst-plugins-good.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-0.10.31.tar.xz.md5
-md5	555845ceab722e517040bab57f9ace95	gst-plugins-good-0.10.31.tar.xz
-# Locally computed
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
deleted file mode 100644
index 791b41351b..0000000000
--- a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
+++ /dev/null
@@ -1,394 +0,0 @@
-################################################################################
-#
-# gst-plugins-good
-#
-################################################################################
-
-GST_PLUGINS_GOOD_VERSION = 0.10.31
-GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.xz
-GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
-GST_PLUGINS_GOOD_LICENSE = LGPL-2.1+
-GST_PLUGINS_GOOD_LICENSE_FILES = COPYING
-
-GST_PLUGINS_GOOD_CONF_OPTS = \
-	--disable-examples \
-	--disable-directsound \
-	--disable-sunaudio \
-	--disable-osx_audio \
-	--disable-osx_video \
-	--disable-aalib \
-	--disable-aalibtest \
-	--disable-esd \
-	--disable-esdtest \
-	--disable-shout2
-
-GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
-
-ifeq ($(BR2_PACKAGE_XORG7),y)
-GST_PLUGINS_GOOD_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
-GST_PLUGINS_GOOD_CONF_OPTS += \
-	--enable-x \
-	--enable-xshm \
-	--enable-xvideo
-else
-GST_PLUGINS_GOOD_CONF_OPTS += \
-	--disable-x \
-	--disable-xshm \
-	--disable-xvideo
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-jpeg
-GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-jpeg
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PNG),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-libpng
-GST_PLUGINS_GOOD_DEPENDENCIES += libpng
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-libpng
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_BZ2),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-bz2
-GST_PLUGINS_GOOD_DEPENDENCIES += bzip2
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-bz2
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_ZLIB),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-zlib
-GST_PLUGINS_GOOD_DEPENDENCIES += zlib
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-zlib
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ALPHA),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-alpha
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-alpha
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_APETAG),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-apetag
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-apetag
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOFX),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-audiofx
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-audiofx
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-audioparsers
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-audioparsers
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUPARSE),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-auparse
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-auparse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUTODETECT),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-autodetect
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-autodetect
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AVI),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-avi
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-avi
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CUTTER),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-cutter
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-cutter
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUGUTILS),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-debugutils
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-debugutils
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEINTERLACE),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-deinterlace
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-deinterlace
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EFFECTV),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-effectv
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-effectv
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EQUALIZER),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-equalizer
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-equalizer
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLV),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-flv
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-flv
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-flx
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-flx
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-goom
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-goom
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM2K1),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-goom2k1
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-goom2k1
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-id3demux
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-id3demux
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ICYDEMUX),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-icydemux
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-icydemux
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-imagefreeze
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-imagefreeze
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_INTERLEAVE),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-interleave
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-interleave
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ISOMP4),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-isomp4
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-isomp4
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LAW),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-law
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-law
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LEVEL),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-level
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-level
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-matroska
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-matroska
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-monoscope
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-monoscope
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIFILE),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-multifile
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-multifile
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIPART),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-multipart
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-multipart
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_REPLAYGAIN),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-replaygain
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-replaygain
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTP),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-rtp
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-rtp
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTPMANAGER),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-rtpmanager
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-rtpmanager
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTSP),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-rtsp
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-rtsp
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SHAPEWIPE),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-shapewipe
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-shapewipe
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SMPTE),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-smpte
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-smpte
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-spectrum
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-spectrum
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-udp
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-udp
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-videobox
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-videobox
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOCROP),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-videocrop
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-videocrop
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-videofilter
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-videofilter
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOMIXER),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-videomixer
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-videomixer
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVENC),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-wavenc
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-wavenc
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-wavparse
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-wavparse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_Y4M),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-y4m
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-y4m
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_V4L2),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-gst_v4l2
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-gst_v4l2
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-annodex
-GST_PLUGINS_GOOD_DEPENDENCIES += libxml2
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-annodex
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CAIRO),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-cairo
-GST_PLUGINS_GOOD_DEPENDENCIES += cairo
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-cairo
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-flac
-GST_PLUGINS_GOOD_DEPENDENCIES += flac
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-flac
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-gdk_pixbuf
-GST_PLUGINS_GOOD_DEPENDENCIES += gdk-pixbuf
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-gdk_pixbuf
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-oss
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-oss
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-oss4
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-oss4
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-pulse
-GST_PLUGINS_GOOD_DEPENDENCIES += pulseaudio
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-pulse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-soup
-GST_PLUGINS_GOOD_DEPENDENCIES += libsoup
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-soup
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-speex
-GST_PLUGINS_GOOD_DEPENDENCIES += speex
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-speex
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPACK),y)
-GST_PLUGINS_GOOD_CONF_OPTS += --enable-wavpack
-GST_PLUGINS_GOOD_DEPENDENCIES += wavpack
-else
-GST_PLUGINS_GOOD_CONF_OPTS += --disable-wavpack
-endif
-
-$(eval $(autotools-package))
diff --git a/package/gstreamer/gst-plugins-ugly/Config.in b/package/gstreamer/gst-plugins-ugly/Config.in
deleted file mode 100644
index 3d133cf3f1..0000000000
--- a/package/gstreamer/gst-plugins-ugly/Config.in
+++ /dev/null
@@ -1,53 +0,0 @@
-menuconfig BR2_PACKAGE_GST_PLUGINS_UGLY
-	bool "gst-plugins-ugly"
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	help
-	  A set of well-supported plug-ins for GStreamer, but might pose
-	  problems for distributors.
-
-	  http://gstreamer.freedesktop.org/
-
-if BR2_PACKAGE_GST_PLUGINS_UGLY
-
-comment "dependency-less plugins"
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ASFDEMUX
-	bool "asfdemux"
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC
-	bool "dvdlpcmdec"
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDSUB
-	bool "dvdsub"
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_IEC958
-	bool "iec958"
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGAUDIOPARSE
-	bool "mpegaudioparse"
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGSTREAM
-	bool "mpegstream"
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_REALMEDIA
-	bool "realmedia"
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_SYNAESTHESIA
-	bool "synaesthesia"
-
-comment "plugins with external dependencies (there may be more available)"
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_LAME
-	bool "lame (*.mp3 audio encoder)"
-	select BR2_PACKAGE_LAME
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD
-	bool "mad (*.mp3 audio)"
-	select BR2_PACKAGE_LIBID3TAG
-	select BR2_PACKAGE_LIBMAD
-
-config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEG2DEC
-	bool "mpeg2dec"
-	select BR2_PACKAGE_LIBMPEG2
-
-endif
diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
deleted file mode 100644
index 8e103676e4..0000000000
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-0.10.19.tar.xz.md5
-md5	ba26045c8c8c91f0d48d327ccf53ac0c	gst-plugins-ugly-0.10.19.tar.xz
-# Locally computed
-sha256  4934f65ff892637e7efaf1cfe635779189dde429d0706f40c86a3aac476ea873  gst-plugins-ugly-0.10.19.tar.xz
-sha256  2a8aa4cd019fab333f1f8377bf7afa426d3038a033361d90fab70c335e9a53e7  cdio-cd-text-api.patch
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
deleted file mode 100644
index 1a1e2a11ba..0000000000
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
+++ /dev/null
@@ -1,90 +0,0 @@
-################################################################################
-#
-# gst-plugins-ugly
-#
-################################################################################
-
-GST_PLUGINS_UGLY_VERSION = 0.10.19
-GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
-GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
-GST_PLUGINS_UGLY_PATCH = http://git.alpinelinux.org/cgit/aports/plain/main/gst-plugins-ugly0.10/cdio-cd-text-api.patch
-# COPYING is in fact LGPL-2.1, but all of the code is LGPL-2.0+
-# (except for one test, xingmux)
-GST_PLUGINS_UGLY_LICENSE = LGPL-2.0+, GPL-2.0+ (synaesthesia)
-GST_PLUGINS_UGLY_LICENSE_FILES = COPYING
-
-GST_PLUGINS_UGLY_CONF_OPTS = \
-	--disable-examples
-
-GST_PLUGINS_UGLY_DEPENDENCIES = gstreamer gst-plugins-base
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ASFDEMUX),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-asfdemux
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-asfdemux
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-dvdlpcmdec
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-dvdlpcmdec
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDSUB),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-dvdsub
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-dvdsub
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_IEC958),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-iec958
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-iec958
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGAUDIOPARSE),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-mpegaudioparse
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-mpegaudioparse
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGSTREAM),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-mpegstream
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-mpegstream
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-realmedia
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-realmedia
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_SYNAESTHESIA),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-synaesthesia
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-synaesthesia
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_LAME),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-lame
-GST_PLUGINS_UGLY_DEPENDENCIES += lame
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-lame
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-mad
-GST_PLUGINS_UGLY_DEPENDENCIES += libid3tag libmad
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-mad
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
-GST_PLUGINS_UGLY_CONF_OPTS += --enable-mpeg2dec
-GST_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
-else
-GST_PLUGINS_UGLY_CONF_OPTS += --disable-mpeg2dec
-endif
-
-$(eval $(autotools-package))
diff --git a/package/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer.mk
deleted file mode 100644
index 22240bceea..0000000000
--- a/package/gstreamer/gstreamer.mk
+++ /dev/null
@@ -1 +0,0 @@
-include $(sort $(wildcard package/gstreamer/*/*.mk))
diff --git a/package/gstreamer/gstreamer/0001-bison3.patch b/package/gstreamer/gstreamer/0001-bison3.patch
deleted file mode 100644
index f9ec52d95a..0000000000
--- a/package/gstreamer/gstreamer/0001-bison3.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix deprecation from bison 3.0+
-From http://comments.gmane.org/gmane.linux.lfs.beyond.devel/24620
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura gstreamer-0.10.36.orig/gst/parse/grammar.y gstreamer-0.10.36/gst/parse/grammar.y
---- gstreamer-0.10.36.orig/gst/parse/grammar.y	2013-10-04 09:52:21.685282055 -0300
-+++ gstreamer-0.10.36/gst/parse/grammar.y	2013-10-04 10:21:54.800211238 -0300
-@@ -26,7 +26,6 @@
-  */
-
- #define YYERROR_VERBOSE 1
--#define YYLEX_PARAM scanner
-
- #define YYENABLE_NLS 0
-
-@@ -648,6 +647,7 @@
- %right '.'
- %left '!' '='
-
-+%lex-param { void *scanner }
- %parse-param { void *scanner }
- %parse-param { graph_t *graph }
- %pure-parser
diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
deleted file mode 100644
index b1334abfcc..0000000000
--- a/package/gstreamer/gstreamer/Config.in
+++ /dev/null
@@ -1,38 +0,0 @@
-comment "gstreamer 0.10 needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
-
-config BR2_PACKAGE_GSTREAMER
-	bool "gstreamer 0.10"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  GStreamer is an open source multimedia framework.
-
-	  This 0.10.x version of GStreamer is incompatible with
-	  GStreamer 1.X.
-
-	  http://gstreamer.freedesktop.org/
-
-if BR2_PACKAGE_GSTREAMER
-
-config BR2_PACKAGE_GSTREAMER_GST_DEBUG
-	bool "enable gst-debug trace support"
-	default y
-	help
-	  Enable support for the gst-debug tracing functionality in
-	  gstreamer.  This has limited CPU overhead, but does increase
-	  the rootfs size somewhat.
-
-config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
-	bool "enable plugin registry"
-	default y
-	help
-	  Enable support for the GStreamer plugin registry. This may
-	  increase the launch-time for a GStreamer application.
-
-endif
diff --git a/package/gstreamer/gstreamer/gstreamer.hash b/package/gstreamer/gstreamer/gstreamer.hash
deleted file mode 100644
index 9b3c42b44a..0000000000
--- a/package/gstreamer/gstreamer/gstreamer.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-0.10.36.tar.xz.md5
-md5	15389c73e091b1dda915279c388b9cb2	gstreamer-0.10.36.tar.xz
-# locally computed
-sha256  9151aa108c177054387885763fa0e433e76780f7c5655c70a5390f2a6c6871da  gstreamer-0.10.36.tar.xz
-sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
deleted file mode 100644
index 2ec360c94d..0000000000
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ /dev/null
@@ -1,36 +0,0 @@
-################################################################################
-#
-# gstreamer
-#
-################################################################################
-
-GSTREAMER_VERSION = 0.10.36
-GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
-GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
-GSTREAMER_INSTALL_STAGING = YES
-# COPYING is in fact v2, but most of the code is v2.1+
-GSTREAMER_LICENSE = LGPL-2.1+
-GSTREAMER_LICENSE_FILES = COPYING
-
-# Checking if unaligned memory access works correctly cannot be done when cross
-# compiling. For the following architectures there is no information available
-# in the configure script.
-ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze)$(BR2_nios2)$(BR2_or1k)$(BR2_riscv),y)
-GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
-endif
-ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
-GSTREAMER_CONF_ENV = as_cv_unaligned_access=yes
-endif
-
-GSTREAMER_CONF_OPTS = \
-	--disable-examples \
-	--disable-tests \
-	--disable-failing-tests \
-	--disable-loadsave \
-	$(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug) \
-	$(if $(BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY),,--disable-registry)
-
-GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex \
-	$(if $(BR2_PACKAGE_LIBXML2),libxml2)
-
-$(eval $(autotools-package))
-- 
2.20.1
