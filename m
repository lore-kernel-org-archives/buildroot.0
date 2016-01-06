From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  6 Jan 2016 14:33:18 +0100
Subject: [Buildroot] [PATCH trivial] uboot: remove unused helper function
	insert_define
Message-ID: <1452087198-28726-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Commit 16b8e813c810fde2fe3655c696edf1e76a7d27ba removed all remaining users
of helper function insert_define.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 boot/uboot/uboot.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c8c50f0..d539b31 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -89,18 +89,6 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
 
-# Helper function to fill the U-Boot config.h file.
-# Argument 1: option name
-# Argument 2: option value
-# If the option value is empty, this function does nothing.
-define insert_define
-$(if $(call qstrip,$(2)),
-	@echo "#ifdef $(strip $(1))" >> $(@D)/include/config.h
-	@echo "#undef $(strip $(1))" >> $(@D)/include/config.h
-	@echo "#endif" >> $(@D)/include/config.h
-	@echo '#define $(strip $(1)) $(call qstrip,$(2))' >> $(@D)/include/config.h)
-endef
-
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-- 
1.9.5
