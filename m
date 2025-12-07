Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4AAD4337F
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3ED181749;
	Fri, 12 Dec 2025 07:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-KgXy4l8fYK; Fri, 12 Dec 2025 07:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0551F843B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526348;
	bh=brukfsEo6uTU1TQpBaWe6CWFeOzQN3BTjA+0/wcOZeY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QKZocZy6lo2BQc3CVt9iYFvHC662K3f4osBwUej3xtQ2zsyHZeToAur+G771dNKCt
	 Em9RdE4l33VoJrdAk/u++d3fahY2fRpoO9h1ttiX/r4ErAW8RK4kDNq3rBNcepLqJA
	 PrHKgF4FjlITSZnTd7vXmtP6R9d31VTNj4Pa5UZ3FdPCBxTnHJbjH/05Im25r3YlUc
	 6FrDWeX2LXl2VTLBHSk1V4Em8QLdu1irwblcv07Fc/FZgQQWAPeNd5WQh67OrR1ak1
	 3hZM6dk0bGae1LWOccREGQKGUcHSllXLsk9RagiiaIiOkK7Jvx1oOdBfBq3NMAmyU5
	 fSyVlpYIMfAzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0551F843B2;
	Fri, 12 Dec 2025 07:59:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFC932C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D9944117A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQ_eG7CaXSqi for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4381A4117E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4381A4117E
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41697807F9; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1c899820e4afdb74153e13f797764f8091ed723
X-Git-Newrev: d4bb95b86e593ab13bc67d376b2931f0ac498e10
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.41697807F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wampcc: fix cmake 4 compatibility
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d4bb95b86e593ab13bc67d376b2931f0ac498e10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0004-Make-compatible-with-CMake-3.8.1.patch    | 35 +++++++++++
 .../0005-Build-Debian-packages-using-CPack.patch   | 69 ++++++++++++++++++++++
 ...-CMake-policy-to-set-MSVC-runtime-options.patch | 38 ++++++++++++
 3 files changed, 142 insertions(+)

diff --git a/package/wampcc/0004-Make-compatible-with-CMake-3.8.1.patch b/package/wampcc/0004-Make-compatible-with-CMake-3.8.1.patch
new file mode 100644
index 0000000000..69e656a3a6
--- /dev/null
+++ b/package/wampcc/0004-Make-compatible-with-CMake-3.8.1.patch
@@ -0,0 +1,35 @@
+From 95cbe3bb3e7cfa32b96356edbd3ce7a8a3bb9018 Mon Sep 17 00:00:00 2001
+From: GHANNADZADEH Saman <saman.ghannadzadeh@oxinst.com>
+Date: Mon, 4 Mar 2019 16:21:40 +0000
+Subject: [PATCH] Make compatible with CMake 3.8.1
+
+This ups the minimum CMake version, and declares th package version in
+the `project(...)` command to be compatible with CMake policy CMP0047.
+
+Upstream: https://github.com/darrenjs/wampcc/commit/95cbe3bb3e7cfa32b96356edbd3ce7a8a3bb9018
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5ae1a370..251e0caa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,11 +1,11 @@
+-cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)
+ 
+-project(wampcc)
+-
+-# Version number
+ set (WAMPCC_VERSION_MAJOR 1)
+ set (WAMPCC_VERSION_MINOR 6)
+ set (WAMPCC_VERSION "${WAMPCC_VERSION_MAJOR}.${WAMPCC_VERSION_MINOR}")
++project(wampcc VERSION ${WAMPCC_VERSION})
++
++# Version number
+ # Include extra cmake modules
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")
+ 
diff --git a/package/wampcc/0005-Build-Debian-packages-using-CPack.patch b/package/wampcc/0005-Build-Debian-packages-using-CPack.patch
new file mode 100644
index 0000000000..6984b47e57
--- /dev/null
+++ b/package/wampcc/0005-Build-Debian-packages-using-CPack.patch
@@ -0,0 +1,69 @@
+From 36ef37248c1608a366846d17d60fec217e515377 Mon Sep 17 00:00:00 2001
+From: GHANNADZADEH Saman <saman.ghannadzadeh@oxinst.com>
+Date: Mon, 4 Mar 2019 16:28:36 +0000
+Subject: [PATCH] Build Debian packages using CPack
+
+Upstream: https://github.com/darrenjs/wampcc/commit/36ef37248c1608a366846d17d60fec217e515377
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt              |  5 ++++-
+ cmake/MakeDebPackages.cmake | 26 ++++++++++++++++++++++++++
+ 2 files changed, 30 insertions(+), 1 deletion(-)
+ create mode 100644 cmake/MakeDebPackages.cmake
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0a8b528d..a9fb364c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,7 @@ project(wampcc VERSION ${WAMPCC_VERSION})
+ 
+ # Version number
+ # Include extra cmake modules
+-set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")
++set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake")
+ 
+ 
+ ##
+@@ -37,6 +37,9 @@ set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH  "Installation dire
+ set(INSTALL_INC_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "Installation directory for headers")
+ set(INSTALL_PKGCONFIG_DIR "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" CACHE PATH "Installation directory for pkgconfig (.pc) files")
+ 
++# Allow settin of RPATH for install
++SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
++
+ ##
+ ## Platform checks, and generate config.h
+ ##
+diff --git a/cmake/MakeDebPackages.cmake b/cmake/MakeDebPackages.cmake
+new file mode 100644
+index 00000000..66ecb336
+--- /dev/null
++++ b/cmake/MakeDebPackages.cmake
+@@ -0,0 +1,26 @@
++set(CPACK_PACKAGE_VENDOR "Darren Smith")
++SET(CPACK_PACKAGE_CONTACT "Darren Smith")
++
++set(CPACK_PACKAGING_INSTALL_PREFIX "/usr/lib")
++
++SET(CPACK_GENERATOR "DEB")
++SET(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
++set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
++set(CPACK_DEBIAN_PACKAGE_GENERATE_SHLIBS ON)
++
++set(CPACK_DEB_COMPONENT_INSTALL ON)
++set(CPACK_DEBIAN_ENABLE_COMPONENT_DEPENDS YES)
++
++set(CPACK_COMPONENTS_ALL lib dev)
++set(CPACK_COMPONENT_DEV_DEPENDS lib)
++
++set(CPACK_DEBIAN_LIB_PACKAGE_NAME libwampcc)
++set(CPACK_DEBIAN_DEV_PACKAGE_NAME libwampcc-dev)
++
++if(BUILD_UTILS)
++  list(APPEND CPACK_COMPONENTS_ALL util)
++  set(CPACK_COMPONENT_UTIL_DEPENDS lib)
++  set(CPACK_DEBIAN_UTIL_PACKAGE_NAME wampcc-utils)
++endif()
++
++include(CPack)
diff --git a/package/wampcc/0006-Use-CMake-policy-to-set-MSVC-runtime-options.patch b/package/wampcc/0006-Use-CMake-policy-to-set-MSVC-runtime-options.patch
new file mode 100644
index 0000000000..5fedd90ad2
--- /dev/null
+++ b/package/wampcc/0006-Use-CMake-policy-to-set-MSVC-runtime-options.patch
@@ -0,0 +1,38 @@
+From 047f8742e721db4d0e91bb6313ec668900975de3 Mon Sep 17 00:00:00 2001
+From: Saman Ghannadzadeh <saman@saman-gh.co.uk>
+Date: Fri, 8 Sep 2023 15:09:23 +0100
+Subject: [PATCH] Use CMake policy to set MSVC runtime options
+
+Currently, we manually set the MSVC flags to set the runtime to be
+static or dynamic. This commit switches to letting CMake automatically do this,
+instead of us manually setting flags.
+
+This should make the CMake recipe more robust.
+
+Upstream: https://github.com/darrenjs/wampcc/commit/047f8742e721db4d0e91bb6313ec668900975de3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported for 1.6]
+---
+ CMakeLists.txt | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7c261cb..28e1965 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,10 +1,13 @@
+-cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.15.0 FATAL_ERROR)
+ 
+ set (WAMPCC_VERSION_MAJOR 1)
+ set (WAMPCC_VERSION_MINOR 6)
+ set (WAMPCC_VERSION "${WAMPCC_VERSION_MAJOR}.${WAMPCC_VERSION_MINOR}")
+ project(wampcc VERSION ${WAMPCC_VERSION})
+ 
++# Allows for setting MSVC static runtime
++cmake_policy(SET CMP0091 NEW)
++
+ # Version number
+ # Include extra cmake modules
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
