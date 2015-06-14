From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:35 +0200
Subject: [Buildroot] [PATCH/RFC v2 36/44]
	package/kodi-audiodecoder-vgmstream: new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-37-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-vgmstream/Config.in         |    7 +++++++
 .../kodi-audiodecoder-vgmstream.mk                    |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-audiodecoder-vgmstream/Config.in
 create mode 100644 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk

diff --git a/package/kodi-audiodecoder-vgmstream/Config.in b/package/kodi-audiodecoder-vgmstream/Config.in
new file mode 100644
index 0000000..ebf83df
--- /dev/null
+++ b/package/kodi-audiodecoder-vgmstream/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_VGMSTREAM
+	bool "kodi-audiodecoder-vgmstream"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  VGM decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.vgmstream
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
new file mode 100644
index 0000000..a888e9f
--- /dev/null
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-vgmstream
+#
+################################################################################
+
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 7723f9130957f4684eac5788ccbc2f45c39590ad
+KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,notspiff,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
+KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPLv2+
+KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = src/VGMCodec.cpp
+
+KODI_AUDIODECODER_VGMSTREAM_DEPENDENCIES = kodi-platform
+
+KODI_AUDIODECODER_VGMSTREAM_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9fc6942..c2e2d4e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -278,6 +278,7 @@ menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-snesapu/Config.in"
 	source "package/kodi-audiodecoder-stsound/Config.in"
 	source "package/kodi-audiodecoder-timidity/Config.in"
+	source "package/kodi-audiodecoder-vgmstream/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
