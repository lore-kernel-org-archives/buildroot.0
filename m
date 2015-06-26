From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:42:21 +0200
Subject: [Buildroot] [git commit] package/opencv: reword modules' prompt and
	help text
Message-ID: <20150626184435.7D8FD80E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1550ee0c127c0f2b646f225339b693092870b91d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is mostly cosmetic changes improving the human interface.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |   46 ++++++++++++++++++++++++++--------------------
 1 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 6b1ffcf..a651d9e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -25,7 +25,8 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
-	  Include opencv_calib3d module into the OpenCV build.
+	  Include opencv_calib3d (camera calibration and 3d reconstruction) module
+	  into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	bool "features2d"
@@ -34,14 +35,16 @@ config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_ML
 	help
-	  Include opencv_features2d module into the OpenCV build.
+	  Include opencv_features2d (2d features framework) module into the OpenCV
+	  build.
 
 config BR2_PACKAGE_OPENCV_LIB_FLANN
 	bool "flann"
 	default y
 	# opencv_core dependency is already enabled
 	help
-	  Include opencv_flann module into the OpenCV build.
+	  Include opencv_flann (clustering and search in multi-dimensional spaces)
+	  module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	bool "highgui"
@@ -50,28 +53,29 @@ config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
 	help
-	  Include opencv_highgui module into the OpenCV build.
+	  Include opencv_highgui (high-level gui and media i/o) module into the
+	  OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
 	bool "imgcodecs"
 	default y
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
-	  Include opencv_imgcodecs module into the OpenCV build.
+	  Include opencv_imgcodecs (image codecs) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	bool "imgproc"
 	default y
 	# opencv_core dependency is already enabled
 	help
-	  Include opencv_imgproc module into the OpenCV build.
+	  Include opencv_imgproc (image processing) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_ML
 	bool "ml"
 	default y
 	# opencv_core dependency is already enabled
 	help
-	  Include opencv_ml module into the OpenCV build.
+	  Include opencv_ml (machine learning) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	bool "objdetect"
@@ -80,25 +84,27 @@ config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_ML
 	help
-	  Include opencv_objdetect module into the OpenCV build.
+	  Include opencv_objdetect (object detection) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_PHOTO
 	bool "photo"
 	default y
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
-	  Include opencv_photo module into the OpenCV build.
+	  Include opencv_photo (computational photography) module into the OpenCV
+	  build.
 
 comment "opencv_python module requires numpy which is not yet available."
 
 config BR2_PACKAGE_OPENCV_LIB_SHAPE
-	bool "shape (shape descriptors and matchers)"
+	bool "shape"
 	default y
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
-	  Include opencv_shape module into the OpenCV build.
+	  Include opencv_shape (shape descriptors and matchers) module into the
+	  OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	bool "stitching"
@@ -108,7 +114,7 @@ config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	help
-	  Include opencv_stitching module into the OpenCV build.
+	  Include opencv_stitching (images stitching) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_SUPERRES
 	bool "superres"
@@ -116,11 +122,10 @@ config BR2_PACKAGE_OPENCV_LIB_SUPERRES
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
-	  Include opencv_superres "super resolution" - module into the OpenCV
-	  build.
+	  Include opencv_superres (super resolution) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_TS
-	bool "ts (touchscreen)"
+	bool "ts"
 	default y
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
@@ -128,22 +133,22 @@ config BR2_PACKAGE_OPENCV_LIB_TS
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
 	help
-	  Include opencv_ts module into the OpenCV build.
+	  Include opencv_ts (test) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
-	bool "videoio (media i/o)"
+	bool "videoio"
 	default y
 	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
-	  Include opencv_videoio module into the OpenCV build.
+	  Include opencv_videoio (media i/o) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEO
 	bool "video"
 	default y
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
-	  Include opencv_video module into the OpenCV build.
+	  Include opencv_video (video analysis) module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
 	bool "videostab"
@@ -154,7 +159,8 @@ config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
 	select BR2_PACKAGE_OPENCV_LIB_PHOTO
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
-	  Include opencv_videostab module into the OpenCV build.
+	  Include opencv_videostab (video stabilization) module into the OpenCV
+	  build.
 
 comment "Test sets"
 config BR2_PACKAGE_OPENCV_BUILD_TESTS
