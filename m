From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 16:06:25 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-starburst: new
 package
Message-ID: <20200315145337.C87F088078@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26293479c4baa48c1524d4be215e8e927c744714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-starburst/Config.in              |  7 +++++++
 .../kodi-visualisation-starburst.hash                       |  3 +++
 .../kodi-visualisation-starburst.mk                         | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 4 files changed, 24 insertions(+)

diff --git a/package/kodi-visualisation-starburst/Config.in b/package/kodi-visualisation-starburst/Config.in
new file mode 100644
index 0000000000..af9eee7a47
--- /dev/null
+++ b/package/kodi-visualisation-starburst/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_VISUALISATION_STARBURST
+	bool "kodi-visualisation-starburst"
+	select BR2_PACKAGE_GLM
+	help
+	  StarBurst visualization for Kodi
+
+	  https://github.com/xbmc/visualization.starburst
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
new file mode 100644
index 0000000000..354ff80cb0
--- /dev/null
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 8e2ee8b39fe1c0daa24b11a9c4a175a85fdbdf7dc1bc48a1ab4876edeb6f676f  kodi-visualisation-starburst-2.0.2-Leia.tar.gz
+sha256 2e668b3da2f061a6d6ecc3cb96bdfb0f8fc9cc98c9e9f95454bc45b88708690f  debian/copyright
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
new file mode 100644
index 0000000000..9f1137d12c
--- /dev/null
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-visualisation-starburst
+#
+################################################################################
+
+KODI_VISUALISATION_STARBURST_VERSION = 2.0.2-Leia
+KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
+KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
+KODI_VISUALISATION_STARBURST_LICENSE_FILES = debian/copyright
+KODI_VISUALISATION_STARBURST_DEPENDENCIES = glm kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index b9eea78d57..fd08f3de61 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -384,6 +384,7 @@ menu "Visualisations"
 	source "package/kodi-visualisation-goom/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
+	source "package/kodi-visualisation-starburst/Config.in"
 	source "package/kodi-visualisation-waveform/Config.in"
 endmenu
 
