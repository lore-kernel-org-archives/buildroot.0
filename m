From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Jun 2017 16:04:15 +0300
Subject: [Buildroot] [PATCH] uboot-tools: drop unreferenced empty variable
Message-ID: <b0f05bfb286331e3658cd6088159a5e8cf9b8a9d.1498395855.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit log 0e0ea8cf5e2c57 (uboot-tools: install libubootenv to staging)
mentions that installation is done in <pkg>_INSTALL_STAGING_CMDS directly, but
forgot to remove the now empty UBOOT_TOOLS_INSTALL_LIBUBOOTENV.

Cc: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uboot-tools/uboot-tools.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index f6b1fc31fcd4..831d44451da4 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -68,9 +68,6 @@ define UBOOT_TOOLS_INSTALL_DUMPIMAGE
 endef
 endif
 
-define UBOOT_TOOLS_INSTALL_LIBUBOOTENV
-endef
-
 define UBOOT_TOOLS_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/tools/env/lib.a $(STAGING_DIR)/usr/lib/libubootenv.a
 	$(INSTALL) -D -m 0644 $(@D)/tools/env/fw_env.h $(STAGING_DIR)/usr/include/fw_env.h
-- 
2.11.0
