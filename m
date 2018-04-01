From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 07:54:59 +0200
Subject: [Buildroot] [git commit] boot/*/*.mk: fix code style
Message-ID: <20180401055510.3EF41813AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9f6e1a329a9ad5044bbeb0ee32c71a0adff2c65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use only one space before backslash.
Indent with tabs.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/lpc32xxcdl/lpc32xxcdl.mk |  8 ++++----
 boot/syslinux/syslinux.mk     |  2 +-
 boot/uboot/uboot.mk           | 14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
index 04c1c7f060..30afed050b 100644
--- a/boot/lpc32xxcdl/lpc32xxcdl.mk
+++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
@@ -33,10 +33,10 @@ LPC32XXCDL_S1L_BURNER = nand/s1lapp_jtag
 endif
 
 LPC32XXCDL_BUILD_FLAGS = \
-	CROSS_COMPILE=$(TARGET_CROSS)           \
-	NXPMCU_WINBASE=$(@D)                    \
-	NXPMCU_SOFTWARE=$(@D)                   \
-	BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME)  \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	NXPMCU_WINBASE=$(@D) \
+	NXPMCU_SOFTWARE=$(@D) \
+	BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME) \
 	CSP=lpc32xx TOOL=gnu GEN=lpc
 
 LPC32XXCDL_BOARD_STARTUP_DIR = \
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 13496414dd..67bc69254e 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -59,7 +59,7 @@ define SYSLINUX_BUILD_CMDS
 		CC_FOR_BUILD="$(HOSTCC)" \
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
-            $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
+		$(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
 # While the actual bootloader is compiled for the target, several
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b7032d5901..24d3e4ef54 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -202,8 +202,8 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
 
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 define UBOOT_CONFIGURE_CMDS
-	$(TARGET_CONFIGURE_OPTS) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
+	$(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_BOARD_NAME)_config
 endef
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
@@ -230,16 +230,16 @@ define UBOOT_BUILD_CMDS
 	$(if $(UBOOT_CUSTOM_DTS_PATH),
 		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
-	$(TARGET_CONFIGURE_OPTS) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
+	$(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_MAKE_TARGET)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
 		$(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
 		$(@D)/tools/mxsboot \
-			-w $(BR2_TARGET_UBOOT_FORMAT_NAND_PAGE_SIZE)	\
-			-o $(BR2_TARGET_UBOOT_FORMAT_NAND_OOB_SIZE)	\
-			-e $(BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE)	\
+			-w $(BR2_TARGET_UBOOT_FORMAT_NAND_PAGE_SIZE) \
+			-o $(BR2_TARGET_UBOOT_FORMAT_NAND_OOB_SIZE) \
+			-e $(BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE) \
 			nand $(@D)/u-boot.sb $(@D)/u-boot.nand)
 endef
 
