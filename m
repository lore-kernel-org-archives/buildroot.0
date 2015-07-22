From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:31:07 +0200
Subject: [Buildroot] [PATCH 45/47] package/kodi-visualisation-waveform: new
	package
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-46-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-waveform/Config.in         |    6 ++++++
 .../kodi-visualisation-waveform.mk                    |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 24 insertions(+)
 create mode 100644 package/kodi-visualisation-waveform/Config.in
 create mode 100644 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk

diff --git a/package/kodi-visualisation-waveform/Config.in b/package/kodi-visualisation-waveform/Config.in
new file mode 100644
index 0000000..56f2509
--- /dev/null
+++ b/package/kodi-visualisation-waveform/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_VISUALISATION_WAVEFORM
+	bool "kodi-visualisation-waveform"
+	help
+	  Waveform visualiser for Kodi
+
+	  https://github.com/notspiff/visualization.waveform
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
new file mode 100644
index 0000000..ddf48f1
--- /dev/null
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-visualisation-waveform
+#
+################################################################################
+
+KODI_VISUALISATION_WAVEFORM_VERSION = abbdbffc5fd2dff1d627de8df3cb5a3887d1119c
+KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
+KODI_VISUALISATION_WAVEFORM_LICENSE = GPLv2+
+KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
+
+KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi
+
+KODI_VISUALISATION_WAVEFORM_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e60815c..631483b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -300,6 +300,7 @@ endmenu
 
 menu "Visualisations"
 	source "package/kodi-visualisation-shadertoy/Config.in"
+	source "package/kodi-visualisation-waveform/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
