From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 00:12:08 +0200
Subject: [Buildroot] [git commit] package/opencv: add inter-module
	dependencies
Message-ID: <20160418221213.03257818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bd5025038a9ecfb2c19a2450a68ae3b0888b440
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated by Samuel the opencv2 package lacks inter-module dependencies:
http://lists.busybox.net/pipermail/buildroot/2016-April/158902.html

This patch adds the necessary code for freeswitch's mod_cv to compile.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 8bc6c34..b563312 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -23,6 +23,13 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 config BR2_PACKAGE_OPENCV_LIB_CONTRIB
 	bool "contrib"
 	default y
+	# modules/contrib/CMakeLists.txt
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_ML
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_contrib module into the OpenCV build.
 
@@ -46,6 +53,8 @@ config BR2_PACKAGE_OPENCV_LIB_GPU
 config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	bool "highgui"
 	default y
+	# modules/highgui/CMakeLists.txt
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_highgui module into the OpenCV build.
 
@@ -58,6 +67,10 @@ config BR2_PACKAGE_OPENCV_LIB_IMGPROC
 config BR2_PACKAGE_OPENCV_LIB_LEGACY
 	bool "legacy"
 	default y
+	# modules/legacy/CMakeLists.txt
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_ML
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  Include opencv_legacy module into the OpenCV build.
 
@@ -75,6 +88,8 @@ config BR2_PACKAGE_OPENCV_LIB_NONFREE
 config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	bool "objdetect"
 	default y
+	# modules/objdetect/CMakeLists.txt
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	help
 	  Include opencv_objdetect module into the OpenCV build.
 
