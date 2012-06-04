From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  4 Jun 2012 20:48:31 +0200
Subject: [Buildroot] [PATCH 1/1] webrtc-audio-processing: disable
	unsupported target architectures
Message-ID: <1338835711-3824-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, webrtc-audio-processing only provides support for the following
architectures (see src/typedefs.h from the source directory):
- x86_64
- i*86
- armel

Fixes http://autobuild.buildroot.org/results/ff777bb06eddafa71327015e1d39fe911c1439d8

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index e33fc57..90341d6 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	bool "webrtc-audio-processing"
+	depends on BR2_arm || BR2_i386 || BR2_x86_64
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  AudioProcessing library based on Google's implementation of
-- 
1.7.10.3
