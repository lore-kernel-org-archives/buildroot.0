From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 18:54:34 +0200
Subject: [Buildroot] [RFC/PATCH v4 10/12] package/kodi-audioencoder-lame:
	New package
In-Reply-To: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413737676-25455-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-lame/Config.in               |    8 ++++++++
 .../kodi-audioencoder-lame/kodi-audioencoder-lame.mk   |   16 ++++++++++++++++
 package/kodi/Config.in                                 |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-audioencoder-lame/Config.in
 create mode 100644 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk

diff --git a/package/kodi-audioencoder-lame/Config.in b/package/kodi-audioencoder-lame/Config.in
new file mode 100644
index 0000000..78ec136
--- /dev/null
+++ b/package/kodi-audioencoder-lame/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_LAME
+	bool "kodi-audioencoder-lame"
+	select BR2_PACKAGE_LAME
+	depends on BR2_PACKAGE_KODI_OPTICALDRIVE
+	help
+	  An audioencoder addon for Kodi
+
+	  https://github.com/xbmc/audioencoder.lame
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
new file mode 100644
index 0000000..94a40bc
--- /dev/null
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# kodi-audioencoder-lame
+#
+################################################################################
+
+KODI_AUDIOENCODER_LAME_VERSION = 90fb99b8f3c876b5f3d8ecd4ea29aa1ef2dabc89
+KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
+KODI_AUDIOENCODER_LAME_LICENSE = GPLv2+
+KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
+KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
+KODI_AUDIOENCODER_LAME_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(TARGET_DIR)/usr/lib/xbmc \
+	-DLAME_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9c37765..11b88a5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -245,6 +245,7 @@ if BR2_PACKAGE_KODI_OPTICALDRIVE
 comment "Kodi audioencoder addons"
 
 source "package/kodi-audioencoder-flac/Config.in"
+source "package/kodi-audioencoder-lame/Config.in"
 
 endif # BR2_PACKAGE_KODI_OPTICALDRIVE
 
-- 
1.7.10.4
