From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Dec 2019 16:12:28 +0100
Subject: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-bad: drop bogus
 select
Message-ID: <20191213151229.1366284-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_WEBRTC does not exist, and we already select
BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING, which is the package really
needed by the webrtcdsp plugin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index e79f266ad0..08952f70cb 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -584,7 +584,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
-	select BR2_PACKAGE_WEBRTC
 	help
 	  WebRTC echo-cancellation, gain control and noise suppression
 
-- 
2.23.0
