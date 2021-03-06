From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:51 +0100
Subject: [Buildroot] [git commit branch/next]
 package/kodi-visualisation-matrix: new package
Message-ID: <20210306213556.96D238183D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a806340de26dc6cd805e97698302ee1da94cdb61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-matrix/Config.in                 |  7 +++++++
 .../kodi-visualisation-matrix.hash                          |  3 +++
 .../kodi-visualisation-matrix/kodi-visualisation-matrix.mk  | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 4 files changed, 24 insertions(+)

diff --git a/package/kodi-visualisation-matrix/Config.in b/package/kodi-visualisation-matrix/Config.in
new file mode 100644
index 0000000000..db01f15231
--- /dev/null
+++ b/package/kodi-visualisation-matrix/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_VISUALISATION_MATRIX
+	bool "kodi-visualisation-matrix"
+	select BR2_PACKAGE_GLM
+	help
+	  Matrix themed visualization addon for Kodi
+
+	  https://github.com/xbmc/visualization.matrix
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
new file mode 100644
index 0000000000..38b9311d6e
--- /dev/null
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  fc5c4790cbf957dbf8d504ae7c43eaeca122fde6423f1135029ff053135f8fd0  kodi-visualisation-matrix-1.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
new file mode 100644
index 0000000000..153c1c15b1
--- /dev/null
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-visualisation-matrix
+#
+################################################################################
+
+KODI_VISUALISATION_MATRIX_VERSION = 1.0.0-Matrix
+KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,$(KODI_VISUALISATION_MATRIX_VERSION))
+KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
+KODI_VISUALISATION_MATRIX_LICENSE_FILES = LICENSE.md
+KODI_VISUALISATION_MATRIX_DEPENDENCIES = glm kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a104ba53c3..01d068da44 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -355,6 +355,7 @@ endmenu
 menu "Visualisations"
 	source "package/kodi-visualisation-fishbmc/Config.in"
 	source "package/kodi-visualisation-goom/Config.in"
+	source "package/kodi-visualisation-matrix/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
 	source "package/kodi-visualisation-starburst/Config.in"
