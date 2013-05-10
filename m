From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Date: Fri, 10 May 2013 10:30:11 +0200
Subject: [Buildroot] [PATCH 1/3] Add package directory freescale-imx
In-Reply-To: <1368174613-3427-1-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368174613-3427-1-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <1368174613-3427-2-git-send-email-h.fijnvandraat@inter.nl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The freescale-imx directory is intended to contain all freescale i.MXyy
related packages, together with their download site and version info

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
---
 package/Config.in                  |    1 +
 package/freescale-imx/Config.in    |   14 ++++++++++++++
 package/freescale-imx/freescale.mk |   13 +++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/freescale-imx/Config.in
 create mode 100644 package/freescale-imx/freescale.mk

diff --git a/package/Config.in b/package/Config.in
index d980871..368be44 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -212,6 +212,7 @@ source "package/xfsprogs/Config.in"
 endmenu
 
 menu "Hardware handling"
+source "package/freescale-imx/Config.in"
 menu "Misc devices firmwares"
 source "package/b43-firmware/Config.in"
 source "package/firmware-imx/Config.in"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
new file mode 100644
index 0000000..4f09ec7
--- /dev/null
+++ b/package/freescale-imx/Config.in
@@ -0,0 +1,14 @@
+comment "freescale-imx is only relevant for the i.MXxx series from Freescale"
+	depends on BR2_arm
+
+menuconfig BR2_PACKAGE_IMX
+	bool "freescale-imx"
+	depends on BR2_arm
+	help
+	  This option enables the selection of some packages specific for
+	  the i.MXxx series of processors from Freescale.
+	  freescale-imx needs an imx-specific kernel to be built
+
+
+if BR2_PACKAGE_IMX
+endif
diff --git a/package/freescale-imx/freescale.mk b/package/freescale-imx/freescale.mk
new file mode 100644
index 0000000..945c51c
--- /dev/null
+++ b/package/freescale-imx/freescale.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# freescale-imx
+#
+#############################################################
+
+IMX_VERSION_LEVEL = 1.1.0
+
+# No official download site from freescale, just this mirror
+IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
+
+include package/freescale-imx/*/*.mk
+
-- 
1.7.10.4
