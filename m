From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Nov 2014 15:53:46 +0100
Subject: [Buildroot] [RFC/PATCH v5 13/13] package/kodi-audioencoder-wav: New
	package
In-Reply-To: <1415458426-23645-1-git-send-email-bernd.kuhls@t-online.de>
References: <1415458426-23645-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1415458426-23645-14-git-send-email-bernd.kuhls@t-online.de>
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
index 0000000..93012b6
--- /dev/null
+++ b/package/kodi-audioencoder-wav/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_WAV
+	bool "kodi-audioencoder-wav"
+	depends on BR2_PACKAGE_KODI_OPTICALDRIVE
+	help
+	  An audioencoder addon for Kodi
+
+	  https://github.com/xbmc/audioencoder.wav
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
new file mode 100644
index 0000000..06803f2
--- /dev/null
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# kodi-audioencoder-wav
+#
+################################################################################
+
+KODI_AUDIOENCODER_WAV_VERSION = 40aaedfa1cd9c75749c82f6e1bd7c42ef61fdb38
+KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
+KODI_AUDIOENCODER_WAV_LICENSE = GPLv2+
+KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
+KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
+KODI_AUDIOENCODER_WAV_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
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
