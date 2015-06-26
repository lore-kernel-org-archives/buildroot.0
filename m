From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:41:44 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad:
	disable opencv plugin with opencv-3
Message-ID: <20150626184435.5D3D880E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e238a87eacf2a0c62736c4123961651afb1ba87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The opencv plugin uses stuff from the now removed opencv's legacy module.
Note that the configure script already correctly check the opencv version
and disable the opencv plugin with opencv-3.x.

Also remove 'select ...' to prevent kconfig from complaining about
recursive dependencies.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 76a601a..bc99527 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -559,19 +559,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	bool "opencv"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_PACKAGE_OPENCV
-	# Remove the following opencv modules when gstreamer fixes the
-	# problem of including the old "cv.h" header
-	# bug: https://bugzilla.gnome.org/show_bug.cgi?id=725163
-	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
-	select BR2_PACKAGE_OPENCV_LIB_CONTRIB
-	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
-	select BR2_PACKAGE_OPENCV_LIB_FLANN
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_LEGACY
-	select BR2_PACKAGE_OPENCV_LIB_ML
-	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
-	select BR2_PACKAGE_OPENCV_LIB_VIDEO
+	depends on BROKEN # gst1-plugin-opencv does not (yet) support opencv >=3.x
 	help
 	  GStreamer OpenCV Plugins
 
