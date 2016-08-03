From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Aug 2016 21:59:09 +0200
Subject: [Buildroot] [git commit] imx-codec: add missing configure options
Message-ID: <20160803200947.6620A81E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c112ddd30464930d99b73b471e5173fa0ee81d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable VPU and hard float support when the configuration contains:
BR2_ARM_EABIHF=y
BR2_PACKAGE_IMX_VPU=y

See Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/blob/krogoth/recipes-multimedia/imx-codec/imx-codec.inc

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-codec/imx-codec.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 2577cf8..4840872 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -13,6 +13,14 @@ IMX_CODEC_LICENSE = NXP Semiconductor Software License Agreement, BSD-3c (flac,
 IMX_CODEC_LICENSE_FILES = EULA COPYING
 IMX_CODEC_REDISTRIBUTE = NO
 
+ifeq ($(BR2_ARM_EABIHF),y)
+IMX_CODEC_CONF_OPTS += --enable-fhw
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_VPU),y)
+IMX_CODEC_CONF_OPTS += --enable-vpu
+endif
+
 define IMX_CODEC_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_CODEC_SOURCE))
 endef
