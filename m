From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:19 +0200
Subject: [Buildroot] [PATCH/RFC 26/27] package/kodi-audiodecoder-timidity:
	new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-timidity/Config.in          |    7 +++++++
 .../kodi-audiodecoder-timidity.mk                     |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-audiodecoder-timidity/Config.in
 create mode 100644 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk

diff --git a/package/kodi-audiodecoder-timidity/Config.in b/package/kodi-audiodecoder-timidity/Config.in
new file mode 100644
index 0000000..8f604ad
--- /dev/null
+++ b/package/kodi-audiodecoder-timidity/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_TIMIDITY
+	bool "kodi-audiodecoder-timidity"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Timidity decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.timidity
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
new file mode 100644
index 0000000..84ac37e
--- /dev/null
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-timidity
+#
+################################################################################
+
+KODI_AUDIODECODER_TIMIDITY_VERSION = bf9ff93d544ddbdbf1228442e9b7c2ca7a14ef42
+KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,notspiff,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
+KODI_AUDIODECODER_TIMIDITY_LICENSE = GPLv2+
+KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
+
+KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi-platform
+
+KODI_AUDIODECODER_TIMIDITY_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 0a98960..7240dc0 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -298,6 +298,7 @@ source "package/kodi-audiodecoder-modplug/Config.in"
 source "package/kodi-audiodecoder-nosefart/Config.in"
 source "package/kodi-audiodecoder-snesapu/Config.in"
 source "package/kodi-audiodecoder-stsound/Config.in"
+source "package/kodi-audiodecoder-timidity/Config.in"
 source "package/kodi-audiodecoder-vgmstream/Config.in"
 
 endif # BR2_PACKAGE_KODI_AUDIO_DECODERS
-- 
1.7.10.4
