From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 17:36:22 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: fix missing dependency
	for opencv plugin
Message-ID: <20140420153626.D06219C8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7105008a7f97e2c845fe80faa0c4cef3c7578d90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gstreamer1 opencv plugin requires opencv's contrib module.

Fixes:
  http://autobuild.buildroot.net/results/0aa/0aab79be8043bf88a227af2ca27b4447aa2f8901/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
