From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 25 Feb 2014 15:36:44 +0000
Subject: [Buildroot] [PATCH] gst1-plugins-bad: select all opencv modules
	needed
Message-ID: <1393342604-48284-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gstopencv.c includes the old-style header opencv/cv.h which includes a
set of module's headers. To satisfy the opencv/cv.h requirements we need
to select the modules which provide the required headers.

Fixes:
   http://autobuild.buildroot.net/results/f5b/f5b248eb7be38d6eb3655cdc1ab6ee5e716b9b29/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 407bf31..629ea3a 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -417,6 +417,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	bool "opencv"
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_OPENCV
+	# Remove the following opencv modules when gstreamer fixes the
+	# problem of including the old "cv.h" header
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_FLANN
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_LEGACY
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  GStreamer OpenCV Plugins
 
-- 
1.7.1
