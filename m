From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:15:03 +0200
Subject: [Buildroot] [git commit] gst1-imx: needs shared libraries
Message-ID: <20160616201633.46728820DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69f616099b05754cae202e8d7669b7046bb21803
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/2d1/2d1b5077a7551cebe4b961d6ce1cf844ad83fb8c/

Otherwise waf configure fails with:
Checking for library dl                                      : not found
The configuration failed

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-imx/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 2b0360f..efd5086 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GST1_IMX
 	bool "gst1-imx"
 	depends on BR2_arm # Only relevant for i.MX
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  This is a set of GStreamer 1.0 plugins for plugins for Freescale's
@@ -17,3 +18,7 @@ config BR2_PACKAGE_GST1_IMX
 	  The MP3 plugin is built when BR2_PACKAGE_IMX_CODEC is enabled.
 
 	  https://github.com/Freescale/gstreamer-imx
+
+comment "gst1-imx needs a toolchain w/ dynamic library"
+	depends on BR2_arm
+	depends on BR2_STATIC_LIBS
