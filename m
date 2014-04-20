From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 20 Apr 2014 14:48:19 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-bad: fix missing dependency for
	opencv plugin
Message-ID: <1397998099-6063-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gstreamer1 opencv plugin requires opencv's contrib module.

Fixes:
  http://autobuild.buildroot.net/results/0aa/0aab79be8043bf88a227af2ca27b4447aa2f8901/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0e4765c..02fa18c 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -430,6 +430,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	# problem of including the old "cv.h" header
 	# bug: https://bugzilla.gnome.org/show_bug.cgi?id=725163
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_CONTRIB
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_FLANN
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-- 
1.9.2
