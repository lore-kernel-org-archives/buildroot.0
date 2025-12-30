Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1990EE95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E756F4060B;
	Tue, 30 Dec 2025 11:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsUKPiSoDc9O; Tue, 30 Dec 2025 11:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09FF4407FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767093295;
	bh=Z52HzcyzczmB8bZnbSRNtoz3ljLAeHOMQ/7Q9bS8WnA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n6EOBIprpzZ24EdcpfVTyXgsMAHpGoZQNmrj4ZFsr9vqUJnjI24iafg0Y+j/eZBhV
	 P06THEG3R9L4JwC6BYH1uxcop0JeJheG5kmkeumisKbvWUwg65dy47xC5ecubW7IZl
	 dJvApG51ufODdZfXXmWzQTW4g0JPXUTQ3DwLIfi0/trkLe1m+yMdrkbw/6QSUiPIxy
	 ksdH+407qqqaPh+vmiBP36H405oI8eoQ+jN/YcW+UmWUwZ4GePjGi7ftK68AHdZ52S
	 M2WkGt3rcL+/uSUR58pUHzIO3nUUKqNvPCz/zTYWt3NjQ6RKMQsx+uMXDuRt3UlogO
	 0EhE8gd+kcC9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09FF4407FA;
	Tue, 30 Dec 2025 11:14:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 170EB177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 078D68097E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id clEgkb4TsDhT for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12A6F809A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12A6F809A7
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11C0A86324; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 12:01:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9211ff06dfdb9bd1fdd74b5786bf75885a6da6ab
X-Git-Newrev: fbbaf33179313b5ec2de2b03b81b638a98c7c7a9
X-Patchwork-Hint: ignore
Message-Id: <20251230111445.11C0A86324@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiqrf: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbbaf33179313b5ec2de2b03b81b638a98c7c7a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fails to build with cmake 4.

The package is a library without any reverse dependencies and no active
development since 2013.

Fixes:
https://autobuild.buildroot.net/results/cb5/cb50e158446e83249fc54e54e5a63ccf36e3be96/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  2 -
 Config.in.legacy                                   |  6 +++
 package/Config.in                                  |  1 -
 ...e-static-library-and-find-required-thread.patch | 45 ----------------------
 package/libiqrf/0002-use-only-c-language.patch     | 29 --------------
 package/libiqrf/Config.in                          | 16 --------
 package/libiqrf/libiqrf.hash                       |  3 --
 package/libiqrf/libiqrf.mk                         | 14 -------
 8 files changed, 6 insertions(+), 110 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c4bc3e5c02..b1d350bc52 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -547,8 +547,6 @@ package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch l
 package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch lib_patch.Upstream
 package/libhdhomerun/0001-dont-strip.patch lib_patch.Upstream
-package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch lib_patch.Upstream
-package/libiqrf/0002-use-only-c-language.patch lib_patch.Upstream
 package/libjson/0001-fix-broken-makefile.patch lib_patch.Upstream
 package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch lib_patch.Upstream
 package/liblinear/0001-build-static-lib.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 3ce540561f..5987e9777c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBIQRF
+	bool "libiqrf has been removed"
+	select BR2_LEGACY
+	help
+	  libiqrf is unmaintained and has been removed
+
 config BR2_PACKAGE_LIBCGI
 	bool "libcgi has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 58905f4759..22b6b7fab4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1836,7 +1836,6 @@ menu "Hardware handling"
 	source "package/libgudev/Config.in"
 	source "package/libiio/Config.in"
 	source "package/libinput/Config.in"
-	source "package/libiqrf/Config.in"
 	source "package/libllcp/Config.in"
 	source "package/libmbim/Config.in"
 	source "package/libnfc/Config.in"
diff --git a/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch b/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
deleted file mode 100644
index 7f460c131e..0000000000
--- a/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 46660112b76664473cc98b8ae6c863fd27c27d2d Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Fri, 29 Aug 2014 23:40:59 +0200
-Subject: [PATCH] cmake: handle static library and find required thread
- module
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- CMakeLists.txt     | 2 ++
- src/CMakeLists.txt | 4 +++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 79f644c..7779a2a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -6,7 +6,9 @@ enable_testing()
- # use local module (for Findlibusb-1.0.cmake)
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")
- 
-+find_package(Threads REQUIRED)
- find_package(libusb-1.0 REQUIRED)
-+
- if (NOT LIBUSB_1_FOUND)
- 	message(FATAL_ERROR "libusb-1.0 not installed. (try apt-get install libusb-1.0-0-dev)")
- endif (NOT LIBUSB_1_FOUND)
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 149d198..0597ccd 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -18,8 +18,10 @@ set (iqrf_sources
- 
- include_directories ("${LIBUSB_1_INCLUDE_DIRS}")
- 
--add_library(iqrf SHARED ${iqrf_sources} ${iqrf_headers})
-+add_library(iqrf ${iqrf_sources} ${iqrf_headers})
-+
- target_link_libraries(iqrf ${LIBUSB_1_LIBRARIES})
-+target_link_libraries(iqrf ${CMAKE_THREAD_LIBS_INIT})
- 
- set_target_properties(iqrf PROPERTIES
- 	VERSION "${iqrf_version_major}.${iqrf_version_minor}"
--- 
-2.1.0
-
diff --git a/package/libiqrf/0002-use-only-c-language.patch b/package/libiqrf/0002-use-only-c-language.patch
deleted file mode 100644
index 2f1c23c28b..0000000000
--- a/package/libiqrf/0002-use-only-c-language.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Use only the C language
-
-libirqf is written completely in C, but by default, CMake assumes that
-both C and C++ are used, and therefore verifies that a C++ compiler is
-installed. This may not necessarily be the case for a C-only package
-in Buildroot.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/CMakeLists.txt
-===================================================================
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -1,5 +1,3 @@
--project(iqrf)
--
- set (iqrf_version_major 0)
- set (iqrf_version_minor 1)
- set (iqrf_version_patch 2)
-Index: b/CMakeLists.txt
-===================================================================
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,3 +1,5 @@
-+project(iqrf C)
-+
- cmake_minimum_required(VERSION 2.8.1)
- enable_testing()
- 
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
deleted file mode 100644
index d86a7fd0ec..0000000000
--- a/package/libiqrf/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_LIBIQRF
-	bool "libiqrf"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	select BR2_PACKAGE_LIBUSB
-	help
-	  This library implement specific protocol
-	  which is used for communicating with iqrf devices
-	  (http://iqrf.org) over usb. For usb access is used
-	  libusb library.
-
-	  https://github.com/nandra/libiqrf
-
-comment "libiqrf needs a toolchain w/ threads, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libiqrf/libiqrf.hash b/package/libiqrf/libiqrf.hash
deleted file mode 100644
index df749def17..0000000000
--- a/package/libiqrf/libiqrf.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  8111031dd9dd6093a1927eb32dd7476fe22cfee9190043aa8e4c88003c104b16  libiqrf-0.1.2.tar.gz
-sha256  11e0700d7c23604d86fa1e7c54c7caa778d79eeb0035be8f80b5a552224ef015  src/iqrf.c
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
deleted file mode 100644
index 3f4e3e8498..0000000000
--- a/package/libiqrf/libiqrf.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# libiqrf
-#
-################################################################################
-
-LIBIQRF_VERSION = 0.1.2
-LIBIQRF_SITE = $(call github,nandra,libiqrf,v$(LIBIQRF_VERSION))
-LIBIQRF_INSTALL_STAGING = YES
-LIBIQRF_DEPENDENCIES = libusb
-LIBIQRF_LICENSE = LGPL-2.1+
-LIBIQRF_LICENSE_FILES = src/iqrf.c
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
