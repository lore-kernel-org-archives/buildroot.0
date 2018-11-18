From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Nov 2018 20:35:12 +0100
Subject: [Buildroot] [PATCH 2/2] imx-uuc: install ufb
In-Reply-To: <20181118193512.11215-1-fontaine.fabrice@gmail.com>
References: <20181118193512.11215-1-fontaine.fabrice@gmail.com>
Message-ID: <20181118193512.11215-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to 79e9798eee9cd972d92ed2b18f170de856d153c9 added the new ufb
daemon through the following commit:
https://github.com/NXPmicro/imx-uuc/commit/ce808f3010ec73ccc07775c6cfd5317807a22415

So install ufb on target

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freescale-imx/imx-uuc/imx-uuc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
index bdfa51b171..52d2b7c7a3 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.mk
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -20,6 +20,7 @@ endef
 define IMX_UUC_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/uuc $(TARGET_DIR)/usr/bin/uuc
 	$(INSTALL) -D -m 755 $(@D)/sdimage $(TARGET_DIR)/usr/bin/sdimage
+	$(INSTALL) -D -m 755 $(@D)/ufb $(TARGET_DIR)/usr/bin/ufb
 	dd if=/dev/zero of=$(TARGET_DIR)/fat bs=1M count=1
 	$(HOST_DIR)/sbin/mkfs.vfat $(TARGET_DIR)/fat
 endef
-- 
2.17.1
