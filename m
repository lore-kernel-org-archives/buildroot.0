From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:16:01 +0100
Subject: [Buildroot] [PATCH 04/14] boot/uboot.mk: Remove obsolete
	CONFIG_NOSOFTFLOAT flag
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418426171-3483-5-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This flag seems to be obsolete. There is no piece of code in the U-Boot source
tree referencing CONFIG_NOSOFTFLOAT.

Unfortunatly it's not documented here. Maybe it's about this old workaround:
http://lists.denx.de/pipermail/u-boot/2007-March/020282.html

However, this patch has been declined:
http://www.denx.de/wiki/view/U-Boot/PatchStatus?rev=1.27

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 boot/uboot/uboot.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 72603e0..1af7e52 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -58,7 +58,6 @@ endif
 
 UBOOT_ARCH = $(KERNEL_ARCH)
 
-UBOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH)
@@ -102,7 +101,7 @@ endif
 
 define UBOOT_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 $(UBOOT_SOURCE_CONFIG) $(UBOOT_DIR)/configs/buildroot_defconfig
-	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
+	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
 		buildroot_config
 	rm $(UBOOT_DIR)/configs/buildroot_defconfig
@@ -122,7 +121,7 @@ define UBOOT_CONFIGURE_CMDS
 endef
 
 define UBOOT_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
+	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
 		$(UBOOT_MAKE_TARGET)
 endef
-- 
2.1.3
