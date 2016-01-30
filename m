From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sat, 30 Jan 2016 12:45:50 +0100
Subject: [Buildroot] [PATCH 03/10] imx-lib: bump to version 5.1
In-Reply-To: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1454154357-31625-4-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change version to be independent of BSP version.  This limits
confusion on future BSP updates that do not include imx-lib updates.

Changelog since 3.14.28-1.0.0_ga:
- Add i.MX 7D support.
- Change LICENSE file.
- Enable pxp libraries for i.MX 6UltraLite.
- Fix rng and shara2 to exclude the 6UL platform to avoid build breaks

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/b299454
https://github.com/Freescale/meta-fsl-arm/commit/5f28af0

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-lib/imx-lib.hash | 2 +-
 package/freescale-imx/imx-lib/imx-lib.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index 85f0a40..8e4bd73 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 46022817d25f154b60247fdcbb87216e23e553bd88ec9664b1b5d5911e7aa2a2  imx-lib-3.14.28-1.0.0.tar.gz
+sha256 2b4547ffb1de328cf8997a09a423c6f015d808493efd11a98a5d42c6497e3445  imx-lib-5.1.tar.gz
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index e160cca..b49357b 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
+IMX_LIB_VERSION = 5.1
 IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
 IMX_LIB_LICENSE = LGPLv2.1+
-IMX_LIB_LICENSE_FILES = pxp/pxp_lib.h
+IMX_LIB_LICENSE_FILES = COPYING-LGPL-2.1
 
 IMX_LIB_INSTALL_STAGING = YES
 
-- 
2.6.4
