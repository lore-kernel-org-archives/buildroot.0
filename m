From: Anton Leontiev <aleontiev@elvees.com>
Date: Sun,  4 Oct 2020 15:55:38 +0300
Subject: [Buildroot] [PATCH] package/uboot-tools: create /var/lock directory
 for fw_printenv
Message-ID: <20201004125538.15161-1-aleontiev@elvees.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fw_setenv/fw_printenv create lock-files in /var/lock. If this directory
doesn't exist tools fail with following error:

  Error opening lock file /var/lock/fw_printenv.lock

Signed-off-by: Anton Leontiev <aleontiev@elvees.com>
---
 package/uboot-tools/uboot-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index a06c25998f..578702f04e 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -65,6 +65,7 @@ ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)
 define UBOOT_TOOLS_INSTALL_FWPRINTENV
 	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(TARGET_DIR)/usr/sbin/fw_printenv
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/lock
 endef
 endif
 
-- 
2.25.0
