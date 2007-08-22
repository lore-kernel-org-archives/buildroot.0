From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 04:47:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/hal
	package/udev package etc...
Message-ID: <20070822114723.7BE55A60F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 04:47:22 -0700 (Wed, 22 Aug 2007)
New Revision: 19644

Log:
- random whitespace cleanup


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/udev/udev.mk
   trunk/buildroot/package/vpnc/vpnc.mk
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/external-toolchain/ext-tool.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-08-22 10:46:44 UTC (rev 19643)
+++ trunk/buildroot/package/Makefile.in	2007-08-22 11:47:22 UTC (rev 19644)
@@ -1,4 +1,4 @@
-ifndef	MAKE
+ifndef MAKE
 MAKE:=make
 endif
 ifndef HOSTMAKE

Modified: trunk/buildroot/package/hal/hal.mk
===================================================================
--- trunk/buildroot/package/hal/hal.mk	2007-08-22 10:46:44 UTC (rev 19643)
+++ trunk/buildroot/package/hal/hal.mk	2007-08-22 11:47:22 UTC (rev 19644)
@@ -13,7 +13,7 @@
 
 GLIB_CFLAGS:=-I$(STAGING_DIR)/usr/include/glib-2.0 \
 	     -I$(STAGING_DIR)/lib/glib/include
-GLIB_LIBS:=$(STAGING_DIR)/lib/libglib-2.0.so	\
+GLIB_LIBS:=$(STAGING_DIR)/lib/libglib-2.0.so \
 	   $(STAGING_DIR)/lib/libgmodule-2.0.so \
 	   $(STAGING_DIR)/lib/libgobject-2.0.so \
 	   $(STAGING_DIR)/lib/libgthread-2.0.so
@@ -77,14 +77,15 @@
 	rm -rf $(TARGET_DIR)/etc/PolicyKit
 	$(INSTALL) -m 0755 -D package/hal/S98haldaemon $(TARGET_DIR)/etc/init.d
 	rm -rf $(TARGET_DIR)/etc/rc.d
-	for file in hald-addon-acpi* hald-addon-cpufreq		\
-		    hald-addon-keyboard hald-addon-pmu		\
-		    hald-probe-pc-floppy hald-probe-printer	\
-		    hald-probe-serial hald-probe-smbios		\
-		    hal-storage-eject hal-storage-closetray	\
-		    hal-system-power-pmu hald-probe-input	\
-		    hald-probe-hiddev hald-addon-hid-ups; do	\
-		rm -f $(TARGET_DIR)/usr/libexec/$$file;		\
+	for file in hald-addon-acpi* hald-addon-cpufreq \
+		hald-addon-keyboard hald-addon-pmu \
+		hald-probe-pc-floppy hald-probe-printer \
+		hald-probe-serial hald-probe-smbios \
+		hal-storage-eject hal-storage-closetray \
+		hal-system-power-pmu hald-probe-input \
+		hald-probe-hiddev hald-addon-hid-ups; \
+	do \
+		rm -f $(TARGET_DIR)/usr/libexec/$$file; \
 	done
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libhal*
 

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-08-22 10:46:44 UTC (rev 19643)
+++ trunk/buildroot/package/udev/udev.mk	2007-08-22 11:47:22 UTC (rev 19644)
@@ -92,11 +92,11 @@
 	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/usr/lib/libvolume_id.so
 
 $(STAGING_DIR)/usr/lib/libvolume_id.la: $(STAGING_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
-	$(INSTALL) -m 0755 -D package/udev/libvolume_id.la.tmpl		$(STAGING_DIR)/usr/lib/libvolume_id.la
-	$(SED) 's/REPLACE_CURRENT/$(UDEV_VOLUME_ID_CURRENT)/g'		$(STAGING_DIR)/usr/lib/libvolume_id.la
-	$(SED) 's/REPLACE_AGE/$(UDEV_VOLUME_ID_AGE)/g'			$(STAGING_DIR)/usr/lib/libvolume_id.la
-	$(SED) 's/REPLACE_REVISION/$(UDEV_VOLUME_ID_REVISION)/g'	$(STAGING_DIR)/usr/lib/libvolume_id.la
-	$(SED) 's,REPLACE_LIB_DIR,$(STAGING_DIR)/usr/lib,g'		$(STAGING_DIR)/usr/lib/libvolume_id.la
+	$(INSTALL) -m 0755 -D package/udev/libvolume_id.la.tmpl $(STAGING_DIR)/usr/lib/libvolume_id.la
+	$(SED) 's/REPLACE_CURRENT/$(UDEV_VOLUME_ID_CURRENT)/g' $(STAGING_DIR)/usr/lib/libvolume_id.la
+	$(SED) 's/REPLACE_AGE/$(UDEV_VOLUME_ID_AGE)/g' $(STAGING_DIR)/usr/lib/libvolume_id.la
+	$(SED) 's/REPLACE_REVISION/$(UDEV_VOLUME_ID_REVISION)/g' $(STAGING_DIR)/usr/lib/libvolume_id.la
+	$(SED) 's,REPLACE_LIB_DIR,$(STAGING_DIR)/usr/lib,g' $(STAGING_DIR)/usr/lib/libvolume_id.la
 
 $(TARGET_DIR)/lib/udev/vol_id: $(STAGING_DIR)/usr/lib/libvolume_id.la
 	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(TARGET_DIR)/usr/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)

Modified: trunk/buildroot/package/vpnc/vpnc.mk
===================================================================
--- trunk/buildroot/package/vpnc/vpnc.mk	2007-08-22 10:46:44 UTC (rev 19643)
+++ trunk/buildroot/package/vpnc/vpnc.mk	2007-08-22 11:47:22 UTC (rev 19644)
@@ -31,22 +31,18 @@
 		CC=$(TARGET_CC) -C $(VPNC_DIR)
 
 $(VPNC_TARGET_BINARY): $(VPNC_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS)		\
-		DESTDIR=$(TARGET_DIR)			\
-		BINDIR=/usr/local/bin			\
-		SBINDIR=/usr/local/sbin			\
-		ETCDIR=/etc/vpnc			\
-		MANDIR=/usr/local/share/man		\
-		VERSION=$(VPNC_VERSION)			\
-		INCLUDE=$(STAGING_DIR)/usr/include	\
-		LDFLAGS="-g -lgcrypt -lgpg-error"	\
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		BINDIR=/usr/local/bin \
+		SBINDIR=/usr/local/sbin \
+		ETCDIR=/etc/vpnc \
+		MANDIR=/usr/share/man \
+		VERSION=$(VPNC_VERSION) \
+		INCLUDE=$(STAGING_DIR)/usr/include \
+		LDFLAGS="-g -lgcrypt -lgpg-error" \
 		-C $(VPNC_DIR) install
 	$(STRIP) $(STRIP_STRIP_UNNEEDED) $(VPNC_TARGET_BINARY)
 
-#		CFLAGS+="-W -Wall -O3 -Wmissing-declarations -Wwrite-strings -g -DVERSION=\"$(VPNC_VERSION)\" -c"	\
-
-
-
 vpnc: uclibc $(VPNC_TARGET_BINARY)
 
 vpnc-source: $(DL_DIR)/$(VPNC_SOURCE)

Modified: trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2007-08-22 10:46:44 UTC (rev 19643)
+++ trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2007-08-22 11:47:22 UTC (rev 19644)
@@ -31,11 +31,11 @@
 DataflashBoot-dirclean:
 	rm -rf $(DATAFLASHBOOT_DIR)
 
-dataflash:	 $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)
+dataflash: $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)
 	mkdir -p $(BINARIES_DIR)
-	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)	$(BINARIES_DIR)/$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY)
-ifneq	($(TARGET_ATMEL_COPYTO),)
-	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)	/tftpboot/$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY)
+	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY) $(BINARIES_DIR)/$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY)
+ifneq ($(TARGET_ATMEL_COPYTO),)
+	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY) /tftpboot/$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY)
 endif
 
 #############################################################

Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-08-22 10:46:44 UTC (rev 19643)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-08-22 11:47:22 UTC (rev 19644)
@@ -44,7 +44,7 @@
 
 LINUX26_COPYTO:=/tftpboot
 
-ifeq	($(DEFAULT_KERNEL_HEADERS),2.6.22.1)
+ifeq ($(DEFAULT_KERNEL_HEADERS),2.6.22.1)
 KERNEL_HEADERS_PATCH_DIR:=target/device/Atmel/linux/kernel-patches-$(DOWNLOAD_LINUX26_VERSION)
 else
 # Patch during kernel header build

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2007-08-22 10:46:44 UTC (rev 19643)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2007-08-22 11:47:22 UTC (rev 19644)
@@ -27,10 +27,10 @@
 AT91BOOTSTRAP_IMG_SIZE:=$(strip  $(subst ",, $(BR2_AT91BOOTSTRAP_IMG_SIZE)))
 
 AT91_CUSTOM_FLAGS:=
-ifneq	($(AT91BOOTSTRAP_JUMP_ADDR),)
+ifneq ($(AT91BOOTSTRAP_JUMP_ADDR),)
 AT91_CUSTOM_FLAGS+=-DJUMP_ADDR=$(AT91BOOTSTRAP_JUMP_ADDR) 
 endif
-ifneq	($(AT91BOOTSTRAP_IMG_SIZE),)
+ifneq ($(AT91BOOTSTRAP_IMG_SIZE),)
 AT91_CUSTOM_FLAGS+=-DIMG_SIZE=$(AT91BOOTSTRAP_IMG_SIZE) 
 endif
 
@@ -43,31 +43,31 @@
 	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) target/device/Atmel/at91bootstrap/ at91bootstrap\*.patch
 	touch $(AT91BOOTSTRAP_DIR)/.unpacked
 
-atbu:	$(AT91BOOTSTRAP_DIR)/.unpacked
+atbu: $(AT91BOOTSTRAP_DIR)/.unpacked
 
 $(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked .config
-	$(MAKE)					\
+	$(MAKE) \
 		MEMORY=$(AT91BOOTSTRAP_MEMORY)	\
 		CROSS_COMPILE=$(TARGET_CROSS)	\
 		-C $(AT91BOOTSTRAP_DIR)		\
 		$(BOARD_NAME)_defconfig
-	touch	$(AT91BOOTSTRAP_DIR)/.configured
+	touch $(AT91BOOTSTRAP_DIR)/.configured
 
 $(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.configured
-	$(MAKE)					\
+	$(MAKE) \
 		MEMORY=$(AT91BOOTSTRAP_MEMORY)	\
 		CROSS_COMPILE=$(TARGET_CROSS)	\
 		AT91_CUSTOM_FLAGS="$(AT91_CUSTOM_FLAGS)" \
 		-C $(AT91BOOTSTRAP_DIR)
 
-$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY):	$(AT91BOOTSTRAP_TARGET)
+$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY): $(AT91BOOTSTRAP_TARGET)
 	mkdir -p $(BINARIES_DIR)
-	cp $(AT91BOOTSTRAP_TARGET)	$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-	cp $(AT91BOOTSTRAP_TARGET)	/tftpboot/$(AT91BOOTSTRAP_BINARY)
+	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
+	cp $(AT91BOOTSTRAP_TARGET) /tftpboot/$(AT91BOOTSTRAP_BINARY)
 
 .PHONY:        at91bootstrap at91bootstrap-source
 
-at91bootstrap:	$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
+at91bootstrap: $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
 
 at91bootstrap-source: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 

Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-08-22 10:46:44 UTC (rev 19643)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-08-22 11:47:22 UTC (rev 19644)
@@ -49,14 +49,14 @@
 	$(WGET) -P $(DL_DIR) $(UBOOT_PATCH_SITE)/$(UBOOT_PATCH_SOURCE)
 
 $(UBOOT_DIR)/.unpacked: $(DL_DIR)/$(UBOOT_SOURCE)
-	mkdir -p   $(BUILD_DIR)
+	mkdir -p $(BUILD_DIR)
 	$(UBOOT_CAT) $(DL_DIR)/$(UBOOT_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	touch	$@
+	touch $@
 
 $(UBOOT_PATCHES)/.unpacked: $(DL_DIR)/$(UBOOT_PATCH_SOURCE)
 	mkdir -p $(UBOOT_PATCHES)
-	bzcat 	$(DL_DIR)/$(UBOOT_PATCH_SOURCE) | tar -C $(UBOOT_PATCHES) -xvf -
-	touch	$@
+	bzcat $(DL_DIR)/$(UBOOT_PATCH_SOURCE) | tar -C $(UBOOT_PATCHES) -xvf -
+	touch $@
 
 $(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE): $(UBOOT_DIR)/.unpacked $(UBOOT_PATCHES)/.unpacked
 	toolchain/patch-kernel.sh $(UBOOT_DIR) $(UBOOT_PATCHES) *.patch
@@ -66,106 +66,107 @@
 #	cp $(UBOOT_ATMEL_BMP) $(UBOOT_DIR)/tools/logos/.
 
 $(UBOOT_BUILD_DIR)/.configured: $(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
-ifneq	($(strip $(UBOOT_CONFIG_FILE)),)
+ifneq ($(strip $(UBOOT_CONFIG_FILE)),)
 	cp $(UBOOT_CONFIG_FILE) $(UBOOT_DIR)/include/configs/.
 endif
-	$(MAKE)				\
-		O=$(UBOOT_BUILD_DIR)	\
-		CONFIG_NOSOFTFLOAT=1		\
-		-C $(UBOOT_DIR) 	\
+	$(MAKE) \
+		O=$(UBOOT_BUILD_DIR) \
+		CONFIG_NOSOFTFLOAT=1 \
+		-C $(UBOOT_DIR) \
 		$(UBOOT_CONFIG)
 	$(SED) 's/ $$(SREC) $$(BIN)//' $(UBOOT_DIR)/examples/Makefile
 	touch $(UBOOT_BUILD_DIR)/.configured
-#	$(MAKE) O=$(UBOOT_BUILD_DIR) -C $(UBOOT_DIR) 
+#	$(MAKE) O=$(UBOOT_BUILD_DIR) -C $(UBOOT_DIR)
 
 $(MKIMAGE_BINLOC): $(UBOOT_BUILD_DIR)/.configured
 	$(MAKE) \
-		O=$(UBOOT_BUILD_DIR)		\
-		CROSS_COMPILE=			\
-		CONFIG_NOSOFTFLOAT=1		\
-		TOPDIR=$(UBOOT_DIR)		\
-		SRCTREE=$(UBOOT_DIR)		\
-		-C $(UBOOT_DIR)	tools
+		O=$(UBOOT_BUILD_DIR) \
+		CROSS_COMPILE= \
+		CONFIG_NOSOFTFLOAT=1 \
+		TOPDIR=$(UBOOT_DIR) \
+		SRCTREE=$(UBOOT_DIR) \
+		-C $(UBOOT_DIR) tools
 	touch $(MKIMAGE_BINLOC)
 
-$(UBOOT_BUILD_DIR)/u-boot.bin:	$(UBOOT_BUILD_DIR)/.configured $(UBOOT_CUSTOM)
+$(UBOOT_BUILD_DIR)/u-boot.bin: $(UBOOT_BUILD_DIR)/.configured $(UBOOT_CUSTOM)
 	echo TARGET_CROSS=$(TARGET_CROSS)
-	$(MAKE) O=$(UBOOT_BUILD_DIR)		\
-		CROSS_COMPILE=$(TARGET_CROSS)	\
-		CONFIG_NOSOFTFLOAT=1		\
-		TOPDIR=$(UBOOT_DIR)		\
-		SRCTREE=$(UBOOT_DIR)		\
-		TFTPBOOT=/tftpboot		\
+	$(MAKE) O=$(UBOOT_BUILD_DIR) \
+		CROSS_COMPILE=$(TARGET_CROSS) \
+		CONFIG_NOSOFTFLOAT=1 \
+		TOPDIR=$(UBOOT_DIR) \
+		SRCTREE=$(UBOOT_DIR) \
+		TFTPBOOT=/tftpboot \
 		-C $(UBOOT_DIR)
 
-$(BINARIES_DIR)/$(UBOOT_BIN):	$(UBOOT_BUILD_DIR)/u-boot.bin
+$(BINARIES_DIR)/$(UBOOT_BIN): $(UBOOT_BUILD_DIR)/u-boot.bin
 	mkdir -p $(BINARIES_DIR)
 	cp $(UBOOT_BUILD_DIR)/u-boot.bin $(BINARIES_DIR)/$(UBOOT_BIN)
 
-/tftpboot/$(UBOOT_BIN):	$(UBOOT_BUILD_DIR)/u-boot.bin
+/tftpboot/$(UBOOT_BIN): $(UBOOT_BUILD_DIR)/u-boot.bin
 	mkdir -p /tftpboot
 	cp $(UBOOT_BUILD_DIR)/u-boot.bin /tftpboot/$(UBOOT_BIN)
 
-uboot-bin:	$(BINARIES_DIR)/$(UBOOT_BIN)	/tftpboot/$(UBOOT_BIN)
+uboot-bin: $(BINARIES_DIR)/$(UBOOT_BIN) /tftpboot/$(UBOOT_BIN)
 
-$(UBOOT_CUSTOM).test:	.config	$(UBOOT_BUILD_DIR)/.configured
-	echo	"/* Automatically generated file, do not edit */"		>  $(UBOOT_CUSTOM).test
-ifneq	($(TARGET_HOSTNAME),)
-	echo	"#if defined(CONFIG_HOSTNAME)"					>> $(UBOOT_CUSTOM).test
-	echo	"#undef	 CONFIG_HOSTNAME"					>> $(UBOOT_CUSTOM).test
-	echo	"#define CONFIG_HOSTNAME		$(TARGET_HOSTNAME)"	>> $(UBOOT_CUSTOM).test
-	echo	"#endif"							>> $(UBOOT_CUSTOM).test
+$(UBOOT_CUSTOM).test: .config $(UBOOT_BUILD_DIR)/.configured
+	echo "/* Automatically generated file, do not edit */" \
+	> $(UBOOT_CUSTOM).test
+ifneq ($(TARGET_HOSTNAME),)
+	echo "#if defined(CONFIG_HOSTNAME)">> $(UBOOT_CUSTOM).test
+	echo "#undef CONFIG_HOSTNAME">> $(UBOOT_CUSTOM).test
+	echo "#define CONFIG_HOSTNAME $(TARGET_HOSTNAME)">> $(UBOOT_CUSTOM).test
+	echo "#endif">> $(UBOOT_CUSTOM).test
 endif
-ifneq	($(TARGET_UBOOT_IPADDR),)
-	echo	"#define CONFIG_IPADDR		$(TARGET_UBOOT_IPADDR)"		>> $(UBOOT_CUSTOM).test
+ifneq ($(TARGET_UBOOT_IPADDR),)
+	echo "#define CONFIG_IPADDR $(TARGET_UBOOT_IPADDR)">> $(UBOOT_CUSTOM).test
 endif
-ifneq	($(TARGET_UBOOT_SERVERIP),)
-	echo	"#define CONFIG_SERVERIP	$(TARGET_UBOOT_SERVERIP)"	>> $(UBOOT_CUSTOM).test
+ifneq ($(TARGET_UBOOT_SERVERIP),)
+	echo "#define CONFIG_SERVERIP $(TARGET_UBOOT_SERVERIP)">> $(UBOOT_CUSTOM).test
 endif
-ifneq	($(TARGET_UBOOT_GATEWAY),)
-	echo	"#define CONFIG_GATEWAYIP	$(TARGET_UBOOT_GATEWAY)"	>> $(UBOOT_CUSTOM).test
+ifneq ($(TARGET_UBOOT_GATEWAY),)
+	echo "#define CONFIG_GATEWAYIP $(TARGET_UBOOT_GATEWAY)">> $(UBOOT_CUSTOM).test
 endif
-ifneq	($(TARGET_UBOOT_NETMASK),)
-	echo	"#define CONFIG_NETMASK		$(TARGET_UBOOT_NETMASK)"	>> $(UBOOT_CUSTOM).test
+ifneq ($(TARGET_UBOOT_NETMASK),)
+	echo "#define CONFIG_NETMASK $(TARGET_UBOOT_NETMASK)">> $(UBOOT_CUSTOM).test
 endif
-ifneq	($(TARGET_UBOOT_ETHADDR),)
-	echo	"#define CONFIG_ETHADDR		$(TARGET_UBOOT_ETHADDR)"	>> $(UBOOT_CUSTOM).test
+ifneq ($(TARGET_UBOOT_ETHADDR),)
+	echo "#define CONFIG_ETHADDR $(TARGET_UBOOT_ETHADDR)">> $(UBOOT_CUSTOM).test
 endif
 	diff -q $(UBOOT_CUSTOM).test $(UBOOT_CUSTOM) || cp -af $(UBOOT_CUSTOM).test $(UBOOT_CUSTOM)
 
-$(UBOOT_SCR):	.config
-ifneq	($(TARGET_UBOOT_IPADDR),)
-	echo setenv ipaddr		$(TARGET_UBOOT_IPADDR)			>  $(UBOOT_SCR)
+$(UBOOT_SCR): .config
+ifneq ($(TARGET_UBOOT_IPADDR),)
+	echo setenv ipaddr $(TARGET_UBOOT_IPADDR)> $(UBOOT_SCR)
 endif
-ifneq	($(TARGET_UBOOT_SERVERIP),)
-	echo setenv serverip		$(TARGET_UBOOT_SERVERIP)		>> $(UBOOT_SCR)
+ifneq ($(TARGET_UBOOT_SERVERIP),)
+	echo setenv serverip $(TARGET_UBOOT_SERVERIP)>> $(UBOOT_SCR)
 endif
-ifneq	($(TARGET_UBOOT_GATEWAY),)
-	echo setenv gatewayip		$(TARGET_UBOOT_GATEWAY)			>> $(UBOOT_SCR)
+ifneq ($(TARGET_UBOOT_GATEWAY),)
+	echo setenv gatewayip $(TARGET_UBOOT_GATEWAY)>> $(UBOOT_SCR)
 endif
-ifneq	($(TARGET_UBOOT_NETMASK),)
-	echo setenv netmask		$(TARGET_UBOOT_NETMASK)			>> $(UBOOT_SCR)
+ifneq ($(TARGET_UBOOT_NETMASK),)
+	echo setenv netmask $(TARGET_UBOOT_NETMASK)>> $(UBOOT_SCR)
 endif
-	echo setenv linux		$(LINUX26_KERNEL)			>> $(UBOOT_SCR)
-	echo setenv kernel-version	$(LINUX26_VERSION)			>> $(UBOOT_SCR)
-	echo setenv kernel-date		$(DATE)					>> $(UBOOT_SCR)
-	echo setenv hostname		$(TARGET_HOSTNAME)			>> $(UBOOT_SCR)
-	echo setenv fs-date		$(DATE)					>> $(UBOOT_SCR)
-	echo setenv rd-1		rootfs.$(BR2_ARCH)-$(DATE).ext2		>> $(UBOOT_SCR)
-	echo setenv rd-2		rootfs.$(BR2_ARCH)-$(DATE).jffs2	>> $(UBOOT_SCR)
-	echo setenv rd			rootfs.$(BR2_ARCH)-$(DATE).ext2		>> $(UBOOT_SCR)
-	echo setenv ver			1					>> $(UBOOT_SCR)
-ifneq	($(TARGET_UBOOT_ETHADDR),)
-	echo setenv ethaddr		$(TARGET_UBOOT_ETHADDR)			>> $(UBOOT_SCR)
+	echo setenv linux $(LINUX26_KERNEL)>> $(UBOOT_SCR)
+	echo setenv kernel-version $(LINUX26_VERSION)>> $(UBOOT_SCR)
+	echo setenv kernel-date $(DATE)>> $(UBOOT_SCR)
+	echo setenv hostname $(TARGET_HOSTNAME) >> $(UBOOT_SCR)
+	echo setenv fs-date $(DATE)>> $(UBOOT_SCR)
+	echo setenv rd-1 rootfs.$(BR2_ARCH)-$(DATE).ext2>> $(UBOOT_SCR)
+	echo setenv rd-2 rootfs.$(BR2_ARCH)-$(DATE).jffs2>> $(UBOOT_SCR)
+	echo setenv rd rootfs.$(BR2_ARCH)-$(DATE).ext2>> $(UBOOT_SCR)
+	echo setenv ver 1>> $(UBOOT_SCR)
+ifneq ($(TARGET_UBOOT_ETHADDR),)
+	echo setenv ethaddr $(TARGET_UBOOT_ETHADDR)>> $(UBOOT_SCR)
 endif
-	echo setenv fstype		ram					>> $(UBOOT_SCR)
-	echo fs									>> $(UBOOT_SCR)
-	echo os									>> $(UBOOT_SCR)
-	echo setargs								>> $(UBOOT_SCR)
-	echo saveenv								>> $(UBOOT_SCR)
+	echo setenv fstype ram>> $(UBOOT_SCR)
+	echo fs >> $(UBOOT_SCR)
+	echo os >> $(UBOOT_SCR)
+	echo setargs>> $(UBOOT_SCR)
+	echo saveenv>> $(UBOOT_SCR)
 
-$(UBOOT_SCR).$(PROJECT):	$(UBOOT_SCR)	 $(MKIMAGE)
-	$(MKIMAGE)  -A arm \
+$(UBOOT_SCR).$(PROJECT): $(UBOOT_SCR) $(MKIMAGE)
+	$(MKIMAGE) -A arm \
 				-O linux	\
 				-T script	\
 				-C none		\
@@ -174,35 +175,35 @@
 				-n "autoscr config" \
 				-d $(UBOOT_SCR)	\
 				$(UBOOT_SCR).$(PROJECT)
-	cp	$(UBOOT_SCR).$(PROJECT) /tftpboot
+	cp $(UBOOT_SCR).$(PROJECT) /tftpboot
 
-$(MKIMAGE):	$(MKIMAGE_BINLOC) 
-	cp -f $(MKIMAGE_BINLOC)	 $(MKIMAGE)
+$(MKIMAGE): $(MKIMAGE_BINLOC) 
+	cp -f $(MKIMAGE_BINLOC) $(MKIMAGE)
 
-uboot: $(MKIMAGE)	uboot-bin $(UBOOT_SCR).$(PROJECT)
+uboot: $(MKIMAGE) uboot-bin $(UBOOT_SCR).$(PROJECT)
 
 uboot-source: $(DL_DIR)/$(UBOOT_SOURCE)
 
 uboot-clean:
-	rm -fr	$(UBOOT_BUILD_DIR)
-	rm -fr	$(UBOOT_PATCHES)
-	rm -f	$(BINARIES_DIR)/$(UBOOT_BIN)
-	rm -fr	$(UBOOT_DIR)
-	rm -f	$(UBOOT_SCR)
-	rm -f	$(UBOOT_SCR).$(PROJECT)
+	rm -fr $(UBOOT_BUILD_DIR)
+	rm -fr $(UBOOT_PATCHES)
+	rm -f $(BINARIES_DIR)/$(UBOOT_BIN)
+	rm -fr $(UBOOT_DIR)
+	rm -f $(UBOOT_SCR)
+	rm -f $(UBOOT_SCR).$(PROJECT)
 #	-$(MAKE) -C $(UBOOT_DIR)/uboot-tools clean
 
-uboot-dirclean:	uboot-clean
+uboot-dirclean: uboot-clean
 	rm -rf $(UBOOT_DIR)
 
 uboot-new:
-	rm -fr	$(UBOOT_BUILD_DIR)/u-boot
-	rm -fr	$(UBOOT_BUILD_DIR)/u-boot.gz
-	rm -fr	$(UBOOT_BUILD_DIR)/u-boot.bin
-	rm -fr	/tftpboot/$(UBOOT_BIN)
-	rm -fr	$(BINARIES_DIR)/$(UBOOT_BIN)
+	rm -fr $(UBOOT_BUILD_DIR)/u-boot
+	rm -fr $(UBOOT_BUILD_DIR)/u-boot.gz
+	rm -fr $(UBOOT_BUILD_DIR)/u-boot.bin
+	rm -fr /tftpboot/$(UBOOT_BIN)
+	rm -fr $(BINARIES_DIR)/$(UBOOT_BIN)
 
-.PHONY:	uboot-bin
+.PHONY: uboot-bin
 #############################################################
 #
 # Build the uboot root filesystem image
@@ -251,31 +252,31 @@
 endif
 
 uboot-test:
-	- at echo	source=$(DL_DIR)/$(UBOOT_SOURCE)
-	- at ls	$(DL_DIR)/$(UBOOT_SOURCE)
-	- at echo	patch=$(DL_DIR)/$(UBOOT_PATCH_SOURCE)
-	- at ls	$(DL_DIR)/$(UBOOT_PATCH_SOURCE)
-	- at echo	unpacked=$(UBOOT_PATCHES)/.unpacked
-	- at ls	$(UBOOT_PATCHES)/.unpacked
-	- at echo	patch-unpacked=$(UBOOT_PATCHES)/.unpacked
-	- at ls	$(UBOOT_PATCHES)/.unpacked
-	- at echo	patched-source=$(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
-	- at ls	$(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
-	- at echo	configured=$(UBOOT_BUILD_DIR)/.configured
-	- at ls	$(UBOOT_BUILD_DIR)/.configured
-	- at echo	mkimage=$(MKIMAGE_BINLOC)
-	- at ls	$(MKIMAGE_BINLOC)
-	- at echo	u-boot.bin=$(UBOOT_BUILD_DIR)/u-boot.bin
-	- at ls	$(UBOOT_BUILD_DIR)/u-boot.bin
-	- at echo	binaries-u-boot.bin=$(BINARIES_DIR)/$(UBOOT_BIN)
-	- at ls	$(BINARIES_DIR)/$(UBOOT_BIN)
-	- at echo	tftpboot=/tftpboot/$(UBOOT_BIN)
-	- at ls	/tftpboot/$(UBOOT_BIN)
-	- at echo	"mkimage = $(MKIMAGE)"
-	- at ls	$(MKIMAGE)
-	- at echo	"u-boot script=$(UBOOT_SCR).$(PROJECT)"
-	- at ls	$(UBOOT_SCR).$(PROJECT)
-	- at echo	"u-boot script (ASCII)=$(UBOOT_SCR)"
-	- at ls	$(UBOOT_SCR)
+	- at echo source=$(DL_DIR)/$(UBOOT_SOURCE)
+	- at ls $(DL_DIR)/$(UBOOT_SOURCE)
+	- at echo patch=$(DL_DIR)/$(UBOOT_PATCH_SOURCE)
+	- at ls $(DL_DIR)/$(UBOOT_PATCH_SOURCE)
+	- at echo unpacked=$(UBOOT_PATCHES)/.unpacked
+	- at ls $(UBOOT_PATCHES)/.unpacked
+	- at echo patch-unpacked=$(UBOOT_PATCHES)/.unpacked
+	- at ls $(UBOOT_PATCHES)/.unpacked
+	- at echo patched-source=$(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
+	- at ls $(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
+	- at echo configured=$(UBOOT_BUILD_DIR)/.configured
+	- at ls $(UBOOT_BUILD_DIR)/.configured
+	- at echo mkimage=$(MKIMAGE_BINLOC)
+	- at ls $(MKIMAGE_BINLOC)
+	- at echo u-boot.bin=$(UBOOT_BUILD_DIR)/u-boot.bin
+	- at ls $(UBOOT_BUILD_DIR)/u-boot.bin
+	- at echo binaries-u-boot.bin=$(BINARIES_DIR)/$(UBOOT_BIN)
+	- at ls $(BINARIES_DIR)/$(UBOOT_BIN)
+	- at echo tftpboot=/tftpboot/$(UBOOT_BIN)
+	- at ls /tftpboot/$(UBOOT_BIN)
+	- at echo "mkimage = $(MKIMAGE)"
+	- at ls $(MKIMAGE)
+	- at echo "u-boot script=$(UBOOT_SCR).$(PROJECT)"
+	- at ls $(UBOOT_SCR).$(PROJECT)
+	- at echo "u-boot script (ASCII)=$(UBOOT_SCR)"
+	- at ls $(UBOOT_SCR)
 	- at echo "mkimage binary=$(MKIMAGE_BINLOC)"
-	- at ls	$(MKIMAGE_BINLOC)
+	- at ls $(MKIMAGE_BINLOC)

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-08-22 10:46:44 UTC (rev 19643)
+++ trunk/buildroot/target/linux/Makefile.in	2007-08-22 11:47:22 UTC (rev 19644)
@@ -55,7 +55,7 @@
 endif
 
 # File name for the Linux kernel binary
-ifndef	LINUX26_KERNEL
+ifndef LINUX26_KERNEL
 LINUX26_KERNEL=$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
 endif
 

Modified: trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2007-08-22 10:46:44 UTC (rev 19643)
+++ trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2007-08-22 11:47:22 UTC (rev 19644)
@@ -3,7 +3,7 @@
 #
 # $1: source
 # $2: destination
-# $2: strip (y|n)	default is to strip
+# $2: strip (y|n)       default is to strip
 #
 copy_toolchain_lib_root =									\
 	LIB="$(strip $1)";									\
