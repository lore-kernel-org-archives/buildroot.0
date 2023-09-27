Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E8FE82CB7
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B15E42C38;
	Wed, 27 Sep 2023 19:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B15E42C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmkWRXz1-CaM; Wed, 27 Sep 2023 19:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 275F342C40;
	Wed, 27 Sep 2023 19:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 275F342C40
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 172381BF32A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5885404FC
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5885404FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALdWFGhNiVr9 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9C4F414F7
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9C4F414F7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99E2F82764; Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:12:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7aa5e8f84fa47259db3b4f66edb452a94e8eca1e
X-Git-Newrev: c11478fb2760de4def18bb823d7ee498f7ade198
X-Patchwork-Hint: ignore
Message-Id: <20230927191659.99E2F82764@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brotli: bump to version 1.1.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c11478fb2760de4def18bb823d7ee498f7ade198
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://github.com/google/brotli/releases/tag/v1.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   2 -
 ...-using-BUILD_SHARED_LIBS-to-choose-static.patch | 130 ---------------------
 ...d-runtime-linker-path-to-pkg-config-files.patch |  51 --------
 package/brotli/brotli.hash                         |   2 +-
 package/brotli/brotli.mk                           |   2 +-
 5 files changed, 2 insertions(+), 185 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2e24f4c27c..373b9b1313 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -221,8 +221,6 @@ package/bridge-utils/0001-fix-build-on-musl.patch Upstream
 package/brltty/0001-Fix-linking-error-on-mips64el.patch Upstream
 package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch Upstream
 package/brltty/S10brltty Indent Shellcheck Variables
-package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch Upstream
-package/brotli/0002-Revert-Add-runtime-linker-path-to-pkg-config-files.patch Upstream
 package/bsdiff/0001-Add-missing-header-for-u_char.patch Upstream
 package/bustle/0001-Makefile-fix-pcap-config-call.patch Upstream
 package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch Upstream
diff --git a/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch b/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch
deleted file mode 100644
index 2a3204fc34..0000000000
--- a/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From 6cb16322decd643fed9de332d9cda77f7738b7af Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Mon, 7 Sep 2020 12:14:22 +0300
-Subject: [PATCH] CMake: Allow using BUILD_SHARED_LIBS to choose static/shared
- libs
-
-By convention projects using CMake which can build either static or
-shared libraries use a BUILD_SHARED_LIBS flag to allow selecting between
-both: the add_library() command automatically switches between both using
-this variable when the library kind is not passed to add_library(). It
-is also usual to expose the BUILD_SHARED_LIBS as an user-facing setting
-with the option() command.
-
-This way, the following will both work as expected:
-
-   % cmake -DBUILD_SHARED_LIBS=OFF ...
-   % cmake -DBUILS_SHARED_LIBS=ON ...
-
-This is helpful for distributions which need (or want) to build only
-static libraries.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://github.com/google/brotli/pull/655]
----
- CMakeLists.txt        | 46 ++++++++++++++-----------------------------
- c/fuzz/test_fuzzer.sh |  6 +++---
- 2 files changed, 18 insertions(+), 34 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4ff3401..f889311 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -6,6 +6,8 @@ cmake_minimum_required(VERSION 2.8.6)
- 
- project(brotli C)
- 
-+option(BUILD_SHARED_LIBS "Build shared libraries" ON)
-+
- if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
-   message(STATUS "Setting build type to Release as none was specified.")
-   set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build." FORCE)
-@@ -137,10 +139,6 @@ set(BROTLI_LIBRARIES_CORE brotlienc brotlidec brotlicommon)
- set(BROTLI_LIBRARIES ${BROTLI_LIBRARIES_CORE} ${LIBM_LIBRARY})
- mark_as_advanced(BROTLI_LIBRARIES)
- 
--set(BROTLI_LIBRARIES_CORE_STATIC brotlienc-static brotlidec-static brotlicommon-static)
--set(BROTLI_LIBRARIES_STATIC ${BROTLI_LIBRARIES_CORE_STATIC} ${LIBM_LIBRARY})
--mark_as_advanced(BROTLI_LIBRARIES_STATIC)
--
- if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
-   add_definitions(-DOS_LINUX)
- elseif(${CMAKE_SYSTEM_NAME} MATCHES "FreeBSD")
-@@ -161,29 +159,25 @@ transform_sources_list("scripts/sources.lst" "${CMAKE_CURRENT_BINARY_DIR}/source
- include("${CMAKE_CURRENT_BINARY_DIR}/sources.lst.cmake")
- 
- if(BROTLI_EMSCRIPTEN)
--  set(BROTLI_SHARED_LIBS "")
--else()
--  set(BROTLI_SHARED_LIBS brotlicommon brotlidec brotlienc)
--  add_library(brotlicommon SHARED ${BROTLI_COMMON_C})
--  add_library(brotlidec SHARED ${BROTLI_DEC_C})
--  add_library(brotlienc SHARED ${BROTLI_ENC_C})
-+  set(BUILD_SHARED_LIBS OFF)
- endif()
- 
--set(BROTLI_STATIC_LIBS brotlicommon-static brotlidec-static brotlienc-static)
--add_library(brotlicommon-static STATIC ${BROTLI_COMMON_C})
--add_library(brotlidec-static STATIC ${BROTLI_DEC_C})
--add_library(brotlienc-static STATIC ${BROTLI_ENC_C})
-+add_library(brotlicommon ${BROTLI_COMMON_C})
-+add_library(brotlidec ${BROTLI_DEC_C})
-+add_library(brotlienc ${BROTLI_ENC_C})
- 
- # Older CMake versions does not understand INCLUDE_DIRECTORIES property.
- include_directories(${BROTLI_INCLUDE_DIRS})
- 
--foreach(lib IN LISTS BROTLI_SHARED_LIBS)
--  target_compile_definitions(${lib} PUBLIC "BROTLI_SHARED_COMPILATION" )
--  string(TOUPPER "${lib}" LIB)
--  set_target_properties (${lib} PROPERTIES DEFINE_SYMBOL "${LIB}_SHARED_COMPILATION")
--endforeach()
-+if(BUILD_SHARED_LIBS)
-+  foreach(lib brotlicommon brotlidec brotlienc)
-+    target_compile_definitions(${lib} PUBLIC "BROTLI_SHARED_COMPILATION" )
-+    string(TOUPPER "${lib}" LIB)
-+    set_target_properties (${lib} PROPERTIES DEFINE_SYMBOL "${LIB}_SHARED_COMPILATION")
-+  endforeach()
-+endif()
- 
--foreach(lib IN LISTS BROTLI_SHARED_LIBS BROTLI_STATIC_LIBS)
-+foreach(lib brotlicommon brotlidec brotlienc)
-   target_link_libraries(${lib} ${LIBM_LIBRARY})
-   set_property(TARGET ${lib} APPEND PROPERTY INCLUDE_DIRECTORIES ${BROTLI_INCLUDE_DIRS})
-   set_target_properties(${lib} PROPERTIES
-@@ -200,9 +194,6 @@ target_link_libraries(brotlidec brotlicommon)
- target_link_libraries(brotlienc brotlicommon)
- endif()
- 
--target_link_libraries(brotlidec-static brotlicommon-static)
--target_link_libraries(brotlienc-static brotlicommon-static)
--
- # For projects stuck on older versions of CMake, this will set the
- # BROTLI_INCLUDE_DIRS and BROTLI_LIBRARIES variables so they still
- # have a relatively easy way to use Brotli:
-@@ -216,7 +207,7 @@ endif()
- 
- # Build the brotli executable
- add_executable(brotli ${BROTLI_CLI_C})
--target_link_libraries(brotli ${BROTLI_LIBRARIES_STATIC})
-+target_link_libraries(brotli ${BROTLI_LIBRARIES})
- 
- # Installation
- if(NOT BROTLI_EMSCRIPTEN)
-@@ -233,13 +224,6 @@ if(NOT BROTLI_BUNDLED_MODE)
-     RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
-   )
- 
--  install(
--    TARGETS ${BROTLI_LIBRARIES_CORE_STATIC}
--    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
--    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
--    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
--  )
--
-   install(
-     DIRECTORY ${BROTLI_INCLUDE_DIRS}/brotli
-     DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
--- 
-2.28.0
-
diff --git a/package/brotli/0002-Revert-Add-runtime-linker-path-to-pkg-config-files.patch b/package/brotli/0002-Revert-Add-runtime-linker-path-to-pkg-config-files.patch
deleted file mode 100644
index 892aa1da15..0000000000
--- a/package/brotli/0002-Revert-Add-runtime-linker-path-to-pkg-config-files.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 09b0992b6acb7faa6fd3b23f9bc036ea117230fc Mon Sep 17 00:00:00 2001
-From: Eugene Kliuchnikov <eustas.ru@gmail.com>
-Date: Wed, 2 Sep 2020 11:38:26 +0200
-Subject: [PATCH] Revert "Add runtime linker path to pkg-config files (#740)"
- (#838)
-
-This reverts commit 31754d4ffce14153b5c2addf7a11019ec23f51c1.
-[Retrieved from:
-https://github.com/google/brotli/commit/09b0992b6acb7faa6fd3b23f9bc036ea117230fc]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- scripts/libbrotlicommon.pc.in | 2 +-
- scripts/libbrotlidec.pc.in    | 2 +-
- scripts/libbrotlienc.pc.in    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/libbrotlicommon.pc.in b/scripts/libbrotlicommon.pc.in
-index 10ca969e..2a8cf7a3 100644
---- a/scripts/libbrotlicommon.pc.in
-+++ b/scripts/libbrotlicommon.pc.in
-@@ -7,5 +7,5 @@ Name: libbrotlicommon
- URL: https://github.com/google/brotli
- Description: Brotli common dictionary library
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -R${libdir} -lbrotlicommon
-+Libs: -L${libdir} -lbrotlicommon
- Cflags: -I${includedir}
-diff --git a/scripts/libbrotlidec.pc.in b/scripts/libbrotlidec.pc.in
-index e7c3124f..6f8ef2e4 100644
---- a/scripts/libbrotlidec.pc.in
-+++ b/scripts/libbrotlidec.pc.in
-@@ -7,6 +7,6 @@ Name: libbrotlidec
- URL: https://github.com/google/brotli
- Description: Brotli decoder library
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -R${libdir} -lbrotlidec
-+Libs: -L${libdir} -lbrotlidec
- Requires.private: libbrotlicommon >= 1.0.2
- Cflags: -I${includedir}
-diff --git a/scripts/libbrotlienc.pc.in b/scripts/libbrotlienc.pc.in
-index 4dd0811b..2098afe2 100644
---- a/scripts/libbrotlienc.pc.in
-+++ b/scripts/libbrotlienc.pc.in
-@@ -7,6 +7,6 @@ Name: libbrotlienc
- URL: https://github.com/google/brotli
- Description: Brotli encoder library
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -R${libdir} -lbrotlienc
-+Libs: -L${libdir} -lbrotlienc
- Requires.private: libbrotlicommon >= 1.0.2
- Cflags: -I${includedir}
diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index 22f894c403..145467c420 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  b8e2df955e8796ac1f022eb4ebad29532cb7e3aa6a4b6aee91dbd2c7d637eee84d9a144d3e878895bb5e62800875c2c01c8f737a1261020c54feacf9f676b5f5  v1.0.9.tar.gz
+sha512  6eb280d10d8e1b43d22d00fa535435923c22ce8448709419d676ff47d4a644102ea04f488fc65a179c6c09fee12380992e9335bad8dfebd5d1f20908d10849d9  v1.1.0.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index ac49fe664f..80aa2566b5 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROTLI_VERSION = 1.0.9
+BROTLI_VERSION = 1.1.0
 BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
 BROTLI_SITE = https://github.com/google/brotli/archive
 BROTLI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
