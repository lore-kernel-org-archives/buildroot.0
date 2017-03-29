From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 23:30:37 +0200
Subject: [Buildroot] [git commit] arch, linux, package: remove whitespaces
Message-ID: <20170329213220.BEDCE82659@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc405b4cb323b6f16dbf12ae319885ec88d1dddd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Whitespaces were searched using the following regex:

[ ]{1,}\t

and then manually removed in most of the cases. For
xserver_xorg-server.mk, tabs before backslashes were removed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arc                                 |  2 +-
 arch/Config.in.arm                                 | 16 ++---
 arch/Config.in.mips                                |  2 +-
 linux/linux-ext-rtai.mk                            |  4 +-
 linux/linux.mk                                     |  6 +-
 package/bluez5_utils/bluez5_utils.mk               |  6 +-
 package/lesstif/lesstif.mk                         |  8 +--
 package/linux-firmware/linux-firmware.mk           |  2 +-
 package/netsnmp/netsnmp.mk                         |  2 +-
 package/pkg-generic.mk                             |  2 +-
 package/pkg-kernel-module.mk                       |  2 +-
 package/pkg-waf.mk                                 |  6 +-
 package/python/python.mk                           |  6 +-
 package/python3/python3.mk                         |  6 +-
 package/rt-tests/rt-tests.mk                       |  6 +-
 package/rtai/rtai.mk                               |  4 +-
 package/udisks/udisks.mk                           |  2 +-
 package/usbmount/usbmount.mk                       |  4 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     | 82 +++++++++++-----------
 19 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 840d472..92503a0 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -39,7 +39,7 @@ config BR2_GCC_TARGET_CPU
 	default "archs"	 if BR2_archs38
 
 config BR2_READELF_ARCH_NAME
-	default "ARCompact" 	if BR2_arc750d || BR2_arc770d
+	default "ARCompact"	if BR2_arc750d || BR2_arc770d
 	default "ARCv2"		if BR2_archs38
 
 choice
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index f910364..b1817ed 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -536,13 +536,13 @@ config BR2_GCC_TARGET_CPU
 	default "iwmmxt"	if BR2_iwmmxt
 	default "cortex-a53"		if (BR2_cortex_a53 && !BR2_ARCH_IS_64)
 	default "cortex-a53+fp"		if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a53+fp+simd" 	if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
+	default "cortex-a53+fp+simd"	if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
 	default "cortex-a57"		if (BR2_cortex_a57 && !BR2_ARCH_IS_64)
 	default "cortex-a57+fp"		if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a57+fp+simd" 	if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
+	default "cortex-a57+fp+simd"	if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
 	default "cortex-a72"		if (BR2_cortex_a72 && !BR2_ARCH_IS_64)
 	default "cortex-a72+fp"		if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a72+fp+simd" 	if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
+	default "cortex-a72+fp+simd"	if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
@@ -552,11 +552,11 @@ config BR2_GCC_TARGET_FPU
 	depends on BR2_arm || BR2_armeb
 	default "vfp"		if BR2_ARM_FPU_VFPV2
 	default "vfpv3"		if BR2_ARM_FPU_VFPV3
-	default "vfpv3-d16" 	if BR2_ARM_FPU_VFPV3D16
-	default "vfpv4" 	if BR2_ARM_FPU_VFPV4
-	default "vfpv4-d16" 	if BR2_ARM_FPU_VFPV4D16
-	default "neon" 		if BR2_ARM_FPU_NEON
-	default "neon-vfpv4" 	if BR2_ARM_FPU_NEON_VFPV4
+	default "vfpv3-d16"	if BR2_ARM_FPU_VFPV3D16
+	default "vfpv4"		if BR2_ARM_FPU_VFPV4
+	default "vfpv4-d16"	if BR2_ARM_FPU_VFPV4D16
+	default "neon"		if BR2_ARM_FPU_NEON
+	default "neon-vfpv4"	if BR2_ARM_FPU_NEON_VFPV4
 	default "fp-armv8"	if BR2_ARM_FPU_FP_ARMV8
 	default "neon-fp-armv8"	if BR2_ARM_FPU_NEON_FP_ARMV8
 
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 22819d0..4e9ad12 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -134,7 +134,7 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_mipsel || BR2_mips64el
-	default "BIG" 	    	if BR2_mips || BR2_mips64
+	default "BIG"		if BR2_mips || BR2_mips64
 
 config BR2_GCC_TARGET_ARCH
 	default "mips32"	if BR2_mips_32
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index 0cc1232..fb483aa 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -20,8 +20,8 @@ endif
 define RTAI_PREPARE_KERNEL
 	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
 	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
-		$(APPLY_PATCHES) $(LINUX_DIR)		 		\
-			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ 	\
+		$(APPLY_PATCHES) $(LINUX_DIR)				\
+			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/	\
 			hal-linux-$${kver}-*patch ; \
 	else \
 		echo "No RTAI patch for your kernel version" ; \
diff --git a/linux/linux.mk b/linux/linux.mk
index 7f4432e..d160d28 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -347,7 +347,7 @@ define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
-	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
+	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then	\
 		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
 	$(LINUX_BUILD_DTB)
@@ -378,7 +378,7 @@ endif
 
 define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
-	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
+	if grep -q "CONFIG_DTC=y" $(@D)/.config; then	\
 		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/linux-dtc ;	\
 		if [ ! -e $(HOST_DIR)/usr/bin/dtc ]; then	\
 			ln -sf linux-dtc $(HOST_DIR)/usr/bin/dtc ;	\
@@ -400,7 +400,7 @@ define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
-	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
+	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then	\
 		$(LINUX_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 4d31a18..63f29ab 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -12,9 +12,9 @@ BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ5_UTILS_LICENSE = GPLv2+, LGPLv2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
-BLUEZ5_UTILS_CONF_OPTS = 	\
-	--enable-tools 		\
-	--enable-library 	\
+BLUEZ5_UTILS_CONF_OPTS =	\
+	--enable-tools		\
+	--enable-library	\
 	--disable-cups
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
index 6ce2339..fb04a9e 100644
--- a/package/lesstif/lesstif.mk
+++ b/package/lesstif/lesstif.mk
@@ -22,11 +22,11 @@ LESSTIF_CONF_OPTS = \
 
 # Reduces the buggy makefile to the smallest possible (and working) thing
 define LESSTIF_NOMAN2HTML
-	echo "all:" 	> $(@D)/doc/Makefile
-	echo "" 		>> $(@D)/doc/Makefile
+	echo "all:" > $(@D)/doc/Makefile
+	echo "" >> $(@D)/doc/Makefile
 	echo "install:" >> $(@D)/doc/Makefile
-	echo "" 		>> $(@D)/doc/Makefile
-	echo "clean:" 	>> $(@D)/doc/Makefile
+	echo "" >> $(@D)/doc/Makefile
+	echo "clean:" >> $(@D)/doc/Makefile
 endef
 
 # Prevents to copy ac_find_motif.m4 on target, it would else
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 55a4aac..33bc0cf 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -53,7 +53,7 @@ endif
 # rtl81xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX),y)
 LINUX_FIRMWARE_FILES += \
-	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin 		\
+	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin		\
 	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin	\
 	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin		\
 	rtlwifi/rtl8188efw.bin rtlwifi/rtl8188eufw.bin		\
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 0f4b7d8..abcf63d 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -117,7 +117,7 @@ endef
 endif
 
 define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
-	$(SED) 	"s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
+	$(SED)	"s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
 		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/bin/net-snmp-config
 endef
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd8a1e2..31dbc54 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -642,7 +642,7 @@ else
 $(1)-install-images:
 endif
 
-$(1)-install-host:      	$$($(2)_TARGET_INSTALL_HOST)
+$(1)-install-host:		$$($(2)_TARGET_INSTALL_HOST)
 $$($(2)_TARGET_INSTALL_HOST):	$$($(2)_TARGET_BUILD)
 
 $(1)-build:		$$($(2)_TARGET_BUILD)
diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index 200c91d..fcd6b8b 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -25,7 +25,7 @@
 #
 #   $(eval $(kernel-module))
 #   define FOO_MOD_TWEAK
-#   	# do something
+#       # do something
 #   endef
 #   FOO_POST_BUILD_HOOKS += FOO_MOD_TWEAK
 #   $(eval $(generic-package))
diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 2cdd654..45b9c41 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -49,9 +49,9 @@ else
 $(2)_WAF = ./waf
 endif
 
-$(2)_BUILD_OPTS 			?=
-$(2)_INSTALL_STAGING_OPTS 		?=
-$(2)_INSTALL_TARGET_OPTS 		?=
+$(2)_BUILD_OPTS				?=
+$(2)_INSTALL_STAGING_OPTS		?=
+$(2)_INSTALL_TARGET_OPTS		?=
 $(2)_WAF_OPTS				?=
 
 #
diff --git a/package/python/python.mk b/package/python/python.mk
index 1787576..e430d74 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -17,9 +17,9 @@ PYTHON_LIBTOOL_PATCH = NO
 # also installed in $(HOST_DIR), as it is needed when cross-compiling
 # third-party Python modules.
 
-HOST_PYTHON_CONF_OPTS += 	\
+HOST_PYTHON_CONF_OPTS +=	\
 	--enable-static		\
-	--without-cxx-main 	\
+	--without-cxx-main	\
 	--disable-sqlite3	\
 	--disable-tk		\
 	--with-expat=system	\
@@ -159,7 +159,7 @@ PYTHON_CONF_ENV += ac_cv_big_endian_double=yes
 endif
 
 PYTHON_CONF_OPTS += \
-	--without-cxx-main 	\
+	--without-cxx-main	\
 	--without-doc-strings	\
 	--with-system-ffi	\
 	--disable-pydoc		\
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 90fba7e..6189aa8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -24,9 +24,9 @@ PYTHON3_LIBTOOL_PATCH = NO
 # installed in $(HOST_DIR), as it is needed when cross-compiling
 # third-party Python modules.
 
-HOST_PYTHON3_CONF_OPTS += 	\
+HOST_PYTHON3_CONF_OPTS +=	\
 	--without-ensurepip	\
-	--without-cxx-main 	\
+	--without-cxx-main	\
 	--disable-sqlite3	\
 	--disable-tk		\
 	--with-expat=system	\
@@ -152,7 +152,7 @@ endif
 
 PYTHON3_CONF_OPTS += \
 	--without-ensurepip	\
-	--without-cxx-main 	\
+	--without-cxx-main	\
 	--with-system-ffi	\
 	--disable-pydoc		\
 	--disable-test-modules	\
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index addc15e..9a9c562 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -16,15 +16,15 @@ endif
 
 define RT_TESTS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)	\
-		CC="$(TARGET_CC)" 		\
+		CC="$(TARGET_CC)"		\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		prefix=/usr
 endef
 
 define RT_TESTS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)		\
-		DESTDIR="$(TARGET_DIR)" 		\
-		prefix=/usr 				\
+		DESTDIR="$(TARGET_DIR)"			\
+		prefix=/usr				\
 		$(if $(BR2_PACKAGE_PYTHON),PYLIB=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/,PYLIB="") \
 		install
 endef
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index dfd8e0c..35e8fc1 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -20,8 +20,8 @@ RTAI_DEPENDENCIES = linux
 
 RTAI_CONF_OPTS = \
 	--includedir=/usr/include/rtai \
-	--with-linux-dir=$(LINUX_DIR) 	\
-	--disable-leds		      	\
+	--with-linux-dir=$(LINUX_DIR)	\
+	--disable-leds			\
 	--enable-usi			\
 	--enable-align-priority		\
 	--disable-rtailab		\
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 4d3ede7..f1558fb 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -11,7 +11,7 @@ UDISKS_LICENSE_FILES = COPYING
 # For 0002-Fix-systemd-service-file.patch
 UDISKS_AUTORECONF = YES
 
-UDISKS_DEPENDENCIES = 	\
+UDISKS_DEPENDENCIES =	\
 	sg3_utils	\
 	host-pkgconf	\
 	udev		\
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 066cbb8..f69e1f6 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -14,9 +14,9 @@ USBMOUNT_LICENSE_FILES = debian/copyright
 define USBMOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
 
-	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink 	\
+	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink	\
 		$(TARGET_DIR)/etc/usbmount/mount.d/00_create_model_symlink
-	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink 	\
+	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink	\
 		$(TARGET_DIR)/etc/usbmount/umount.d/00_remove_model_symlink
 
 	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f32383f..306e9d0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -12,47 +12,47 @@ XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 # xfont_font-util is needed only for autoreconf
 XSERVER_XORG_SERVER_AUTORECONF = YES
-XSERVER_XORG_SERVER_DEPENDENCIES = 	\
-	xfont_font-util			\
-	xutil_util-macros 		\
-	xlib_libX11 			\
-	xlib_libXau 			\
-	xlib_libXdmcp 			\
-	xlib_libXext 			\
-	xlib_libXfixes 			\
-	xlib_libXi 			\
-	xlib_libXrender 		\
-	xlib_libXres 			\
-	xlib_libXft 			\
-	xlib_libXcursor 		\
-	xlib_libXinerama 		\
-	xlib_libXrandr 			\
-	xlib_libXdamage 		\
-	xlib_libXxf86vm 		\
-	xlib_libxkbfile 		\
-	xlib_xtrans 			\
-	xdata_xbitmaps 			\
-	xproto_bigreqsproto 		\
-	xproto_compositeproto 		\
-	xproto_damageproto 		\
-	xproto_fixesproto 		\
-	xproto_fontsproto 		\
-	xproto_glproto 			\
-	xproto_inputproto 		\
-	xproto_kbproto 			\
-	xproto_randrproto 		\
-	xproto_renderproto 		\
-	xproto_resourceproto 		\
-	xproto_videoproto 		\
-	xproto_xcmiscproto 		\
-	xproto_xextproto 		\
-	xproto_xf86bigfontproto 	\
-	xproto_xf86dgaproto 		\
-	xproto_xf86vidmodeproto 	\
-	xproto_xproto 			\
-	xkeyboard-config		\
-	pixman 				\
-	mcookie 			\
+XSERVER_XORG_SERVER_DEPENDENCIES = \
+	xfont_font-util \
+	xutil_util-macros \
+	xlib_libX11 \
+	xlib_libXau \
+	xlib_libXdmcp \
+	xlib_libXext \
+	xlib_libXfixes \
+	xlib_libXi \
+	xlib_libXrender \
+	xlib_libXres \
+	xlib_libXft \
+	xlib_libXcursor \
+	xlib_libXinerama \
+	xlib_libXrandr \
+	xlib_libXdamage \
+	xlib_libXxf86vm \
+	xlib_libxkbfile \
+	xlib_xtrans \
+	xdata_xbitmaps \
+	xproto_bigreqsproto \
+	xproto_compositeproto \
+	xproto_damageproto \
+	xproto_fixesproto \
+	xproto_fontsproto \
+	xproto_glproto \
+	xproto_inputproto \
+	xproto_kbproto \
+	xproto_randrproto \
+	xproto_renderproto \
+	xproto_resourceproto \
+	xproto_videoproto \
+	xproto_xcmiscproto \
+	xproto_xextproto \
+	xproto_xf86bigfontproto \
+	xproto_xf86dgaproto \
+	xproto_xf86vidmodeproto \
+	xproto_xproto \
+	xkeyboard-config \
+	pixman \
+	mcookie \
 	host-pkgconf
 
 # We force -O2 regardless of the optimization level chosen by the
