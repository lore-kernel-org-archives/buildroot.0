From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:53:38 +0200
Subject: [Buildroot] [git commit] opencv: sort and reorder CMake
	configuration flags
Message-ID: <20140716210452.790909CE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71a67380b696d988e09cdac938c184ac415f1b3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make easier future package update.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |   39 +++++++++++++++++++++++++--------------
 1 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index d56b5e4..5d83074 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -10,24 +10,35 @@ OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3c
 OPENCV_LICENSE_FILES = doc/license.txt
 
+# OpenCV component options
 OPENCV_CONF_OPT += \
-	-DBUILD_WITH_STATIC_CRT=OFF                                  \
-	-DBUILD_DOCS=OFF                                             \
-	-DBUILD_EXAMPLES=OFF                                         \
-	-DBUILD_PACKAGE=OFF                                          \
-	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
+	-DBUILD_WITH_DEBUG_INFO=OFF \
+	-DBUILD_DOCS=OFF            \
+	-DBUILD_EXAMPLES=OFF        \
 	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
-	-DBUILD_WITH_DEBUG_INFO=OFF             \
+	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF)
+
+# OpenCV build options
+OPENCV_CONF_OPT += \
+	-DBUILD_WITH_STATIC_CRT=OFF      \
+	-DENABLE_FAST_MATH=ON            \
+	-DENABLE_NOISY_WARNINGS=OFF      \
+	-DENABLE_OMIT_FRAME_POINTER=ON   \
+	-DENABLE_PRECOMPILED_HEADERS=OFF \
+	-DENABLE_PROFILING=OFF           \
+	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
+
+# OpenCV link options
+OPENCV_CONF_OPT += \
 	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
 	-DCMAKE_SKIP_RPATH=OFF                  \
-	-DCMAKE_USE_RELATIVE_PATHS=OFF          \
-	-DENABLE_FAST_MATH=ON                   \
-	-DENABLE_NOISY_WARNINGS=OFF             \
-	-DENABLE_OMIT_FRAME_POINTER=ON          \
-	-DENABLE_PRECOMPILED_HEADERS=OFF        \
-	-DENABLE_PROFILING=OFF                  \
-	-DENABLE_SOLUTION_FOLDERS=OFF           \
-	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
+	-DCMAKE_USE_RELATIVE_PATHS=OFF
+
+# OpenCV packaging options:
+OPENCV_CONF_OPT += \
+	-DBUILD_PACKAGE=OFF           \
+	-DENABLE_SOLUTION_FOLDERS=OFF \
+	-DINSTALL_CREATE_DISTRIB=OFF
 
 # OpenCV module selection
 OPENCV_CONF_OPT += \
