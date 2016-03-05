From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:48:48 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-fishbmc: new
	package
Message-ID: <20160305144959.35E6C7FF2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3318758c56e2d29aae877f99eaf646b04dde68c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-visualisation-fishbmc/Config.in                | 10 ++++++++++
 .../kodi-visualisation-fishbmc.hash                         |  2 ++
 .../kodi-visualisation-fishbmc.mk                           | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 4 files changed, 26 insertions(+)

diff --git a/package/kodi-visualisation-fishbmc/Config.in b/package/kodi-visualisation-fishbmc/Config.in
new file mode 100644
index 0000000..9f1a4c5
--- /dev/null
+++ b/package/kodi-visualisation-fishbmc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_VISUALISATION_FISHBMC
+	bool "kodi-visualisation-fishbmc"
+	depends on BR2_PACKAGE_KODI_GL
+	help
+	  Fische visualiser for Kodi
+
+	  https://github.com/notspiff/visualization.fishbmc
+
+comment "fishbmc needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
new file mode 100644
index 0000000..6a65a58
--- /dev/null
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 7047d501942bcd5095e0f1424f003caec8eb792b59d16d16ad25f14829844e50 kodi-visualisation-fishbmc-50c38c296a62e096a2216e43b86d864ee265c506.tar.gz
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
new file mode 100644
index 0000000..1e07774
--- /dev/null
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-visualisation-fishbmc
+#
+################################################################################
+
+KODI_VISUALISATION_FISHBMC_VERSION = 50c38c296a62e096a2216e43b86d864ee265c506
+KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
+KODI_VISUALISATION_FISHBMC_LICENSE = GPLv2+
+KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
+KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 37f962d..f37e78a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -279,6 +279,7 @@ menu "Screensavers"
 endmenu
 
 menu "Visualisations"
+	source "package/kodi-visualisation-fishbmc/Config.in"
 	source "package/kodi-visualisation-goom/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
