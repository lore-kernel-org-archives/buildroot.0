Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07BAE9D3F7
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B321882572;
	Wed,  4 Feb 2026 15:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uA0JyftzCiif; Wed,  4 Feb 2026 15:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94C2883DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770217273;
	bh=trMx4UOK9vygK7KOzGg6pzPcYs9yppf8gOqitGzAeRk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H8qc5pvqSA9p11PpO7z7HCjNKEU0W1jxra5xlFPhsnobb/BInn3lkSIgllvO4E9f5
	 U8ez7UQlWx1WoHDTbnBWq4wi+d4jcfNNe4/ad/8H+7zJVXz+rqOUF0oSxaVc0ekyZ4
	 htv/4tfaGc1KK0dEzn2mynvaciA63JpN33S9USaxt6X3dwO57M/aI+4sYPm4lIqWYu
	 Q6y9xfwU/KGII3bZl0+jsR9op4QlCtTPeI9nv7WxWK3Fwakeck6u1TMsQhPV8QUU1R
	 CHVqCapb+oAgxYrE+WTbtINivAkf9LbIPYJsQo9jp3n1ri5ibKGj7SsIXYe/BZhhX/
	 CwXbbx+2Ux5FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94C2883DBB;
	Wed,  4 Feb 2026 15:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7558C173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58CD860DA8
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZ3Pgo66BzBT for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F08E60DA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F08E60DA2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AB978691B; Wed,  4 Feb 2026 15:01:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 15:42:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3abf16c8ef7cf7b2493b3ddfc66ec132c42493b
X-Git-Newrev: e57c73bd5a67fa62fea7d9219a1ba751571f1756
X-Patchwork-Hint: ignore
Message-Id: <20260204150108.1AB978691B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cjson: add a patch to allow
 cross-compilation with sysroot.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e57c73bd5a67fa62fea7d9219a1ba751571f1756
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The current generated cJSONConfig.cmake holds hard coded path of libraries and makes it impossible to use in SDKs.
Use CMakePackageConfigHelpers and @PACKAGE_INIT@ to make them suit for real environment dynamically.

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ageConfigHelpers-to-generate-config.cmake.patch | 191 +++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/package/cjson/0001-Use-CMakePackageConfigHelpers-to-generate-config.cmake.patch b/package/cjson/0001-Use-CMakePackageConfigHelpers-to-generate-config.cmake.patch
new file mode 100644
index 0000000000..04248afbd9
--- /dev/null
+++ b/package/cjson/0001-Use-CMakePackageConfigHelpers-to-generate-config.cmake.patch
@@ -0,0 +1,191 @@
+From 2b0a994b5832439cf704147c5b485b9a4c7fbc24 Mon Sep 17 00:00:00 2001
+From: Charles Chan <charles@zeerd.com>
+Date: Fri, 22 Dec 2023 11:14:36 +0800
+Subject: [PATCH] Use CMakePackageConfigHelpers to generate config.cmake
+Signed-off-by: Charles Chan <charles@zeerd.com>
+Upstream: https://github.com/DaveGamble/cJSON/pull/812/commits/2b0a994b5832439cf704147c5b485b9a4c7fbc24
+
+---
+ CMakeLists.txt                                | 72 ++++++++++---------
+ .../{cJSONConfig.cmake.in => Config.cmake.in} | 15 ++--
+ library_config/cJSONConfigVersion.cmake.in    | 11 ---
+ 3 files changed, 48 insertions(+), 50 deletions(-)
+ rename library_config/{cJSONConfig.cmake.in => Config.cmake.in} (57%)
+ delete mode 100644 library_config/cJSONConfigVersion.cmake.in
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f23ec631..fe10d6fe 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -142,25 +142,25 @@ endif()
+ configure_file("${CMAKE_CURRENT_SOURCE_DIR}/library_config/libcjson.pc.in"
+     "${CMAKE_CURRENT_BINARY_DIR}/libcjson.pc" @ONLY)
+ 
+-install(FILES cJSON.h DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}/cjson")
+-install (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcjson.pc" DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}/pkgconfig")
++install(FILES cJSON.h DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/cjson")
++install (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcjson.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+ install(TARGETS "${CJSON_LIB}"
+-    EXPORT "${CJSON_LIB}"
+-    ARCHIVE DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-    LIBRARY DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-    RUNTIME DESTINATION "${CMAKE_INSTALL_FULL_BINDIR}"
+-    INCLUDES DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}"
++    EXPORT "${CJSON_LIB}-targets"
++    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
++    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+ )
+ if (BUILD_SHARED_AND_STATIC_LIBS)
+     install(TARGETS "${CJSON_LIB}-static"
+-    EXPORT "${CJSON_LIB}" 
+-    ARCHIVE DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-    INCLUDES DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}"
++    EXPORT "${CJSON_LIB}-targets"
++    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+ )
+ endif()
+ if(ENABLE_TARGET_EXPORT)
+     # export library information for CMake projects
+-    install(EXPORT "${CJSON_LIB}" DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}/cmake/cJSON")
++    install(EXPORT "${CJSON_LIB}-targets" DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cJSON")
+ endif()
+ 
+ if(ENABLE_CJSON_VERSION_SO)
+@@ -194,24 +194,24 @@ if(ENABLE_CJSON_UTILS)
+         "${CMAKE_CURRENT_BINARY_DIR}/libcjson_utils.pc" @ONLY)
+ 
+     install(TARGETS "${CJSON_UTILS_LIB}"
+-        EXPORT "${CJSON_UTILS_LIB}"
+-        ARCHIVE DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-        LIBRARY DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-        RUNTIME DESTINATION "${CMAKE_INSTALL_FULL_BINDIR}"
+-        INCLUDES DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}"
++        EXPORT "${CJSON_UTILS_LIB}-targets"
++        ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++        LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
++        INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+     )
+     if (BUILD_SHARED_AND_STATIC_LIBS)
+-        install(TARGETS "${CJSON_UTILS_LIB}-static" 
+-        EXPORT "${CJSON_UTILS_LIB}" 
+-        ARCHIVE DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-        INCLUDES DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}"
++        install(TARGETS "${CJSON_UTILS_LIB}-static"
++        EXPORT "${CJSON_UTILS_LIB}-targets"
++        ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++        INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+         )
+     endif()
+-    install(FILES cJSON_Utils.h DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}/cjson")
+-    install (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcjson_utils.pc" DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}/pkgconfig")
++    install(FILES cJSON_Utils.h DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/cjson")
++    install (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcjson_utils.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+     if(ENABLE_TARGET_EXPORT)
+-      # export library information for CMake projects
+-      install(EXPORT "${CJSON_UTILS_LIB}" DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}/cmake/cJSON")
++        # export library information for CMake projects
++        install(EXPORT "${CJSON_UTILS_LIB}-targets" DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cJSON")
+     endif()
+ 
+     if(ENABLE_CJSON_VERSION_SO)
+@@ -223,18 +223,22 @@ if(ENABLE_CJSON_UTILS)
+ endif()
+ 
+ # create the other package config files
+-configure_file(
+-    "${CMAKE_CURRENT_SOURCE_DIR}/library_config/cJSONConfig.cmake.in"
+-    ${PROJECT_BINARY_DIR}/cJSONConfig.cmake @ONLY)
+-configure_file(
+-    "${CMAKE_CURRENT_SOURCE_DIR}/library_config/cJSONConfigVersion.cmake.in"
+-    ${PROJECT_BINARY_DIR}/cJSONConfigVersion.cmake @ONLY)
+-
+ if(ENABLE_TARGET_EXPORT)
+-    # Install package config files
+-    install(FILES ${PROJECT_BINARY_DIR}/cJSONConfig.cmake
++    include(CMakePackageConfigHelpers)
++    write_basic_package_version_file(
+         ${PROJECT_BINARY_DIR}/cJSONConfigVersion.cmake
+-        DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}/cmake/cJSON")
++        VERSION ${NCHL_VERSION}
++        COMPATIBILITY AnyNewerVersion)
++
++    configure_package_config_file(
++        "${PROJECT_SOURCE_DIR}/library_config/Config.cmake.in"
++        "${PROJECT_BINARY_DIR}/cJSONConfig.cmake"
++        INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cJSON"
++        )
++    install(FILES
++            ${PROJECT_BINARY_DIR}/cJSONConfigVersion.cmake
++            ${PROJECT_BINARY_DIR}/cJSONConfig.cmake
++        DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cJSON")
+ endif()
+ 
+ option(ENABLE_CJSON_TEST "Enable building cJSON test" ON)
+diff --git a/library_config/cJSONConfig.cmake.in b/library_config/Config.cmake.in
+similarity index 57%
+rename from library_config/cJSONConfig.cmake.in
+rename to library_config/Config.cmake.in
+index 909f7a9a..2784b7ab 100644
+--- a/library_config/cJSONConfig.cmake.in
++++ b/library_config/Config.cmake.in
+@@ -1,9 +1,12 @@
++@PACKAGE_INIT@
++include(CMakeFindDependencyMacro)
++
+ # Whether the utils lib was build.
+ set(CJSON_UTILS_FOUND @ENABLE_CJSON_UTILS@)
+ 
+ # The include directories used by cJSON
+-set(CJSON_INCLUDE_DIRS "@CMAKE_INSTALL_FULL_INCLUDEDIR@")
+-set(CJSON_INCLUDE_DIR "@CMAKE_INSTALL_FULL_INCLUDEDIR@")
++set(CJSON_INCLUDE_DIRS "${PACKAGE_PREFIX_DIR}/@CMAKE_INSTALL_INCLUDEDIR@")
++set(CJSON_INCLUDE_DIR "${PACKAGE_PREFIX_DIR}/@CMAKE_INSTALL_INCLUDEDIR@")
+ 
+ get_filename_component(_dir "${CMAKE_CURRENT_LIST_FILE}" PATH)
+ 
+@@ -11,19 +14,21 @@ get_filename_component(_dir "${CMAKE_CURRENT_LIST_FILE}" PATH)
+ set(CJSON_LIBRARY "@CJSON_LIB@")
+ if(@ENABLE_TARGET_EXPORT@)
+   # Include the target
+-  include("${_dir}/cjson.cmake")
++    include("${CMAKE_CURRENT_LIST_DIR}/cjson-targets.cmake")
+ endif()
+ 
+ if(CJSON_UTILS_FOUND)
+   # The cJSON utils library
+-  set(CJSON_UTILS_LIBRARY @CJSON_UTILS_LIB@)
++  set(CJSON_UTILS_LIBRARY "@CJSON_UTILS_LIB@")
+   # All cJSON libraries
+   set(CJSON_LIBRARIES "@CJSON_UTILS_LIB@" "@CJSON_LIB@")
+   if(@ENABLE_TARGET_EXPORT@)
+     # Include the target
+-    include("${_dir}/cjson_utils.cmake")
++    include("${CMAKE_CURRENT_LIST_DIR}/cjson_utils-targets.cmake")
+   endif()
+ else()
+   # All cJSON libraries
+   set(CJSON_LIBRARIES "@CJSON_LIB@")
+ endif()
++
++check_required_components("@CMAKE_PROJECT_NAME@")
+diff --git a/library_config/cJSONConfigVersion.cmake.in b/library_config/cJSONConfigVersion.cmake.in
+deleted file mode 100644
+index 22ffec0f..00000000
+--- a/library_config/cJSONConfigVersion.cmake.in
++++ /dev/null
+@@ -1,11 +0,0 @@
+-set(PACKAGE_VERSION "@PROJECT_VERSION@")
+-
+-# Check whether the requested PACKAGE_FIND_VERSION is compatible
+-if("${PACKAGE_VERSION}" VERSION_LESS "${PACKAGE_FIND_VERSION}")
+-  set(PACKAGE_VERSION_COMPATIBLE FALSE)
+-else()
+-  set(PACKAGE_VERSION_COMPATIBLE TRUE)
+-  if ("${PACKAGE_VERSION}" VERSION_EQUAL "${PACKAGE_FIND_VERSION}")
+-    set(PACKAGE_VERSION_EXACT TRUE)
+-  endif()
+-endif()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
