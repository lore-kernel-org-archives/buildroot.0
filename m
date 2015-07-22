From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:31:08 +0200
Subject: [Buildroot] [PATCH 46/47] package/kodi-visualisation-spectrum: new
	package
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-47-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-spectrum/Config.in         |    6 ++++++
 .../kodi-visualisation-spectrum.mk                    |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 24 insertions(+)
 create mode 100644 package/kodi-visualisation-spectrum/Config.in
 create mode 100644 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk

diff --git a/package/kodi-visualisation-spectrum/Config.in b/package/kodi-visualisation-spectrum/Config.in
new file mode 100644
index 0000000..3b2b0a2
--- /dev/null
+++ b/package/kodi-visualisation-spectrum/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_VISUALISATION_SPECTRUM
+	bool "kodi-visualisation-spectrum"
+	help
+	  Spectrum visualiser for Kodi
+
+	  https://github.com/notspiff/visualization.spectrum
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
new file mode 100644
index 0000000..3ea5775
--- /dev/null
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-visualisation-spectrum
+#
+################################################################################
+
+KODI_VISUALISATION_SPECTRUM_VERSION = aae1960b5bc14e50914205e2dabcb51077690a64
+KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
+KODI_VISUALISATION_SPECTRUM_LICENSE = GPLv2+
+KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
+
+KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi
+
+KODI_VISUALISATION_SPECTRUM_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 631483b..6048818 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -300,6 +300,7 @@ endmenu
 
 menu "Visualisations"
 	source "package/kodi-visualisation-shadertoy/Config.in"
+	source "package/kodi-visualisation-spectrum/Config.in"
 	source "package/kodi-visualisation-waveform/Config.in"
 endmenu
 
-- 
1.7.10.4
