From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 16:20:26 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: drop
 bogus select
Message-ID: <20191213151212.A6AF188DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8393212437b80a3fdac2bd83b2d015241fa28cfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_WEBRTC does not exist, and we already select
BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING, which is the package really
needed by the webrtcdsp plugin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
