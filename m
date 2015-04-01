From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:17 +0200
Subject: [Buildroot] [PATCH/RFC 24/27] package/kodi-audiodecoder-nosefart:
	new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-25-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-nosefart/Config.in          |    7 +++++++
 .../kodi-audiodecoder-nosefart.mk                     |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-audiodecoder-nosefart/Config.in
 create mode 100644 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk

diff --git a/package/kodi-audiodecoder-nosefart/Config.in b/package/kodi-audiodecoder-nosefart/Config.in
new file mode 100644
index 0000000..96591aa
--- /dev/null
+++ b/package/kodi-audiodecoder-nosefart/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_NOSEFART
+	bool "kodi-audiodecoder-nosefart"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Nosefart decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.nosefart
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
new file mode 100644
index 0000000..663a58f
--- /dev/null
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-nosefart
+#
+################################################################################
+
+KODI_AUDIODECODER_NOSEFART_VERSION = c77e5a126a89ed6923d96dce8bce9473685b059d
+KODI_AUDIODECODER_NOSEFART_SITE = $(call github,notspiff,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
+KODI_AUDIODECODER_NOSEFART_LICENSE = GPLv2+
+KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = src/NSFCodec.cpp
+
+KODI_AUDIODECODER_NOSEFART_DEPENDENCIES = kodi-platform
+
+KODI_AUDIODECODER_NOSEFART_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 8c99457..797e883 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -295,6 +295,7 @@ if BR2_PACKAGE_KODI_AUDIO_DECODERS
 comment "Kodi audio decoders"
 
 source "package/kodi-audiodecoder-modplug/Config.in"
+source "package/kodi-audiodecoder-nosefart/Config.in"
 source "package/kodi-audiodecoder-snesapu/Config.in"
 source "package/kodi-audiodecoder-vgmstream/Config.in"
 
-- 
1.7.10.4
