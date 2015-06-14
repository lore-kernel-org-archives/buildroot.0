From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:32 +0200
Subject: [Buildroot] [PATCH/RFC v2 33/44] package/kodi-audiodecoder-snesapu:
	new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-34-git-send-email-bernd.kuhls@t-online.de>
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
index 0000000..6d433d7
--- /dev/null
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-snesapu
+#
+################################################################################
+
+KODI_AUDIODECODER_SNESAPU_VERSION = 399d1d3f32fe6f62f5657b8ce67c30229629cb51
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
index 6283158..728ed5a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -275,6 +275,7 @@ menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-modplug/Config.in"
 	source "package/kodi-audiodecoder-nosefart/Config.in"
 	source "package/kodi-audiodecoder-sidplay/Config.in"
+	source "package/kodi-audiodecoder-snesapu/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
