Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF6AC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA111401C9;
	Thu, 27 Jul 2023 10:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA111401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSJf6dTP3-zz; Thu, 27 Jul 2023 10:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0CF1402A7;
	Thu, 27 Jul 2023 10:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0CF1402A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1222F1BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDB2883EFD
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDB2883EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QPnlYMJW_Gg for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:29:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D438183A8F
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D438183A8F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEFE0836B5; Thu, 27 Jul 2023 10:29:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 12:29:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c03fc8a9fffd3a545abbf9829a81c6fed97c7db6
X-Git-Newrev: e84fad284882ab8e353d733f855aedcc424a9d14
X-Patchwork-Hint: ignore
Message-Id: <20230727102952.BEFE0836B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiredis: bump version to 1.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e84fad284882ab8e353d733f855aedcc424a9d14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.

Changelog: https://github.com/redis/hiredis/blob/master/CHANGELOG.md

This release includes improvements for static-only builds:
https://github.com/redis/hiredis/pull/1160

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   1 -
 ...-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch | 171 ---------------------
 package/hiredis/hiredis.hash                       |   2 +-
 package/hiredis/hiredis.mk                         |   2 +-
 4 files changed, 2 insertions(+), 174 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8eb88813c9..4be4ab4f27 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -584,7 +584,6 @@ package/haveged/S21haveged Shellcheck Variables
 package/heirloom-mailx/0001-fix-libressl-support.patch Upstream
 package/highway/0001-Fix-compilation-for-armv7-with-gcc-8.patch Upstream
 package/highway/0002-Fix-compilation-for-armv7-targets-with-vfp-v4-and-gc.patch Upstream
-package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch Upstream
 package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch Upstream
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch Upstream
 package/htpdate/S43htpdate Shellcheck
diff --git a/package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch b/package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
deleted file mode 100644
index 38e9282041..0000000000
--- a/package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From 286ba29771611abfaf126527141cac1d406c7eaf Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 22 Dec 2022 23:00:56 +0100
-Subject: [PATCH] CMakeLists.txt: respect BUILD_SHARED_LIBS
-
-To allow building hiredis on toolchain without dynamic library support,
-respect standard cmake BUILD_SHARED_LIBS:
-https://cmake.org/cmake/help/latest/variable/BUILD_SHARED_LIBS.html
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/redis/hiredis/pull/1147]
----
- CMakeLists.txt | 70 ++++++++++++++++++++++++++++++++++----------------
- 1 file changed, 48 insertions(+), 22 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3d52d0c..66a1383 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,6 @@
- CMAKE_MINIMUM_REQUIRED(VERSION 3.0.0)
- 
-+OPTION(BUILD_SHARED_LIBS "Build shared libraries" ON)
- OPTION(ENABLE_SSL "Build hiredis_ssl for SSL support" OFF)
- OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
- OPTION(ENABLE_SSL_TESTS "Should we test SSL connections" OFF)
-@@ -44,35 +45,49 @@ IF(WIN32)
-     ADD_DEFINITIONS(-D_CRT_SECURE_NO_WARNINGS -DWIN32_LEAN_AND_MEAN)
- ENDIF()
- 
--ADD_LIBRARY(hiredis SHARED ${hiredis_sources})
- ADD_LIBRARY(hiredis_static STATIC ${hiredis_sources})
--ADD_LIBRARY(hiredis::hiredis ALIAS hiredis)
- ADD_LIBRARY(hiredis::hiredis_static ALIAS hiredis_static)
-+SET(HIREDIS_DEFAULT_LIBRARY hiredis_static)
-+SET(HIREDIS_TARGETS hiredis_static)
- 
- IF(NOT MSVC)
-     SET_TARGET_PROPERTIES(hiredis_static
-         PROPERTIES OUTPUT_NAME hiredis)
- ENDIF()
- 
--SET_TARGET_PROPERTIES(hiredis
--    PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS TRUE
--    VERSION "${HIREDIS_SONAME}")
-+IF(BUILD_SHARED_LIBS)
-+    ADD_LIBRARY(hiredis SHARED ${hiredis_sources})
-+    ADD_LIBRARY(hiredis::hiredis ALIAS hiredis)
-+    SET(HIREDIS_DEFAULT_LIBRARY hiredis)
-+    SET(HIREDIS_TARGETS ${HIREDIS_TARGETS} hiredis)
-+    SET_TARGET_PROPERTIES(hiredis
-+        PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS TRUE
-+        VERSION "${HIREDIS_SONAME}")
-+ENDIF()
- IF(MSVC)
-     SET_TARGET_PROPERTIES(hiredis_static
-         PROPERTIES COMPILE_FLAGS /Z7)
- ENDIF()
- IF(WIN32 OR MINGW)
--    TARGET_LINK_LIBRARIES(hiredis PUBLIC ws2_32 crypt32)
-+    IF(BUILD_SHARED_LIBS)
-+        TARGET_LINK_LIBRARIES(hiredis PUBLIC ws2_32 crypt32)
-+    ENDIF()
-     TARGET_LINK_LIBRARIES(hiredis_static PUBLIC ws2_32 crypt32)
- ELSEIF(CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
--    TARGET_LINK_LIBRARIES(hiredis PUBLIC m)
-+    IF(BUILD_SHARED_LIBS)
-+        TARGET_LINK_LIBRARIES(hiredis PUBLIC m)
-+    ENDIF()
-     TARGET_LINK_LIBRARIES(hiredis_static PUBLIC m)
- ELSEIF(CMAKE_SYSTEM_NAME MATCHES "SunOS")
--    TARGET_LINK_LIBRARIES(hiredis PUBLIC socket)
-+    IF(BUILD_SHARED_LIBS)
-+        TARGET_LINK_LIBRARIES(hiredis PUBLIC socket)
-+    ENDIF()
-     TARGET_LINK_LIBRARIES(hiredis_static PUBLIC socket)
- ENDIF()
- 
--TARGET_INCLUDE_DIRECTORIES(hiredis PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
-+IF(BUILD_SHARED_LIBS)
-+    TARGET_INCLUDE_DIRECTORIES(hiredis PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
-+ENDIF()
- TARGET_INCLUDE_DIRECTORIES(hiredis_static PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
- 
- CONFIGURE_FILE(hiredis.pc.in hiredis.pc @ONLY)
-@@ -103,7 +118,7 @@ set(CPACK_RPM_PACKAGE_AUTOREQPROV ON)
- 
- include(CPack)
- 
--INSTALL(TARGETS hiredis hiredis_static
-+INSTALL(TARGETS ${HIREDIS_TARGETS}
-     EXPORT hiredis-targets
-     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-@@ -161,39 +176,50 @@ IF(ENABLE_SSL)
-     FIND_PACKAGE(OpenSSL REQUIRED)
-     SET(hiredis_ssl_sources
-         ssl.c)
--    ADD_LIBRARY(hiredis_ssl SHARED
--            ${hiredis_ssl_sources})
-+
-     ADD_LIBRARY(hiredis_ssl_static STATIC
-             ${hiredis_ssl_sources})
-+    SET(HIREDIS_SSL_DEFAULT_LIBRARY hiredis_ssl_static)
-+    SET(HIREDIS_SSL_TARGETS hiredis_ssl_static)
-+    IF(BUILD_SHARED_LIBS)
-+        ADD_LIBRARY(hiredis_ssl SHARED
-+            ${hiredis_ssl_sources})
-+        SET(HIREDIS_SSL_DEFAULT_LIBRARY hiredis_ssl)
-+        SET(HIREDIS_SSL_TARGETS ${HIREDIS_SSL_TARGETS} hiredis_ssl)
-+    ENDIF()
-     IF(NOT MSVC)
-         SET_TARGET_PROPERTIES(hiredis_ssl_static
-             PROPERTIES OUTPUT_NAME hiredis_ssl)
-     ENDIF()
- 
--    IF (APPLE)
-+    IF (APPLE AND BUILD_SHARED_LIBS)
-         SET_PROPERTY(TARGET hiredis_ssl PROPERTY LINK_FLAGS "-Wl,-undefined -Wl,dynamic_lookup")
-     ENDIF()
- 
--    SET_TARGET_PROPERTIES(hiredis_ssl
--        PROPERTIES
--        WINDOWS_EXPORT_ALL_SYMBOLS TRUE
--        VERSION "${HIREDIS_SONAME}")
-+    IF(BUILD_SHARED_LIBS)
-+        SET_TARGET_PROPERTIES(hiredis_ssl
-+            PROPERTIES
-+            WINDOWS_EXPORT_ALL_SYMBOLS TRUE
-+            VERSION "${HIREDIS_SONAME}")
-+    ENDIF()
-     IF(MSVC)
-         SET_TARGET_PROPERTIES(hiredis_ssl_static
-             PROPERTIES COMPILE_FLAGS /Z7)
-     ENDIF()
- 
--    TARGET_INCLUDE_DIRECTORIES(hiredis_ssl PRIVATE "${OPENSSL_INCLUDE_DIR}")
-     TARGET_INCLUDE_DIRECTORIES(hiredis_ssl_static PRIVATE "${OPENSSL_INCLUDE_DIR}")
-+    IF(BUILD_SHARED_LIBS)
-+        TARGET_INCLUDE_DIRECTORIES(hiredis_ssl PRIVATE "${OPENSSL_INCLUDE_DIR}")
-+        TARGET_LINK_LIBRARIES(hiredis_ssl PRIVATE ${OPENSSL_LIBRARIES})
-+    ENDIF()
- 
--    TARGET_LINK_LIBRARIES(hiredis_ssl PRIVATE ${OPENSSL_LIBRARIES})
-     IF (WIN32 OR MINGW)
-         TARGET_LINK_LIBRARIES(hiredis_ssl PRIVATE hiredis)
-         TARGET_LINK_LIBRARIES(hiredis_ssl_static PUBLIC hiredis_static)
-     ENDIF()
-     CONFIGURE_FILE(hiredis_ssl.pc.in hiredis_ssl.pc @ONLY)
- 
--    INSTALL(TARGETS hiredis_ssl hiredis_ssl_static
-+    INSTALL(TARGETS ${HIREDIS_SSL_TARGETS}
-         EXPORT hiredis_ssl-targets
-         RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-         LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-@@ -236,10 +262,10 @@ ENDIF()
- IF(NOT DISABLE_TESTS)
-     ENABLE_TESTING()
-     ADD_EXECUTABLE(hiredis-test test.c)
--    TARGET_LINK_LIBRARIES(hiredis-test hiredis)
-+    TARGET_LINK_LIBRARIES(hiredis-test ${HIREDIS_DEFAULT_LIBRARY})
-     IF(ENABLE_SSL_TESTS)
-         ADD_DEFINITIONS(-DHIREDIS_TEST_SSL=1)
--        TARGET_LINK_LIBRARIES(hiredis-test hiredis_ssl)
-+        TARGET_LINK_LIBRARIES(hiredis-test ${HIREDIS_SSL_DEFAULT_LIBRARY})
-     ENDIF()
-     IF(ENABLE_ASYNC_TESTS)
-         ADD_DEFINITIONS(-DHIREDIS_TEST_ASYNC=1)
--- 
-2.35.1
-
diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index cdcbef1525..16ee442d93 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  fe6d21741ec7f3fc9df409d921f47dfc73a4d8ff64f4ac6f1d95f951bf7f53d6  hiredis-1.1.0.tar.gz
+sha256  82ad632d31ee05da13b537c124f819eb88e18851d9cb0c30ae0552084811588c  hiredis-1.2.0.tar.gz
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  COPYING
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index a2f7627b58..a7a6d639e6 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIREDIS_VERSION_MAJOR = 1.1
+HIREDIS_VERSION_MAJOR = 1.2
 HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
