Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DF3EE4998
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACBE60C2C;
	Tue, 30 Dec 2025 18:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aal_ggwdPIgX; Tue, 30 Dec 2025 18:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DBA760C21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118378;
	bh=aj7XAIxk+1x/i7w7YmOXtpUjge4azctnoD2cMmsHpzY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H7yzPRN3+i4np1c8TD+NepDQ+7eMsZAkJtkGtuBDRjdM/7sFxzyKI8p9KI8+BITqA
	 6/aGbQLMhJ50IDWxhNZ15+6IpdmOJDFkfxqnAvGobgiJ/fLbVk0k3dHANfQx4QOrxK
	 k8WhPTKSyYxbgIxQpg117AEZ7HW27/MNvtWACbQViVPrHGEFQ8D45xtO8mVGCxqYWD
	 xYcGWRvztATDuS+d266fmx/BF4MscMsM3WLCQwsPXqD1501iYMz9HReLzgewfclKl7
	 LSvcLRdg+MO+7skKUPq9tU74ZmPj7jD6edQErOkea1CLDhqFc+YsXH+4UvD8hW+s5p
	 +30evRYu2hrYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DBA760C21;
	Tue, 30 Dec 2025 18:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02DF1177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3557E403B8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQd03kKdWyhi for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E77C4062F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E77C4062F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D70887C3E; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28309d0a58ea2c898ee37fa3982c81c3fc380121
X-Git-Newrev: 1c9ae47194d1fa69b804793ba0921ff24eee7a20
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.6D70887C3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv3: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c9ae47194d1fa69b804793ba0921ff24eee7a20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV3 is unmaintained.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |   6 +
 package/Config.in                                  |   1 -
 ...set-minimum-required-CMake-version-to-3.5.patch |  41 ---
 package/opencv3/Config.in                          | 312 ------------------
 package/opencv3/opencv3.hash                       |   3 -
 package/opencv3/opencv3.mk                         | 354 ---------------------
 package/opencv4/Config.in                          |   1 -
 7 files changed, 6 insertions(+), 712 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1d8ed9698d..a1ec2033a2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_OPENCV3
+	bool "opencv3"
+	select BR2_LEGACY
+	help
+	  opencv3 is unmaintained and has been removed
+
 config BR2_PACKAGE_VLC_OPENCV3_BACKEND
 	bool "opencv3 support in vlc has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index c92a642dcb..77667a41a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1774,7 +1774,6 @@ menu "Graphics"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencl-headers/Config.in"
 	source "package/opencl-icd-loader/Config.in"
-	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
 	source "package/opengl/Config.in"
diff --git a/package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch b/package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch
deleted file mode 100644
index 46009de302..0000000000
--- a/package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 3b7311f48ef70127ddad7c7ea9c008fa6af3a9a1 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 25 Dec 2025 23:11:27 +0100
-Subject: [PATCH] cmake: set minimum required CMake version to 3.5
-
-This fixes build with CMake 4.
-
-Upstream: N/A, opencv 3.x is no longer maintained
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- cmake/OpenCVGenPkgconfig.cmake   | 2 +-
- cmake/OpenCVMinDepVersions.cmake | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
-index 425c0faa3b..9642a4b983 100644
---- a/cmake/OpenCVGenPkgconfig.cmake
-+++ b/cmake/OpenCVGenPkgconfig.cmake
-@@ -110,7 +110,7 @@ endif()
- # =============================================================================
- else() # DEFINED CMAKE_HELPER_SCRIPT
- 
--cmake_minimum_required(VERSION 2.8.12.2)
-+cmake_minimum_required(VERSION 3.5)
- cmake_policy(SET CMP0012 NEW)
- include("${CMAKE_HELPER_SCRIPT}")
- include("${OpenCV_SOURCE_DIR}/cmake/OpenCVUtils.cmake")
-diff --git a/cmake/OpenCVMinDepVersions.cmake b/cmake/OpenCVMinDepVersions.cmake
-index e67856bb97..eb7a6d861e 100644
---- a/cmake/OpenCVMinDepVersions.cmake
-+++ b/cmake/OpenCVMinDepVersions.cmake
-@@ -1,5 +1,5 @@
- if(NOT DEFINED MIN_VER_CMAKE)
--  set(MIN_VER_CMAKE 2.8.12.2)
-+  set(MIN_VER_CMAKE 3.5)
- endif()
- set(MIN_VER_CUDA 6.5)
- set(MIN_VER_PYTHON2 2.7)
--- 
-2.52.0
-
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
deleted file mode 100644
index ad8a075729..0000000000
--- a/package/opencv3/Config.in
+++ /dev/null
@@ -1,312 +0,0 @@
-menuconfig BR2_PACKAGE_OPENCV3
-	bool "opencv3"
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
-	depends on !BR2_STATIC_LIBS # include dlfcn.h
-	select BR2_PACKAGE_ZLIB
-	help
-	  OpenCV (Open Source Computer Vision) is a library of
-	  programming functions for real time computer vision.
-
-	  Note that the opencv_core module and the opencv_hal library
-	  are always built and installed, not matter which other
-	  modules are enabled below.
-
-	  http://opencv.org/
-
-if BR2_PACKAGE_OPENCV3
-
-comment "OpenCV modules"
-
-config BR2_PACKAGE_OPENCV3_LIB_CALIB3D
-	bool "calib3d"
-	select BR2_PACKAGE_OPENCV3_LIB_FEATURES2D
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	help
-	  Include opencv_calib3d (camera calibration and 3d
-	  reconstruction) module into the OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_FEATURES2D
-	bool "features2d"
-	select BR2_PACKAGE_OPENCV3_LIB_FLANN
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV3_LIB_ML
-	help
-	  Include opencv_features2d (2d features framework) module
-	  into the OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_FLANN
-	bool "flann"
-	# opencv_core dependency is already enabled
-	help
-	  Include opencv_flann (clustering and search in
-	  multi-dimensional spaces) module into the OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_HIGHGUI
-	bool "highgui"
-	select BR2_PACKAGE_OPENCV3_LIB_IMGCODECS
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV3_LIB_VIDEOIO
-	help
-	  Include opencv_highgui (high-level gui and media i/o) module
-	  into the OpenCV build.
-
-if BR2_PACKAGE_OPENCV3_LIB_HIGHGUI
-
-choice
-	prompt "gui toolkit"
-	help
-	  GUI toolkit to be used by the opencv_highgui module.
-
-config BR2_PACKAGE_OPENCV3_GUI_NONE
-	bool "none"
-
-config BR2_PACKAGE_OPENCV3_WITH_GTK3
-	bool "gtk3"
-	depends on BR2_PACKAGE_LIBGTK3
-
-comment "gtk3 support needs libgtk3"
-	depends on BR2_USE_MMU # libgtk3 -> glib2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_LIBGTK3
-
-config BR2_PACKAGE_OPENCV3_WITH_QT5
-	bool "qt5"
-	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_CONCURRENT
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_WIDGETS
-	help
-	  Use Qt5 with base, concurrent, test, gui and widgets
-	  components, as GUI toolkit.
-
-comment "qt5 support needs qt5"
-	depends on !BR2_PACKAGE_QT5
-
-endchoice
-
-config BR2_PACKAGE_OPENCV3_WITH_OPENGL
-	bool "opengl support"
-	# OpenGL support done using Qt5OpenGL, so depends on WITH_QT5
-	depends on BR2_PACKAGE_OPENCV3_WITH_QT5
-	# OpenGL support requires Qt5OpenGL with GL support, not GLES
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
-	depends on BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	help
-	  Enable OpenGL for UI.
-
-comment "opengl support needs an OpenGL provider"
-	depends on BR2_PACKAGE_OPENCV3_WITH_QT5
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || \
-		!BR2_PACKAGE_HAS_LIBGL
-
-endif # BR2_PACKAGE_OPENCV3_LIB_HIGHGUI
-
-config BR2_PACKAGE_OPENCV3_LIB_IMGCODECS
-	bool "imgcodecs"
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	help
-	  Include opencv_imgcodecs (image codecs) module into the
-	  OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	bool "imgproc"
-	# opencv_core dependency is already enabled
-	help
-	  Include opencv_imgproc (image processing) module into the
-	  OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_ML
-	bool "ml"
-	# opencv_core dependency is already enabled
-	help
-	  Include opencv_ml (machine learning) module into the OpenCV
-	  build.
-
-config BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
-	bool "objdetect"
-	# opencv_core dependency is already enabled
-	select BR2_PACKAGE_OPENCV3_LIB_CALIB3D
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV3_LIB_ML
-	help
-	  Include opencv_objdetect (object detection) module into the
-	  OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_PHOTO
-	bool "photo"
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	help
-	  Include opencv_photo (computational photography) module into
-	  the OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_PYTHON
-	bool "python"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
-	select BR2_PACKAGE_PYTHON_NUMPY
-	help
-	  Include opencv_python module into the OpenCV build.  No
-	  python example is installed.
-
-comment "python support needs a glibc or musl toolchain w/ gcc >= 9"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
-		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
-
-config BR2_PACKAGE_OPENCV3_LIB_SHAPE
-	bool "shape"
-	# opencv_core dependency is already enabled
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV3_LIB_VIDEO
-	help
-	  Include opencv_shape (shape descriptors and matchers) module
-	  into the OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_STITCHING
-	bool "stitching"
-	select BR2_PACKAGE_OPENCV3_LIB_CALIB3D
-	select BR2_PACKAGE_OPENCV3_LIB_FEATURES2D
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
-	help
-	  Include opencv_stitching (images stitching) module into the
-	  OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_SUPERRES
-	bool "superres"
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV3_LIB_VIDEO
-	help
-	  Include opencv_superres (super resolution) module into the
-	  OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_TS
-	bool "ts"
-	# opencv_core dependency is already enabled
-	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI
-	select BR2_PACKAGE_OPENCV3_LIB_IMGCODECS
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV3_LIB_VIDEOIO
-	help
-	  Include opencv_ts (test) module into the OpenCV build.
-
-config BR2_PACKAGE_OPENCV3_LIB_VIDEOIO
-	bool "videoio"
-	select BR2_PACKAGE_OPENCV3_LIB_IMGCODECS
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	help
-	  Include opencv_videoio (media i/o) module into the OpenCV
-	  build.
-
-config BR2_PACKAGE_OPENCV3_LIB_VIDEO
-	bool "video"
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	help
-	  Include opencv_video (video analysis) module into the OpenCV
-	  build.
-
-config BR2_PACKAGE_OPENCV3_LIB_VIDEOSTAB
-	bool "videostab"
-	select BR2_PACKAGE_OPENCV3_LIB_CALIB3D
-	select BR2_PACKAGE_OPENCV3_LIB_FEATURES2D
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV3_LIB_PHOTO
-	select BR2_PACKAGE_OPENCV3_LIB_VIDEO
-	help
-	  Include opencv_videostab (video stabilization) module into
-	  the OpenCV build.
-
-comment "Test sets"
-config BR2_PACKAGE_OPENCV3_BUILD_TESTS
-	bool "build tests"
-
-config BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS
-	bool "build performance tests"
-
-comment "3rd party support"
-
-config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1
-	bool "gstreamer-1.x"
-	depends on BR2_USE_MMU # gstreamer1 -> libglib2
-	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2
-	select BR2_PACKAGE_GSTREAMER1
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
-	help
-	  Enable gstreamer support.
-
-comment "gstreamer support needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_OPENCV3_WITH_JASPER
-	bool "jpeg2000 support"
-	select BR2_PACKAGE_JASPER
-	help
-	  Enable jpeg2000 support.
-
-	  Note: this does not use the libjasper bundled with opencv,
-	  but uses the libjasper package installed system-wide by
-	  Buildroot.
-
-config BR2_PACKAGE_OPENCV3_WITH_JPEG
-	bool "jpeg support"
-	select BR2_PACKAGE_JPEG
-	help
-	  Use shared libjpeg from the target system.
-
-config BR2_PACKAGE_OPENCV3_WITH_PNG
-	bool "png support"
-	select BR2_PACKAGE_LIBPNG
-	help
-	  Use shared libpng from the target system.
-
-config BR2_PACKAGE_OPENCV3_WITH_TIFF
-	bool "tiff support"
-	select BR2_PACKAGE_TIFF
-	help
-	  Use shared libtiff from the target system.
-
-config BR2_PACKAGE_OPENCV3_WITH_V4L
-	bool "v4l support"
-	help
-	  Enable Video 4 Linux support.
-
-	  If the package libv4l is enabled, its support is
-	  automatically enabled.
-
-config BR2_PACKAGE_OPENCV3_WITH_WEBP
-	bool "webp support"
-	select BR2_PACKAGE_WEBP
-	help
-	  Enable WebP support.
-
-	  Use shared libwebp from the target system.
-
-comment "Install options"
-
-config BR2_PACKAGE_OPENCV3_INSTALL_DATA
-	bool "install extra data"
-	help
-	  Install various data that is used by cv libraries and/or
-	  demo applications, specifically for haarcascades and
-	  lbpcascades features.
-
-	  For further information: see OpenCV documentation.
-
-endif # BR2_PACKAGE_OPENCV3
-
-comment "opencv3 needs a toolchain w/ C++, NPTL, wchar, dynamic library"
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		BR2_STATIC_LIBS
diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
deleted file mode 100644
index b378e7050f..0000000000
--- a/package/opencv3/opencv3.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  b9eda448a08ba7b10bfd5bd45697056569ebdf7a02070947e1c1f3e8e69280cd  opencv3-3.4.20.tar.gz
-sha256  3f221dbe2ca9228d6470990ed28e55957e8506335df4620539c4db0dd27a6b4c  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
deleted file mode 100644
index 9e488bed0c..0000000000
--- a/package/opencv3/opencv3.mk
+++ /dev/null
@@ -1,354 +0,0 @@
-################################################################################
-#
-# opencv3
-#
-################################################################################
-
-OPENCV3_VERSION = 3.4.20
-OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
-OPENCV3_INSTALL_STAGING = YES
-OPENCV3_LICENSE = BSD-3-Clause
-OPENCV3_LICENSE_FILES = LICENSE
-OPENCV3_CPE_ID_VENDOR = opencv
-OPENCV3_CPE_ID_PRODUCT = opencv
-OPENCV3_SUPPORTS_IN_SOURCE_BUILD = NO
-
-OPENCV3_CXXFLAGS = $(TARGET_CXXFLAGS)
-
-# Uses __atomic_fetch_add_4
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-OPENCV3_CXXFLAGS += -latomic
-endif
-
-# Fix c++11 build with missing std::exception_ptr
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
-OPENCV3_CXXFLAGS += -DCV__EXCEPTION_PTR=0
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
-OPENCV3_CXXFLAGS += -O0
-endif
-
-# OpenCV component options
-OPENCV3_CONF_OPTS += \
-	-DCMAKE_CXX_FLAGS="$(OPENCV3_CXXFLAGS)" \
-	-DBUILD_DOCS=OFF \
-	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS),ON,OFF) \
-	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV3_BUILD_TESTS),ON,OFF) \
-	-DBUILD_WITH_DEBUG_INFO=OFF \
-	-DDOWNLOAD_EXTERNAL_TEST_DATA=OFF \
-	-DOPENCV_ENABLE_PKG_CONFIG=ON
-
-ifeq ($(BR2_PACKAGE_OPENCV3_BUILD_TESTS)$(BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS),)
-OPENCV3_CONF_OPTS += -DINSTALL_TEST=OFF
-else
-OPENCV3_CONF_OPTS += -DINSTALL_TEST=ON
-endif
-
-# OpenCV build options
-OPENCV3_CONF_OPTS += \
-	-DBUILD_WITH_STATIC_CRT=OFF \
-	-DENABLE_CCACHE=OFF \
-	-DENABLE_COVERAGE=OFF \
-	-DENABLE_FAST_MATH=ON \
-	-DENABLE_IMPL_COLLECTION=OFF \
-	-DENABLE_NOISY_WARNINGS=OFF \
-	-DENABLE_OMIT_FRAME_POINTER=ON \
-	-DENABLE_PRECOMPILED_HEADERS=OFF \
-	-DENABLE_PROFILING=OFF \
-	-DOPENCV_WARNINGS_ARE_ERRORS=OFF
-
-# OpenCV link options
-OPENCV3_CONF_OPTS += \
-	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
-	-DCMAKE_SKIP_RPATH=OFF \
-	-DCMAKE_USE_RELATIVE_PATHS=OFF
-
-# OpenCV packaging options:
-OPENCV3_CONF_OPTS += \
-	-DBUILD_PACKAGE=OFF \
-	-DENABLE_SOLUTION_FOLDERS=OFF \
-	-DINSTALL_CREATE_DISTRIB=OFF
-
-# OpenCV module selection
-# * Modules on:
-#   - core: if not set, opencv does not build anything
-#   - hal: core's dependency
-# * Modules off:
-#   - android*: android stuff
-#   - apps: programs for training classifiers
-#   - java: java bindings
-#   - viz: missing VTK dependency
-#   - world: all-in-one module
-#
-# * Contrib modules from [1] are disabled:
-#   - opencv_contrib package is not available in Buildroot;
-#   - OPENCV3_EXTRA_MODULES_PATH is not set.
-#
-# [1] https://github.com/Itseez/opencv_contrib
-OPENCV3_CONF_OPTS += \
-	-DBUILD_opencv_androidcamera=OFF \
-	-DBUILD_opencv_apps=OFF \
-	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV3_LIB_CALIB3D),ON,OFF) \
-	-DBUILD_opencv_core=ON \
-	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV3_LIB_FEATURES2D),ON,OFF) \
-	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV3_LIB_FLANN),ON,OFF) \
-	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),ON,OFF) \
-	-DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV3_LIB_IMGCODECS),ON,OFF) \
-	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),ON,OFF) \
-	-DBUILD_opencv_java=OFF \
-	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV3_LIB_ML),ON,OFF) \
-	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV3_LIB_OBJDETECT),ON,OFF) \
-	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV3_LIB_PHOTO),ON,OFF) \
-	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV3_LIB_SHAPE),ON,OFF) \
-	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV3_LIB_STITCHING),ON,OFF) \
-	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV3_LIB_SUPERRES),ON,OFF) \
-	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV3_LIB_TS),ON,OFF) \
-	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV3_LIB_VIDEO),ON,OFF) \
-	-DBUILD_opencv_videoio=$(if $(BR2_PACKAGE_OPENCV3_LIB_VIDEOIO),ON,OFF) \
-	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV3_LIB_VIDEOSTAB),ON,OFF) \
-	-DBUILD_opencv_viz=OFF \
-	-DBUILD_opencv_world=OFF
-
-# Hardware support options.
-#
-# * PowerPC and VFPv3 support are turned off since their only effects
-#   are altering CFLAGS, adding '-mcpu=G3 -mtune=G5' or '-mfpu=vfpv3'
-#   to them, which is already handled by Buildroot.
-# * NEON logic is needed as it is not only used to add CFLAGS, but
-#   also to enable additional NEON code.
-OPENCV3_CONF_OPTS += \
-	-DENABLE_POWERPC=OFF \
-	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF) \
-	-DENABLE_VFPV3=OFF
-
-# Cuda stuff
-OPENCV3_CONF_OPTS += \
-	-DBUILD_CUDA_STUBS=OFF \
-	-DBUILD_opencv_cudaarithm=OFF \
-	-DBUILD_opencv_cudabgsegm=OFF \
-	-DBUILD_opencv_cudacodec=OFF \
-	-DBUILD_opencv_cudafeatures2d=OFF \
-	-DBUILD_opencv_cudafilters=OFF \
-	-DBUILD_opencv_cudaimgproc=OFF \
-	-DBUILD_opencv_cudalegacy=OFF \
-	-DBUILD_opencv_cudaobjdetect=OFF \
-	-DBUILD_opencv_cudaoptflow=OFF \
-	-DBUILD_opencv_cudastereo=OFF \
-	-DBUILD_opencv_cudawarping=OFF \
-	-DBUILD_opencv_cudev=OFF \
-	-DWITH_CUBLAS=OFF \
-	-DWITH_CUDA=OFF \
-	-DWITH_CUFFT=OFF
-
-# NVidia stuff
-OPENCV3_CONF_OPTS += -DWITH_NVCUVID=OFF
-
-# AMD stuff
-OPENCV3_CONF_OPTS += \
-	-DWITH_OPENCLAMDBLAS=OFF \
-	-DWITH_OPENCLAMDFFT=OFF
-
-# Intel stuff
-OPENCV3_CONF_OPTS += \
-	-DBUILD_WITH_DYNAMIC_IPP=OFF \
-	-DWITH_INTELPERC=OFF \
-	-DWITH_IPP=OFF \
-	-DWITH_IPP_A=OFF \
-	-DWITH_TBB=OFF
-
-# Smartek stuff
-OPENCV3_CONF_OPTS += -DWITH_GIGEAPI=OFF
-
-# Prosilica stuff
-OPENCV3_CONF_OPTS += -DWITH_PVAPI=OFF
-
-# Ximea stuff
-OPENCV3_CONF_OPTS += -DWITH_XIMEA=OFF
-
-# Non-Linux support (Android options) must remain OFF:
-OPENCV3_CONF_OPTS += \
-	-DANDROID=OFF \
-	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
-	-DBUILD_ANDROID_EXAMPLES=OFF \
-	-DBUILD_ANDROID_SERVICE=OFF \
-	-DBUILD_FAT_JAVA_LIB=OFF \
-	-DINSTALL_ANDROID_EXAMPLES=OFF \
-	-DWITH_ANDROID_CAMERA=OFF
-
-# Non-Linux support (Mac OSX options) must remain OFF:
-OPENCV3_CONF_OPTS += \
-	-DWITH_AVFOUNDATION=OFF \
-	-DWITH_CARBON=OFF \
-	-DWITH_QUICKTIME=OFF
-
-# Non-Linux support (Windows options) must remain OFF:
-OPENCV3_CONF_OPTS += \
-	-DWITH_CSTRIPES=OFF \
-	-DWITH_DSHOW=OFF \
-	-DWITH_MSMF=OFF \
-	-DWITH_VFW=OFF \
-	-DWITH_VIDEOINPUT=OFF \
-	-DWITH_WIN32UI=OFF
-
-# Software/3rd-party support options:
-# - disable all examples
-OPENCV3_CONF_OPTS += \
-	-DBUILD_EXAMPLES=OFF \
-	-DBUILD_JASPER=OFF \
-	-DBUILD_JPEG=OFF \
-	-DBUILD_OPENEXR=OFF \
-	-DBUILD_PNG=OFF \
-	-DBUILD_PROTOBUF=OFF \
-	-DBUILD_TIFF=OFF \
-	-DBUILD_ZLIB=OFF \
-	-DINSTALL_C_EXAMPLES=OFF \
-	-DINSTALL_PYTHON_EXAMPLES=OFF \
-	-DINSTALL_TO_MANGLED_PATHS=OFF
-
-# Disabled features (mostly because they are not available in Buildroot), but
-# - eigen: OpenCV does not use it, not take any benefit from it.
-OPENCV3_CONF_OPTS += \
-	-DWITH_1394=OFF \
-	-DWITH_CLP=OFF \
-	-DWITH_EIGEN=OFF \
-	-DWITH_FFMPEG=OFF \
-	-DWITH_GDAL=OFF \
-	-DWITH_GPHOTO2=OFF \
-	-DWITH_GSTREAMER_0_10=OFF \
-	-DWITH_GTK_2_X=OFF \
-	-DWITH_LAPACK=OFF \
-	-DWITH_MATLAB=OFF \
-	-DWITH_OPENCL=OFF \
-	-DWITH_OPENCL_SVM=OFF \
-	-DWITH_OPENEXR=OFF \
-	-DWITH_OPENNI2=OFF \
-	-DWITH_OPENNI=OFF \
-	-DWITH_PROTOBUF=OFF \
-	-DWITH_UNICAP=OFF \
-	-DWITH_VA=OFF \
-	-DWITH_VA_INTEL=OFF \
-	-DWITH_VTK=OFF \
-	-DWITH_XINE=OFF
-
-OPENCV3_DEPENDENCIES += host-pkgconf zlib
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1),y)
-OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=ON
-OPENCV3_DEPENDENCIES += gstreamer1 gst1-plugins-base
-else
-OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK3),y)
-OPENCV3_CONF_OPTS += -DWITH_GTK=ON
-OPENCV3_DEPENDENCIES += libgtk3
-else
-OPENCV3_CONF_OPTS += -DWITH_GTK=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_JASPER),y)
-OPENCV3_CONF_OPTS += -DWITH_JASPER=ON
-OPENCV3_DEPENDENCIES += jasper
-else
-OPENCV3_CONF_OPTS += -DWITH_JASPER=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_JPEG),y)
-OPENCV3_CONF_OPTS += -DWITH_JPEG=ON
-OPENCV3_DEPENDENCIES += jpeg
-else
-OPENCV3_CONF_OPTS += -DWITH_JPEG=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_OPENGL),y)
-OPENCV3_CONF_OPTS += -DWITH_OPENGL=ON
-OPENCV3_DEPENDENCIES += libgl
-else
-OPENCV3_CONF_OPTS += -DWITH_OPENGL=OFF
-endif
-
-OPENCV3_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_TOOLCHAIN_HAS_OPENMP),ON,OFF)
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PNG),y)
-OPENCV3_CONF_OPTS += -DWITH_PNG=ON
-OPENCV3_DEPENDENCIES += libpng
-else
-OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT5),y)
-OPENCV3_CONF_OPTS += -DWITH_QT=5
-OPENCV3_DEPENDENCIES += qt5base
-else
-OPENCV3_CONF_OPTS += -DWITH_QT=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_TIFF),y)
-OPENCV3_CONF_OPTS += -DWITH_TIFF=ON
-OPENCV3_DEPENDENCIES += tiff
-else
-OPENCV3_CONF_OPTS += -DWITH_TIFF=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_V4L),y)
-OPENCV3_CONF_OPTS += \
-	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF) \
-	-DWITH_V4L=ON
-OPENCV3_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
-else
-OPENCV3_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_WEBP),y)
-OPENCV3_CONF_OPTS += -DWITH_WEBP=ON
-OPENCV3_DEPENDENCIES += webp
-else
-OPENCV3_CONF_OPTS += -DWITH_WEBP=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_PYTHON),y)
-OPENCV3_CONF_OPTS += \
-	-DBUILD_opencv_python2=OFF \
-	-DBUILD_opencv_python3=ON \
-	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/bin/python3 \
-	-DPYTHON3_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	-DPYTHON3_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR).so \
-	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include \
-	-DPYTHON3_PACKAGES_PATH=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
-	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
-OPENCV3_DEPENDENCIES += python3
-OPENCV3_KEEP_PY_FILES += usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/cv2/config*.py
-OPENCV3_CONF_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
-OPENCV3_DEPENDENCIES += python-numpy
-else
-OPENCV3_CONF_OPTS += \
-	-DBUILD_opencv_python2=OFF \
-	-DBUILD_opencv_python3=OFF
-endif
-
-# Installation hooks:
-define OPENCV3_CLEAN_INSTALL_LICENSE
-	$(RM) -fr $(TARGET_DIR)/usr/share/licenses/opencv3
-endef
-OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_LICENSE
-
-define OPENCV3_CLEAN_INSTALL_CMAKE
-	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCV*.cmake
-endef
-OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_CMAKE
-
-define OPENCV3_CLEAN_INSTALL_VALGRIND
-	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/valgrind*
-endef
-OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_VALGRIND
-
-ifneq ($(BR2_PACKAGE_OPENCV3_INSTALL_DATA),y)
-define OPENCV3_CLEAN_INSTALL_DATA
-	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/haarcascades \
-		$(TARGET_DIR)/usr/share/OpenCV/lbpcascades
-endef
-OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_DATA
-endif
-
-$(eval $(cmake-package))
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index a553411e1a..a7f5592122 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -6,7 +6,6 @@ menuconfig BR2_PACKAGE_OPENCV4
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # include dlfcn.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	depends on !BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_ZLIB
 	help
 	  OpenCV (Open Source Computer Vision) is a library of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
