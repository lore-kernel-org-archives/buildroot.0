Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B3BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 15:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1381040177;
	Sat, 20 Nov 2021 15:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7FmmTTJa1V_9; Sat, 20 Nov 2021 15:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7576F4012E;
	Sat, 20 Nov 2021 15:05:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 898AF1BF470
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 15:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 780AE400AF
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 15:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gz6235jTFTkN for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 15:05:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 825724012E
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 15:05:03 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout07.t-online.de (Postfix) with SMTP id 3CB8317E4A;
 Sat, 20 Nov 2021 16:04:49 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.220]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1moRv6-23BwZ70; Sat, 20 Nov 2021 16:04:48 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45110)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1moRv4-0006Zz-A3;
 Sat, 20 Nov 2021 16:04:47 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 16:04:45 +0100
Message-Id: <20211120150446.447240-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1637420688-00001454-C9AFF3DF/0/0 CLEAN NORMAL
X-TOI-MSGID: 1227ce6e-ad03-49f8-9a9f-35f77865ebe2
Subject: [Buildroot] [PATCH/next 1/2] package/x265: bump version to 3.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thijs Vermeir <thijsvermeir@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebased patch 0001 based on Gentoo patch
https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/x265/files/arm-r1.patch

Removed patch 0002, a different fix was applied upstream:
https://bitbucket.org/multicoreware/x265_git/commits/ec7396adaa6afd2c8aab1918cfe4bb6e384740c3

Update project URL and _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x265/0001-fix-gcc-options.patch    |  78 +++--
 package/x265/0002-arm-asm-primitives.patch | 354 ---------------------
 package/x265/Config.in                     |   2 +-
 package/x265/x265.hash                     |   6 +-
 package/x265/x265.mk                       |   4 +-
 5 files changed, 63 insertions(+), 381 deletions(-)
 delete mode 100644 package/x265/0002-arm-asm-primitives.patch

diff --git a/package/x265/0001-fix-gcc-options.patch b/package/x265/0001-fix-gcc-options.patch
index 81518212b4..0283da25ea 100644
--- a/package/x265/0001-fix-gcc-options.patch
+++ b/package/x265/0001-fix-gcc-options.patch
@@ -17,36 +17,72 @@ Backported from upstream pull request:
 https://bitbucket.org/multicoreware/x265/pull-requests/21
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 3.5 based on
+ https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/x265/files/arm-r1.patch]
 
 diff -r 58dddcf01b7d source/CMakeLists.txt
 --- a/source/CMakeLists.txt	Mon Jan 23 09:50:33 2017 +0530
 +++ b/source/CMakeLists.txt	Mon Jan 23 21:03:10 2017 +0100
-@@ -194,28 +194,6 @@
-     if(NATIVE_BUILD)
-         if(INTEL_CXX)
-             add_definitions(-xhost)
+@@ -40,7 +40,7 @@ SET(CMAKE_MODULE_PATH "${PROJECT_SOURCE_
+ # System architecture detection
+ string(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" SYSPROC)
+ set(X86_ALIASES x86 i386 i686 x86_64 amd64)
+-set(ARM_ALIASES armv6l armv7l aarch64)
++set(ARM_ALIASES armv6l armv6l armv7l armv7a aarch64)
+ list(FIND X86_ALIASES "${SYSPROC}" X86MATCH)
+ list(FIND ARM_ALIASES "${SYSPROC}" ARMMATCH)
+ set(POWER_ALIASES ppc64 ppc64le)
+@@ -239,11 +239,7 @@ if(GCC)
+         endif()
+     endif()
+     if(ARM AND CROSS_COMPILE_ARM)
+-        if(ARM64)
+-            set(ARM_ARGS -fPIC)
 -        else()
--            add_definitions(-march=native)
--        endif()
--    elseif(X86 AND NOT X64)
--        string(FIND "${CMAKE_CXX_FLAGS}" "-march" marchPos)
--        if(marchPos LESS "0")
--            add_definitions(-march=i686)
--            if(WIN32 AND NOT INTEL_CXX AND NOT CLANG AND
--               CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 6.0 AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 7.0)
--                add_definitions(-mpreferred-stack-boundary=2)
--            endif()
+-            set(ARM_ARGS -march=armv6 -mfloat-abi=soft -mfpu=vfp -marm -fPIC)
 -        endif()
--    endif()
--    if(ARM AND CROSS_COMPILE_ARM)
++        set(ARM_ARGS -fPIC)
+         message(STATUS "cross compile arm")
+     elseif(ARM)
+         if(ARM64)
+@@ -252,10 +248,10 @@ if(GCC)
+         else()
+             find_package(Neon)
+             if(CPU_HAS_NEON)
+-                set(ARM_ARGS -mcpu=native -mfloat-abi=hard -mfpu=neon -marm -fPIC)
++                set(ARM_ARGS -mfpu=neon -fPIC)
+                 add_definitions(-DHAVE_NEON)
+             else()
+-                set(ARM_ARGS -mcpu=native -mfloat-abi=hard -mfpu=vfp -marm)
++	        set(ARM_ARGS -fPIC)
+             endif()
+         endif()
+     endif()
+--- a/source/dynamicHDR10/CMakeLists.txt
++++ b/source/dynamicHDR10/CMakeLists.txt
+@@ -43,14 +43,14 @@ if(GCC)
+         endif()
+     endif()
+     if(ARM AND CROSS_COMPILE_ARM)
 -        set(ARM_ARGS -march=armv6 -mfloat-abi=soft -mfpu=vfp -marm -fPIC)
--    elseif(ARM)
--        find_package(Neon)
--        if(CPU_HAS_NEON)
++        set(ARM_ARGS -fPIC)
+     elseif(ARM)
+         find_package(Neon)
+         if(CPU_HAS_NEON)
 -            set(ARM_ARGS -mcpu=native -mfloat-abi=hard -mfpu=neon -marm -fPIC)
--            add_definitions(-DHAVE_NEON)
--        else()
++            set(ARM_ARGS -fPIC)
+             add_definitions(-DHAVE_NEON)
+         else()
 -            set(ARM_ARGS -mcpu=native -mfloat-abi=hard -mfpu=vfp -marm)
++            set(ARM_ARGS -fPIC)
          endif()
      endif()
      add_definitions(${ARM_ARGS})
+@@ -150,4 +150,4 @@ set(BIN_INSTALL_DIR bin CACHE STRING "Install location of executables")
+ option(ENABLE_SHARED "Build shared library" OFF)
+ 
+ install(FILES hdr10plus.h DESTINATION include)
+-endif()
+\ No newline at end of file
++endif()
+
diff --git a/package/x265/0002-arm-asm-primitives.patch b/package/x265/0002-arm-asm-primitives.patch
deleted file mode 100644
index e500443429..0000000000
--- a/package/x265/0002-arm-asm-primitives.patch
+++ /dev/null
@@ -1,354 +0,0 @@
-Fixes "arm assembly fail to compile on 1.8"
-
-Downloaded from upstream bug report:
-https://bitbucket.org/multicoreware/x265/issues/406
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- ./source/common/arm/asm-primitives.cpp.orig	2018-05-21 02:33:10.000000000 -0600
-+++ ./source/common/arm/asm-primitives.cpp	2018-05-28 20:38:37.302378303 -0600
-@@ -48,77 +48,77 @@ void setupAssemblyPrimitives(EncoderPrim
-         p.ssim_4x4x2_core = PFX(ssim_4x4x2_core_neon);
- 
-         // addAvg
--         p.pu[LUMA_4x4].addAvg   = PFX(addAvg_4x4_neon);
--         p.pu[LUMA_4x8].addAvg   = PFX(addAvg_4x8_neon);
--         p.pu[LUMA_4x16].addAvg  = PFX(addAvg_4x16_neon);
--         p.pu[LUMA_8x4].addAvg   = PFX(addAvg_8x4_neon);
--         p.pu[LUMA_8x8].addAvg   = PFX(addAvg_8x8_neon);
--         p.pu[LUMA_8x16].addAvg  = PFX(addAvg_8x16_neon);
--         p.pu[LUMA_8x32].addAvg  = PFX(addAvg_8x32_neon);
--         p.pu[LUMA_12x16].addAvg = PFX(addAvg_12x16_neon);
--         p.pu[LUMA_16x4].addAvg  = PFX(addAvg_16x4_neon);
--         p.pu[LUMA_16x8].addAvg  = PFX(addAvg_16x8_neon);
--         p.pu[LUMA_16x12].addAvg = PFX(addAvg_16x12_neon);
--         p.pu[LUMA_16x16].addAvg = PFX(addAvg_16x16_neon);
--         p.pu[LUMA_16x32].addAvg = PFX(addAvg_16x32_neon);
--         p.pu[LUMA_16x64].addAvg = PFX(addAvg_16x64_neon);
--         p.pu[LUMA_24x32].addAvg = PFX(addAvg_24x32_neon);
--         p.pu[LUMA_32x8].addAvg  = PFX(addAvg_32x8_neon);
--         p.pu[LUMA_32x16].addAvg = PFX(addAvg_32x16_neon);
--         p.pu[LUMA_32x24].addAvg = PFX(addAvg_32x24_neon);
--         p.pu[LUMA_32x32].addAvg = PFX(addAvg_32x32_neon);
--         p.pu[LUMA_32x64].addAvg = PFX(addAvg_32x64_neon);
--         p.pu[LUMA_48x64].addAvg = PFX(addAvg_48x64_neon);
--         p.pu[LUMA_64x16].addAvg = PFX(addAvg_64x16_neon);
--         p.pu[LUMA_64x32].addAvg = PFX(addAvg_64x32_neon);
--         p.pu[LUMA_64x48].addAvg = PFX(addAvg_64x48_neon);
--         p.pu[LUMA_64x64].addAvg = PFX(addAvg_64x64_neon);
-+         p.pu[LUMA_4x4].addAvg[ALIGNED]   = PFX(addAvg_4x4_neon);
-+         p.pu[LUMA_4x8].addAvg[ALIGNED]   = PFX(addAvg_4x8_neon);
-+         p.pu[LUMA_4x16].addAvg[ALIGNED]  = PFX(addAvg_4x16_neon);
-+         p.pu[LUMA_8x4].addAvg[ALIGNED]   = PFX(addAvg_8x4_neon);
-+         p.pu[LUMA_8x8].addAvg[ALIGNED]   = PFX(addAvg_8x8_neon);
-+         p.pu[LUMA_8x16].addAvg[ALIGNED]  = PFX(addAvg_8x16_neon);
-+         p.pu[LUMA_8x32].addAvg[ALIGNED]  = PFX(addAvg_8x32_neon);
-+         p.pu[LUMA_12x16].addAvg[ALIGNED] = PFX(addAvg_12x16_neon);
-+         p.pu[LUMA_16x4].addAvg[ALIGNED]  = PFX(addAvg_16x4_neon);
-+         p.pu[LUMA_16x8].addAvg[ALIGNED]  = PFX(addAvg_16x8_neon);
-+         p.pu[LUMA_16x12].addAvg[ALIGNED] = PFX(addAvg_16x12_neon);
-+         p.pu[LUMA_16x16].addAvg[ALIGNED] = PFX(addAvg_16x16_neon);
-+         p.pu[LUMA_16x32].addAvg[ALIGNED] = PFX(addAvg_16x32_neon);
-+         p.pu[LUMA_16x64].addAvg[ALIGNED] = PFX(addAvg_16x64_neon);
-+         p.pu[LUMA_24x32].addAvg[ALIGNED] = PFX(addAvg_24x32_neon);
-+         p.pu[LUMA_32x8].addAvg[ALIGNED]  = PFX(addAvg_32x8_neon);
-+         p.pu[LUMA_32x16].addAvg[ALIGNED] = PFX(addAvg_32x16_neon);
-+         p.pu[LUMA_32x24].addAvg[ALIGNED] = PFX(addAvg_32x24_neon);
-+         p.pu[LUMA_32x32].addAvg[ALIGNED] = PFX(addAvg_32x32_neon);
-+         p.pu[LUMA_32x64].addAvg[ALIGNED] = PFX(addAvg_32x64_neon);
-+         p.pu[LUMA_48x64].addAvg[ALIGNED] = PFX(addAvg_48x64_neon);
-+         p.pu[LUMA_64x16].addAvg[ALIGNED] = PFX(addAvg_64x16_neon);
-+         p.pu[LUMA_64x32].addAvg[ALIGNED] = PFX(addAvg_64x32_neon);
-+         p.pu[LUMA_64x48].addAvg[ALIGNED] = PFX(addAvg_64x48_neon);
-+         p.pu[LUMA_64x64].addAvg[ALIGNED] = PFX(addAvg_64x64_neon);
- 
-         // chroma addAvg
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_4x2].addAvg   = PFX(addAvg_4x2_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_4x4].addAvg   = PFX(addAvg_4x4_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_4x8].addAvg   = PFX(addAvg_4x8_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_4x16].addAvg  = PFX(addAvg_4x16_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_6x8].addAvg   = PFX(addAvg_6x8_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x2].addAvg   = PFX(addAvg_8x2_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x4].addAvg   = PFX(addAvg_8x4_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x6].addAvg   = PFX(addAvg_8x6_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x8].addAvg   = PFX(addAvg_8x8_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x16].addAvg  = PFX(addAvg_8x16_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x32].addAvg  = PFX(addAvg_8x32_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_12x16].addAvg = PFX(addAvg_12x16_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_16x4].addAvg  = PFX(addAvg_16x4_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_16x8].addAvg  = PFX(addAvg_16x8_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_16x12].addAvg = PFX(addAvg_16x12_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_16x16].addAvg = PFX(addAvg_16x16_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_16x32].addAvg = PFX(addAvg_16x32_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_24x32].addAvg = PFX(addAvg_24x32_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_32x8].addAvg  = PFX(addAvg_32x8_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_32x16].addAvg = PFX(addAvg_32x16_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_32x24].addAvg = PFX(addAvg_32x24_neon);
--        p.chroma[X265_CSP_I420].pu[CHROMA_420_32x32].addAvg = PFX(addAvg_32x32_neon);
--
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_4x8].addAvg   = PFX(addAvg_4x8_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_4x16].addAvg  = PFX(addAvg_4x16_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_4x32].addAvg  = PFX(addAvg_4x32_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_6x16].addAvg  = PFX(addAvg_6x16_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x4].addAvg   = PFX(addAvg_8x4_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x8].addAvg   = PFX(addAvg_8x8_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x12].addAvg  = PFX(addAvg_8x12_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x16].addAvg  = PFX(addAvg_8x16_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x32].addAvg  = PFX(addAvg_8x32_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x64].addAvg  = PFX(addAvg_8x64_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_12x32].addAvg = PFX(addAvg_12x32_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_16x8].addAvg  = PFX(addAvg_16x8_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_16x16].addAvg = PFX(addAvg_16x16_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_16x24].addAvg = PFX(addAvg_16x24_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_16x32].addAvg = PFX(addAvg_16x32_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_16x64].addAvg = PFX(addAvg_16x64_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_24x64].addAvg = PFX(addAvg_24x64_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_32x16].addAvg = PFX(addAvg_32x16_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_32x32].addAvg = PFX(addAvg_32x32_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_32x48].addAvg = PFX(addAvg_32x48_neon);
--        p.chroma[X265_CSP_I422].pu[CHROMA_422_32x64].addAvg = PFX(addAvg_32x64_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_4x2].addAvg[ALIGNED]   = PFX(addAvg_4x2_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_4x4].addAvg[ALIGNED]   = PFX(addAvg_4x4_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_4x8].addAvg[ALIGNED]   = PFX(addAvg_4x8_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_4x16].addAvg[ALIGNED]  = PFX(addAvg_4x16_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_6x8].addAvg[ALIGNED]   = PFX(addAvg_6x8_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x2].addAvg[ALIGNED]   = PFX(addAvg_8x2_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x4].addAvg[ALIGNED]   = PFX(addAvg_8x4_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x6].addAvg[ALIGNED]   = PFX(addAvg_8x6_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x8].addAvg[ALIGNED]   = PFX(addAvg_8x8_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x16].addAvg[ALIGNED]  = PFX(addAvg_8x16_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_8x32].addAvg[ALIGNED]  = PFX(addAvg_8x32_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_12x16].addAvg[ALIGNED] = PFX(addAvg_12x16_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_16x4].addAvg[ALIGNED]  = PFX(addAvg_16x4_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_16x8].addAvg[ALIGNED]  = PFX(addAvg_16x8_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_16x12].addAvg[ALIGNED] = PFX(addAvg_16x12_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_16x16].addAvg[ALIGNED] = PFX(addAvg_16x16_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_16x32].addAvg[ALIGNED] = PFX(addAvg_16x32_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_24x32].addAvg[ALIGNED] = PFX(addAvg_24x32_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_32x8].addAvg[ALIGNED]  = PFX(addAvg_32x8_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_32x16].addAvg[ALIGNED] = PFX(addAvg_32x16_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_32x24].addAvg[ALIGNED] = PFX(addAvg_32x24_neon);
-+        p.chroma[X265_CSP_I420].pu[CHROMA_420_32x32].addAvg[ALIGNED] = PFX(addAvg_32x32_neon);
-+
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_4x8].addAvg[ALIGNED]   = PFX(addAvg_4x8_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_4x16].addAvg[ALIGNED]  = PFX(addAvg_4x16_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_4x32].addAvg[ALIGNED]  = PFX(addAvg_4x32_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_6x16].addAvg[ALIGNED]  = PFX(addAvg_6x16_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x4].addAvg[ALIGNED]   = PFX(addAvg_8x4_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x8].addAvg[ALIGNED]   = PFX(addAvg_8x8_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x12].addAvg[ALIGNED]  = PFX(addAvg_8x12_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x16].addAvg[ALIGNED]  = PFX(addAvg_8x16_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x32].addAvg[ALIGNED]  = PFX(addAvg_8x32_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_8x64].addAvg[ALIGNED]  = PFX(addAvg_8x64_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_12x32].addAvg[ALIGNED] = PFX(addAvg_12x32_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_16x8].addAvg[ALIGNED]  = PFX(addAvg_16x8_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_16x16].addAvg[ALIGNED] = PFX(addAvg_16x16_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_16x24].addAvg[ALIGNED] = PFX(addAvg_16x24_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_16x32].addAvg[ALIGNED] = PFX(addAvg_16x32_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_16x64].addAvg[ALIGNED] = PFX(addAvg_16x64_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_24x64].addAvg[ALIGNED] = PFX(addAvg_24x64_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_32x16].addAvg[ALIGNED] = PFX(addAvg_32x16_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_32x32].addAvg[ALIGNED] = PFX(addAvg_32x32_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_32x48].addAvg[ALIGNED] = PFX(addAvg_32x48_neon);
-+        p.chroma[X265_CSP_I422].pu[CHROMA_422_32x64].addAvg[ALIGNED] = PFX(addAvg_32x64_neon);
- 
-         // quant
-          p.quant = PFX(quant_neon);
-@@ -402,7 +402,7 @@ void setupAssemblyPrimitives(EncoderPrim
-         p.scale2D_64to32  = PFX(scale2D_64to32_neon);
- 
-         // scale1D_128to64
--        p.scale1D_128to64 = PFX(scale1D_128to64_neon);
-+        p.scale1D_128to64[ALIGNED] = PFX(scale1D_128to64_neon);
- 
-         // copy_count
-         p.cu[BLOCK_4x4].copy_cnt     = PFX(copy_cnt_4_neon);
-@@ -411,37 +411,37 @@ void setupAssemblyPrimitives(EncoderPrim
-         p.cu[BLOCK_32x32].copy_cnt   = PFX(copy_cnt_32_neon);
- 
-         // filterPixelToShort
--        p.pu[LUMA_4x4].convert_p2s   = PFX(filterPixelToShort_4x4_neon);
--        p.pu[LUMA_4x8].convert_p2s   = PFX(filterPixelToShort_4x8_neon);
--        p.pu[LUMA_4x16].convert_p2s  = PFX(filterPixelToShort_4x16_neon);
--        p.pu[LUMA_8x4].convert_p2s   = PFX(filterPixelToShort_8x4_neon);
--        p.pu[LUMA_8x8].convert_p2s   = PFX(filterPixelToShort_8x8_neon);
--        p.pu[LUMA_8x16].convert_p2s  = PFX(filterPixelToShort_8x16_neon);
--        p.pu[LUMA_8x32].convert_p2s  = PFX(filterPixelToShort_8x32_neon);
--        p.pu[LUMA_12x16].convert_p2s = PFX(filterPixelToShort_12x16_neon);
--        p.pu[LUMA_16x4].convert_p2s  = PFX(filterPixelToShort_16x4_neon);
--        p.pu[LUMA_16x8].convert_p2s  = PFX(filterPixelToShort_16x8_neon);
--        p.pu[LUMA_16x12].convert_p2s = PFX(filterPixelToShort_16x12_neon);
--        p.pu[LUMA_16x16].convert_p2s = PFX(filterPixelToShort_16x16_neon);
--        p.pu[LUMA_16x32].convert_p2s = PFX(filterPixelToShort_16x32_neon);
--        p.pu[LUMA_16x64].convert_p2s = PFX(filterPixelToShort_16x64_neon);
--        p.pu[LUMA_24x32].convert_p2s = PFX(filterPixelToShort_24x32_neon);
--        p.pu[LUMA_32x8].convert_p2s  = PFX(filterPixelToShort_32x8_neon);
--        p.pu[LUMA_32x16].convert_p2s = PFX(filterPixelToShort_32x16_neon);
--        p.pu[LUMA_32x24].convert_p2s = PFX(filterPixelToShort_32x24_neon);
--        p.pu[LUMA_32x32].convert_p2s = PFX(filterPixelToShort_32x32_neon);
--        p.pu[LUMA_32x64].convert_p2s = PFX(filterPixelToShort_32x64_neon);
--        p.pu[LUMA_48x64].convert_p2s = PFX(filterPixelToShort_48x64_neon);
--        p.pu[LUMA_64x16].convert_p2s = PFX(filterPixelToShort_64x16_neon);
--        p.pu[LUMA_64x32].convert_p2s = PFX(filterPixelToShort_64x32_neon);
--        p.pu[LUMA_64x48].convert_p2s = PFX(filterPixelToShort_64x48_neon);
--        p.pu[LUMA_64x64].convert_p2s = PFX(filterPixelToShort_64x64_neon);
-+        p.pu[LUMA_4x4].convert_p2s[ALIGNED]   = PFX(filterPixelToShort_4x4_neon);
-+        p.pu[LUMA_4x8].convert_p2s[ALIGNED]   = PFX(filterPixelToShort_4x8_neon);
-+        p.pu[LUMA_4x16].convert_p2s[ALIGNED]  = PFX(filterPixelToShort_4x16_neon);
-+        p.pu[LUMA_8x4].convert_p2s[ALIGNED]   = PFX(filterPixelToShort_8x4_neon);
-+        p.pu[LUMA_8x8].convert_p2s[ALIGNED]   = PFX(filterPixelToShort_8x8_neon);
-+        p.pu[LUMA_8x16].convert_p2s[ALIGNED]  = PFX(filterPixelToShort_8x16_neon);
-+        p.pu[LUMA_8x32].convert_p2s[ALIGNED]  = PFX(filterPixelToShort_8x32_neon);
-+        p.pu[LUMA_12x16].convert_p2s[ALIGNED] = PFX(filterPixelToShort_12x16_neon);
-+        p.pu[LUMA_16x4].convert_p2s[ALIGNED]  = PFX(filterPixelToShort_16x4_neon);
-+        p.pu[LUMA_16x8].convert_p2s[ALIGNED]  = PFX(filterPixelToShort_16x8_neon);
-+        p.pu[LUMA_16x12].convert_p2s[ALIGNED] = PFX(filterPixelToShort_16x12_neon);
-+        p.pu[LUMA_16x16].convert_p2s[ALIGNED] = PFX(filterPixelToShort_16x16_neon);
-+        p.pu[LUMA_16x32].convert_p2s[ALIGNED] = PFX(filterPixelToShort_16x32_neon);
-+        p.pu[LUMA_16x64].convert_p2s[ALIGNED] = PFX(filterPixelToShort_16x64_neon);
-+        p.pu[LUMA_24x32].convert_p2s[ALIGNED] = PFX(filterPixelToShort_24x32_neon);
-+        p.pu[LUMA_32x8].convert_p2s[ALIGNED]  = PFX(filterPixelToShort_32x8_neon);
-+        p.pu[LUMA_32x16].convert_p2s[ALIGNED] = PFX(filterPixelToShort_32x16_neon);
-+        p.pu[LUMA_32x24].convert_p2s[ALIGNED] = PFX(filterPixelToShort_32x24_neon);
-+        p.pu[LUMA_32x32].convert_p2s[ALIGNED] = PFX(filterPixelToShort_32x32_neon);
-+        p.pu[LUMA_32x64].convert_p2s[ALIGNED] = PFX(filterPixelToShort_32x64_neon);
-+        p.pu[LUMA_48x64].convert_p2s[ALIGNED] = PFX(filterPixelToShort_48x64_neon);
-+        p.pu[LUMA_64x16].convert_p2s[ALIGNED] = PFX(filterPixelToShort_64x16_neon);
-+        p.pu[LUMA_64x32].convert_p2s[ALIGNED] = PFX(filterPixelToShort_64x32_neon);
-+        p.pu[LUMA_64x48].convert_p2s[ALIGNED] = PFX(filterPixelToShort_64x48_neon);
-+        p.pu[LUMA_64x64].convert_p2s[ALIGNED] = PFX(filterPixelToShort_64x64_neon);
- 
-         // Block_fill
--        p.cu[BLOCK_4x4].blockfill_s   = PFX(blockfill_s_4x4_neon);
--        p.cu[BLOCK_8x8].blockfill_s   = PFX(blockfill_s_8x8_neon);
--        p.cu[BLOCK_16x16].blockfill_s = PFX(blockfill_s_16x16_neon);
--        p.cu[BLOCK_32x32].blockfill_s = PFX(blockfill_s_32x32_neon);
-+        p.cu[BLOCK_4x4].blockfill_s[ALIGNED]   = PFX(blockfill_s_4x4_neon);
-+        p.cu[BLOCK_8x8].blockfill_s[ALIGNED]   = PFX(blockfill_s_8x8_neon);
-+        p.cu[BLOCK_16x16].blockfill_s[ALIGNED] = PFX(blockfill_s_16x16_neon);
-+        p.cu[BLOCK_32x32].blockfill_s[ALIGNED] = PFX(blockfill_s_32x32_neon);
- 
-         // Blockcopy_ss
-         p.cu[BLOCK_4x4].copy_ss   = PFX(blockcopy_ss_4x4_neon);
-@@ -495,21 +495,21 @@ void setupAssemblyPrimitives(EncoderPrim
-         p.chroma[X265_CSP_I422].cu[BLOCK_422_32x64].copy_sp = PFX(blockcopy_sp_32x64_neon);
- 
-         // pixel_add_ps
--        p.cu[BLOCK_4x4].add_ps   = PFX(pixel_add_ps_4x4_neon);
--        p.cu[BLOCK_8x8].add_ps   = PFX(pixel_add_ps_8x8_neon);
--        p.cu[BLOCK_16x16].add_ps = PFX(pixel_add_ps_16x16_neon);
--        p.cu[BLOCK_32x32].add_ps = PFX(pixel_add_ps_32x32_neon);
--        p.cu[BLOCK_64x64].add_ps = PFX(pixel_add_ps_64x64_neon);
-+        p.cu[BLOCK_4x4].add_ps[ALIGNED]   = PFX(pixel_add_ps_4x4_neon);
-+        p.cu[BLOCK_8x8].add_ps[ALIGNED]   = PFX(pixel_add_ps_8x8_neon);
-+        p.cu[BLOCK_16x16].add_ps[ALIGNED] = PFX(pixel_add_ps_16x16_neon);
-+        p.cu[BLOCK_32x32].add_ps[ALIGNED] = PFX(pixel_add_ps_32x32_neon);
-+        p.cu[BLOCK_64x64].add_ps[ALIGNED] = PFX(pixel_add_ps_64x64_neon);
- 
-         // chroma add_ps
--        p.chroma[X265_CSP_I420].cu[BLOCK_420_4x4].add_ps   = PFX(pixel_add_ps_4x4_neon);
--        p.chroma[X265_CSP_I420].cu[BLOCK_420_8x8].add_ps   = PFX(pixel_add_ps_8x8_neon);
--        p.chroma[X265_CSP_I420].cu[BLOCK_420_16x16].add_ps = PFX(pixel_add_ps_16x16_neon);
--        p.chroma[X265_CSP_I420].cu[BLOCK_420_32x32].add_ps = PFX(pixel_add_ps_32x32_neon);
--        p.chroma[X265_CSP_I422].cu[BLOCK_422_4x8].add_ps   = PFX(pixel_add_ps_4x8_neon);
--        p.chroma[X265_CSP_I422].cu[BLOCK_422_8x16].add_ps  = PFX(pixel_add_ps_8x16_neon);
--        p.chroma[X265_CSP_I422].cu[BLOCK_422_16x32].add_ps = PFX(pixel_add_ps_16x32_neon);
--        p.chroma[X265_CSP_I422].cu[BLOCK_422_32x64].add_ps = PFX(pixel_add_ps_32x64_neon);
-+        p.chroma[X265_CSP_I420].cu[BLOCK_420_4x4].add_ps[ALIGNED]   = PFX(pixel_add_ps_4x4_neon);
-+        p.chroma[X265_CSP_I420].cu[BLOCK_420_8x8].add_ps[ALIGNED]   = PFX(pixel_add_ps_8x8_neon);
-+        p.chroma[X265_CSP_I420].cu[BLOCK_420_16x16].add_ps[ALIGNED] = PFX(pixel_add_ps_16x16_neon);
-+        p.chroma[X265_CSP_I420].cu[BLOCK_420_32x32].add_ps[ALIGNED] = PFX(pixel_add_ps_32x32_neon);
-+        p.chroma[X265_CSP_I422].cu[BLOCK_422_4x8].add_ps[ALIGNED]   = PFX(pixel_add_ps_4x8_neon);
-+        p.chroma[X265_CSP_I422].cu[BLOCK_422_8x16].add_ps[ALIGNED]  = PFX(pixel_add_ps_8x16_neon);
-+        p.chroma[X265_CSP_I422].cu[BLOCK_422_16x32].add_ps[ALIGNED] = PFX(pixel_add_ps_16x32_neon);
-+        p.chroma[X265_CSP_I422].cu[BLOCK_422_32x64].add_ps[ALIGNED] = PFX(pixel_add_ps_32x64_neon);
- 
-         // cpy2Dto1D_shr
-         p.cu[BLOCK_4x4].cpy2Dto1D_shr   = PFX(cpy2Dto1D_shr_4x4_neon);
-@@ -518,10 +518,10 @@ void setupAssemblyPrimitives(EncoderPrim
-         p.cu[BLOCK_32x32].cpy2Dto1D_shr = PFX(cpy2Dto1D_shr_32x32_neon);
- 
-         // ssd_s
--        p.cu[BLOCK_4x4].ssd_s   = PFX(pixel_ssd_s_4x4_neon);
--        p.cu[BLOCK_8x8].ssd_s   = PFX(pixel_ssd_s_8x8_neon);
--        p.cu[BLOCK_16x16].ssd_s = PFX(pixel_ssd_s_16x16_neon);
--        p.cu[BLOCK_32x32].ssd_s = PFX(pixel_ssd_s_32x32_neon);
-+        p.cu[BLOCK_4x4].ssd_s[ALIGNED]   = PFX(pixel_ssd_s_4x4_neon);
-+        p.cu[BLOCK_8x8].ssd_s[ALIGNED]   = PFX(pixel_ssd_s_8x8_neon);
-+        p.cu[BLOCK_16x16].ssd_s[ALIGNED] = PFX(pixel_ssd_s_16x16_neon);
-+        p.cu[BLOCK_32x32].ssd_s[ALIGNED] = PFX(pixel_ssd_s_32x32_neon);
- 
-         // sse_ss
-         p.cu[BLOCK_4x4].sse_ss   = PFX(pixel_sse_ss_4x4_neon);
-@@ -548,10 +548,10 @@ void setupAssemblyPrimitives(EncoderPrim
-         p.chroma[X265_CSP_I422].cu[BLOCK_422_32x64].sub_ps = PFX(pixel_sub_ps_32x64_neon);
- 
-         // calc_Residual
--        p.cu[BLOCK_4x4].calcresidual   = PFX(getResidual4_neon);
--        p.cu[BLOCK_8x8].calcresidual   = PFX(getResidual8_neon);
--        p.cu[BLOCK_16x16].calcresidual = PFX(getResidual16_neon);
--        p.cu[BLOCK_32x32].calcresidual = PFX(getResidual32_neon);
-+        p.cu[BLOCK_4x4].calcresidual[ALIGNED]   = PFX(getResidual4_neon);
-+        p.cu[BLOCK_8x8].calcresidual[ALIGNED]   = PFX(getResidual8_neon);
-+        p.cu[BLOCK_16x16].calcresidual[ALIGNED] = PFX(getResidual16_neon);
-+        p.cu[BLOCK_32x32].calcresidual[ALIGNED] = PFX(getResidual32_neon);
- 
-         // sse_pp
-         p.cu[BLOCK_4x4].sse_pp   = PFX(pixel_sse_pp_4x4_neon);
-@@ -722,31 +722,31 @@ void setupAssemblyPrimitives(EncoderPrim
-         p.pu[LUMA_64x64].sad_x4 = PFX(sad_x4_64x64_neon);
- 
-         // pixel_avg_pp
--        p.pu[LUMA_4x4].pixelavg_pp   = PFX(pixel_avg_pp_4x4_neon);
--        p.pu[LUMA_4x8].pixelavg_pp   = PFX(pixel_avg_pp_4x8_neon);
--        p.pu[LUMA_4x16].pixelavg_pp  = PFX(pixel_avg_pp_4x16_neon);
--        p.pu[LUMA_8x4].pixelavg_pp   = PFX(pixel_avg_pp_8x4_neon);
--        p.pu[LUMA_8x8].pixelavg_pp   = PFX(pixel_avg_pp_8x8_neon);
--        p.pu[LUMA_8x16].pixelavg_pp  = PFX(pixel_avg_pp_8x16_neon);
--        p.pu[LUMA_8x32].pixelavg_pp  = PFX(pixel_avg_pp_8x32_neon);
--        p.pu[LUMA_12x16].pixelavg_pp = PFX(pixel_avg_pp_12x16_neon);
--        p.pu[LUMA_16x4].pixelavg_pp  = PFX(pixel_avg_pp_16x4_neon);
--        p.pu[LUMA_16x8].pixelavg_pp  = PFX(pixel_avg_pp_16x8_neon);
--        p.pu[LUMA_16x12].pixelavg_pp = PFX(pixel_avg_pp_16x12_neon);
--        p.pu[LUMA_16x16].pixelavg_pp = PFX(pixel_avg_pp_16x16_neon);
--        p.pu[LUMA_16x32].pixelavg_pp = PFX(pixel_avg_pp_16x32_neon);
--        p.pu[LUMA_16x64].pixelavg_pp = PFX(pixel_avg_pp_16x64_neon);
--        p.pu[LUMA_24x32].pixelavg_pp = PFX(pixel_avg_pp_24x32_neon);
--        p.pu[LUMA_32x8].pixelavg_pp  = PFX(pixel_avg_pp_32x8_neon);
--        p.pu[LUMA_32x16].pixelavg_pp = PFX(pixel_avg_pp_32x16_neon);
--        p.pu[LUMA_32x24].pixelavg_pp = PFX(pixel_avg_pp_32x24_neon);
--        p.pu[LUMA_32x32].pixelavg_pp = PFX(pixel_avg_pp_32x32_neon);
--        p.pu[LUMA_32x64].pixelavg_pp = PFX(pixel_avg_pp_32x64_neon);
--        p.pu[LUMA_48x64].pixelavg_pp = PFX(pixel_avg_pp_48x64_neon);
--        p.pu[LUMA_64x16].pixelavg_pp = PFX(pixel_avg_pp_64x16_neon);
--        p.pu[LUMA_64x32].pixelavg_pp = PFX(pixel_avg_pp_64x32_neon);
--        p.pu[LUMA_64x48].pixelavg_pp = PFX(pixel_avg_pp_64x48_neon);
--        p.pu[LUMA_64x64].pixelavg_pp = PFX(pixel_avg_pp_64x64_neon);
-+        p.pu[LUMA_4x4].pixelavg_pp[ALIGNED]   = PFX(pixel_avg_pp_4x4_neon);
-+        p.pu[LUMA_4x8].pixelavg_pp[ALIGNED]   = PFX(pixel_avg_pp_4x8_neon);
-+        p.pu[LUMA_4x16].pixelavg_pp[ALIGNED]  = PFX(pixel_avg_pp_4x16_neon);
-+        p.pu[LUMA_8x4].pixelavg_pp[ALIGNED]   = PFX(pixel_avg_pp_8x4_neon);
-+        p.pu[LUMA_8x8].pixelavg_pp[ALIGNED]   = PFX(pixel_avg_pp_8x8_neon);
-+        p.pu[LUMA_8x16].pixelavg_pp[ALIGNED]  = PFX(pixel_avg_pp_8x16_neon);
-+        p.pu[LUMA_8x32].pixelavg_pp[ALIGNED]  = PFX(pixel_avg_pp_8x32_neon);
-+        p.pu[LUMA_12x16].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_12x16_neon);
-+        p.pu[LUMA_16x4].pixelavg_pp[ALIGNED]  = PFX(pixel_avg_pp_16x4_neon);
-+        p.pu[LUMA_16x8].pixelavg_pp[ALIGNED]  = PFX(pixel_avg_pp_16x8_neon);
-+        p.pu[LUMA_16x12].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_16x12_neon);
-+        p.pu[LUMA_16x16].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_16x16_neon);
-+        p.pu[LUMA_16x32].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_16x32_neon);
-+        p.pu[LUMA_16x64].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_16x64_neon);
-+        p.pu[LUMA_24x32].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_24x32_neon);
-+        p.pu[LUMA_32x8].pixelavg_pp[ALIGNED]  = PFX(pixel_avg_pp_32x8_neon);
-+        p.pu[LUMA_32x16].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_32x16_neon);
-+        p.pu[LUMA_32x24].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_32x24_neon);
-+        p.pu[LUMA_32x32].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_32x32_neon);
-+        p.pu[LUMA_32x64].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_32x64_neon);
-+        p.pu[LUMA_48x64].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_48x64_neon);
-+        p.pu[LUMA_64x16].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_64x16_neon);
-+        p.pu[LUMA_64x32].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_64x32_neon);
-+        p.pu[LUMA_64x48].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_64x48_neon);
-+        p.pu[LUMA_64x64].pixelavg_pp[ALIGNED] = PFX(pixel_avg_pp_64x64_neon);
- 
-         // planecopy
-         p.planecopy_cp = PFX(pixel_planecopy_cp_neon);
diff --git a/package/x265/Config.in b/package/x265/Config.in
index 180931db66..1067505d31 100644
--- a/package/x265/Config.in
+++ b/package/x265/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_X265
 	  General Public License (GPL) 2 license or a commercial
 	  license, similar to the x264 project.
 
-	  https://bitbucket.org/multicoreware/x265/wiki/Home
+	  https://bitbucket.org/multicoreware/x265_git/wiki/Home
 
 if BR2_PACKAGE_X265
 
diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 3d70ac0c67..fb9a5b5910 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,5 +1,5 @@
-# From https://mailman.videolan.org/pipermail/x265-devel/2020-February/012880.html
-md5  0c8c747b59b5411dea8cf557554636c1  x265_3.3.tar.gz
+# From https://mailman.videolan.org/pipermail/x265-devel/2021-March/013257.html
+md5  deb5df5cb2ec17bdbae6ac6bbc3b1eef  x265_3.5.tar.gz
 # Locally generated
-sha256  f26e148ed1f4dfb33fd1eb3ff5e60e08078d1b2017e88bcbb045b3fb58300b9c  x265_3.3.tar.gz
+sha256  e70a3335cacacbba0b3a20ec6fecd6783932288ebc8163ad74bcc9606477cae8  x265_3.5.tar.gz
 sha256  d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49  COPYING
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 872753eea8..85c4ade768 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-X265_VERSION = 3.3
+X265_VERSION = 3.5
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
-X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
+X265_SITE = https://bitbucket.org/multicoreware/x265_git/downloads
 X265_LICENSE = GPL-2.0+
 X265_LICENSE_FILES = COPYING
 X265_CPE_ID_VENDOR = multicorewareinc
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
