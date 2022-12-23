Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAE0C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB0CF8237E;
	Mon, 20 Feb 2023 23:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB0CF8237E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ozUZidIINO0T; Mon, 20 Feb 2023 23:19:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84B4F823E3;
	Mon, 20 Feb 2023 23:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B4F823E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 556FE1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60AB161397
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60AB161397
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZeU1yNpfISZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8AAF612D9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8AAF612D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3C4C81979; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 10:34:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b30eb2f763ac98b4c44d38097bc6da8d9a9a550b
X-Git-Newrev: bd7e90779861bb603fc1cca03f6fad4d951f7bd9
X-Patchwork-Hint: ignore
Message-Id: <20230220205214.C3C4C81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hiredis: bump to
 version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd7e90779861bb603fc1cca03f6fad4d951f7bd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Replace first patch
- Drop second and third patches (already in version)

https://github.com/redis/hiredis/blob/v1.1.0/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-CMakeLists.txt-do-not-force-SHARED.patch  |  47 ------
 ...-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch | 171 +++++++++++++++++++++
 ...s.txt-allow-building-without-a-C-compiler.patch |  57 -------
 .../hiredis/0003-Explicitly-set-c99-in-CMake.patch |  28 ----
 package/hiredis/hiredis.hash                       |   2 +-
 package/hiredis/hiredis.mk                         |   4 +-
 6 files changed, 174 insertions(+), 135 deletions(-)

diff --git a/package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch b/package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch
deleted file mode 100644
index b7fdb87910..0000000000
--- a/package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0ce382c275b087e866517c003e565f8cc4855bdd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 29 Aug 2020 23:19:26 +0200
-Subject: [PATCH] CMakeLists.txt: do not force SHARED
-
-Allow the user to build static libraries by removing SHARED from
-ADD_LIBRARY calls.
-
-Here is an extract of
-https://cmake.org/cmake/help/latest/command/add_library.html:
-
-"If no type is given explicitly the type is STATIC or SHARED based on
-whether the current value of the variable BUILD_SHARED_LIBS is ON."
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: probably not upstreamable as is because it will
-conflict with https://github.com/redis/hiredis/pull/851. So, this patch
-will probably have to be reworked for 1.0.x]
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1beccc6..fed79fd 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -40,7 +40,7 @@ IF(WIN32)
-     ADD_COMPILE_DEFINITIONS(_CRT_SECURE_NO_WARNINGS WIN32_LEAN_AND_MEAN)
- ENDIF()
- 
--ADD_LIBRARY(hiredis SHARED ${hiredis_sources})
-+ADD_LIBRARY(hiredis ${hiredis_sources})
- 
- SET_TARGET_PROPERTIES(hiredis
-     PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS TRUE
-@@ -97,7 +97,7 @@ IF(ENABLE_SSL)
-     FIND_PACKAGE(OpenSSL REQUIRED)
-     SET(hiredis_ssl_sources
-         ssl.c)
--    ADD_LIBRARY(hiredis_ssl SHARED
-+    ADD_LIBRARY(hiredis_ssl
-             ${hiredis_ssl_sources})
- 
-     IF (APPLE)
--- 
-2.28.0
-
diff --git a/package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch b/package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
new file mode 100644
index 0000000000..38e9282041
--- /dev/null
+++ b/package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
@@ -0,0 +1,171 @@
+From 286ba29771611abfaf126527141cac1d406c7eaf Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 22 Dec 2022 23:00:56 +0100
+Subject: [PATCH] CMakeLists.txt: respect BUILD_SHARED_LIBS
+
+To allow building hiredis on toolchain without dynamic library support,
+respect standard cmake BUILD_SHARED_LIBS:
+https://cmake.org/cmake/help/latest/variable/BUILD_SHARED_LIBS.html
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/redis/hiredis/pull/1147]
+---
+ CMakeLists.txt | 70 ++++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 48 insertions(+), 22 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3d52d0c..66a1383 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,6 @@
+ CMAKE_MINIMUM_REQUIRED(VERSION 3.0.0)
+ 
++OPTION(BUILD_SHARED_LIBS "Build shared libraries" ON)
+ OPTION(ENABLE_SSL "Build hiredis_ssl for SSL support" OFF)
+ OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
+ OPTION(ENABLE_SSL_TESTS "Should we test SSL connections" OFF)
+@@ -44,35 +45,49 @@ IF(WIN32)
+     ADD_DEFINITIONS(-D_CRT_SECURE_NO_WARNINGS -DWIN32_LEAN_AND_MEAN)
+ ENDIF()
+ 
+-ADD_LIBRARY(hiredis SHARED ${hiredis_sources})
+ ADD_LIBRARY(hiredis_static STATIC ${hiredis_sources})
+-ADD_LIBRARY(hiredis::hiredis ALIAS hiredis)
+ ADD_LIBRARY(hiredis::hiredis_static ALIAS hiredis_static)
++SET(HIREDIS_DEFAULT_LIBRARY hiredis_static)
++SET(HIREDIS_TARGETS hiredis_static)
+ 
+ IF(NOT MSVC)
+     SET_TARGET_PROPERTIES(hiredis_static
+         PROPERTIES OUTPUT_NAME hiredis)
+ ENDIF()
+ 
+-SET_TARGET_PROPERTIES(hiredis
+-    PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS TRUE
+-    VERSION "${HIREDIS_SONAME}")
++IF(BUILD_SHARED_LIBS)
++    ADD_LIBRARY(hiredis SHARED ${hiredis_sources})
++    ADD_LIBRARY(hiredis::hiredis ALIAS hiredis)
++    SET(HIREDIS_DEFAULT_LIBRARY hiredis)
++    SET(HIREDIS_TARGETS ${HIREDIS_TARGETS} hiredis)
++    SET_TARGET_PROPERTIES(hiredis
++        PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS TRUE
++        VERSION "${HIREDIS_SONAME}")
++ENDIF()
+ IF(MSVC)
+     SET_TARGET_PROPERTIES(hiredis_static
+         PROPERTIES COMPILE_FLAGS /Z7)
+ ENDIF()
+ IF(WIN32 OR MINGW)
+-    TARGET_LINK_LIBRARIES(hiredis PUBLIC ws2_32 crypt32)
++    IF(BUILD_SHARED_LIBS)
++        TARGET_LINK_LIBRARIES(hiredis PUBLIC ws2_32 crypt32)
++    ENDIF()
+     TARGET_LINK_LIBRARIES(hiredis_static PUBLIC ws2_32 crypt32)
+ ELSEIF(CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
+-    TARGET_LINK_LIBRARIES(hiredis PUBLIC m)
++    IF(BUILD_SHARED_LIBS)
++        TARGET_LINK_LIBRARIES(hiredis PUBLIC m)
++    ENDIF()
+     TARGET_LINK_LIBRARIES(hiredis_static PUBLIC m)
+ ELSEIF(CMAKE_SYSTEM_NAME MATCHES "SunOS")
+-    TARGET_LINK_LIBRARIES(hiredis PUBLIC socket)
++    IF(BUILD_SHARED_LIBS)
++        TARGET_LINK_LIBRARIES(hiredis PUBLIC socket)
++    ENDIF()
+     TARGET_LINK_LIBRARIES(hiredis_static PUBLIC socket)
+ ENDIF()
+ 
+-TARGET_INCLUDE_DIRECTORIES(hiredis PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
++IF(BUILD_SHARED_LIBS)
++    TARGET_INCLUDE_DIRECTORIES(hiredis PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
++ENDIF()
+ TARGET_INCLUDE_DIRECTORIES(hiredis_static PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
+ 
+ CONFIGURE_FILE(hiredis.pc.in hiredis.pc @ONLY)
+@@ -103,7 +118,7 @@ set(CPACK_RPM_PACKAGE_AUTOREQPROV ON)
+ 
+ include(CPack)
+ 
+-INSTALL(TARGETS hiredis hiredis_static
++INSTALL(TARGETS ${HIREDIS_TARGETS}
+     EXPORT hiredis-targets
+     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+@@ -161,39 +176,50 @@ IF(ENABLE_SSL)
+     FIND_PACKAGE(OpenSSL REQUIRED)
+     SET(hiredis_ssl_sources
+         ssl.c)
+-    ADD_LIBRARY(hiredis_ssl SHARED
+-            ${hiredis_ssl_sources})
++
+     ADD_LIBRARY(hiredis_ssl_static STATIC
+             ${hiredis_ssl_sources})
++    SET(HIREDIS_SSL_DEFAULT_LIBRARY hiredis_ssl_static)
++    SET(HIREDIS_SSL_TARGETS hiredis_ssl_static)
++    IF(BUILD_SHARED_LIBS)
++        ADD_LIBRARY(hiredis_ssl SHARED
++            ${hiredis_ssl_sources})
++        SET(HIREDIS_SSL_DEFAULT_LIBRARY hiredis_ssl)
++        SET(HIREDIS_SSL_TARGETS ${HIREDIS_SSL_TARGETS} hiredis_ssl)
++    ENDIF()
+     IF(NOT MSVC)
+         SET_TARGET_PROPERTIES(hiredis_ssl_static
+             PROPERTIES OUTPUT_NAME hiredis_ssl)
+     ENDIF()
+ 
+-    IF (APPLE)
++    IF (APPLE AND BUILD_SHARED_LIBS)
+         SET_PROPERTY(TARGET hiredis_ssl PROPERTY LINK_FLAGS "-Wl,-undefined -Wl,dynamic_lookup")
+     ENDIF()
+ 
+-    SET_TARGET_PROPERTIES(hiredis_ssl
+-        PROPERTIES
+-        WINDOWS_EXPORT_ALL_SYMBOLS TRUE
+-        VERSION "${HIREDIS_SONAME}")
++    IF(BUILD_SHARED_LIBS)
++        SET_TARGET_PROPERTIES(hiredis_ssl
++            PROPERTIES
++            WINDOWS_EXPORT_ALL_SYMBOLS TRUE
++            VERSION "${HIREDIS_SONAME}")
++    ENDIF()
+     IF(MSVC)
+         SET_TARGET_PROPERTIES(hiredis_ssl_static
+             PROPERTIES COMPILE_FLAGS /Z7)
+     ENDIF()
+ 
+-    TARGET_INCLUDE_DIRECTORIES(hiredis_ssl PRIVATE "${OPENSSL_INCLUDE_DIR}")
+     TARGET_INCLUDE_DIRECTORIES(hiredis_ssl_static PRIVATE "${OPENSSL_INCLUDE_DIR}")
++    IF(BUILD_SHARED_LIBS)
++        TARGET_INCLUDE_DIRECTORIES(hiredis_ssl PRIVATE "${OPENSSL_INCLUDE_DIR}")
++        TARGET_LINK_LIBRARIES(hiredis_ssl PRIVATE ${OPENSSL_LIBRARIES})
++    ENDIF()
+ 
+-    TARGET_LINK_LIBRARIES(hiredis_ssl PRIVATE ${OPENSSL_LIBRARIES})
+     IF (WIN32 OR MINGW)
+         TARGET_LINK_LIBRARIES(hiredis_ssl PRIVATE hiredis)
+         TARGET_LINK_LIBRARIES(hiredis_ssl_static PUBLIC hiredis_static)
+     ENDIF()
+     CONFIGURE_FILE(hiredis_ssl.pc.in hiredis_ssl.pc @ONLY)
+ 
+-    INSTALL(TARGETS hiredis_ssl hiredis_ssl_static
++    INSTALL(TARGETS ${HIREDIS_SSL_TARGETS}
+         EXPORT hiredis_ssl-targets
+         RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+         LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+@@ -236,10 +262,10 @@ ENDIF()
+ IF(NOT DISABLE_TESTS)
+     ENABLE_TESTING()
+     ADD_EXECUTABLE(hiredis-test test.c)
+-    TARGET_LINK_LIBRARIES(hiredis-test hiredis)
++    TARGET_LINK_LIBRARIES(hiredis-test ${HIREDIS_DEFAULT_LIBRARY})
+     IF(ENABLE_SSL_TESTS)
+         ADD_DEFINITIONS(-DHIREDIS_TEST_SSL=1)
+-        TARGET_LINK_LIBRARIES(hiredis-test hiredis_ssl)
++        TARGET_LINK_LIBRARIES(hiredis-test ${HIREDIS_SSL_DEFAULT_LIBRARY})
+     ENDIF()
+     IF(ENABLE_ASYNC_TESTS)
+         ADD_DEFINITIONS(-DHIREDIS_TEST_ASYNC=1)
+-- 
+2.35.1
+
diff --git a/package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch b/package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch
deleted file mode 100644
index 08a9ef9854..0000000000
--- a/package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From bb4a8937411a9e6ac2e5c12c0e7eeaa7dab251ba Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 5 Sep 2020 12:54:21 +0200
-Subject: [PATCH] CMakeLists.txt: allow building without a C++ compiler
-
-Define hiredis as a C project (and use a single PROJECT statement) to
-avoid the following build failure if a C++ compiler is not found:
-
-CMake Error at CMakeLists.txt:3 (PROJECT):
-  The CMAKE_CXX_COMPILER:
-
-    /srv/storage/autobuild/run/instance-1/output-1/host/bin/arm-linux-g++
-
-  is not a full path to an existing compiler tool.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-The only cpp source file is examples/example-qt.cpp which is never
-compiled with cmake buildsystem. This file is compiled only with the
-Makefile buildsystem so perhaps it should be removed. If it is added to
-the cmake buildsystem, a call to enable_language(CXX) will have to be
-added.
-
-Fixes:
- - http://autobuild.buildroot.org/results/830ec3398cd29b9fc5cde06a225ef531d7a9d850
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/redis/hiredis/pull/872]
----
- CMakeLists.txt | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4cbd438..9d65b7f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,5 @@
- CMAKE_MINIMUM_REQUIRED(VERSION 3.4.0)
- INCLUDE(GNUInstallDirs)
--PROJECT(hiredis)
- 
- OPTION(ENABLE_SSL "Build hiredis_ssl for SSL support" OFF)
- OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
-@@ -20,7 +19,7 @@ getVersionBit(HIREDIS_SONAME)
- SET(VERSION "${HIREDIS_MAJOR}.${HIREDIS_MINOR}.${HIREDIS_PATCH}")
- MESSAGE("Detected version: ${VERSION}")
- 
--PROJECT(hiredis VERSION "${VERSION}")
-+PROJECT(hiredis LANGUAGES "C" VERSION "${VERSION}")
- 
- # Hiredis requires C99
- SET(CMAKE_C_STANDARD 99)
--- 
-2.28.0
-
diff --git a/package/hiredis/0003-Explicitly-set-c99-in-CMake.patch b/package/hiredis/0003-Explicitly-set-c99-in-CMake.patch
deleted file mode 100644
index 7e6ef8bca4..0000000000
--- a/package/hiredis/0003-Explicitly-set-c99-in-CMake.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 13a35bdb64615e381c5e1151cdd4e78bba71a6db Mon Sep 17 00:00:00 2001
-From: michael-grunder <michael.grunder@gmail.com>
-Date: Fri, 28 Aug 2020 12:35:01 -0700
-Subject: [PATCH] Explicitly set c99 in CMake
-
-See #869
-
-[Retrieved from:
-https://github.com/redis/hiredis/commit/13a35bdb64615e381c5e1151cdd4e78bba71a6db]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1beccc69a..4cbd438d7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -22,6 +22,9 @@ MESSAGE("Detected version: ${VERSION}")
- 
- PROJECT(hiredis VERSION "${VERSION}")
- 
-+# Hiredis requires C99
-+SET(CMAKE_C_STANDARD 99)
-+
- SET(ENABLE_EXAMPLES OFF CACHE BOOL "Enable building hiredis examples")
- 
- SET(hiredis_sources
diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index a45cf68f99..cdcbef1525 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e0ab696e2f07deb4252dda45b703d09854e53b9703c7d52182ce5a22616c3819  hiredis-1.0.2.tar.gz
+sha256  fe6d21741ec7f3fc9df409d921f47dfc73a4d8ff64f4ac6f1d95f951bf7f53d6  hiredis-1.1.0.tar.gz
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  COPYING
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index a571951fa3..d59933845c 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HIREDIS_VERSION_MAJOR = 1.0
-HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).2
+HIREDIS_VERSION_MAJOR = 1.1
+HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
