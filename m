From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:55:55 +0200
Subject: [Buildroot] [git commit] opencv: add superres module knob
Message-ID: <20140716210452.C51ED9D25F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=984c06cffc613dbd7bf075ad7a3da6db1495e991
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new module has been introduced in opencv-2.4.8.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |    7 +++++++
 package/opencv/opencv.mk |    1 +
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 7644d64..8d9599f 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -92,6 +92,13 @@ config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	help
 	  Include opencv_stitching module into the OpenCV build.
 
+config BR2_PACKAGE_OPENCV_LIB_SUPERRES
+	bool "superres"
+	default y
+	help
+	  Include opencv_superres "super resolution" - module into the OpenCV
+	  build.
+
 config BR2_PACKAGE_OPENCV_LIB_TS
 	bool "ts (touchscreen)"
 	default y
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index fa9b207..6afe7ca 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -60,6 +60,7 @@ OPENCV_CONF_OPT += \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
 	-DBUILD_opencv_python=OFF                                               \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
+	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
 	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
 	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF)       \
 	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
