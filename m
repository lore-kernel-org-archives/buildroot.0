From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:31 +0100
Subject: [Buildroot] [PATCH/next 26/31] package/kodi-audiodecoder-opus: new
	package
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-opus/Config.in                   | 10 ++++++++++
 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash |  2 ++
 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk   | 13 +++++++++++++
 package/kodi/Config.in                                     |  1 +
 4 files changed, 26 insertions(+)
 create mode 100644 package/kodi-audiodecoder-opus/Config.in
 create mode 100644 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
 create mode 100644 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk

diff --git a/package/kodi-audiodecoder-opus/Config.in b/package/kodi-audiodecoder-opus/Config.in
new file mode 100644
index 0000000..12d7247
--- /dev/null
+++ b/package/kodi-audiodecoder-opus/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_OPUS
+	bool "kodi-audiodecoder-opus"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_OPUS
+	select BR2_PACKAGE_OPUSFILE
+	help
+	  Opus audio decoder for Kodi
+
+	  https://github.com/notspiff/audiodecoder.opus
diff --git a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
new file mode 100644
index 0000000..fa60ce5
--- /dev/null
+++ b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 74b5736aa21d9cfb8fa835c1dc9cca47817cdb3867f99f5c6aee655f0df476ad kodi-audiodecoder-opus-0bd11e35e6ed8b6480e4100ac8927113cb085eda.tar.gz
diff --git a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
new file mode 100644
index 0000000..efe17f3
--- /dev/null
+++ b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-audiodecoder-opus
+#
+################################################################################
+
+KODI_AUDIODECODER_OPUS_VERSION = 0bd11e35e6ed8b6480e4100ac8927113cb085eda
+KODI_AUDIODECODER_OPUS_SITE = $(call github,notspiff,audiodecoder.opus,$(KODI_AUDIODECODER_OPUS_VERSION))
+KODI_AUDIODECODER_OPUS_LICENSE = GPLv2+
+KODI_AUDIODECODER_OPUS_LICENSE_FILES = src/OpusCodec.cpp
+KODI_AUDIODECODER_OPUS_DEPENDENCIES = kodi-platform libogg opus opusfile
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index daed533..8f44581 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -228,6 +228,7 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-modplug/Config.in"
 	source "package/kodi-audiodecoder-nosefart/Config.in"
+	source "package/kodi-audiodecoder-opus/Config.in"
 	source "package/kodi-audiodecoder-sidplay/Config.in"
 	source "package/kodi-audiodecoder-snesapu/Config.in"
 	source "package/kodi-audiodecoder-stsound/Config.in"
-- 
2.7.0
