From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jun 2015 12:26:31 +0200
Subject: [Buildroot] [PATCH v5 05/13] package/opencv: reword modules' prompt
	and help text
In-Reply-To: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1433672799-21387-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is mostly cosmetic changes improving the human interface.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v4->v5:
- new patch
---
 package/opencv/Config.in | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 4ab4dc7..58a6ccb 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -18,7 +18,7 @@ if BR2_PACKAGE_OPENCV
 comment "OpenCV modules"
 
 config BR2_PACKAGE_OPENCV_LIB_CALIB3D
-	bool "calib3d"
+	bool "calib3d (camera calibration and 3d reconstruction)"
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
@@ -27,7 +27,7 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 # opencv_core module is automatically enabled when OpenCV package is selected
 
 config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
-	bool "features2d"
+	bool "features2d (2d features framework)"
 	select BR2_PACKAGE_OPENCV_LIB_FLANN
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_ML
@@ -35,7 +35,7 @@ config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	  Include opencv_features2d module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_FLANN
-	bool "flann"
+	bool "flann (clustering and search in multi-dimensional spaces)"
 	# opencv_core dependency is already enabled
 	help
 	  Include opencv_flann module into the OpenCV build.
@@ -44,7 +44,7 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
 # opencv_core, so it is automatically enabled
 
 config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-	bool "highgui"
+	bool "highgui (high-level gui and media i/o)"
 	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
@@ -70,7 +70,7 @@ config BR2_PACKAGE_OPENCV_LIB_ML
 	  Include opencv_ml module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
-	bool "objdetect"
+	bool "objdetect (object detection)"
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_ML
@@ -78,7 +78,7 @@ config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	  Include opencv_objdetect module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_PHOTO
-	bool "photo"
+	bool "photo (computational photography)"
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_photo module into the OpenCV build.
@@ -94,7 +94,7 @@ config BR2_PACKAGE_OPENCV_LIB_SHAPE
 	  Include opencv_shape module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_STITCHING
-	bool "stitching"
+	bool "stitching (images stitching)"
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
@@ -103,15 +103,14 @@ config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	  Include opencv_stitching module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_SUPERRES
-	bool "superres"
+	bool "superres (super resolution)"
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
-	  Include opencv_superres "super resolution" - module into the OpenCV
-	  build.
+	  Include opencv_superres module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_TS
-	bool "ts (touchscreen)"
+	bool "ts (test module)"
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
@@ -128,13 +127,13 @@ config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
 	  Include opencv_videoio module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEO
-	bool "video"
+	bool "video (video analysis)"
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_video module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
-	bool "videostab"
+	bool "videostab (video stabilization)"
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-- 
2.4.2
