From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  6 Oct 2014 22:19:26 +0200
Subject: [Buildroot] [PATCH v4 9/9] package/gstreamer1/gst1-plugins-bad:
	rework opencv plugin dependencies
In-Reply-To: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
References: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1412626766-24683-10-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst1 opencv plugin source code still include OpenCV's headers from its
deprecated API.

Use the newly introduced BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS to
select all required OpenCV module dependencies.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v3 -> v4:
- rebase

changes v2 -> v3:
- rebase
- update A/R/T tags

changes v1 -> v2:
- new patch
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index c455aca..e59620f 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -437,15 +437,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	# Remove the following opencv modules when gstreamer fixes the
 	# problem of including the old "cv.h" header
 	# bug: https://bugzilla.gnome.org/show_bug.cgi?id=725163
-	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
-	select BR2_PACKAGE_OPENCV_LIB_CONTRIB
-	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
-	select BR2_PACKAGE_OPENCV_LIB_FLANN
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_LEGACY
-	select BR2_PACKAGE_OPENCV_LIB_ML
-	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
-	select BR2_PACKAGE_OPENCV_LIB_VIDEO
+	select BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS
 	help
 	  GStreamer OpenCV Plugins
 
-- 
2.1.2
