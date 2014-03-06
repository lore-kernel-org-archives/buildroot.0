From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 18:25:27 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: add missing opencv ml
	module dependency
Message-ID: <20140306172532.94CD39BDCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01ab9e6b0e9332294f538ea24301cf53585e01ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
