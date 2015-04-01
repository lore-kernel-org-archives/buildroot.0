From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:15 +0200
Subject: [Buildroot] [PATCH/RFC 22/27] package/kodi-audiodecoder-modplug:
	new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-23-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-modplug/Config.in           |    8 ++++++++
 .../kodi-audiodecoder-modplug.mk                      |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 26 insertions(+)
 create mode 100644 package/kodi-audiodecoder-modplug/Config.in
 create mode 100644 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk

diff --git a/package/kodi-audiodecoder-modplug/Config.in b/package/kodi-audiodecoder-modplug/Config.in
new file mode 100644
index 0000000..0269973
--- /dev/null
+++ b/package/kodi-audiodecoder-modplug/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_MODPLUG
+	bool "kodi-audiodecoder-modplug"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBMODPLUG
+	help
+	  Modplug decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.modplug
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
new file mode 100644
index 0000000..5598f4a
--- /dev/null
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-modplug
+#
+################################################################################
+
+KODI_AUDIODECODER_MODPLUG_VERSION = c7e8ca82cc00def42452308fd3d49ec4e81b0f2b
+KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
+KODI_AUDIODECODER_MODPLUG_LICENSE = GPLv2+
+KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = src/ModplugCodec.cpp
+
+KODI_AUDIODECODER_MODPLUG_DEPENDENCIES = kodi-platform libmodplug
+
+KODI_AUDIODECODER_MODPLUG_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 63771bf..e86c14e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -294,6 +294,7 @@ if BR2_PACKAGE_KODI_AUDIO_DECODERS
 
 comment "Kodi audio decoders"
 
+source "package/kodi-audiodecoder-modplug/Config.in"
 source "package/kodi-audiodecoder-vgmstream/Config.in"
 
 endif # BR2_PACKAGE_KODI_AUDIO_DECODERS
-- 
1.7.10.4
