From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:03:07 +0100
Subject: [Buildroot] [PATCH 23/28] package/kodi-audiodecoder-opus: new
	package
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-24-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-opus/Config.in                 | 10 ++++++++++
 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk | 13 +++++++++++++
 package/kodi/Config.in                                   |  1 +
 3 files changed, 24 insertions(+)
 create mode 100644 package/kodi-audiodecoder-opus/Config.in
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
index 216e730..86bd40d 100644
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
