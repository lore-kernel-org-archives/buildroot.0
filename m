From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 11:33:00 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: Add bug URL for the
	opencv modules issue
Message-ID: <20140226103328.048BA9BA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2842c7136454e4c85be980605b22ef92657fcba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A bug has been reported upstream to fix this issue properly, and a
GStreamer developer agreed with our proposal. We add the bug URL to
comments on Config.in to let the interested users follow the progress of
this issue.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index efad91e..2efbfbe 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -420,6 +420,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	select BR2_PACKAGE_OPENCV
 	# Remove the following opencv modules when gstreamer fixes the
 	# problem of including the old "cv.h" header
+	# bug: https://bugzilla.gnome.org/show_bug.cgi?id=725163
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV_LIB_FLANN
