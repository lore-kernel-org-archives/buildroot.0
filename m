Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0B3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 09:13:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C374761B44
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 09:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C374761B44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67F8F40464;
	Sun,  3 Oct 2021 09:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOgZQJ_OEM4G; Sun,  3 Oct 2021 09:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65E4840424;
	Sun,  3 Oct 2021 09:13:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 895561BF39F
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 09:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77BEF60AD6
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 09:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqS-vALbd1sg for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 09:13:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2AB660AD7
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 09:13:26 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout08.t-online.de (Postfix) with SMTP id 55930102F7;
 Sun,  3 Oct 2021 11:12:50 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.198]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mWxY5-4V6Mgz0; Sun, 3 Oct 2021 11:12:46 +0200
Received: from [192.168.1.109] (port=42692 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mWxY4-0001yz-KG;
 Sun, 03 Oct 2021 11:12:45 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  3 Oct 2021 11:12:43 +0200
Message-Id: <20211003091244.723799-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211003091244.723799-1-bernd.kuhls@t-online.de>
References: <20211003091244.723799-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1633252366-00001454-5F5837E7/0/0 CLEAN NORMAL
X-TOI-MSGID: 85935fe2-a4db-4cff-b800-84962f4c2479
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: bump version to
 21.3.3
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes Kodi on Rocketlake.

Replaced patch 0001 with upstream PR 1242 and added ssp-related
configure options.

Removed patch 0002 which was applied upstream:
https://github.com/intel/media-driver/commit/6a5249738b62c91b812cdc477994759959f37d0c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...001-Add-MEDIA-BUILD-HARDENING-option.patch | 105 ++++++++++++++++++
 .../0001-Drop-hardening-related-flags.patch   |  71 ------------
 ...akelists.txt-respect-MEDIA_BUILD_FAT.patch |  51 ---------
 .../intel-mediadriver/intel-mediadriver.hash  |   2 +-
 .../intel-mediadriver/intel-mediadriver.mk    |   8 +-
 5 files changed, 113 insertions(+), 124 deletions(-)
 create mode 100644 package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
 delete mode 100644 package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
 delete mode 100644 package/intel-mediadriver/0002-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch

diff --git a/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch b/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
new file mode 100644
index 0000000000..1bb92de5c3
--- /dev/null
+++ b/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
@@ -0,0 +1,105 @@
+From 103c00c8d74a1cd87686850212bd93c0e4d59fc9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 11 Aug 2021 21:34:59 +0200
+Subject: [PATCH] Add MEDIA_BUILD_HARDENING option
+
+Add MEDIA_BUILD_HARDENING option to allow the user to disable hardening
+options such as stack-protector-all or FORTIFY SOURCE 2 which are not
+always available (e.g. fortify source 2 is only available on glibc >= 6
+and not musl/uclibc-ng)
+
+Patch sent upstream: https://github.com/intel/media-driver/pull/1242
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ cmrtlib/linux/CMakeLists.txt                       | 14 ++++++++++----
+ .../cmake/linux/media_compile_flags_linux.cmake    | 12 ++++++++++--
+ media_driver/media_top_cmake.cmake                 |  8 +++++++-
+ 3 files changed, 27 insertions(+), 7 deletions(-)
+
+diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
+index 65f71ceef..b066138d9 100644
+--- a/cmrtlib/linux/CMakeLists.txt
++++ b/cmrtlib/linux/CMakeLists.txt
+@@ -32,12 +32,18 @@ else()
+ endif()
+ 
+ # Set up compile options that will be used for the Linux build
+-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all")
+-set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive")
++set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing")
+ set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
+-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all")
+-set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive")
++set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
+ set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
++if(MEDIA_BUILD_HARDENING)
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -fstack-protector-all")
++    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -D_FORTIFY_SOURCE=2")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -fstack-protector-all")
++    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -D_FORTIFY_SOURCE=2")
++endif()
+ if(MEDIA_BUILD_FATAL_WARNINGS)
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -Werror")
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -Werror")
+diff --git a/media_driver/cmake/linux/media_compile_flags_linux.cmake b/media_driver/cmake/linux/media_compile_flags_linux.cmake
+index 7a2bd64b6..98896b131 100755
+--- a/media_driver/cmake/linux/media_compile_flags_linux.cmake
++++ b/media_driver/cmake/linux/media_compile_flags_linux.cmake
+@@ -47,7 +47,6 @@ set(MEDIA_COMPILER_FLAGS_COMMON
+     # Other common flags
+     -fmessage-length=0
+     -fvisibility=hidden
+-    -fstack-protector
+     -fdata-sections
+     -ffunction-sections
+     -Wl,--gc-sections
+@@ -64,6 +63,11 @@ set(MEDIA_COMPILER_FLAGS_COMMON
+     -g
+ )
+ 
++if(MEDIA_BUILD_HARDENING)
++    set(MEDIA_COMPILER_FLAGS_COMMON
++        ${MEDIA_COMPILER_FLAGS_COMMON}
++        -fstack-protector)
++endif()
+ 
+ if(${UFO_MARCH} STREQUAL "slm")
+     set(MEDIA_COMPILER_FLAGS_COMMON
+@@ -119,9 +123,13 @@ if(${UFO_VARIANT} STREQUAL "default")
+     set(MEDIA_COMPILER_FLAGS_RELEASE
+         ${MEDIA_COMPILER_FLAGS_RELEASE}
+         -O2
+-        -D_FORTIFY_SOURCE=2
+         -fno-omit-frame-pointer
+     )
++    if(MEDIA_BUILD_HARDENING)
++        set(MEDIA_COMPILER_FLAGS_RELEASE
++            ${MEDIA_COMPILER_FLAGS_RELEASE}
++            -D_FORTIFY_SOURCE=2)
++    endif()
+ endif()
+ 
+ if(NOT ${PLATFORM} STREQUAL "android")
+diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
+index f089ea45f..b0b428914 100755
+--- a/media_driver/media_top_cmake.cmake
++++ b/media_driver/media_top_cmake.cmake
+@@ -111,7 +111,13 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
+     set_target_properties(${LIB_NAME_OBJ} PROPERTIES COMPILE_FLAGS "-Werror")
+ endif()
+ 
+-set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS "-Wl,--no-as-needed -Wl,--gc-sections -z relro -z now -fstack-protector -fPIC")
++set(MEDIA_LINK_FLAGS "-Wl,--no-as-needed -Wl,--gc-sections -z relro -z now -fPIC")
++option(MEDIA_BUILD_HARDENING "Enable hardening (stack-protector, fortify source)" ON)
++if(MEDIA_BUILD_HARDENING)
++    set(MEDIA_LINK_FLAGS "${MEDIA_LINK_FLAGS} -fstack-protector")
++endif()
++set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS ${MEDIA_LINK_FLAGS})
++
+ set_target_properties(${LIB_NAME}        PROPERTIES PREFIX "")
+ set_target_properties(${LIB_NAME_STATIC} PROPERTIES PREFIX "")
+ 
diff --git a/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch b/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
deleted file mode 100644
index 376308ea42..0000000000
--- a/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 8916c8480eb3483c2ffb41ad8961cd0c2b0fb1c4 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 15 Apr 2019 22:48:21 +0200
-Subject: [PATCH] Drop hardening-related flags
-
-These will be set by Buildroot depending on toolchain capabilities and
-global Buildroot options.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- cmrtlib/linux/CMakeLists.txt                             | 8 ++++----
- media_driver/cmake/linux/media_compile_flags_linux.cmake | 1 -
- media_driver/media_top_cmake.cmake                       | 2 +-
- 3 files changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
-index 44ce4f08..b462fbea 100644
---- a/cmrtlib/linux/CMakeLists.txt
-+++ b/cmrtlib/linux/CMakeLists.txt
-@@ -32,11 +32,11 @@
- endif()
- 
- # Set up compile options that will be used for the Linux build
--set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all -Werror")
--set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
-+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -Werror")
-+set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing")
- set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
--set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all -Werror")
--set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -Werror")
-+set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
- set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
- 
- set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
-diff --git a/media_driver/cmake/linux/media_compile_flags_linux.cmake b/media_driver/cmake/linux/media_compile_flags_linux.cmake
-index 9e85fdb2..c45ce11b 100755
---- a/media_driver/cmake/linux/media_compile_flags_linux.cmake
-+++ b/media_driver/cmake/linux/media_compile_flags_linux.cmake
-@@ -47,7 +47,6 @@ set(MEDIA_COMPILER_FLAGS_COMMON
-     # Other common flags
-     -fmessage-length=0
-     -fvisibility=hidden
--    -fstack-protector
-     -fdata-sections
-     -ffunction-sections
-     -Wl,--gc-sections
-@@ -119,7 +118,6 @@
-     set(MEDIA_COMPILER_FLAGS_RELEASE
-         ${MEDIA_COMPILER_FLAGS_RELEASE}
-         -O2
--        -D_FORTIFY_SOURCE=2
-         -fno-omit-frame-pointer
-     )
- endif()
-diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
-index 3491db1e..b30fa04a 100755
---- a/media_driver/media_top_cmake.cmake
-+++ b/media_driver/media_top_cmake.cmake
-@@ -105,7 +105,7 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
-     set_target_properties(${LIB_NAME_OBJ} PROPERTIES COMPILE_FLAGS "-Werror")
- endif()
- 
--set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS "-Wl,--no-as-needed -Wl,--gc-sections -z relro -z now -fstack-protector -fPIC")
-+set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS "-Wl,--no-as-needed -Wl,--gc-sections -fPIC")
- set_target_properties(${LIB_NAME}        PROPERTIES PREFIX "")
- set_target_properties(${LIB_NAME_STATIC} PROPERTIES PREFIX "")
- 
--- 
-2.20.1
-
diff --git a/package/intel-mediadriver/0002-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch b/package/intel-mediadriver/0002-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
deleted file mode 100644
index df8d39f777..0000000000
--- a/package/intel-mediadriver/0002-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From f09fddd6763aca237f19417de05a1f5de7f51d40 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 5 Jun 2021 16:57:32 +0200
-Subject: [PATCH] cmrtlib/linux/CMakelists.txt: respect
- MEDIA_BUILD_FATAL_WARNINGS
-
-Respect MEDIA_BUILD_FATAL_WARNINGS to avoid the following build failure
-when the user provides _FORTIFY_SOURCE:
-
-In file included from /home/buildroot/autobuild/instance-0/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/dlfcn.h:22,
-                 from /home/buildroot/autobuild/instance-0/output-1/build/intel-mediadriver-19.4.0r/cmrtlib/linux/../linux/share/cm_include.h:30,
-                 from /home/buildroot/autobuild/instance-0/output-1/build/intel-mediadriver-19.4.0r/cmrtlib/agnostic/share/cm_printf_host.cpp:23:
-/home/buildroot/autobuild/instance-0/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/features.h:397:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
-  397 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
-      |    ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/52638d95312e464626d1c4047b3b26d4f57a1cd2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/intel/media-driver/pull/1203]
----
- cmrtlib/linux/CMakeLists.txt | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
-index 7a0193a8..65f71cee 100644
---- a/cmrtlib/linux/CMakeLists.txt
-+++ b/cmrtlib/linux/CMakeLists.txt
-@@ -32,12 +32,16 @@
- endif()
- 
- # Set up compile options that will be used for the Linux build
--set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -Werror")
-+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive")
- set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing")
- set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
--set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -Werror")
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive")
- set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
- set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
-+if(MEDIA_BUILD_FATAL_WARNINGS)
-+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -Werror")
-+   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -Werror")
-+endif()
- 
- set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
- set(CMAKE_SKIP_RPATH ON)
--- 
-2.30.2
-
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 74dc397041..6a7953403d 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b190a980447284508969da38971cfdaaf6e69d840d49e81f5969e124bf17e16  intel-media-21.2.3.tar.gz
+sha256  10d57dc1e1e15b6d97af62340296fbc1936c5962692a4e8b2d0ebb2337bdc9d1  intel-media-21.3.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index fc9343da23..adef65ed30 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 21.2.3
+INTEL_MEDIADRIVER_VERSION = 21.3.3
 INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
@@ -33,4 +33,10 @@ INTEL_MEDIADRIVER_CONF_OPTS = \
 	-DMEDIA_BUILD_FATAL_WARNINGS=OFF \
 	-DMEDIA_RUN_TEST_SUITE=OFF
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+INTEL_MEDIADRIVER_CONF_OPTS += -DMEDIA_BUILD_HARDENING=ON
+else
+INTEL_MEDIADRIVER_CONF_OPTS += -DMEDIA_BUILD_HARDENING=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
