From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Aug 2016 22:07:01 +0200
Subject: [Buildroot] [git commit] imx-parser: add missing configure options
Message-ID: <20160803200947.8250381E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae753a6403265a466b05fcc5bb125d97c5d573ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable hard float support when the configuration contains:
BR2_ARM_EABIHF=y

See Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/blob/krogoth/recipes-multimedia/imx-parser/imx-parser.inc

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-parser/imx-parser.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
index 7dd1402..e579789 100644
--- a/package/freescale-imx/imx-parser/imx-parser.mk
+++ b/package/freescale-imx/imx-parser/imx-parser.mk
@@ -13,6 +13,12 @@ IMX_PARSER_LICENSE = NXP Semiconductor Software License Agreement
 IMX_PARSER_LICENSE_FILES = EULA COPYING
 IMX_PARSER_REDISTRIBUTE = NO
 
+ifeq ($(BR2_ARM_EABIHF),y)
+IMX_PARSER_CONF_OPTS += --enable-fhw
+else
+IMX_PARSER_CONF_OPTS += --enable-fsw
+endif
+
 define IMX_PARSER_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_PARSER_SOURCE))
 endef
