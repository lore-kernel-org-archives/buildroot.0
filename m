From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 18:50:34 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: v4l2 plugin needs
	kernel headers 3.0+
Message-ID: <20140815165247.0CE009D44A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=921d6185660b1fe30a877efd06cb7598714d933d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/284/284313e660c3c9fad891fd71aa56ca5751946dc6/

For the multi planar api (mp_pix). It was actually added in 2.6.39 (commit
f8f3914cf9), but we only have symbols for 3.x kernels, so use 3.0 instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 7159c5a..65dc7b1 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -269,9 +269,13 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS4
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
 	bool "v4l2"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # multi planar api
 	help
 	  elements for Video 4 Linux
 
+comment "v4l2 needs toolchain w/ headers >= 3.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO
 	bool "cairo"
 	select BR2_PACKAGE_CAIRO
