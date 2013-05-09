From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Date: Thu,  9 May 2013 19:41:53 +0200
Subject: [Buildroot] [PATCH 1/4] Create package/freescale-imx directory With
	current version and download site
In-Reply-To: <1368121316-3645-1-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368121316-3645-1-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <1368121316-3645-2-git-send-email-h.fijnvandraat@inter.nl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
---
 package/freescale-imx/Config.in    |   16 ++++++++++++++++
 package/freescale-imx/freescale.mk |   13 +++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 package/freescale-imx/Config.in
 create mode 100644 package/freescale-imx/freescale.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
new file mode 100644
index 0000000..8d0e347
--- /dev/null
+++ b/package/freescale-imx/Config.in
@@ -0,0 +1,16 @@
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
+source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/firmware-imx/Config.in"
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
