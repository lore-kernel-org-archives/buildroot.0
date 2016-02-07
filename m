From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:03:05 +0100
Subject: [Buildroot] [PATCH 21/28] package/kodi-visualisation-fountain: new
	package
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-22-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-fountain/Config.in                 | 11 +++++++++++
 .../kodi-visualisation-fountain.mk                            | 11 +++++++++++
 package/kodi/Config.in                                        |  1 +
 3 files changed, 23 insertions(+)
 create mode 100644 package/kodi-visualisation-fountain/Config.in
 create mode 100644 package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk

diff --git a/package/kodi-visualisation-fountain/Config.in b/package/kodi-visualisation-fountain/Config.in
new file mode 100644
index 0000000..2c52edd
--- /dev/null
+++ b/package/kodi-visualisation-fountain/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN
+	bool "kodi-visualisation-fountain"
+	depends on BR2_PACKAGE_KODI_GL # libsoil
+	select BR2_PACKAGE_LIBSOIL
+	help
+	  Fountain visualization for Kodi
+
+	  https://github.com/notspiff/visualization.fountain
+
+comment "fountain needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
new file mode 100644
index 0000000..5684402
--- /dev/null
+++ b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# kodi-visualisation-fountain
+#
+################################################################################
+
+KODI_VISUALISATION_FOUNTAIN_VERSION = f22deacd2396a204694d346f85369ea9ea70e16f
+KODI_VISUALISATION_FOUNTAIN_SITE = $(call github,notspiff,visualization.fountain,$(KODI_VISUALISATION_FOUNTAIN_VERSION))
+KODI_VISUALISATION_FOUNTAIN_DEPENDENCIES = kodi libsoil
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index c60b3ff..258a44d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -279,6 +279,7 @@ endmenu
 
 menu "Visualisations"
 	source "package/kodi-visualisation-fishbmc/Config.in"
+	source "package/kodi-visualisation-fountain/Config.in"
 	source "package/kodi-visualisation-goom/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
-- 
2.7.0
