From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 19:58:29 +0100
Subject: [Buildroot] [git commit] package/kodi-audioencoder-wav: New package
Message-ID: <20141227185849.C5E197FD02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7863cfe0d27d31e5d542ce05312464dc48bc28fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: removed dependency on BR2_PACKAGE_KODI_OPTICALDRIVE from the
package Config.in, since it is already only included if
BR2_PACKAGE_KODI_OPTICALDRIVE is enabled.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audioencoder-wav/Config.in            |    6 ++++++
 .../kodi-audioencoder-wav/kodi-audioencoder-wav.mk |   15 +++++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/kodi-audioencoder-wav/Config.in b/package/kodi-audioencoder-wav/Config.in
new file mode 100644
index 0000000..6813f02
--- /dev/null
+++ b/package/kodi-audioencoder-wav/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_WAV
+	bool "kodi-audioencoder-wav"
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
index 486dfda..41f7798 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -247,6 +247,7 @@ comment "Kodi audioencoder addons"
 source "package/kodi-audioencoder-flac/Config.in"
 source "package/kodi-audioencoder-lame/Config.in"
 source "package/kodi-audioencoder-vorbis/Config.in"
+source "package/kodi-audioencoder-wav/Config.in"
 
 endif # BR2_PACKAGE_KODI_OPTICALDRIVE
 
