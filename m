From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:43:25 +0200
Subject: [Buildroot] [git commit] package/opencv: reduce modules on by
	default
Message-ID: <20150626184435.8DD3480E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f45342b7555dccb9aa4890b846a9e45f8a1f7560
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its integration into Buildroot, OpenCV always enables all modules
by default because the inter-module denpedency were not supported.

Now that OpenCV inter-module dependencies are correctly set at the
Buildroot configuration level, it is possible to reduce the enabled
module list to its minimal set, letting kconfig enable the other
modules.

This change will not change anything WRT a defconfig build with opencv.

Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index a651d9e..6f99ecb 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -21,7 +21,6 @@ comment "OpenCV modules"
 
 config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	bool "calib3d"
-	default y
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
@@ -30,7 +29,6 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 
 config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	bool "features2d"
-	default y
 	select BR2_PACKAGE_OPENCV_LIB_FLANN
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_ML
@@ -40,7 +38,6 @@ config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 
 config BR2_PACKAGE_OPENCV_LIB_FLANN
 	bool "flann"
-	default y
 	# opencv_core dependency is already enabled
 	help
 	  Include opencv_flann (clustering and search in multi-dimensional spaces)
@@ -48,7 +45,6 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
 
 config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	bool "highgui"
-	default y
 	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
@@ -58,28 +54,24 @@ config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 
 config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
 	bool "imgcodecs"
-	default y
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_imgcodecs (image codecs) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	bool "imgproc"
-	default y
 	# opencv_core dependency is already enabled
 	help
 	  Include opencv_imgproc (image processing) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_ML
 	bool "ml"
-	default y
 	# opencv_core dependency is already enabled
 	help
 	  Include opencv_ml (machine learning) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	bool "objdetect"
-	default y
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_ML
@@ -88,7 +80,6 @@ config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 
 config BR2_PACKAGE_OPENCV_LIB_PHOTO
 	bool "photo"
-	default y
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_photo (computational photography) module into the OpenCV
@@ -137,7 +128,6 @@ config BR2_PACKAGE_OPENCV_LIB_TS
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
 	bool "videoio"
-	default y
 	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
@@ -145,7 +135,6 @@ config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEO
 	bool "video"
-	default y
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_video (video analysis) module into the OpenCV build.
