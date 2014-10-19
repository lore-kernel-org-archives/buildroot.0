From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 18:54:36 +0200
Subject: [Buildroot] [RFC/PATCH v4 12/12] package/kodi-audioencoder-wav: New
	package
In-Reply-To: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413737676-25455-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-wav/Config.in                |    7 +++++++
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk |   15 +++++++++++++++
 package/kodi/Config.in                                 |    1 +
 3 files changed, 23 insertions(+)
 create mode 100644 package/kodi-audioencoder-wav/Config.in
 create mode 100644 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk

diff --git a/package/kodi-audioencoder-wav/Config.in b/package/kodi-audioencoder-wav/Config.in
new file mode 100644
index 0000000..d7d6d7d
--- /dev/null
+++ b/package/kodi-audioencoder-wav/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_WAV
+	bool "kodi-audioencoder-wav"
+	depends on BR2_PACKAGE_KODI_OPTICALDRIVE
+	help
+	  An audioencoder addon for XBMC
+
+	  https://github.com/xbmc/audioencoder.wav
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
new file mode 100644
index 0000000..954b90f
--- /dev/null
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# kodi-audioencoder-wav
+#
+################################################################################
+
+KODI_AUDIOENCODER_WAV_VERSION = b28ab95a89f6b2d7332692d4cf3653731342620f
+KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
+KODI_AUDIOENCODER_WAV_LICENSE = GPLv2+
+KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
+KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
+KODI_AUDIOENCODER_WAV_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(TARGET_DIR)/usr/lib/xbmc
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 3111f4e..8f05593 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -247,6 +247,7 @@ comment "Kodi audioencoder addons"
 source "package/kodi-audioencoder-flac/Config.in"
 source "package/kodi-audioencoder-lame/Config.in"
 source "package/kodi-audioencoder-vorbis/Config.in"
+source "package/kodi-audioencoder-wav/Config.in"
 
 endif # BR2_PACKAGE_KODI_OPTICALDRIVE
 
-- 
1.7.10.4
