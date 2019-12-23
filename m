From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:09:19 +0100
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/gstreamer1/gst1-plugins-bad: drop bogus select
Message-ID: <20191223080015.7767B8DED8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=580109168ff8755901a557f8c1785c311950424a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

BR2_PACKAGE_WEBRTC does not exist, and we already select
BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING, which is the package really
needed by the webrtcdsp plugin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8393212437b80a3fdac2bd83b2d015241fa28cfb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index f0a8461165..d36316bf30 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -567,7 +567,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
-	select BR2_PACKAGE_WEBRTC
 	help
 	  WebRTC echo-cancellation, gain control and noise suppression
 
