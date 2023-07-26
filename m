Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0EBC001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D90A040BC2;
	Wed, 26 Jul 2023 21:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D90A040BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whWKyL6mlIEb; Wed, 26 Jul 2023 21:19:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D373640A59;
	Wed, 26 Jul 2023 21:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D373640A59
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B28701BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C89540A59
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C89540A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cifc_8JelXSI for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:19:12 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54A3C40609
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54A3C40609
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 860A9A4C077A;
 Wed, 26 Jul 2023 23:19:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47896)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOluY-0000Fz-0d;
 Wed, 26 Jul 2023 23:19:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 23:19:08 +0200
Message-Id: <20230726211910.2206515-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690406350;
 bh=Q6QxqN/ehitszwWhVyS8TjA6FveL+mPmuO6zOw5If4I=;
 h=From:To:Cc:Subject:Date:From;
 b=BNRSUiILsKwZt6Bp8yZz52bRPny750kH6QAeXecOnxMpH2D/VaAQJjM9QiEp+XavF
 s1KXvtA/PDdaD88SwOObuPXWbRKLjW1gWjo7fSDKaWNwxnF+MlWGmL11yDAUQ/1gMh
 JUk+Cj95NRPZyB1NiJoVrE4TB/YHLzqq8a5wDfv7mU1ozxyTHtlZZXy2ZalIcEbPD4
 3l8cr7fhpDBYsdxTF7DJja34waxTvgc+mUI0XQ/Sybzlq27P4XnBUABbFVaqFe+s3B
 rrzgzRPj9ORPvbXJF3KrNaOl17wftyxUsGULnBQPuukCkf8dMcFfVsRLKxhXj2snmS
 PvFaGgPfox/wA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=BNRSUiIL
Subject: [Buildroot] [PATCH v2 1/3] package/hiredis: bump version to 1.2.0
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
Cc: Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release.

Changelog: https://github.com/redis/hiredis/blob/master/CHANGELOG.md

This release includes improvements for static-only builds:
https://github.com/redis/hiredis/pull/1160

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 .checkpackageignore                           |   1 -
 ...eLists.txt-respect-BUILD_SHARED_LIBS.patch | 171 ------------------
 package/hiredis/hiredis.hash                  |   2 +-
 package/hiredis/hiredis.mk                    |   2 +-
 4 files changed, 2 insertions(+), 174 deletions(-)
 delete mode 100644 package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 8d76e0b9d5..76d67007e8 100644
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
