From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:16:03 +0100
Subject: [Buildroot] [PATCH 06/14] boot/uboot.mk: Replace UBOOT_MAKE_OPTS
	with UBOOT_MAKE_FLAGS
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418426171-3483-7-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is just cosmetic to be consistent with the other Kconfig packages
which name the variable UBOOT_MAKE_FLAGS instead of UBOOT_MAKE_OPTS.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 boot/uboot/uboot.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index f1d40a1..f1307f6 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -58,7 +58,7 @@ endif
 
 UBOOT_ARCH = $(KERNEL_ARCH)
 
-UBOOT_MAKE_OPTS += \
+UBOOT_MAKE_FLAGS += \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH)
 
@@ -102,7 +102,7 @@ endif
 define UBOOT_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 $(UBOOT_SOURCE_CONFIG) $(UBOOT_DIR)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
+		$(MAKE) -C $(@D) $(UBOOT_MAKE_FLAGS)		\
 		buildroot_config
 	rm $(UBOOT_DIR)/configs/buildroot_defconfig
 	@echo >> $(@D)/include/config.h
@@ -122,7 +122,7 @@ endef
 
 define UBOOT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
+		$(MAKE) -C $(@D) $(UBOOT_MAKE_FLAGS) 		\
 		$(UBOOT_MAKE_TARGET)
 endef
 
-- 
2.1.3
