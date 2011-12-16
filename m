From: Henri Bragge <henri.bragge@gmail.com>
Date: Fri, 16 Dec 2011 22:08:59 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix install commands
Message-ID: <1324066139-1913-1-git-send-email-henri.bragge@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Henri Bragge <henri.bragge@gmail.com>
---
 package/uboot-tools/uboot-tools.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index e20560a..00592d6 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -13,13 +13,13 @@ endef
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE),y)
 define UBOOT_TOOLS_INSTALL_MKIMAGE
-	install -m 0755 -D $(@D)/tools/mkimage $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(TARGET_DIR)/usr/bin/mkimage
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)
 define UBOOT_TOOLS_INSTALL_FWPRINTENV
-	install -m 0755 -D $(@D)/tools/env/fw_printenv $(TARGET_DIR)/usr/sbin
+	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(TARGET_DIR)/usr/sbin/fw_printenv
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 endef
 endif
@@ -48,7 +48,7 @@ define HOST_UBOOT_TOOLS_BUILD_CMDS
 endef
 
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
-	install -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin/mkimage
 endef
 
 $(eval $(call GENTARGETS))
-- 
1.7.8
