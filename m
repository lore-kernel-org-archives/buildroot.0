From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:30 +0200
Subject: [Buildroot] [PATCH/RFC v2 31/44]
	package/kodi-audiodecoder-nosefart: new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-32-git-send-email-bernd.kuhls@t-online.de>
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
index 0000000..b849e76
--- /dev/null
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-nosefart
+#
+################################################################################
+
+KODI_AUDIODECODER_NOSEFART_VERSION = 936313f2be5c4936af8a643876363dcea76a8ebe
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
index 968e57a..f7f90eb 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -273,6 +273,7 @@ endmenu
 
 menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-modplug/Config.in"
+	source "package/kodi-audiodecoder-nosefart/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
