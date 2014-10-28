From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 19:35:07 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: Enable support for
	libavresample
Message-ID: <20141028183520.04DDEB1D37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3765858c590d85738154edc697aa45f2d09f86e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/Config.in |    5 +++++
 package/ffmpeg/ffmpeg.mk |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 20d5231..6fde46e 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -49,6 +49,11 @@ config BR2_PACKAGE_FFMPEG_FFSERVER
 	help
 	  FFserver is a streaming server for both audio and video.
 
+config BR2_PACKAGE_FFMPEG_AVRESAMPLE
+	bool "Build libavresample"
+	help
+	  Avresample is a audio conversion library for compatibility.
+
 config BR2_PACKAGE_FFMPEG_POSTPROC
 	bool "Build libpostproc"
 	depends on BR2_PACKAGE_FFMPEG_GPL
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 0990f18..686f50d 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -98,6 +98,12 @@ else
 FFMPEG_CONF_OPTS += --disable-ffserver
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
+FFMPEG_CONF_OPTS += --enable-avresample
+else
+FFMPEG_CONF_OPTS += --disable-avresample
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
 FFMPEG_CONF_OPTS += --enable-postproc
 else
