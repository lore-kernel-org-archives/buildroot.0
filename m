From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 16:38:37 +0100
Subject: [Buildroot] [git commit] boot/uboot: Remove obsolete
	CONFIG_NOSOFTFLOAT flag
Message-ID: <20150110153843.0A00580174@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67813024444c03f300a8df2148cb5b902c44d223
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This flag seems to be obsolete. There is no piece of code in the U-Boot source
tree referencing CONFIG_NOSOFTFLOAT.

Unfortunatly the use of this flag is not documented here. Maybe it's about this
old workaround:
http://lists.denx.de/pipermail/u-boot/2007-March/020282.html

However, this patch has been declined:
http://www.denx.de/wiki/view/U-Boot/PatchStatus?rev=1.27

Since no other configure options are used, remove also UBOOT_CONFIGURE_OPTS.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 8ce2fc2..a9ba054 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -58,7 +58,6 @@ endif
 
 UBOOT_ARCH = $(KERNEL_ARCH)
 
-UBOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH)
@@ -95,7 +94,7 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
 define UBOOT_CONFIGURE_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
+	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
 		$(UBOOT_BOARD_NAME)_config
 	@echo >> $(@D)/include/config.h
@@ -114,7 +113,7 @@ define UBOOT_CONFIGURE_CMDS
 endef
 
 define UBOOT_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
+	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
 		$(UBOOT_MAKE_TARGET)
 endef
