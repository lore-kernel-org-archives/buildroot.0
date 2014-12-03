From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 23:20:37 +0100
Subject: [Buildroot] [git commit] ffmpeg: Add ffprobe option
Message-ID: <20141203222237.B14317FBBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b3b4f23317cf6b2bab4cc12a0bce9b2ceb27fdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/Config.in |    6 ++++++
 package/ffmpeg/ffmpeg.mk |    7 ++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 6fde46e..5f86f52 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -49,6 +49,12 @@ config BR2_PACKAGE_FFMPEG_FFSERVER
 	help
 	  FFserver is a streaming server for both audio and video.
 
+config BR2_PACKAGE_FFMPEG_FFPROBE
+	bool "Build ffprobe"
+	help
+	  FFprobe is a utility to determine the audio and video
+	  characteristics of a container file.
+
 config BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	bool "Build libavresample"
 	help
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 22577e6..784d8b3 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -23,7 +23,6 @@ FFMPEG_CONF_OPTS = \
 	--enable-logging \
 	--enable-optimizations \
 	--disable-extra-warnings \
-	--disable-ffprobe \
 	--enable-avdevice \
 	--enable-avcodec \
 	--enable-avformat \
@@ -104,6 +103,12 @@ else
 FFMPEG_CONF_OPTS += --disable-avresample
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG_FFPROBE),y)
+FFMPEG_CONF_OPTS += --enable-ffprobe
+else
+FFMPEG_CONF_OPTS += --disable-ffprobe
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
 FFMPEG_CONF_OPTS += --enable-postproc
 else
