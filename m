From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:50:12 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-fountain: new
	package
Message-ID: <20160305145056.38C8B80E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2c505622a5e3c18a5b72aeeeb74d5619a5bc20f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-visualisation-fountain/Config.in                 | 11 +++++++++++
 .../kodi-visualisation-fountain.hash                          |  2 ++
 .../kodi-visualisation-fountain.mk                            | 11 +++++++++++
 package/kodi/Config.in                                        |  1 +
 4 files changed, 25 insertions(+)

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
diff --git a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
new file mode 100644
index 0000000..8dc933e
--- /dev/null
+++ b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 7b2867f415f22e4bc4ba834034f00117fcf76774aea0afc7bf30b5f2d1991dd7 kodi-visualisation-fountain-f22deacd2396a204694d346f85369ea9ea70e16f.tar.gz
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
index f37e78a..ff6a3e6 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -280,6 +280,7 @@ endmenu
 
 menu "Visualisations"
 	source "package/kodi-visualisation-fishbmc/Config.in"
+	source "package/kodi-visualisation-fountain/Config.in"
 	source "package/kodi-visualisation-goom/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
