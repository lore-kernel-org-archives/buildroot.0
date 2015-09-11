From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 11 Sep 2015 11:39:41 +0200
Subject: [Buildroot] [PATCH v2 02/14] imx-kobs: add new package
In-Reply-To: <1441964394-3817-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1441964394-3817-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1441964394-3817-3-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on the Yocto 3.14.28-1.0.0_ga update:
https://github.com/Freescale/meta-fsl-arm/commit/6c44744

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi,

This package has only been built as I have no i.MX device that has a
NAND Flash.

Regards,
Gary
---
 package/freescale-imx/Config.in              |  1 +
 package/freescale-imx/imx-kobs/Config.in     | 10 ++++++++++
 package/freescale-imx/imx-kobs/imx-kobs.hash |  2 ++
 package/freescale-imx/imx-kobs/imx-kobs.mk   | 12 ++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/freescale-imx/imx-kobs/Config.in
 create mode 100644 package/freescale-imx/imx-kobs/imx-kobs.hash
 create mode 100644 package/freescale-imx/imx-kobs/imx-kobs.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index dffe76f..a958dbd 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -42,6 +42,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 
+source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
diff --git a/package/freescale-imx/imx-kobs/Config.in b/package/freescale-imx/imx-kobs/Config.in
new file mode 100644
index 0000000..fc2344e
--- /dev/null
+++ b/package/freescale-imx/imx-kobs/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_IMX_KOBS
+	bool "imx-kobs"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  The imx-kobs tool is used for writing images to NAND on i.MX
+	  platforms.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
+
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
new file mode 100644
index 0000000..13373ea
--- /dev/null
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 cfac042f5c96731205c397a4a6b3ed966f804569ae4d0e2685d22fdf6bdc9eb7  imx-kobs-3.14.28-1.0.0.tar.gz
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
new file mode 100644
index 0000000..02c5cad
--- /dev/null
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# imx-kobs
+#
+################################################################################
+
+IMX_KOBS_VERSION = $(FREESCALE_IMX_VERSION)
+IMX_KOBS_SITE = $(FREESCALE_IMX_SITE)
+IMX_KOBS_LICENSE = GPLv2+
+IMX_KOBS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.5.1
