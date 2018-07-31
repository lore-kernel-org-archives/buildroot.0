From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 22:09:21 +0200
Subject: [Buildroot] [git commit] package/opencv: bump version to 2.4.13.7
Message-ID: <20180731200341.877B78AA14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7afa9ae9628224be1f3691cbd6b57feabe39409
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Update-OpenCVCompilerOptions.cmake.patch  | 32 ----------------------
 package/opencv/opencv.hash                         |  2 +-
 package/opencv/opencv.mk                           |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/package/opencv/0003-Update-OpenCVCompilerOptions.cmake.patch b/package/opencv/0003-Update-OpenCVCompilerOptions.cmake.patch
deleted file mode 100644
index 9a81d9308a..0000000000
--- a/package/opencv/0003-Update-OpenCVCompilerOptions.cmake.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 126de0cd95418811e302996161e03195bf7e631a Mon Sep 17 00:00:00 2001
-From: neok-m4700 <neok-m4700@users.noreply.github.com>
-Date: Tue, 25 Jul 2017 10:25:20 +0200
-Subject: [PATCH] Update OpenCVCompilerOptions.cmake
-
-misplaced else
-
-[Upstream commit: https://github.com/opencv/opencv/commit/126de0cd95418811e302996161e03195bf7e631a]
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- cmake/OpenCVCompilerOptions.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/OpenCVCompilerOptions.cmake b/cmake/OpenCVCompilerOptions.cmake
-index 9b2a4e42e..7b079c5f9 100644
---- a/cmake/OpenCVCompilerOptions.cmake
-+++ b/cmake/OpenCVCompilerOptions.cmake
-@@ -18,9 +18,9 @@ if(ENABLE_CCACHE AND NOT CMAKE_COMPILER_IS_CCACHE)
-         message(STATUS "Unable to compile program with enabled ccache, reverting...")
-         set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${__OLD_RULE_LAUNCH_COMPILE}")
-       endif()
--    else()
--      message(STATUS "Looking for ccache - not found")
-     endif()
-+  else()
-+    message(STATUS "Looking for ccache - not found")
-   endif()
- endif()
- 
--- 
-2.15.0
-
diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
index 5b4b80d06e..dfb3b28581 100644
--- a/package/opencv/opencv.hash
+++ b/package/opencv/opencv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 fb4769d0119c35426c3754b7fb079b407911e863958db53bdec83c7794582e41  opencv-2.4.13.3.tar.gz
+sha256 192d903588ae2cdceab3d7dc5a5636b023132c8369f184ca89ccec0312ae33d0  opencv-2.4.13.7.tar.gz
 sha256 46e42877dfc3ac65769292cb4dc1a04b204ad9e40859a390f4c035d6179fbcc4  LICENSE
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index d170aec58f..d9813a041d 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.13.3
+OPENCV_VERSION = 2.4.13.7
 OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
 OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3-Clause
