From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 21:56:55 +0100
Subject: [Buildroot] [git commit] imx-uuc: install ufb
Message-ID: <20181118205423.A3DDE83A11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e5fceeb062e12f8fa0222dc0dc2129a97f96044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bump to 79e9798eee9cd972d92ed2b18f170de856d153c9 added the new ufb
daemon through the following commit:
https://github.com/NXPmicro/imx-uuc/commit/ce808f3010ec73ccc07775c6cfd5317807a22415

So install ufb on target

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
