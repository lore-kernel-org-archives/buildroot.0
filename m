From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:16 +0200
Subject: [Buildroot] [PATCH/RFC 23/27] package/kodi-audiodecoder-snesapu:
	new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-24-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-snesapu/Config.in           |    7 +++++++
 .../kodi-audiodecoder-snesapu.mk                      |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-audiodecoder-snesapu/Config.in
 create mode 100644 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk

diff --git a/package/kodi-audiodecoder-snesapu/Config.in b/package/kodi-audiodecoder-snesapu/Config.in
new file mode 100644
index 0000000..0cb572f
--- /dev/null
+++ b/package/kodi-audiodecoder-snesapu/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_SNESAPU
+	bool "kodi-audiodecoder-snesapu"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  SPC decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.snesapu
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
new file mode 100644
index 0000000..b68305d
--- /dev/null
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-snesapu
+#
+################################################################################
+
+KODI_AUDIODECODER_SNESAPU_VERSION = 9fc775b13279567ac880f076beb9eead88747467
+KODI_AUDIODECODER_SNESAPU_SITE = $(call github,notspiff,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
+KODI_AUDIODECODER_SNESAPU_LICENSE = GPLv2+
+KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = src/SPCCodec.cpp
+
+KODI_AUDIODECODER_SNESAPU_DEPENDENCIES = kodi-platform
+
+KODI_AUDIODECODER_SNESAPU_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e86c14e..8c99457 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -295,6 +295,7 @@ if BR2_PACKAGE_KODI_AUDIO_DECODERS
 comment "Kodi audio decoders"
 
 source "package/kodi-audiodecoder-modplug/Config.in"
+source "package/kodi-audiodecoder-snesapu/Config.in"
 source "package/kodi-audiodecoder-vgmstream/Config.in"
 
 endif # BR2_PACKAGE_KODI_AUDIO_DECODERS
-- 
1.7.10.4
