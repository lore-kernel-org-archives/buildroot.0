From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:28:13 +0100
Subject: [Buildroot] [PATCH v3 4/4] libfslparser: add missing configure
	options
In-Reply-To: <1458138493-12172-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458138493-12172-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458138493-12172-5-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable hard float support when the proper configuration is setup.
BR2_ARM_EABIHF=y

See Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-multimedia/libfslparser/libfslparser.inc

Tested with Linaro ARM 2015.11 toolchain.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---

Thanks to those options:
- libraries are copied from release/lib/yocto/hw instead
  of release/lib/yocto/sw.

Regards,
Gary

---
 package/libfslparser/libfslparser.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 62c6053..586a956 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -13,6 +13,10 @@ LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLPARSER_LICENSE_FILES = EULA COPYING
 LIBFSLPARSER_REDISTRIBUTE = NO
 
+ifeq ($(BR2_ARM_EABIHF),y)
+LIBFSLPARSER_CONF_OPTS += --enable-fhw
+endif
+
 define LIBFSLPARSER_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLPARSER_SOURCE))
 endef
-- 
2.7.0
