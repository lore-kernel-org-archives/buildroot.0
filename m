Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884F6C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F02460E6F;
	Tue,  1 Nov 2022 22:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F02460E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Evck6dULIehJ; Tue,  1 Nov 2022 22:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F9C60E2F;
	Tue,  1 Nov 2022 22:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F9C60E2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4E81BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 775B5401CA
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 775B5401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Rs8a723kvL6 for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:23:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2C0C40193
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C0C40193
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEC4287515; Tue,  1 Nov 2022 22:23:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 23:23:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d6ae054196aa19c235d180e8168c21fe05aca47
X-Git-Newrev: bf83252de4dc901bde36cafdbb4038447f7cb7c3
X-Patchwork-Hint: ignore
Message-Id: <20221101222354.DEC4287515@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flann: bump to version 1.9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf83252de4dc901bde36cafdbb4038447f7cb7c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- lz4 is a mandatory dependency since
  https://github.com/flann-lib/flann/commit/df3fc59212660e43867cb85d5e557f5cae6d30d7
- Drop patch (not needed since
  https://github.com/flann-lib/flann/commit/86c92adbdea3e41d7ad371732cfe3b8231e0ecc6)
- PYTHON_EXECUTABLE can be dropped since
  https://github.com/flann-lib/flann/commit/5f4ac506323585c1f74ef57a73962beb887e3a3b

https://github.com/flann-lib/flann/blob/1.9.2/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../flann/0001-src-cpp-fix-cmake-3.11-build.patch  | 80 ----------------------
 package/flann/Config.in                            |  1 +
 package/flann/flann.hash                           |  2 +-
 package/flann/flann.mk                             |  4 +-
 4 files changed, 4 insertions(+), 83 deletions(-)

diff --git a/package/flann/0001-src-cpp-fix-cmake-3.11-build.patch b/package/flann/0001-src-cpp-fix-cmake-3.11-build.patch
deleted file mode 100644
index b37bedcf6d..0000000000
--- a/package/flann/0001-src-cpp-fix-cmake-3.11-build.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From fa5ec96a94646492a3f908e12905b3e48a8e800b Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 18 Apr 2018 20:24:13 +0200
-Subject: [PATCH] src/cpp: fix cmake >= 3.11 build
-
-CMake < 3.11 doesn't support add_library() without any source file
-(i.e add_library(foo SHARED)). But flann CMake use a trick that use
-an empty string "" as source list (i.e add_library(foo SHARED "")).
-This look like a bug in CMake < 3.11.
-
-With CMake >= 3.11, the new behaviour of add_library() break the
-existing flann CMake code.
-
-From CMake Changelog [1]:
-"add_library() and add_executable() commands can now be called without
- any sources and will not complain as long as sources are added later
- via the target_sources() command."
-
-Note: flann CMake code doesn't use target_sources() since no source file
-are provided intentionally since the flann shared library is created by
-linking with the flann_cpp_s static library with this line:
-
-target_link_libraries(flann_cpp -Wl,-whole-archive flann_cpp_s -Wl,-no-whole-archive)
-
-If you try to use "add_library(flann_cpp SHARED ${CPP_SOURCES})" (as it should
-be normally done), the link fail due to already defined symbol.
-
-They are building the shared version using the static library "to speedup the
-build time" [3]
-
-This issue is already reported upstream [2] with a proposed solution.
-
-Upstream status: Pending
-
-Fixes:
-http://autobuild.buildroot.net/results/b2f/b2febfaf8c44ce477b3e4a5b9b976fd25e8d7454
-
-[1] https://cmake.org/cmake/help/v3.11/release/3.11.html
-[2] https://github.com/mariusmuja/flann/issues/369
-[3] https://github.com/mariusmuja/flann/commit/0fd62b43be2fbb0b8d791ee36290791224dc030c
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/cpp/CMakeLists.txt | 4 ++--
- src/cpp/empty.cpp      | 1 +
- 2 files changed, 3 insertions(+), 2 deletions(-)
- create mode 100644 src/cpp/empty.cpp
-
-diff --git a/src/cpp/CMakeLists.txt b/src/cpp/CMakeLists.txt
-index b44a735..a816863 100644
---- a/src/cpp/CMakeLists.txt
-+++ b/src/cpp/CMakeLists.txt
-@@ -29,7 +29,7 @@ if (BUILD_CUDA_LIB)
- endif()
- 
- if(CMAKE_SYSTEM_NAME STREQUAL "Linux" AND CMAKE_COMPILER_IS_GNUCC)
--    add_library(flann_cpp SHARED "")
-+    add_library(flann_cpp SHARED "empty.cpp")
-     set_target_properties(flann_cpp PROPERTIES LINKER_LANGUAGE CXX)
-     target_link_libraries(flann_cpp -Wl,-whole-archive flann_cpp_s -Wl,-no-whole-archive)
- 
-@@ -85,7 +85,7 @@ if (BUILD_C_BINDINGS)
-     set_property(TARGET flann_s PROPERTY COMPILE_DEFINITIONS FLANN_STATIC)
- 
-     if(CMAKE_SYSTEM_NAME STREQUAL "Linux" AND CMAKE_COMPILER_IS_GNUCC)
--        add_library(flann SHARED "")
-+        add_library(flann SHARED "empty.cpp")
-         set_target_properties(flann PROPERTIES LINKER_LANGUAGE CXX)
-         target_link_libraries(flann -Wl,-whole-archive flann_s -Wl,-no-whole-archive)
-     else()
-diff --git a/src/cpp/empty.cpp b/src/cpp/empty.cpp
-new file mode 100644
-index 0000000..40a8c17
---- /dev/null
-+++ b/src/cpp/empty.cpp
-@@ -0,0 +1 @@
-+/* empty */
--- 
-2.14.3
-
diff --git a/package/flann/Config.in b/package/flann/Config.in
index 3725fc784f..180d7eae8a 100644
--- a/package/flann/Config.in
+++ b/package/flann/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FLANN
 	bool "flann"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LZ4
 	help
 	  FLANN is a library for performing fast approximate nearest
 	  neighbor searches in high dimensional spaces. It contains a
diff --git a/package/flann/flann.hash b/package/flann/flann.hash
index 543e4b483d..6eaa48c403 100644
--- a/package/flann/flann.hash
+++ b/package/flann/flann.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b23b5f4e71139faa3bcb39e6bbcc76967fbaf308c4ee9d4f5bfbeceaa76cc5d3  flann-1.9.1.tar.gz
+sha256  e26829bb0017f317d9cc45ab83ddcb8b16d75ada1ae07157006c1e7d601c8824  flann-1.9.2.tar.gz
 sha256  3993f339cc56506c62aa1eb2fb76f240ee93b738d857832899c1e207b1dc069a  COPYING
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index 6c2e6a9e78..d1a622e685 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-FLANN_VERSION = 1.9.1
+FLANN_VERSION = 1.9.2
 FLANN_SITE = $(call github,mariusmuja,flann,$(FLANN_VERSION))
 FLANN_INSTALL_STAGING = YES
 FLANN_LICENSE = BSD-3-Clause
 FLANN_LICENSE_FILES = COPYING
+FLANN_DEPENDENCIES = host-pkgconf lz4
 FLANN_CONF_OPTS = \
 	-DBUILD_C_BINDINGS=ON \
 	-DBUILD_PYTHON_BINDINGS=OFF \
 	-DBUILD_MATLAB_BINDINGS=OFF \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_FLANN_EXAMPLES),ON,OFF) \
 	-DUSE_OPENMP=$(if $(BR2_TOOLCHAIN_HAS_OPENMP),ON,OFF) \
-	-DPYTHON_EXECUTABLE=OFF \
 	-DCMAKE_DISABLE_FIND_PACKAGE_HDF5=TRUE
 
 FLANN_CXXFLAGS = $(TARGET_CXXFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
