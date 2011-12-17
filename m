From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Dec 2011 22:31:51 +0100
Subject: [Buildroot] [git commit] uboot-tools: fix install commands
Message-ID: <20111218210431.A71918FA93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54b2f131067003fc53240b9bd4497a25c145591a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Henri Bragge <henri.bragge@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
