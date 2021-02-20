From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:29 +0100
Subject: [Buildroot] [PATCH/next 10/54]
 package/kodi-inputstream-ffmpegdirect: new package
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-ffmpegdirect/Config.in   | 13 +++++++++++++
 .../kodi-inputstream-ffmpegdirect.hash            |  3 +++
 .../kodi-inputstream-ffmpegdirect.mk              | 15 +++++++++++++++
 package/kodi/Config.in                            |  1 +
 4 files changed, 32 insertions(+)
 create mode 100644 package/kodi-inputstream-ffmpegdirect/Config.in
 create mode 100644 package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
 create mode 100644 package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk

diff --git a/package/kodi-inputstream-ffmpegdirect/Config.in b/package/kodi-inputstream-ffmpegdirect/Config.in
new file mode 100644
index 0000000000..4f246e1733
--- /dev/null
+++ b/package/kodi-inputstream-ffmpegdirect/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_KODI_INPUTSTREAM_FFMPEGDIRECT
+	bool "kodi-inputstream-ffmpegdirect"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_GPL
+	select BR2_PACKAGE_FFMPEG_POSTPROC
+	help
+	  This is a Kodi input stream addon for streams that can be
+	  opened by FFmpeg's libavformat, such as plain TS, HLS and
+	  DASH streams.
+
+	  https://github.com/xbmc/inputstream.ffmpegdirect
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
new file mode 100644
index 0000000000..ccb7291bb8
--- /dev/null
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  952eeaa7af717dd954c940feb2902b51e497cde8822222c1bfa98804ec8665c7  kodi-inputstream-ffmpegdirect-1.19.2-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
new file mode 100644
index 0000000000..80891858cf
--- /dev/null
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# kodi-inputstream-ffmpegdirect
+#
+################################################################################
+
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.19.2-Matrix
+KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
+KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
+KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
+KODI_INPUTSTREAM_FFMPEGDIRECT_DEPENDENCIES = bzip2 ffmpeg kodi
+KODI_INPUTSTREAM_FFMPEGDIRECT_CONF_OPTS = \
+	-DFFMPEG_PATH=$(STAGING_DIR)/usr
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4fc2f832ac..eefdd54990 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -303,6 +303,7 @@ endmenu
 
 menu "Inputstream addons"
 	source "package/kodi-inputstream-adaptive/Config.in"
+	source "package/kodi-inputstream-ffmpegdirect/Config.in"
 	source "package/kodi-inputstream-rtmp/Config.in"
 endmenu
 
-- 
2.29.2
