From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 25 Oct 2014 20:29:31 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/1=5D_package=3A_indentation_clea?=
	=?utf-8?q?nup?=
Message-ID: <1414261771-2818-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 boot/grub2/Config.in                               |    6 +-
 fs/common.mk                                       |    2 +-
 fs/cpio/cpio.mk                                    |   12 +--
 linux/linux.mk                                     |    8 +-
 package/Makefile.in                                |    2 +-
 package/at/at.mk                                   |    8 +-
 package/avahi/avahi.mk                             |    2 +-
 package/bind/bind.mk                               |    4 +-
 package/busybox/busybox.mk                         |    2 +-
 package/dhcp/dhcp.mk                               |    4 +-
 package/dstat/dstat.mk                             |    2 +-
 package/dtach/dtach.mk                             |    2 +-
 package/elfutils/elfutils.mk                       |    4 +-
 package/gcc/gcc-final/gcc-final.mk                 |   22 ++---
 package/gcc/gcc.mk                                 |    4 +-
 package/gsl/gsl.mk                                 |    4 +-
 package/lftp/lftp.mk                               |    2 +-
 package/libsoup/libsoup.mk                         |    2 +-
 package/lsof/lsof.mk                               |    6 +-
 package/midori/midori.mk                           |    6 +-
 package/ncftp/ncftp.mk                             |    2 +-
 package/netcat-openbsd/Config.in                   |   20 ++--
 package/opentyrian/opentyrian.mk                   |    2 +-
 package/pkg-autotools.mk                           |    6 +-
 package/redis/redis.mk                             |    6 +-
 package/sam-ba/sam-ba.mk                           |    6 +-
 package/sdl_image/sdl_image.mk                     |   12 +--
 package/simicsfs/simicsfs.mk                       |    4 +-
 package/strongswan/strongswan.mk                   |   96 ++++++++++----------
 package/vde2/vde2.mk                               |   12 +--
 package/vlc/vlc.mk                                 |    6 +-
 .../xcursor-transparent-theme.mk                   |    2 +-
 package/ympd/ympd.mk                               |    2 +-
 33 files changed, 140 insertions(+), 140 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 4e0d1d6..626344a 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -106,9 +106,9 @@ config BR2_TARGET_GRUB2
 	  2. Extract, and rename OVMF.fd to bios.bin and
 	     CirrusLogic5446.rom to vgabios-cirrus.bin.
 	  3. qemu-system-{i386,x86-64} -L ovmf-dir/ -hda disk.img
-          4. Make sure to pass pci=nocrs to the kernel command line,
-             to workaround a bug in the EFI BIOS regarding the
-             EFI framebuffer.
+	  4. Make sure to pass pci=nocrs to the kernel command line,
+	     to workaround a bug in the EFI BIOS regarding the
+	     EFI framebuffer.
 
 	  http://www.gnu.org/software/grub/
 
diff --git a/fs/common.mk b/fs/common.mk
index 70198c0..d40f5ae 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -31,7 +31,7 @@
 FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
 FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
-       $(BR2_ROOTFS_STATIC_DEVICE_TABLE))
+	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 USERS_TABLE = $(BUILD_DIR)/_users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 771306c..e82167e 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -7,18 +7,18 @@
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 
 define ROOTFS_CPIO_ADD_INIT
-        if [ ! -e $(TARGET_DIR)/init ]; then \
-                ln -sf sbin/init $(TARGET_DIR)/init; \
-        fi
+	if [ ! -e $(TARGET_DIR)/init ]; then \
+		ln -sf sbin/init $(TARGET_DIR)/init; \
+	fi
 endef
 
 else
 # devtmpfs does not get automounted when initramfs is used.
 # Add a pre-init script to mount it before running init
 define ROOTFS_CPIO_ADD_INIT
-        if [ ! -e $(TARGET_DIR)/init ]; then \
-                $(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
-        fi
+	if [ ! -e $(TARGET_DIR)/init ]; then \
+		$(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
+	fi
 endef
 
 PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)
diff --git a/linux/linux.mk b/linux/linux.mk
index abd3772..6740d01 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -253,10 +253,10 @@ ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 # address and entry point for the kernel from the already
 # generate uboot image before using mkimage -l.
 LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) |\
-        sed -n -e 's/Image Name:[ ]*\(.*\)/-n \1/p' -e 's/Load Address:/-a/p' -e 's/Entry Point:/-e/p'`; \
-        $(MKIMAGE) -A $(MKIMAGE_ARCH) -O linux \
-        -T kernel -C none $${MKIMAGE_ARGS} \
-        -d $(KERNEL_ARCH_PATH)/boot/zImage $(LINUX_IMAGE_PATH);
+	sed -n -e 's/Image Name:[ ]*\(.*\)/-n \1/p' -e 's/Load Address:/-a/p' -e 's/Entry Point:/-e/p'`; \
+	$(MKIMAGE) -A $(MKIMAGE_ARCH) -O linux \
+	-T kernel -C none $${MKIMAGE_ARGS} \
+	-d $(KERNEL_ARCH_PATH)/boot/zImage $(LINUX_IMAGE_PATH);
 endif
 endif
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 7c929ef..ff2ee2d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -32,7 +32,7 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR is not allowed to be empty)
 endif
 ifeq ($(TARGET_VENDOR),unknown)
 $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
-        It might be confused with the native toolchain)
+	It might be confused with the native toolchain)
 endif
 
 # Compute GNU_TARGET_NAME
diff --git a/package/at/at.mk b/package/at/at.mk
index efce57e..851a05b 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -15,10 +15,10 @@ AT_LICENSE = GPLv2+, GPLv3+, ISC
 AT_LICENSE_FILES = Copyright COPYING
 
 AT_CONF_OPTS = \
-        --with-jobdir=/var/spool/cron/atjobs \
-        --with-atspool=/var/spool/cron/atspool \
-        --with-daemon_username=root \
-        --with-daemon_groupname=root \
+	--with-jobdir=/var/spool/cron/atjobs \
+	--with-atspool=/var/spool/cron/atspool \
+	--with-daemon_username=root \
+	--with-daemon_groupname=root \
 	SENDMAIL=/usr/sbin/sendmail
 
 define AT_INSTALL_INITSCRIPT
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 3b9ac63..1ddae6c 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -86,7 +86,7 @@ AVAHI_CONF_OPTS = \
 		--with-autoipd-group=avahi
 
 AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
-       host-pkgconf host-gettext
+	host-pkgconf host-gettext
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0dcfb40..690ca3e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -76,8 +76,8 @@ endef
 
 ifeq ($(BR2_PACKAGE_BIND_SERVER),y)
 define BIND_INSTALL_INIT_SYSV
-        $(INSTALL) -m 0755 -D package/bind/S81named \
-                $(TARGET_DIR)/etc/init.d/S81named
+	$(INSTALL) -m 0755 -D package/bind/S81named \
+		$(TARGET_DIR)/etc/init.d/S81named
 endef
 else
 BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_SERVER
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 73a99fb..98d1bd1 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -173,7 +173,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
 define BUSYBOX_SET_WATCHDOG
-        $(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
 endef
 define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 25c9e76..736635a 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -26,11 +26,11 @@ DHCP_CONF_OPTS = \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
-        DHCP_CONF_OPTS += --enable-delayed-ack
+DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
 ifneq ($(BR2_INET_IPV6),y)
-        DHCP_CONF_OPTS += --disable-dhcpv6
+DHCP_CONF_OPTS += --disable-dhcpv6
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index e71b0cc..f02e908 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -11,7 +11,7 @@ DSTAT_LICENSE = GPLv2
 DSTAT_LICENSE_FILES = COPYING
 
 define DSTAT_INSTALL_TARGET_CMDS
-       $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/dtach/dtach.mk b/package/dtach/dtach.mk
index 56ab175..5f5a903 100644
--- a/package/dtach/dtach.mk
+++ b/package/dtach/dtach.mk
@@ -11,7 +11,7 @@ DTACH_LICENSE_FILES = COPYING
 
 # The Makefile does not have an install target.
 define DTACH_INSTALL_TARGET_CMDS
-        $(INSTALL) -D -m 0755 $(@D)/dtach $(TARGET_DIR)/usr/bin/dtach
+	$(INSTALL) -D -m 0755 $(@D)/dtach $(TARGET_DIR)/usr/bin/dtach
 endef
 
 $(eval $(autotools-package))
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 163db96..4f00a27 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -22,8 +22,8 @@ ELFUTILS_INSTALL_STAGING = YES
 ifeq ($(BR2_LARGEFILE),y)
 # elfutils gets confused when lfs mode is forced, so don't
 ELFUTILS_CONF_ENV += \
-        CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
-        CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
+	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
+	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
 endif
 
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS)
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 26c2011..9579b63 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -27,17 +27,17 @@ HOST_GCC_FINAL_SUBDIR = build
 HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 
 define  HOST_GCC_FINAL_CONFIGURE_CMDS
-        (cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
-                $(HOST_CONFIGURE_OPTS) \
-                CFLAGS="$(HOST_CFLAGS)" \
-                LDFLAGS="$(HOST_LDFLAGS)" \
-                $(HOST_GCC_FINAL_CONF_ENV) \
-                ./configure \
-                --prefix="$(HOST_DIR)/usr" \
-                --sysconfdir="$(HOST_DIR)/etc" \
-                --enable-static \
-                $(QUIET) $(HOST_GCC_FINAL_CONF_OPTS) \
-        )
+	(cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(HOST_GCC_FINAL_CONF_ENV) \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+		--enable-static \
+		$(QUIET) $(HOST_GCC_FINAL_CONF_OPTS) \
+	)
 endef
 
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 1352bdf..59f6268 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -26,8 +26,8 @@ GCC_SOURCE ?= gcc-$(GCC_VERSION).tar.bz2
 #
 
 define HOST_GCC_XTENSA_OVERLAY_EXTRACT
-        tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
-                $(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gcc
+	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
+		$(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gcc
 endef
 
 #
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 1dfc0f9..0ad5377 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -19,8 +19,8 @@ GSL_CONFIG_SCRIPTS = gsl-config
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ifneq ($(BR2_i386),y)
 GSL_CONF_ENV = \
-       ac_cv_have_decl_feenableexcept=no \
-       ac_cv_have_decl_fesettrapenable=no
+	ac_cv_have_decl_feenableexcept=no \
+	ac_cv_have_decl_fesettrapenable=no
 endif
 endif
 
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 25703f4..a50b018 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -31,7 +31,7 @@ endif
 
 # Remove /usr/share/lftp
 define LFTP_REMOVE_DATA
-        $(RM) -fr $(TARGET_DIR)/usr/share/lftp
+	$(RM) -fr $(TARGET_DIR)/usr/share/lftp
 endef
 
 LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_DATA
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 6833917..723b6cc 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -21,7 +21,7 @@ endif
 LIBSOUP_CONF_OPTS = --disable-glibtest
 
 LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
-       libglib2 libxml2 sqlite host-intltool
+	libglib2 libxml2 sqlite host-intltool
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
 LIBSOUP_CONF_OPTS += --with-gnome
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 7131c2c..75ce3d4 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -39,9 +39,9 @@ endif
 
 # The .tar.bz2 contains another .tar, which contains the source code.
 define LSOF_EXTRACT_CMDS
-        $(call suitable-extractor,$(LSOF_SOURCE)) $(DL_DIR)/$(LSOF_SOURCE) | \
-                $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
-        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
+	$(call suitable-extractor,$(LSOF_SOURCE)) $(DL_DIR)/$(LSOF_SOURCE) | \
+		$(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
+	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
 endef
 
 define LSOF_CONFIGURE_CMDS
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 39bf1a7..a8b0b37 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -34,15 +34,15 @@ define MIDORI_CONFIGURE_CMDS
 		$(HOST_DIR)/usr/bin/python2 ./waf configure \
 		--prefix=/usr			\
 		--disable-libnotify		\
-       )
+	)
 endef
 
 define MIDORI_BUILD_CMDS
-       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
+	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
 endef
 
 define MIDORI_INSTALL_TARGET_CMDS
-       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install)
 endef
 
 $(eval $(generic-package))
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 6ab3934..76d3bce 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -18,7 +18,7 @@ NCFTP_DEPENDENCIES = host-autoconf
 # We need to pass -I because of the non-standard m4 directory name, and
 # none of the other autotools are used, so the below is the easiest.
 define NCFTP_RUN_AUTOCONF
-       (cd $(@D); $(HOST_DIR)/usr/bin/autoconf -I$(@D)/autoconf_local/)
+	(cd $(@D); $(HOST_DIR)/usr/bin/autoconf -I$(@D)/autoconf_local/)
 endef
 NCFTP_PRE_CONFIGURE_HOOKS += NCFTP_RUN_AUTOCONF
 
diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index 47dfe5f..346561a 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -5,18 +5,18 @@ config BR2_PACKAGE_NETCAT_OPENBSD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
-          A simple Unix utility which reads and writes data across network
-          connections using TCP or UDP protocol. It is designed to be a
-          reliable "back-end" tool that can be used directly or easily driven
-          by other programs and scripts. At the same time it is a feature-rich
-          network debugging and exploration tool, since it can create almost
-          any kind of connection you would need and has several interesting
-          built-in capabilities.
+	  A simple Unix utility which reads and writes data across network
+	  connections using TCP or UDP protocol. It is designed to be a
+	  reliable "back-end" tool that can be used directly or easily driven
+	  by other programs and scripts. At the same time it is a feature-rich
+	  network debugging and exploration tool, since it can create almost
+	  any kind of connection you would need and has several interesting
+	  built-in capabilities.
 
-          This package contains the OpenBSD rewrite of netcat, including
-          support for IPv6, proxies, and Unix sockets.
+	  This package contains the OpenBSD rewrite of netcat, including
+	  support for IPv6, proxies, and Unix sockets.
 
-          https://packages.debian.org/sid/netcat-openbsd
+	  https://packages.debian.org/sid/netcat-openbsd
 
 comment "netcat-openbsd needs an (e)glibc toolchain w/ threads"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index 64959ca..f00a52b 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -20,7 +20,7 @@ OPENTYRIAN_NETWORK = false
 endif
 
 define OPENTYRIAN_BUILD_CMDS
-        $(MAKE) PLATFORM=UNIX \
+	$(MAKE) PLATFORM=UNIX \
 		CC="$(TARGET_CC)" \
 		STRIP="/bin/true" \
 		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 3c6bb0d..09f9412 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -162,7 +162,7 @@ define $(2)_CONFIGURE_CMDS
 	        $$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$$(HOST_CFLAGS)" \
 		LDFLAGS="$$(HOST_LDFLAGS)" \
-                $$($$(PKG)_CONF_ENV) \
+		$$($$(PKG)_CONF_ENV) \
 		CONFIG_SITE=/dev/null \
 		./configure \
 		--prefix="$$(HOST_DIR)/usr" \
@@ -187,8 +187,8 @@ endif
 # Hook to update config.sub and config.guess if needed
 #
 define UPDATE_CONFIG_HOOK
-       @$$(call MESSAGE,"Updating config.sub and config.guess")
-       $$(call CONFIG_UPDATE,$$(@D))
+	@$$(call MESSAGE,"Updating config.sub and config.guess")
+	$$(call CONFIG_UPDATE,$$(@D))
 endef
 
 $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index f3f9acb..00490e7 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -16,12 +16,12 @@ REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
 	PREFIX=$(TARGET_DIR)/usr MALLOC=libc \
 
 define REDIS_BUILD_CMDS
-        $(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
 endef
 
 define REDIS_INSTALL_TARGET_CMDS
-        $(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) \
-	    LDCONFIG=true install
+	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) \
+		LDCONFIG=true install
 endef
 
 $(eval $(generic-package))
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index c03fcc4..905a6cb 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -12,9 +12,9 @@ SAM_BA_LICENSE = BSD-like (partly binary-only)
 SAM_BA_LICENSE_FILES = doc/readme.txt
 
 define HOST_SAM_BA_EXTRACT_CMDS
-        unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
-        mv $(BUILD_DIR)/sam-ba_cdc_cdc_linux/* $(@D)
-        rmdir $(BUILD_DIR)/sam-ba_cdc_cdc_linux/
+	unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
+	mv $(BUILD_DIR)/sam-ba_cdc_cdc_linux/* $(@D)
+	rmdir $(BUILD_DIR)/sam-ba_cdc_cdc_linux/
 endef
 
 # Since it's a prebuilt application and it does not conform to the
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 65e6e5d..951ea45 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -36,12 +36,12 @@ SDL_IMAGE_DEPENDENCIES = sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),webp)
 
 HOST_SDL_IMAGE_CONF_OPTS = --with-sdl-prefix=$(HOST_DIR)/usr \
-                --with-sdl-exec-prefix=$(HOST_DIR)/usr \
-                --disable-sdltest \
-                --disable-static \
-                --disable-jpg-shared \
-                --disable-png-shared \
-                --disable-tif-shared \
+		--with-sdl-exec-prefix=$(HOST_DIR)/usr \
+		--disable-sdltest \
+		--disable-static \
+		--disable-jpg-shared \
+		--disable-png-shared \
+		--disable-tif-shared \
 
 HOST_SDL_IMAGE_DEPENDENCIES = host-libjpeg host-libpng host-sdl
 
diff --git a/package/simicsfs/simicsfs.mk b/package/simicsfs/simicsfs.mk
index 34061ff..51987c5 100644
--- a/package/simicsfs/simicsfs.mk
+++ b/package/simicsfs/simicsfs.mk
@@ -11,11 +11,11 @@ SIMICSFS_LICENSE_FILES = hostfs.h
 SIMICSFS_DEPENDENCIES = linux
 
 define SIMICSFS_BUILD_CMDS
-        $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
+	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
 endef
 
 define SIMICSFS_INSTALL_TARGET_CMDS
-        $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
+	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 endef
 
 $(eval $(generic-package))
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 9aff1e0..bb1d268 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -10,61 +10,61 @@ STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
-STRONGSWAN_CONF_OPTS +=                                                             \
-      --without-lib-prefix                                                         \
-      --enable-pkcs11=yes                                                          \
-      --enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no)                        \
-      --enable-socket-default=$(if $(BR2_INET_IPV6),yes,no)                        \
-      --enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no)              \
-      --enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no)                \
-      --enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no)                      \
-      --enable-af-alg=$(if $(BR2_PACKAGE_STRONGSWAN_AF_ALG),yes,no)                \
-      --enable-curl=$(if $(BR2_PACKAGE_STRONGSWAN_CURL),yes,no)                    \
-      --enable-charon=$(if $(BR2_PACKAGE_STRONGSWAN_CHARON),yes,no)                \
-      --enable-tnccs-11=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),yes,no)            \
-      --enable-tnccs-20=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_20),yes,no)            \
-      --enable-tnccs-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC),yes,no)  \
-      --enable-eap-sim-pcsc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),yes,no)    \
-      --enable-unity=$(if $(BR2_PACKAGE_STRONGSWAN_UNITY),yes,no)                  \
-      --enable-stroke=$(if $(BR2_PACKAGE_STRONGSWAN_STROKE),yes,no)                \
-      --enable-sql=$(if $(BR2_PACKAGE_STRONGSWAN_SQL),yes,no)                      \
-      --enable-tools=$(if $(BR2_PACKAGE_STRONGSWAN_TOOLS),yes,no)                  \
-      --enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no)
+STRONGSWAN_CONF_OPTS +=                                                              \
+	--without-lib-prefix                                                         \
+	--enable-pkcs11=yes                                                          \
+	--enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no)                        \
+	--enable-socket-default=$(if $(BR2_INET_IPV6),yes,no)                        \
+	--enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no)              \
+	--enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no)                \
+	--enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no)                      \
+	--enable-af-alg=$(if $(BR2_PACKAGE_STRONGSWAN_AF_ALG),yes,no)                \
+	--enable-curl=$(if $(BR2_PACKAGE_STRONGSWAN_CURL),yes,no)                    \
+	--enable-charon=$(if $(BR2_PACKAGE_STRONGSWAN_CHARON),yes,no)                \
+	--enable-tnccs-11=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),yes,no)            \
+	--enable-tnccs-20=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_20),yes,no)            \
+	--enable-tnccs-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC),yes,no)  \
+	--enable-eap-sim-pcsc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),yes,no)    \
+	--enable-unity=$(if $(BR2_PACKAGE_STRONGSWAN_UNITY),yes,no)                  \
+	--enable-stroke=$(if $(BR2_PACKAGE_STRONGSWAN_STROKE),yes,no)                \
+	--enable-sql=$(if $(BR2_PACKAGE_STRONGSWAN_SQL),yes,no)                      \
+	--enable-tools=$(if $(BR2_PACKAGE_STRONGSWAN_TOOLS),yes,no)                  \
+	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no)
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
-STRONGSWAN_CONF_OPTS +=              \
-      --enable-eap-sim              \
-      --enable-eap-sim-file         \
-      --enable-eap-aka              \
-      --enable-eap-aka-3gpp2        \
-      --enable-eap-simaka-sql       \
-      --enable-eap-simaka-pseudonym \
-      --enable-eap-simaka-reauth    \
-      --enable-eap-identity         \
-      --enable-eap-md5              \
-      --enable-eap-gtc              \
-      --enable-eap-mschapv2         \
-      --enable-eap-tls              \
-      --enable-eap-ttls             \
-      --enable-eap-peap             \
-      --enable-eap-tnc              \
-      --enable-eap-dynamic          \
-      --enable-eap-radius
+STRONGSWAN_CONF_OPTS +=               \
+	--enable-eap-sim              \
+	--enable-eap-sim-file         \
+	--enable-eap-aka              \
+	--enable-eap-aka-3gpp2        \
+	--enable-eap-simaka-sql       \
+	--enable-eap-simaka-pseudonym \
+	--enable-eap-simaka-reauth    \
+	--enable-eap-identity         \
+	--enable-eap-md5              \
+	--enable-eap-gtc              \
+	--enable-eap-mschapv2         \
+	--enable-eap-tls              \
+	--enable-eap-ttls             \
+	--enable-eap-peap             \
+	--enable-eap-tnc              \
+	--enable-eap-dynamic          \
+	--enable-eap-radius
 STRONGSWAN_DEPENDENCIES += gmp
 endif
 
-STRONGSWAN_DEPENDENCIES +=                               \
-      $(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl)    \
-      $(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt)   \
-      $(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp)            \
-      $(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl)       \
-      $(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2)   \
-      $(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite)
+STRONGSWAN_DEPENDENCIES +=                                 \
+	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl)    \
+	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt)   \
+	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp)            \
+	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl)       \
+	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2)   \
+	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite)
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_SQL),y)
-STRONGSWAN_DEPENDENCIES +=                               \
-      $(if $(BR2_PACKAGE_SQLITE),sqlite)                 \
-      $(if $(BR2_PACKAGE_MYSQL),mysql)
+STRONGSWAN_DEPENDENCIES +=                                 \
+	$(if $(BR2_PACKAGE_SQLITE),sqlite)                 \
+	$(if $(BR2_PACKAGE_MYSQL),mysql)
 endif
 
 $(eval $(autotools-package))
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index e7ec332..c8bcfae 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -26,12 +26,12 @@ VDE2_AUTORECONF = YES
 # Note: disabled features can be added with corresponding dependencies
 #       in future commits.
 VDE2_CONF_OPTS = --disable-experimental  \
-                --disable-cryptcab      \
-                --disable-pcap          \
-                --disable-python        \
-                --disable-profile       \
-                --disable-kernel-switch \
-                --enable-tuntap         \
+		--disable-cryptcab      \
+		--disable-pcap          \
+		--disable-python        \
+		--disable-profile       \
+		--disable-kernel-switch \
+		--enable-tuntap         \
 
 #?Package does not build in parallel due to improper make rules
 VDE2_MAKE = $(MAKE1)
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 5a75087..7e81d59 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -252,9 +252,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPTS += --enable-qt
 VLC_CONF_ENV += \
-       ac_cv_path_MOC=$(HOST_DIR)/usr/bin/moc \
-       ac_cv_path_RCC=$(HOST_DIR)/usr/bin/rcc \
-       ac_cv_path_UIC=$(HOST_DIR)/usr/bin/uic
+	ac_cv_path_MOC=$(HOST_DIR)/usr/bin/moc \
+	ac_cv_path_RCC=$(HOST_DIR)/usr/bin/rcc \
+	ac_cv_path_UIC=$(HOST_DIR)/usr/bin/uic
 VLC_DEPENDENCIES += qt
 else
 VLC_CONF_OPTS += --disable-qt
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
index a52f8d0..5c6f2d2 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -11,7 +11,7 @@ XCURSOR_TRANSPARENT_THEME_LICENSE = GPLv2
 XCURSOR_TRANSPARENT_THEME_LICENSE_FILES = COPYING
 
 define ICONS_DEFAULT_CONFIG_INSTALL
-        $(INSTALL) -m 0755 -D package/x11r7/xcursor-transparent-theme/index.theme \
+	$(INSTALL) -m 0755 -D package/x11r7/xcursor-transparent-theme/index.theme \
 		$(TARGET_DIR)/usr/share/icons/default/index.theme
 endef
 
diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
index ac51eb9..2898c9d 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -11,7 +11,7 @@ YMPD_LICENSE_FILE = LICENSE
 YMPD_DEPENDENCIES = libmpdclient
 
 define YMPD_MAKE_HOST_TOOL
-        $(HOSTCC) $(HOST_CFLAGS) $(@D)/htdocs/mkdata.c -o $(@D)/mkdata
+	$(HOSTCC) $(HOST_CFLAGS) $(@D)/htdocs/mkdata.c -o $(@D)/mkdata
 endef
 
 YMPD_PRE_BUILD_HOOKS += YMPD_MAKE_HOST_TOOL
-- 
1.7.9.5
