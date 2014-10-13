From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Oct 2014 19:45:52 +0200
Subject: [Buildroot] [PATCH v2 2/7] package/ffmpeg: Enable support for
	libavresample
In-Reply-To: <1413222357-8299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413222357-8299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413222357-8299-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/Config.in |    5 +++++
 package/ffmpeg/ffmpeg.mk |    6 ++++++
 2 files changed, 11 insertions(+)

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
index af4e1f6..0493385 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -104,6 +104,12 @@ else
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
-- 
1.7.10.4
