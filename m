From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 Jul 2016 00:32:49 +0200
Subject: [Buildroot] [PATCH 1/4] package/webrtc-audio-processing: needs gcc
	>= 4.8
Message-ID: <1467585172-10299-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Webrtc-audio-processing require a C++11 compiler

Fixes:
http://autobuild.buildroot.net/results/729/729cd0039ac172cfe31a4325bad902e9a14e146f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/webrtc-audio-processing/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index f228bc7..7c69903 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	bool "webrtc-audio-processing"
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  AudioProcessing library based on Google's implementation of
@@ -9,6 +10,7 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 
 	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 
-comment "webrtc-audio-processing needs a toolchain w/ C++, threads"
+comment "webrtc-audio-processing needs a toolchain w/ C++, threads, gcc >= 4.8"
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-- 
2.5.5
