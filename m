From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:29:05 +0100
Subject: [Buildroot] [git commit] gst-ffmpeg: disable for MIPS R6
Message-ID: <20160119202909.19822827D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38c5f75d1828b766fdb7d30476d27375d86c3b56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package bundles a version of libav which doesn't have support for
MIPS R6.

Fixes:

  http://autobuild.buildroot.org/results/e54/e54f0f9aa8fbc1760379ce64d17422810864b56b/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-ffmpeg/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index cc9b497..004ec1c 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
+	# Unsupported for MIPS R6. It bundles a version of libav which
+	# doesn't have support for MIPS R6.
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	help
 	  GStreamer plugin containing one plugin with a set of elements using
