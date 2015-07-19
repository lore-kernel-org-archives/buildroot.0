From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:53 +0200
Subject: [Buildroot] [PATCH/RFC v3 48/50]
	package/kodi-visualisation-waveforhue: new package
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-49-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-waveforhue/Config.in       |    6 ++++++
 .../kodi-visualisation-waveforhue.mk                  |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 24 insertions(+)
 create mode 100644 package/kodi-visualisation-waveforhue/Config.in
 create mode 100644 package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk

diff --git a/package/kodi-visualisation-waveforhue/Config.in b/package/kodi-visualisation-waveforhue/Config.in
new file mode 100644
index 0000000..9694027
--- /dev/null
+++ b/package/kodi-visualisation-waveforhue/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE
+	bool "kodi-visualisation-waveforhue"
+	help
+	  WaveForHue visualiser for Kodi
+
+	  https://github.com/notspiff/visualization.waveforhue
diff --git a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
new file mode 100644
index 0000000..d278654
--- /dev/null
+++ b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-visualisation-waveforhue
+#
+################################################################################
+
+KODI_VISUALISATION_WAVEFORHUE_VERSION = 330b5d0432a976993d8ea3e13f01ec9bd3d8b02e
+KODI_VISUALISATION_WAVEFORHUE_SITE = $(call github,notspiff,visualization.waveforhue,$(KODI_VISUALISATION_WAVEFORHUE_VERSION))
+KODI_VISUALISATION_WAVEFORHUE_LICENSE = GPLv2+
+KODI_VISUALISATION_WAVEFORHUE_LICENSE_FILES = COPYING
+
+KODI_VISUALISATION_WAVEFORHUE_DEPENDENCIES = kodi
+
+KODI_VISUALISATION_WAVEFORHUE_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6048818..946694b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -301,6 +301,7 @@ endmenu
 menu "Visualisations"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
+	source "package/kodi-visualisation-waveforhue/Config.in"
 	source "package/kodi-visualisation-waveform/Config.in"
 endmenu
 
-- 
1.7.10.4
