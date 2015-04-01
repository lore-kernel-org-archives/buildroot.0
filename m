From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:20 +0200
Subject: [Buildroot] [PATCH/RFC 27/27] package/kodi-audiodecoder-sidplay:
	new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-28-git-send-email-bernd.kuhls@t-online.de>
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
index 0000000..5a00869
--- /dev/null
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-sidplay
+#
+################################################################################
+
+KODI_AUDIODECODER_SIDPLAY_VERSION = f2e7d98528dfb3bfdd5dabcb5152955c9dc6979a
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
index 7240dc0..b7697ed 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -296,6 +296,7 @@ comment "Kodi audio decoders"
 
 source "package/kodi-audiodecoder-modplug/Config.in"
 source "package/kodi-audiodecoder-nosefart/Config.in"
+source "package/kodi-audiodecoder-sidplay/Config.in"
 source "package/kodi-audiodecoder-snesapu/Config.in"
 source "package/kodi-audiodecoder-stsound/Config.in"
 source "package/kodi-audiodecoder-timidity/Config.in"
-- 
1.7.10.4
