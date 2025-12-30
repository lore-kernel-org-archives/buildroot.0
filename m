Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F3AEE4990
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A57407E8;
	Tue, 30 Dec 2025 18:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChQITTbmRuXv; Tue, 30 Dec 2025 18:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2027C407FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118365;
	bh=3wTaU7I8u39XrFPd+BaONJQqerlsdhnAUmOBztKSOIw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H03BOCg0WEExHqHm768zUmqrPeMwH0gDIJgJJ3QLDFShl7cwx23tUKI4Fo8CJtYM6
	 uDUXECyUj03pVMukeutYx0ZJU8zEf2Uz6xPBrgjDOguyq4fjCadXUnq2uF3x3H6OX2
	 IOtOf0rWj0Hz84lZ3dIIh7STS9S8w8LiEhodx+E8nOwKxYgmrGysS4N7jX082gaLNb
	 75quniA80dltZ3xQemJ2TSetpPDl6LJmuDfHiH8eqkXtvar7zdTgk7huwgSlM4Nw1Y
	 cHumCd/QDvZvzUj25QXHjn8yIT4KfDxhjExI2Feph5WU4mFcmsA1jKUtqOwQNdjSyE
	 RaHvc5CyxOweA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2027C407FF;
	Tue, 30 Dec 2025 18:12:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D918177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74EFE80F83
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-4H7gQAizTA for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C5CB80EE8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C5CB80EE8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09DD987C3F; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0eb9886f718233fd08698fb53089c1a81545b526
X-Git-Newrev: c2645a3312f4d913c4df299b8bad2b0fa89a11da
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.09DD987C3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musepack: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1406687102496991747=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1406687102496991747==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c2645a3312f4d913c4df299b8bad2b0fa89a11da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Last release 2011: https://www.musepack.net/index.php?pg=src

The package is broken with cmake 4 and no other package depends on it.

No autobuilder issues, as this problem was hidden by the libcuefile
CMake 4 build issue.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  5 ---
 Config.in.legacy                                   | 18 +++++++++
 package/Config.in                                  |  1 -
 package/gstreamer1/gst1-plugins-bad/Config.in      |  4 --
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  8 +---
 package/mpd/Config.in                              |  9 -----
 package/mpd/mpd.mk                                 |  8 +---
 package/musepack/0001-shared.patch                 | 24 -----------
 ...he-standard-CMake-flag-to-drive-the-share.patch | 43 --------------------
 .../0003-include-fpu-control-with-glibc-only.patch | 26 ------------
 package/musepack/0004-missing-sys-select.patch     | 21 ----------
 package/musepack/0005-fix-build-with-gcc-10.patch  | 30 --------------
 package/musepack/0006-incompatible-pointers.patch  | 47 ----------------------
 package/musepack/Config.in                         | 12 ------
 package/musepack/musepack.hash                     |  7 ----
 package/musepack/musepack.mk                       | 16 --------
 package/vlc/vlc.mk                                 |  8 +---
 17 files changed, 21 insertions(+), 266 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 80e46fe3ce..c48a0a5b18 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -690,11 +690,6 @@ package/mrouted/S41mrouted NotExecutable
 package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
 package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch lib_patch.Upstream
 package/multipath-tools/S60multipathd Shellcheck
-package/musepack/0001-shared.patch lib_patch.Upstream
-package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch lib_patch.Upstream
-package/musepack/0003-include-fpu-control-with-glibc-only.patch lib_patch.Upstream
-package/musepack/0004-missing-sys-select.patch lib_patch.Upstream
-package/musepack/0005-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
 package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch lib_patch.Upstream
 package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 0b73fe5149..28c90b32d1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,24 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_MPD_MUSEPACK
+	bool "musepack support in mpd has been removed"
+	select BR2_LEGACY
+	help
+	  musepack package is unmaintained and has been removed
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK
+	bool "musepack support in gst1-plugins-bad has been removed"
+	select BR2_LEGACY
+	help
+	  musepack package is unmaintained and has been removed
+
+config BR2_PACKAGE_MUSEPACK
+	bool "musepack has been removed"
+	select BR2_LEGACY
+	help
+	  musepack is unmaintained and has been removed
+
 config BR2_PACKAGE_RACEHOUND
 	bool "racehound has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index a60050b2d4..e54a5e0fa5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -41,7 +41,6 @@ menu "Audio and video applications"
 	source "package/mpg123/Config.in"
 	source "package/mpv/Config.in"
 	source "package/multicat/Config.in"
-	source "package/musepack/Config.in"
 	source "package/ncmpc/Config.in"
 	source "package/opus-tools/Config.in"
 	source "package/pipewire/Config.in"
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 4a78e9b694..45a8a44077 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -507,10 +507,6 @@ comment "mpeg2enc needs a toolchain w/ threads, C++"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK
-	bool "musepack"
-	select BR2_PACKAGE_MUSEPACK
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 	bool "neon"
 	select BR2_PACKAGE_NEON
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 99aa258786..c6fb669e13 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -62,6 +62,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dmicrodns=disabled \
 	-Dlibde265=disabled \
 	-Dmodplug=disabled \
+	-Dmusepack=disabled \
 	-Dmplex=disabled \
 	-Donnx=disabled \
 	-Dopenexr=disabled \
@@ -648,13 +649,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dmpeg2enc=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK),y)
-GST1_PLUGINS_BAD_CONF_OPTS += -Dmusepack=enabled
-GST1_PLUGINS_BAD_DEPENDENCIES += musepack
-else
-GST1_PLUGINS_BAD_CONF_OPTS += -Dmusepack=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dneon=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += neon
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 48b8c914fa..d8ce930cc5 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -140,15 +140,6 @@ config BR2_PACKAGE_MPD_MPG123
 	  Enable mpg123 input support.
 	  Select this if you want to play back MP3 files.
 
-config BR2_PACKAGE_MPD_MUSEPACK
-	bool "musepack"
-	select BR2_PACKAGE_LIBCUEFILE
-	select BR2_PACKAGE_LIBREPLAYGAIN
-	select BR2_PACKAGE_MUSEPACK
-	help
-	  Enable musepack input support.
-	  Select this if you want to play back MPC files.
-
 config BR2_PACKAGE_MPD_OPUS
 	bool "opus"
 	select BR2_PACKAGE_OPUS
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ff6f08ba65..cc7bd7f0b2 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -19,6 +19,7 @@ MPD_SELINUX_MODULES = mpd
 MPD_CONF_OPTS = \
 	-Daudiofile=disabled \
 	-Ddocumentation=disabled \
+	-Dmpcdec=disabled \
 	-Dopenmpt=disabled \
 	-Dpipewire=disabled \
 	-Dsnapcast=false
@@ -226,13 +227,6 @@ else
 MPD_CONF_OPTS += -Dmpg123=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_MUSEPACK),y)
-MPD_DEPENDENCIES += musepack
-MPD_CONF_OPTS += -Dmpcdec=enabled
-else
-MPD_CONF_OPTS += -Dmpcdec=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT),y)
 MPD_CONF_OPTS += -Dneighbor=true
 else
diff --git a/package/musepack/0001-shared.patch b/package/musepack/0001-shared.patch
deleted file mode 100644
index d8c788db7c..0000000000
--- a/package/musepack/0001-shared.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fixup installation of shared mpcdec library.
-Based on gentoo patch.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-
-diff -Nura musepack_src_r475.orig/libmpcdec/CMakeLists.txt musepack_src_r475/libmpcdec/CMakeLists.txt
---- musepack_src_r475.orig/libmpcdec/CMakeLists.txt	2010-08-21 12:55:01.000000000 -0300
-+++ musepack_src_r475/libmpcdec/CMakeLists.txt	2011-08-17 15:53:06.126873408 -0300
-@@ -1,7 +1,12 @@
- include_directories(${libmpc_SOURCE_DIR}/include)
- if(SHARED)
--  add_library(mpcdec SHARED huffman mpc_decoder mpc_reader streaminfo mpc_bits_reader mpc_demux requant synth_filter ${libmpc_SOURCE_DIR}/common/crc32)
-+  add_library(mpcdec_shared SHARED huffman mpc_decoder mpc_reader streaminfo mpc_bits_reader mpc_demux requant synth_filter ${libmpc_SOURCE_DIR}/common/crc32)
-+  set_target_properties(mpcdec_shared PROPERTIES OUTPUT_NAME mpcdec CLEAN_DIRECT_OUTPUT 1 VERSION 7.0.1 SOVERSION 7)
-+  target_link_libraries(mpcdec_shared m)
-+  install(TARGETS mpcdec_shared LIBRARY DESTINATION "lib${LIB_SUFFIX}" ARCHIVE DESTINATION "lib${LIB_SUFFIX}")
- else(SHARED)
-   add_library(mpcdec_static STATIC huffman mpc_decoder mpc_reader streaminfo mpc_bits_reader mpc_demux requant synth_filter ${libmpc_SOURCE_DIR}/common/crc32)
-+  set_target_properties(mpcdec_static PROPERTIES OUTPUT_NAME mpcdec CLEAN_DIRECT_OUTPUT 1)
-+  target_link_libraries(mpcdec_static m)
-+  install(TARGETS mpcdec_static LIBRARY DESTINATION "lib${LIB_SUFFIX}" ARCHIVE DESTINATION "lib${LIB_SUFFIX}")
- endif(SHARED)
--
diff --git a/package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
deleted file mode 100644
index dade23f7aa..0000000000
--- a/package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d2f01ba6fa2a065156fad686d1849309c661e527 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 31 Aug 2014 12:07:31 +0200
-Subject: [PATCH] cmake: use the standard CMake flag to drive the shared
- object build
-
-If BUILD_SHARED_LIBS is set and SHARED undefined, then drive SHARED with
-the BUILD_SHARED_LIBS value.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- CMakeLists.txt | 15 ++++++++++-----
- 1 file changed, 10 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b13f78c..db75510 100755
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -7,11 +7,16 @@ project(libmpc C)
- set(CMAKE_VERBOSE_MAKEFILE false)
- TEST_BIG_ENDIAN(MPC_ENDIANNESS)
- 
--if(WIN32)
--  option(SHARED "Use shared libmpcdec" OFF)
--else(WIN32)
--  option(SHARED "Use shared libmpcdec" ON)
--endif(WIN32)
-+# Use the standard CMake flag to drive the shared object build.
-+if(DEFINED BUILD_SHARED_LIBS AND NOT DEFINED SHARED)
-+  set(SHARED ${BUILD_SHARED_LIBS})
-+else()
-+  if(WIN32)
-+    option(SHARED "Use shared libmpcdec" OFF)
-+  else(WIN32)
-+    option(SHARED "Use shared libmpcdec" ON)
-+  endif(WIN32)
-+endif()
- 
- add_definitions(-DFAST_MATH -DCVD_FASTLOG)
- 
--- 
-2.1.0
-
diff --git a/package/musepack/0003-include-fpu-control-with-glibc-only.patch b/package/musepack/0003-include-fpu-control-with-glibc-only.patch
deleted file mode 100644
index 6f50155781..0000000000
--- a/package/musepack/0003-include-fpu-control-with-glibc-only.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Include <fpu_control.h> only on glibc systems
-
-The <fpu_control.h> header provides _FPU_*() macros, which the
-Init_FPU() function uses only on i386, and only when they are
-defined. Since <fpu_control.h> is not available, this causes a build
-failure with C libraries such as musl. By simply including
-<fpu_control.h> explicitly on glibc systems, we avoid the build
-failure, since mpcenc.c already conditionally uses the <fpu_control.h>
-macros only if they are defined.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Thomas: better commit log.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-diff -uNr musepack_src_r475.org/mpcenc/mpcenc.h musepack_src_r475/mpcenc/mpcenc.h
---- musepack_src_r475.org/mpcenc/mpcenc.h	2009-02-23 19:15:46.000000000 +0100
-+++ musepack_src_r475/mpcenc/mpcenc.h	2016-01-30 09:29:08.000000000 +0100
-@@ -50,7 +51,7 @@
- # include <unistd.h>
- #endif
- 
--#if   defined __linux__
-+#if   defined __GLIBC__
- #  include <fpu_control.h>
- #elif defined __FreeBSD__
- # include <machine/floatingpoint.h>
diff --git a/package/musepack/0004-missing-sys-select.patch b/package/musepack/0004-missing-sys-select.patch
deleted file mode 100644
index 64efbc4733..0000000000
--- a/package/musepack/0004-missing-sys-select.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Add missing <sys/select.h> include
-
-This header is needed when types like fd_set are used. This fixes a
-build issue occurring on the musl C library.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Thomas: better commit log.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/mpcenc/mpcenc.h
-===================================================================
---- a/mpcenc/mpcenc.h
-+++ b/mpcenc/mpcenc.h
-@@ -34,6 +34,7 @@
- //// portable system includes //////////////////////////////////////
- #include <stddef.h>
- #include <math.h>
-+#include <sys/select.h>
- 
- //// system dependent system includes //////////////////////////////
- // low level I/O, where are prototypes and constants?
diff --git a/package/musepack/0005-fix-build-with-gcc-10.patch b/package/musepack/0005-fix-build-with-gcc-10.patch
deleted file mode 100644
index 012dbab542..0000000000
--- a/package/musepack/0005-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-fix build with gcc 10
-
-Define __Cc, __Dc and Res_bit as extern to avoid the following build
-failure with gcc 10 (which defaults to -fno-common):
-
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: CMakeFiles/mpcdec_shared.dir/requant.o:(.rodata+0x0): multiple definition of `__Dc'; CMakeFiles/mpcdec_shared.dir/mpc_decoder.o:(.rodata+0x430): first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: CMakeFiles/mpcdec_shared.dir/requant.o:(.rodata+0x28): multiple definition of `__Cc'; CMakeFiles/mpcdec_shared.dir/mpc_decoder.o:(.rodata+0x458): first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: CMakeFiles/mpcdec_shared.dir/requant.o:(.rodata+0x74): multiple definition of `Res_bit'; CMakeFiles/mpcdec_shared.dir/mpc_decoder.o:(.rodata+0x4a4): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/9971da8c59484a6a26eb79d6e157461a47855dbf
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -Naur musepack_src_r475.orig/libmpcdec/requant.h musepack_src_r475/libmpcdec/requant.h
---- musepack_src_r475.orig/libmpcdec/requant.h	2020-09-10 08:31:50.696105246 +0200
-+++ musepack_src_r475/libmpcdec/requant.h	2020-09-10 08:32:52.944106476 +0200
-@@ -47,9 +47,9 @@
- 
- 
- /* C O N S T A N T S */
--const mpc_uint8_t      Res_bit [18];     ///< Bits per sample for chosen quantizer
--const MPC_SAMPLE_FORMAT __Cc    [1 + 18]; ///< Requantization coefficients
--const mpc_int16_t       __Dc    [1 + 18]; ///< Requantization offset
-+extern const mpc_uint8_t      Res_bit [18];     ///< Bits per sample for chosen quantizer
-+extern const MPC_SAMPLE_FORMAT __Cc    [1 + 18]; ///< Requantization coefficients
-+extern const mpc_int16_t       __Dc    [1 + 18]; ///< Requantization offset
- 
- #define Cc (__Cc + 1)
- #define Dc (__Dc + 1)
diff --git a/package/musepack/0006-incompatible-pointers.patch b/package/musepack/0006-incompatible-pointers.patch
deleted file mode 100644
index 7fb1b8fa23..0000000000
--- a/package/musepack/0006-incompatible-pointers.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Fixed incompatible pointer types
-
-This is due to GCC14 that no longer allows implicitly casting all pointer types
-to all other pointer types. Resulting in error such as :
-
-output/build/musepack-475/libmpcpsy/ans.c:291:120: error: passing argument 10 of ‘FindOptimalANS’ from incompatible pointer type [-Wincompatible-pointer-types]
-  291 | L, ANSspec_M, m->NS_Order_L, m->SNR_comp_L, m->FIR_L, smr.L, smr.M, m->SCF_Index_L, Transient );
-      |                                                                     ~^~~~~~~~~~~~~
-      |                                                                      |
-      |                                                                      int *
-
-Patch downloaded from Gentoo:
-https://gitweb.gentoo.org/repo/gentoo.git/tree/media-sound/musepack-tools/files/musepack-tools-495-incompatible-pointers.patch
-
-Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
-Upstream: N/A no SCM, not active anymore
-
---- musepack-tools-495/libmpcpsy/ans.c
-+++ musepack-tools-495-fixed/libmpcpsy/ans.c
-@@ -287,12 +287,12 @@
-     // for L or M, respectively
-     memset ( m->FIR_L,      0, sizeof m->FIR_L      );         // reset FIR
-     memset ( m->NS_Order_L, 0, sizeof m->NS_Order_L );         // reset Flags
--	FindOptimalANS ( MaxBand, MSflag, ANSspec_L, ANSspec_M, m->NS_Order_L, m->SNR_comp_L, m->FIR_L, smr.L, smr.M, m->SCF_Index_L, Transient );
-+	FindOptimalANS ( MaxBand, MSflag, ANSspec_L, ANSspec_M, m->NS_Order_L, m->SNR_comp_L, m->FIR_L, smr.L, smr.M, (const void*)m->SCF_Index_L, Transient );
- 
-     // for R or S, respectively
- 	memset ( m->FIR_R,      0, sizeof m->FIR_R      );         // reset FIR
- 	memset ( m->NS_Order_R, 0, sizeof m->NS_Order_R );         // reset Flags
--	FindOptimalANS ( MaxBand, MSflag, ANSspec_R, ANSspec_S, m->NS_Order_R, m->SNR_comp_R, m->FIR_R, smr.R, smr.S, m->SCF_Index_R, Transient );
-+	FindOptimalANS ( MaxBand, MSflag, ANSspec_R, ANSspec_S, m->NS_Order_R, m->SNR_comp_R, m->FIR_R, smr.R, smr.S, (const void*)m->SCF_Index_R, Transient );
- 
-     return;
- }
---- musepack-tools-495/mpcenc/mpcenc.h
-+++ musepack-tools-495-fixed/mpcenc/mpcenc.h
-@@ -241,8 +241,8 @@
- 
- float  ISNR_Schaetzer                  ( const float* samples, const float comp, const int res);
- float  ISNR_Schaetzer_Trans            ( const float* samples, const float comp, const int res);
--void   QuantizeSubband                 ( unsigned int* qu_output, const float* input, const int res, float* errors, const int maxNsOrder );
--void   QuantizeSubbandWithNoiseShaping ( unsigned int* qu_output, const float* input, const int res, float* errors, const float* FIR );
-+void   QuantizeSubband                 ( mpc_int16_t* qu_output, const float* input, const int res, float* errors, const int maxNsOrder );
-+void   QuantizeSubbandWithNoiseShaping ( mpc_int16_t* qu_output, const float* input, const int res, float* errors, const float* FIR );
- 
- void   NoiseInjectionComp ( void );
- 
diff --git a/package/musepack/Config.in b/package/musepack/Config.in
deleted file mode 100644
index f368764ba9..0000000000
--- a/package/musepack/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_MUSEPACK
-	bool "musepack"
-	select BR2_PACKAGE_LIBCUEFILE
-	select BR2_PACKAGE_LIBREPLAYGAIN
-	help
-	  Musepack is an audio compression format with a strong
-	  emphasis on high quality. It's not lossless, but it is
-	  designed for transparency, so that you won't be able to hear
-	  differences between the original wave file and the much
-	  smaller MPC file.
-
-	  http://www.musepack.net/
diff --git a/package/musepack/musepack.hash b/package/musepack/musepack.hash
deleted file mode 100644
index 5a03bd260a..0000000000
--- a/package/musepack/musepack.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# From https://www.musepack.net/index.php?pg=src
-md5  754d67be67f713e54baf70fcfdb2817e  musepack_src_r475.tar.gz
-# Calculated based on the hash above
-sha256  a4b1742f997f83e1056142d556a8c20845ba764b70365ff9ccf2e3f81c427b2b  musepack_src_r475.tar.gz
-# Locally computed
-sha256  141f551d8e4f037b7f6bc9136b7d3116c7ae9ec8da10c4f14c07c6dc34bc9aa5  libmpcdec/COPYING
-sha256  0da88639aebbd614151ee52294fa13789f8cd28d9f2e0a56998b89b5c21ddc2b  libmpcenc/quant.c
diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
deleted file mode 100644
index 02fe53d47d..0000000000
--- a/package/musepack/musepack.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# musepack
-#
-################################################################################
-
-MUSEPACK_VERSION = 475
-MUSEPACK_SITE = http://files.musepack.net/source
-MUSEPACK_SOURCE = musepack_src_r$(MUSEPACK_VERSION).tar.gz
-MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
-MUSEPACK_INSTALL_STAGING = YES
-MUSEPACK_BUILD_OPTS = -j1
-MUSEPACK_LICENSE = BSD-3-Clause (*mpcdec), LGPL-2.1+ (*mpcenc)
-MUSEPACK_LICENSE_FILES = libmpcdec/COPYING libmpcenc/quant.c
-
-$(eval $(cmake-package))
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 81783c99ed..2a83b66c92 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -70,6 +70,7 @@ VLC_CONF_OPTS += \
 	--disable-microdns \
 	--disable-mmal \
 	--disable-mtp \
+	--disable-mpc \
 	--disable-notify \
 	--disable-projectm \
 	--disable-schroedinger \
@@ -462,13 +463,6 @@ else
 VLC_CONF_OPTS += --disable-mpg123
 endif
 
-ifeq ($(BR2_PACKAGE_MUSEPACK),y)
-VLC_CONF_OPTS += --enable-mpc
-VLC_DEPENDENCIES += musepack
-else
-VLC_CONF_OPTS += --disable-mpc
-endif
-
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 VLC_CONF_OPTS += --enable-ncurses
 VLC_DEPENDENCIES += ncurses

--===============1406687102496991747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1406687102496991747==--
