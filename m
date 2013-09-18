From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Sep 2013 07:46:04 -0300
Subject: [Buildroot] [PATCH] webrtc-audio-processing: needs threads
Message-ID: <1379501164-28915-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/543/5435304b12fa1344411821b749cb028485431a82/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webrtc-audio-processing/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index 90341d6..9fa141f 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -2,11 +2,12 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	bool "webrtc-audio-processing"
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  AudioProcessing library based on Google's implementation of
 	  WebRTC.
 
 	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 
-comment "webrtc-audio-processing requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "webrtc-audio-processing requires a toolchain with C++ and thread support enabled"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.5
