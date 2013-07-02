From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 2 Jul 2013 13:45:47 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: add missing depends on
	C++ for the OpenCV plugin
Message-ID: <20130702114844.399129A02E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b767aee44395fe5dae4d0b05a67810c7cce855b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV requires C++ support, so we shouldn't select it without
depending on C++ support.

Fixes:
http://autobuild.buildroot.org/results/71f/71f2d8a267a0d159521407a9a2330e68d756c4b3/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst1-plugins-bad/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst1-plugins-bad/Config.in b/package/multimedia/gst1-plugins-bad/Config.in
index 7eb531a..98550e0 100644
--- a/package/multimedia/gst1-plugins-bad/Config.in
+++ b/package/multimedia/gst1-plugins-bad/Config.in
@@ -400,10 +400,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	bool "opencv"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_OPENCV
 	help
 	  GStreamer OpenCV Plugins
 
+comment "opencv plugin requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 	bool "opus"
 	select BR2_PACKAGE_OPUS
