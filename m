From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:16:04 +0100
Subject: [Buildroot] [PATCH 07/14] boot/uboot.mk: Make make action
	single-line
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418426171-3483-8-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cosmetic after removing and renaming of variables.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 boot/uboot/uboot.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index f1307f6..c786986 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -101,9 +101,7 @@ endif
 
 define UBOOT_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 $(UBOOT_SOURCE_CONFIG) $(UBOOT_DIR)/configs/buildroot_defconfig
-	$(TARGET_MAKE_ENV) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_FLAGS)		\
-		buildroot_config
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_FLAGS) buildroot_config
 	rm $(UBOOT_DIR)/configs/buildroot_defconfig
 	@echo >> $(@D)/include/config.h
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
@@ -121,9 +119,7 @@ define UBOOT_CONFIGURE_CMDS
 endef
 
 define UBOOT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_FLAGS) 		\
-		$(UBOOT_MAKE_TARGET)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_FLAGS) $(UBOOT_MAKE_TARGET)
 endef
 
 define UBOOT_BUILD_OMAP_IFT
-- 
2.1.3
