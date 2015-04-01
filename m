From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:18 +0200
Subject: [Buildroot] [PATCH/RFC 25/27] package/kodi-audiodecoder-stsound:
	new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-26-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-stsound/Config.in           |    7 +++++++
 .../kodi-audiodecoder-stsound.mk                      |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-audiodecoder-stsound/Config.in
 create mode 100644 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk

diff --git a/package/kodi-audiodecoder-stsound/Config.in b/package/kodi-audiodecoder-stsound/Config.in
new file mode 100644
index 0000000..6be216a
--- /dev/null
+++ b/package/kodi-audiodecoder-stsound/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_STSOUND
+	bool "kodi-audiodecoder-stsound"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  YM decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.stsound
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
new file mode 100644
index 0000000..cff8bc7
--- /dev/null
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-stsound
+#
+################################################################################
+
+KODI_AUDIODECODER_STSOUND_VERSION = 775c858d82bced9b2bf6fe12fc1c9bfcb3de8c4c
+KODI_AUDIODECODER_STSOUND_SITE = $(call github,notspiff,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
+KODI_AUDIODECODER_STSOUND_LICENSE = GPLv2+
+KODI_AUDIODECODER_STSOUND_LICENSE_FILES = src/YMCodec.cpp
+
+KODI_AUDIODECODER_STSOUND_DEPENDENCIES = kodi-platform
+
+KODI_AUDIODECODER_STSOUND_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 797e883..0a98960 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -297,6 +297,7 @@ comment "Kodi audio decoders"
 source "package/kodi-audiodecoder-modplug/Config.in"
 source "package/kodi-audiodecoder-nosefart/Config.in"
 source "package/kodi-audiodecoder-snesapu/Config.in"
+source "package/kodi-audiodecoder-stsound/Config.in"
 source "package/kodi-audiodecoder-vgmstream/Config.in"
 
 endif # BR2_PACKAGE_KODI_AUDIO_DECODERS
-- 
1.7.10.4
