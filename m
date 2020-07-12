From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 10:55:05 +0200
Subject: [Buildroot] [git commit] package/freescale-imx/imx-seco: bump
 version to 3.6.3
Message-ID: <20200712085154.8B0B38682B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34c6de8f96a599f4a5038cbc744d5061625140c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with 5.4.24_2.1.0 NXP Linux BSP.
Firmware file names now include the SoC revision.

In order not to break the compatibility with the imx-seco 2.3.1
package, it remains B0 support for i.MX8QXP MEK. C0 support should
introduce a Kconfig option and this will be done in a future patch.

License was updated from:
LA_OPT_NXP_Software_License v10 December 2019
to:
LA_OPT_NXP_Software_License v11 February 2020
which explains the change of EULA/COPYING license files.

Tested-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
[Maeva: tested on i.MX8QXP MEK (Board rev D1, SoC rev B0)
and on i.MX8QM MEK (SoC rev B0)]
Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-seco/imx-seco.hash | 6 +++---
 package/freescale-imx/imx-seco/imx-seco.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
index 56f56369d4..930801e839 100644
--- a/package/freescale-imx/imx-seco/imx-seco.hash
+++ b/package/freescale-imx/imx-seco/imx-seco.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b429ac58b2ea1771b3fdf7ae87bf1d37ccaf596bde01a5ecccae27b2145f6824  imx-seco-2.3.1.bin
-sha256  69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
-sha256  6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  COPYING
+sha256  52ba07633e0f8707d8c26724b5cd03ef96444c8de1e0e134acac50acacf3e7dd  imx-seco-3.6.3.bin
+sha256  7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  EULA
+sha256  2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  COPYING
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index d06bf4c5cc..be3f3c4419 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SECO_VERSION = 2.3.1
+IMX_SECO_VERSION = 3.6.3
 IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
 IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
 
@@ -22,12 +22,12 @@ IMX_SECO_INSTALL_IMAGES = YES
 # is done in post-image script.
 ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
 define IMX_SECO_INSTALL_IMAGES_CMDS
-	cp $(@D)/firmware/seco/mx8qx-ahab-container.img \
+	cp $(@D)/firmware/seco/mx8qxb0-ahab-container.img \
 		$(BINARIES_DIR)/ahab-container.img
 endef
 else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
 define IMX_SECO_INSTALL_IMAGES_CMDS
-	cp $(@D)/firmware/seco/mx8qm-ahab-container.img \
+	cp $(@D)/firmware/seco/mx8qmb0-ahab-container.img \
 		$(BINARIES_DIR)/ahab-container.img
 endef
 endif
