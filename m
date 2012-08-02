From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:37 -0000
Subject: [Buildroot] [git commit branch/next] webrtc-audio-processing:
	disable unsupported target architectures
Message-ID: <20120802195235.CD94096AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e08c28f945fff0bdb1ff0342aa25e84a92eb2c83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, webrtc-audio-processing only provides support for the following
architectures (see src/typedefs.h from the source directory):
- x86_64
- i*86
- armel

Fixes http://autobuild.buildroot.org/results/ff777bb06eddafa71327015e1d39fe911c1439d8

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webrtc-audio-processing/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
