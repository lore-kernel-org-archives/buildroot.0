From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:31 +0200
Subject: [Buildroot] [PATCH/RFC v2 32/44] package/kodi-audiodecoder-sidplay:
	new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-33-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-sidplay/Config.in           |    8 ++++++++
 .../kodi-audiodecoder-sidplay.mk                      |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 26 insertions(+)
 create mode 100644 package/kodi-audiodecoder-sidplay/Config.in
 create mode 100644 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk

diff --git a/package/kodi-audiodecoder-sidplay/Config.in b/package/kodi-audiodecoder-sidplay/Config.in
new file mode 100644
index 0000000..ae99afa
--- /dev/null
+++ b/package/kodi-audiodecoder-sidplay/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_SIDPLAY
+	bool "kodi-audiodecoder-sidplay"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBSIDPLAY2
+	help
+	  Sidplay decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.sidplay
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
new file mode 100644
index 0000000..ba9a515
--- /dev/null
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-sidplay
+#
+################################################################################
+
+KODI_AUDIODECODER_SIDPLAY_VERSION = 27b2c0582878857bfe03195471fa7ffa4bcc40f0
+KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,notspiff,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
+KODI_AUDIODECODER_SIDPLAY_LICENSE = GPLv2+
+KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = src/SIDCodec.cpp
+
+KODI_AUDIODECODER_SIDPLAY_DEPENDENCIES = host-pkgconf kodi-platform libsidplay2
+
+KODI_AUDIODECODER_SIDPLAY_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f7f90eb..6283158 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -274,6 +274,7 @@ endmenu
 menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-modplug/Config.in"
 	source "package/kodi-audiodecoder-nosefart/Config.in"
+	source "package/kodi-audiodecoder-sidplay/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
