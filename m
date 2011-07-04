From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2011 23:33:40 +0200
Subject: [Buildroot] [PATCH 23/28] u-boot: rename options BR2_BOOT_UBOOT* to
	BR2_BOOT_U_BOOT*
In-Reply-To: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6d661eec5fad72fde3a9ffad6d0c8a81a4c87a4c.1309815048.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we are moving U-Boot to the package infrastructure, the Kconfig
options must match the package name. As the package name is 'u-boot',
the Kconfig options must be BR2_BOOT_U_BOOT*.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |   70 ++++++++++++++++++++++++------------------------
 boot/u-boot/u-boot.mk |   35 ++++++++++++------------
 2 files changed, 52 insertions(+), 53 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index d9a6385..658a539 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -1,10 +1,10 @@
-menuconfig BR2_BOOT_UBOOT
+menuconfig BR2_BOOT_U_BOOT
 	bool "U-Boot"
 	help
 	  Build "Das U-Boot" Boot Monitor
 
-if BR2_BOOT_UBOOT
-config BR2_BOOT_UBOOT_BOARDNAME
+if BR2_BOOT_U_BOOT
+config BR2_BOOT_U_BOOT_BOARDNAME
 	string "U-Boot board name"
 	help
 	  One of U-Boot supported boards to be built.
@@ -12,47 +12,47 @@ config BR2_BOOT_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_BOOT_UBOOT_2011_03
+	default BR2_BOOT_U_BOOT_2011_03
 	help
 	  Select the specific U-Boot version you want to use
 
-config BR2_BOOT_UBOOT_2011_03
+config BR2_BOOT_U_BOOT_2011_03
 	bool "2011.03"
 
-config BR2_BOOT_UBOOT_2010_12
+config BR2_BOOT_U_BOOT_2010_12
 	bool "2010.12"
 
-config BR2_BOOT_UBOOT_2010_09
+config BR2_BOOT_U_BOOT_2010_09
 	bool "2010.09"
 
-config BR2_BOOT_UBOOT_2010_06
+config BR2_BOOT_U_BOOT_2010_06
 	bool "2010.06"
 
-config BR2_BOOT_UBOOT_2010_03
+config BR2_BOOT_U_BOOT_2010_03
 	bool "2010.03"
 
-config BR2_BOOT_UBOOT_CUSTOM_TARBALL
+config BR2_BOOT_U_BOOT_CUSTOM_TARBALL
 	bool "Custom tarball"
 
 endchoice
 
-if BR2_BOOT_UBOOT_CUSTOM_TARBALL
+if BR2_BOOT_U_BOOT_CUSTOM_TARBALL
 
-config BR2_BOOT_UBOOT_CUSTOM_TARBALL_LOCATION
+config BR2_BOOT_U_BOOT_CUSTOM_TARBALL_LOCATION
 	string "URL of custom U-Boot tarball"
 
 endif
 
-config BR2_BOOT_UBOOT_VERSION
+config BR2_BOOT_U_BOOT_VERSION
 	string
-	default "2011.03"	if BR2_BOOT_UBOOT_2011_03
-	default "2010.12"	if BR2_BOOT_UBOOT_2010_12
-	default "2010.09"	if BR2_BOOT_UBOOT_2010_09
-	default "2010.06"	if BR2_BOOT_UBOOT_2010_06
-	default "2010.03"	if BR2_BOOT_UBOOT_2010_03
-	default "custom"	if BR2_BOOT_UBOOT_CUSTOM_TARBALL
-
-config BR2_BOOT_UBOOT_CUSTOM_PATCH_DIR
+	default "2011.03"	if BR2_BOOT_U_BOOT_2011_03
+	default "2010.12"	if BR2_BOOT_U_BOOT_2010_12
+	default "2010.09"	if BR2_BOOT_U_BOOT_2010_09
+	default "2010.06"	if BR2_BOOT_U_BOOT_2010_06
+	default "2010.03"	if BR2_BOOT_U_BOOT_2010_03
+	default "custom"	if BR2_BOOT_U_BOOT_CUSTOM_TARBALL
+
+config BR2_BOOT_U_BOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
 	  If your board requires custom patches, add the path to the
@@ -64,68 +64,68 @@ config BR2_BOOT_UBOOT_CUSTOM_PATCH_DIR
 choice
 	prompt "U-Boot binary format"
 
-config BR2_BOOT_UBOOT_FORMAT_BIN
+config BR2_BOOT_U_BOOT_FORMAT_BIN
 	bool "u-boot.bin"
 
-config BR2_BOOT_UBOOT_FORMAT_KWB
+config BR2_BOOT_U_BOOT_FORMAT_KWB
 	depends on BR2_arm
 	bool "u-boot.kwb (Marvell)"
 
-config BR2_BOOT_UBOOT_FORMAT_LDR
+config BR2_BOOT_U_BOOT_FORMAT_LDR
 	depends on BR2_bfin
 	bool "u-boot.ldr"
 
 endchoice
 
-config BR2_BOOT_UBOOT_TOOL_ENV
+config BR2_BOOT_U_BOOT_TOOL_ENV
 	bool "fw_printenv tool in target"
 	help
 	  Install fw_printenv / fw_setenv tools in target.
 
-menuconfig BR2_BOOT_UBOOT_NETWORK
+menuconfig BR2_BOOT_U_BOOT_NETWORK
 	bool "Network Settings"
 	default y
 	help
 	  Network settings for U-boot
 
-if BR2_BOOT_UBOOT_NETWORK
+if BR2_BOOT_U_BOOT_NETWORK
 
-config BR2_BOOT_UBOOT_SERVERIP
+config BR2_BOOT_U_BOOT_SERVERIP
 	string "server ip"
 	default "10.175.196.221"
 	help
 	  TFTP server ip address
 
-config BR2_BOOT_UBOOT_IPADDR
+config BR2_BOOT_U_BOOT_IPADDR
 	string "ip address"
 	default "10.175.196.18"
 	help
 	  Target ip address
 
-config BR2_BOOT_UBOOT_GATEWAY
+config BR2_BOOT_U_BOOT_GATEWAY
 	string "gateway ip"
 	default "10.175.196.1"
 	help
 	  Gateway ip address
 
-config BR2_BOOT_UBOOT_NETMASK
+config BR2_BOOT_U_BOOT_NETMASK
 	string "netmask"
 	default "255.255.255.0"
 	help
 	  Network Mask
 
-config BR2_BOOT_UBOOT_ETHADDR
+config BR2_BOOT_U_BOOT_ETHADDR
 	string "ethernet address"
 	default "04:25:fe:ed:00:18"
 	help
 	  Target MAC address for the ethernet interface.
 	  This should be changed for production units
 
-config BR2_BOOT_UBOOT_ETH1ADDR
+config BR2_BOOT_U_BOOT_ETH1ADDR
 	string "ethernet 2 address"
 	help
 	  Target MAC address for the second ethernet interface.
 
-endif # BR2_BOOT_UBOOT_NETWORK
+endif # BR2_BOOT_U_BOOT_NETWORK
 
-endif # BR2_BOOT_UBOOT
+endif # BR2_BOOT_U_BOOT
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index ecbf675..d6fb881 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -3,14 +3,14 @@
 # U-Boot
 #
 #############################################################
-U_BOOT_VERSION    = $(call qstrip,$(BR2_BOOT_UBOOT_VERSION))
-U_BOOT_BOARD_NAME = $(call qstrip,$(BR2_BOOT_UBOOT_BOARDNAME))
+U_BOOT_VERSION    = $(call qstrip,$(BR2_BOOT_U_BOOT_VERSION))
+U_BOOT_BOARD_NAME = $(call qstrip,$(BR2_BOOT_U_BOOT_BOARDNAME))
 
 U_BOOT_INSTALL_IMAGES = YES
 
 ifeq ($(U_BOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
-U_BOOT_TARBALL = $(call qstrip,$(BR2_BOOT_UBOOT_CUSTOM_TARBALL_LOCATION))
+U_BOOT_TARBALL = $(call qstrip,$(BR2_BOOT_U_BOOT_CUSTOM_TARBALL_LOCATION))
 U_BOOT_SITE    = $(dir $(U_BOOT_TARBALL))
 U_BOOT_SOURCE  = $(notdir $(U_BOOT_TARBALL))
 else
@@ -19,10 +19,10 @@ U_BOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
 U_BOOT_SOURCE  = u-boot-$(U_BOOT_VERSION).tar.bz2
 endif
 
-ifeq ($(BR2_BOOT_UBOOT_FORMAT_KWB),y)
+ifeq ($(BR2_BOOT_U_BOOT_FORMAT_KWB),y)
 U_BOOT_BIN          = u-boot.kwb
 U_BOOT_MAKE_TARGET  = $(U_BOOT_BIN)
-else ifeq ($(BR2_BOOT_UBOOT_FORMAT_LDR),y)
+else ifeq ($(BR2_BOOT_U_BOOT_FORMAT_LDR),y)
 U_BOOT_BIN          = u-boot.ldr
 else
 U_BOOT_BIN          = u-boot.bin
@@ -52,9 +52,9 @@ $(if $(call qstrip,$(2)),
 	@echo '#define $(strip $(1)) $(call qstrip,$(2))' >> $(@D)/include/config.h)
 endef
 
-ifneq ($(call qstrip,$(BR2_BOOT_UBOOT_CUSTOM_PATCH_DIR)),)
+ifneq ($(call qstrip,$(BR2_BOOT_U_BOOT_CUSTOM_PATCH_DIR)),)
 define U_BOOT_APPLY_CUSTOM_PATCHES
-	toolchain/patch-kernel.sh $(@D) $(BR2_BOOT_UBOOT_CUSTOM_PATCH_DIR) \
+	toolchain/patch-kernel.sh $(@D) $(BR2_BOOT_U_BOOT_CUSTOM_PATCH_DIR) \
 		u-boot-$(U_BOOT_VERSION)-\*.patch
 endef
 
@@ -71,16 +71,16 @@ define U_BOOT_CONFIGURE_CMDS
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
 	$(call insert_define,DATE,$(DATE))
 	$(call insert_define,CONFIG_LOAD_SCRIPTS,1)
-	$(call insert_define,CONFIG_IPADDR,$(BR2_BOOT_UBOOT_IPADDR))
-	$(call insert_define,CONFIG_GATEWAYIP,$(BR2_BOOT_UBOOT_GATEWAY))
-	$(call insert_define,CONFIG_NETMASK,$(BR2_BOOT_UBOOT_NETMASK))
-	$(call insert_define,CONFIG_SERVERIP,$(BR2_BOOT_UBOOT_SERVERIP))
-	$(call insert_define,CONFIG_ETHADDR,$(BR2_BOOT_UBOOT_ETHADDR))
-	$(call insert_define,CONFIG_ETH1ADDR,$(BR2_BOOT_UBOOT_ETH1ADDR))
+	$(call insert_define,CONFIG_IPADDR,$(BR2_BOOT_U_BOOT_IPADDR))
+	$(call insert_define,CONFIG_GATEWAYIP,$(BR2_BOOT_U_BOOT_GATEWAY))
+	$(call insert_define,CONFIG_NETMASK,$(BR2_BOOT_U_BOOT_NETMASK))
+	$(call insert_define,CONFIG_SERVERIP,$(BR2_BOOT_U_BOOT_SERVERIP))
+	$(call insert_define,CONFIG_ETHADDR,$(BR2_BOOT_U_BOOT_ETHADDR))
+	$(call insert_define,CONFIG_ETH1ADDR,$(BR2_BOOT_U_BOOT_ETH1ADDR))
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(@D)/include/config.h
 endef
 
-ifeq ($(BR2_BOOT_UBOOT_TOOL_ENV),y)
+ifeq ($(BR2_BOOT_U_BOOT_TOOL_ENV),y)
 define U_BOOT_BUILD_TARGET_ENV_UTILS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) HOSTCC="$(TARGET_CC)" -C $(@D) env
 endef
@@ -97,7 +97,7 @@ define U_BOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(U_BOOT_BIN) $(BINARIES_DIR)/
 endef
 
-ifeq ($(BR2_BOOT_UBOOT_TOOL_ENV),y)
+ifeq ($(BR2_BOOT_U_BOOT_TOOL_ENV),y)
 define U_BOOT_INSTALL_TARGET_ENV_UTILS
 	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv \
 		$(TARGET_DIR)/usr/sbin/fw_printenv
@@ -116,13 +116,12 @@ $(eval $(call GENTARGETS,boot,u-boot))
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_BOOT_UBOOT),y)
+ifeq ($(BR2_BOOT_U_BOOT),y)
 TARGETS+=u-boot
-
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(U_BOOT_BOARD_NAME),)
-$(error NO U-Boot board name set. Check your BR2_BOOT_UBOOT_BOARDNAME setting)
+$(error NO U-Boot board name set. Check your BR2_BOOT_U_BOOT_BOARDNAME setting)
 endif
 endif
 
-- 
1.7.4.1
