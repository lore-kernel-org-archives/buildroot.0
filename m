From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:44:03 +0200
Subject: [Buildroot] [git commit] package/opencv: disable all modules by
	default
Message-ID: <20150626184435.A0A4B80E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07d3749c25e342e2a2c4835a097dd156add5eee7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change allows to reduce the size of the default OpenCV package, so
the final root filesystem.

However, this will break any existing defconfig enabling OpenCV. Indeed,
a minimal OpenCV  package will be built, whereas, prior to applying this
patches, a full-featured one would have been built instead.

Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 6f99ecb..877ddda 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -89,7 +89,6 @@ comment "opencv_python module requires numpy which is not yet available."
 
 config BR2_PACKAGE_OPENCV_LIB_SHAPE
 	bool "shape"
-	default y
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
@@ -99,7 +98,6 @@ config BR2_PACKAGE_OPENCV_LIB_SHAPE
 
 config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	bool "stitching"
-	default y
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
@@ -109,7 +107,6 @@ config BR2_PACKAGE_OPENCV_LIB_STITCHING
 
 config BR2_PACKAGE_OPENCV_LIB_SUPERRES
 	bool "superres"
-	default y
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
@@ -117,7 +114,6 @@ config BR2_PACKAGE_OPENCV_LIB_SUPERRES
 
 config BR2_PACKAGE_OPENCV_LIB_TS
 	bool "ts"
-	default y
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
@@ -141,7 +137,6 @@ config BR2_PACKAGE_OPENCV_LIB_VIDEO
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
 	bool "videostab"
-	default y
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
