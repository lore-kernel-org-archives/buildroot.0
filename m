From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 27 Jul 2016 15:53:33 +0200
Subject: [Buildroot] [PATCH 4/5] imx-parser: add missing configure options
In-Reply-To: <1469627614-29709-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1469627614-29709-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1469627614-29709-5-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable hard float support when the configuration contains:
BR2_ARM_EABIHF=y

See Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/blob/krogoth/recipes-multimedia/imx-parser/imx-parser.inc

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---

Thanks to those options:
- libraries are copied from release/lib/yocto/hw instead
  of release/lib/yocto/sw.

Regards,
Gary

---
 package/freescale-imx/imx-parser/imx-parser.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
index 75fe6cc..75364ae 100644
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
-- 
2.8.1
