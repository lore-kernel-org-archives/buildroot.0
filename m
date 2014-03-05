From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  5 Mar 2014 23:55:30 +0100
Subject: [Buildroot] [PATCH] gst1-plugins-bad: add missing opencv ml module
	dependency
Message-ID: <1394060130-4805-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst1-plugins-bad source code does include the old-style global opencv
header "opencv/cv.h", which includes headers from the core, imgproc,
video, features2d, flann, calib3d, objdetect and legacy modules.

However, the legacy module, in addition to headers from some of the
previously listed modules, also includes headers from the ml module.

Thus, the ml module must be selected to be able to build the legacy
one, so the gst-plugins-bad's opencv plugin.

Fixes:
  http://autobuild.buildroot.net/results/d02/d02e1843ef90f4b40c99e3b23eddf376f827d46e/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0685322..2c5c290 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -434,6 +434,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	select BR2_PACKAGE_OPENCV_LIB_FLANN
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_LEGACY
+	select BR2_PACKAGE_OPENCV_LIB_ML
 	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
-- 
1.9.0
