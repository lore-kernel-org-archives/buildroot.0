From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 23:28:34 +0100
Subject: [Buildroot] [PATCH 1/9] Rename BR2_LARGEFILE to
	BR2_TOOLCHAIN_HAS_LARGEFILE
In-Reply-To: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
Message-ID: <497953e44beee80e7dd1098b32a0211f03808a6e.1299536722.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk                                |    2 +-
 boot/grub2/grub2.mk                              |    2 +-
 configs/arm_nptl_toolchain_defconfig             |    2 +-
 configs/arm_toolchain_defconfig                  |    2 +-
 package/Makefile.in                              |    4 ++--
 package/bind/Config.in                           |    4 ++--
 package/bootutils/Config.in                      |    4 ++--
 package/busybox/busybox.mk                       |    2 +-
 package/bzip2/bzip2.mk                           |    2 +-
 package/cdrkit/Config.in                         |    4 ++--
 package/dmraid/Config.in                         |    4 ++--
 package/dnsmasq/dnsmasq.mk                       |    2 +-
 package/dosfstools/Config.in                     |    4 ++--
 package/e2fsprogs/Config.in                      |    4 ++--
 package/fuse/Config.in                           |    4 ++--
 package/gamin/gamin.mk                           |    2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                 |    2 +-
 package/gvfs/Config.in                           |    4 ++--
 package/hdparm/Config.in                         |    4 ++--
 package/imagemagick/imagemagick.mk               |    2 +-
 package/iptables/Config.in                       |    4 ++--
 package/libdrm/Config.in                         |    4 ++--
 package/libelf/libelf.mk                         |    2 +-
 package/libupnp/Config.in                        |    4 ++--
 package/libxml2/libxml2.mk                       |    2 +-
 package/lighttpd/lighttpd.mk                     |    2 +-
 package/lsof/lsof.mk                             |    2 +-
 package/luafilesystem/luafilesystem.mk           |    2 +-
 package/lvm2/Config.in                           |    4 ++--
 package/memtester/Config.in                      |    4 ++--
 package/multimedia/alsa-utils/Config.in          |    4 ++--
 package/multimedia/ffmpeg/Config.in              |    4 ++--
 package/multimedia/gst-ffmpeg/Config.in          |    4 ++--
 package/multimedia/gst-plugins-bad/Config.in     |    4 ++--
 package/multimedia/libdvdnav/Config.in           |    4 ++--
 package/multimedia/libdvdread/Config.in          |    4 ++--
 package/multimedia/mpd/Config.in                 |    4 ++--
 package/multimedia/mplayer/mplayer.mk            |    2 +-
 package/nbd/nbd.mk                               |    2 +-
 package/ncftp/Config.in                          |    4 ++--
 package/nfs-utils/Config.in                      |    4 ++--
 package/ntfs-3g/Config.in                        |    4 ++--
 package/ntfsprogs/Config.in                      |    4 ++--
 package/php/php.mk                               |    4 ++--
 package/qt/qt.mk                                 |    2 +-
 package/sfdisk/sfdisk.mk                         |    2 +-
 package/sqlite/sqlite.mk                         |    2 +-
 package/squashfs/Config.in                       |    4 ++--
 package/squashfs3/Config.in                      |    4 ++--
 package/sshfs/Config.in                          |    4 ++--
 package/strace/strace.mk                         |    2 +-
 package/sysklogd/Config.in                       |    4 ++--
 package/udev/udev.mk                             |    2 +-
 package/udpcast/Config.in                        |    4 ++--
 package/wipe/wipe.mk                             |    2 +-
 package/x11r7/Config.in                          |    4 ++--
 package/x11r7/xlib_libpciaccess/Config.in        |    4 ++--
 package/xfsprogs/Config.in                       |    4 ++--
 target/xtensa/defconfig                          |    2 +-
 toolchain/gcc/Config.in                          |    2 +-
 toolchain/helpers.mk                             |    4 ++--
 toolchain/toolchain-buildroot/Config.in.2        |    2 +-
 toolchain/toolchain-common.in                    |    2 +-
 toolchain/toolchain-crosstool-ng/Config.in       |    6 +++---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 toolchain/toolchain-external/Config.in           |    4 ++--
 toolchain/uClibc/uclibc.mk                       |    2 +-
 67 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 401d346..cf5d118 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -15,7 +15,7 @@ GRUB_SPLASHIMAGE=$(TOPDIR)/boot/grub/splash.xpm.gz
 
 
 GRUB_CFLAGS=-DSUPPORT_LOOPDEV
-ifeq ($(BR2_LARGEFILE),)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),)
 GRUB_CFLAGS+=-U_FILE_OFFSET_BITS
 endif
 
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index f939d9a..5a08c95 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -20,7 +20,7 @@ GRUB2_CAT:=$(ZCAT)
 GRUB2_DIR:=$(BUILD_DIR)/grub-1.98
 
 GRUB2_CFLAGS=-DSUPPORT_LOOPDEV
-ifeq ($(BR2_LARGEFILE),)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),)
 GRUB2_CFLAGS+=-U_FILE_OFFSET_BITS
 endif
 
diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index 8100073..78dc557 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_arm926t=y
 
 # Toolchain options
-BR2_LARGEFILE=y
+BR2_TOOLCHAIN_HAS_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 8bc97c9..7fa51c2 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -2,7 +2,7 @@
 BR2_arm=y
 
 # Common Toolchain Options
-BR2_LARGEFILE=y
+BR2_TOOLCHAIN_HAS_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
diff --git a/package/Makefile.in b/package/Makefile.in
index ef2c591..4aa52dc 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -94,7 +94,7 @@ ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
 TARGET_CFLAGS+=-fno-pic -mno-abicalls
 endif
 
-ifeq ($(BR2_LARGEFILE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
@@ -295,7 +295,7 @@ else
 DISABLE_NLS:=--disable-nls
 endif
 
-ifneq ($(BR2_LARGEFILE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 DISABLE_LARGEFILE= --disable-largefile
 endif
 
diff --git a/package/bind/Config.in b/package/bind/Config.in
index 827ee26..f3a9ab4 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  BIND (Berkeley Internet Name Domain) is an implementation of
 	  the Domain Name System (DNS) protocols and provides an openly
@@ -28,4 +28,4 @@ config BR2_PACKAGE_BIND_TOOLS
 	  Install tools (host, nslookup, dig, nsupdate)
 
 comment "bind requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
index 06a8fd8..d2a91c1 100644
--- a/package/bootutils/Config.in
+++ b/package/bootutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BOOTUTILS
 	bool "bootutils"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  BootUtils is a collection of utilities to facilitate booting of
 	  Linux 2.6-based systems. The process of finding the root volume
@@ -10,4 +10,4 @@ config BR2_PACKAGE_BOOTUTILS
 	  http://bootutils.pr.linuxrulz.org/
 
 comment "bootutils requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5583bc6..6764427 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -47,7 +47,7 @@ define BUSYBOX_SET_BB_PWD
 endef
 endif
 
-ifeq ($(BR2_LARGEFILE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 define BUSYBOX_SET_LARGEFILE
 	$(call KCONFIG_ENABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FDISK_SUPPORT_LARGE_DISKS,$(BUSYBOX_BUILD_CONFIG))
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 123e579..3b8ee7d 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -24,7 +24,7 @@ define BZIP2_NOLARGEFILE_FIX_MAKEFILE
 	$(SED) "s,^BIGFILES,#BIGFILES,g" $(@D)/Makefile-libbz2_so
 endef
 
-ifneq ($(BR2_LARGEFILE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 BZIP2_POST_PATCH_HOOKS += BZIP2_NOLARGEFILE_FIX_MAKEFILE
 endif
 
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 7ff50f3..ecfc1ca 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_CDRKIT
 	# Needed for libbz
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	bool "cdrkit"
 	help
 	  cdrkit is a suite of programs for recording CDs and DVDs,
@@ -12,4 +12,4 @@ config BR2_PACKAGE_CDRKIT
 	  http://www.cdrkit.org/
 
 comment "cdrkit requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 7b37244..b858894 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -10,4 +10,4 @@ config BR2_PACKAGE_DMRAID
 	  respective mappings for the ATARAID sets discovered.
 
 comment "dmraid requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 976e1d6..9347ee5 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -28,7 +28,7 @@ ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
 	DNSMASQ_MAKE_ENV += LDFLAGS+="-lintl"
 endif
 
-ifneq ($(BR2_LARGEFILE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 	DNSMASQ_COPTS += -DNO_LARGEFILE
 endif
 
diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
index 1b92026..535d7ae 100644
--- a/package/dosfstools/Config.in
+++ b/package/dosfstools/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DOSFSTOOLS
 	bool "dosfstools"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  Tools for creating and checking DOS FAT filesystems.
 
@@ -25,4 +25,4 @@ config BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL
 	  Get or set the DOS FAT filesystem label.
 
 comment "dosfstools requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 2bb92d9..f2669af 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,7 +1,7 @@
 
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  The EXT2 file system utilities and libraries
 
@@ -135,5 +135,5 @@ config BR2_PACKAGE_E2FSPROGS_LIBBLKID
 endmenu
 
 comment "e2fsprogs requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
 
diff --git a/package/fuse/Config.in b/package/fuse/Config.in
index dffadf8..d1d70d1 100644
--- a/package/fuse/Config.in
+++ b/package/fuse/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  FUSE (Filesystem in UserSpacE)
 
 	  http://fuse.sourceforge.net/
 
 comment "libfuse requires a toolchain with LARGEFILE support"
-        depends on !BR2_LARGEFILE
+        depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index f0600b2..3a978ef 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -17,7 +17,7 @@ GAMIN_CONF_OPT += --without-python
 
 GAMIN_CONF_ENV = have_abstract_sockets=no
 
-ifneq ($(BR2_LARGEFILE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 GAMIN_CONF_ENV += CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
 endif
 
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index cf915bb..83c59bf 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -16,7 +16,7 @@ GDK_PIXBUF_CONF_ENV = \
 
 GDK_PIXBUF_CONF_OPT = --disable-glibtest
 
-ifneq ($(BR2_LARGEFILE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 GDK_PIXBUF_CONF_OPT += --disable-largefile
 endif
 
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 04fce93..22c93ef 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GVFS
 	bool "gvfs"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT # needed by dbus(-glib)
@@ -17,4 +17,4 @@ config BR2_PACKAGE_GVFS
 	  http://en.wikipedia.org/wiki/GVFS
 
 comment "gvfs requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/hdparm/Config.in b/package/hdparm/Config.in
index 32bd247..f82c85a 100644
--- a/package/hdparm/Config.in
+++ b/package/hdparm/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_HDPARM
 	bool "hdparm"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  hdparm - get/set hard disk parameters for Linux IDE drives.
 
 	  http://www.ibiblio.org/pub/Linux/system/hardware/
 
 comment "hdparm requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 97c0041..5cd6275 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -11,7 +11,7 @@ IMAGEMAGICK_SITE = ftp://ftp.imagemagick.org/pub/ImageMagick
 IMAGEMAGICK_INSTALL_STAGING = YES
 IMAGEMAGICK_AUTORECONF = YES
 
-ifeq ($(BR2_LARGEFILE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
 else
 IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=32
diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index da5a832..58039bf 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_IPTABLES
 	bool "iptables"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  Linux kernel (2.4+) firewall, NAT, and packet mangling tools.
 
 	  http://www.iptables.org/
 
 comment "iptables requires a toolchain with LARGEFILE support"
-        depends on !BR2_LARGEFILE
+        depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index d68f9d5..8560115 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
@@ -15,4 +15,4 @@ config BR2_PACKAGE_LIBDRM
 	  http://dri.freedesktop.org/libdrm/
 
 comment "libdrm requires a toolchain with LARGEFILE support"
-	depends on BR2_PACKAGE_XORG7 && !BR2_LARGEFILE
+	depends on BR2_PACKAGE_XORG7 && !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 2a7d066..c838d43 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -16,6 +16,6 @@ LIBELD_CONF_ENV = libelf_cv_working_memmove=yes \
 
 LIBELF_CONF_OPT = --enable-shared --disable-sanity-checks \
 		$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
-		$(if $(BR2_LARGEFILE),--enable-elf64)
+		$(if $(BR2_TOOLCHAIN_HAS_LARGEFILE),--enable-elf64)
 
 $(eval $(call AUTOTARGETS,package,libelf))
diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
index 2e6edcd..a033996 100644
--- a/package/libupnp/Config.in
+++ b/package/libupnp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBUPNP
 	bool "libupnp"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  The portable SDK for UPnP(tm) Devices (libupnp) provides developers
 	  with an API and open source code for building control points,
@@ -10,4 +10,4 @@ config BR2_PACKAGE_LIBUPNP
 	  http://pupnp.sourceforge.net/
 
 comment "libupnp requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index d07f631..fcfd14a 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -8,7 +8,7 @@ LIBXML2_VERSION = 2.7.8
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 
-ifneq ($(BR2_LARGEFILE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
 endif
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 67cd272..22e4974 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -12,7 +12,7 @@ LIGHTTPD_CONF_OPT = \
 	--libexecdir=/usr/lib \
 	--localstatedir=/var \
 	--program-prefix="" \
-	$(if $(BR2_LARGEFILE),,--disable-lfs)
+	$(if $(BR2_TOOLCHAIN_HAS_LARGEFILE),,--disable-lfs)
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 167cb20..18783d0 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -8,7 +8,7 @@ LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
 LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 
 BR2_LSOF_CFLAGS =
-ifeq ($(BR2_LARGEFILE),)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),)
 BR2_LSOF_CFLAGS += -U_FILE_OFFSET_BITS
 endif
 ifeq ($(BR2_INET_IPV6),)
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 5f1119a..8d8a047 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -8,7 +8,7 @@ LUAFILESYSTEM_VERSION = 1.5.0
 LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
 LUAFILESYSTEM_DEPENDENCIES = lua
 
-ifeq ($(BR2_LARGEFILE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 LFS_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
 endif
 
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 30af14e..8d860a1 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and disk
@@ -22,4 +22,4 @@ config BR2_PACKAGE_LVM2_DMSETUP_ONLY
 	  Install dmsetup only and skip the LVM2 suite.
 
 comment "lvm2 requires a toolchain with LARGEFILE support"
-        depends on !BR2_LARGEFILE
+        depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/memtester/Config.in b/package/memtester/Config.in
index 82769f5..ede54d2 100644
--- a/package/memtester/Config.in
+++ b/package/memtester/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_MEMTESTER
 	bool "memtester"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  A userspace utility for testing the memory subsystem for faults.
 
 	  http://pyropus.ca/software/memtester/
 
 comment "memtester requires a toolchain with LARGEFILE support"
-       depends on !BR2_LARGEFILE
+       depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index b85ff7e..b268606 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_PACKAGE_ALSA_LIB
 	help
 	  This package contains the command line utilities for the ALSA
@@ -9,7 +9,7 @@ config BR2_PACKAGE_ALSA_UTILS
 	  http://www.alsa-project.org/
 
 comment "alsa-utils requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
 
 if BR2_PACKAGE_ALSA_UTILS
 menu "ALSA utils selection"
diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
index 7a9513c..901a6dd 100644
--- a/package/multimedia/ffmpeg/Config.in
+++ b/package/multimedia/ffmpeg/Config.in
@@ -1,9 +1,9 @@
 comment "ffmpeg requires a toolchain with LARGEFILE and IPV6 support"
-	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
+	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_INET_IPV6)
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	depends on BR2_INET_IPV6
 	help
          FFmpeg is a complete, cross-platform solution to record, convert
diff --git a/package/multimedia/gst-ffmpeg/Config.in b/package/multimedia/gst-ffmpeg/Config.in
index 537101e..c4f4681 100644
--- a/package/multimedia/gst-ffmpeg/Config.in
+++ b/package/multimedia/gst-ffmpeg/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_GST_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
 	select BR2_PACKAGE_FFMPEG_POSTPROC
 	select BR2_PACKAGE_FFMPEG_SWSCALE
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	depends on BR2_INET_IPV6
 	help
 	  GStreamer plugin using FFmpeg.
@@ -14,4 +14,4 @@ config BR2_PACKAGE_GST_FFMPEG
 	  http://gstreamer.freedesktop.org/
 
 comment "gst-ffmpeg requires a toolchain with LARGEFILE and IPV6 support"
-	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
+	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index e25b756..6665110 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -58,11 +58,11 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDNAV
 	bool "dvdnav"
-	depends on BR2_LARGEFILE # libdvdread
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE # libdvdread
 	select BR2_PACKAGE_LIBDVDNAV
 
 comment "dvdnav requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU
 	bool "dvdspu"
diff --git a/package/multimedia/libdvdnav/Config.in b/package/multimedia/libdvdnav/Config.in
index 5ba31e8..1936674 100644
--- a/package/multimedia/libdvdnav/Config.in
+++ b/package/multimedia/libdvdnav/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
-	depends on BR2_LARGEFILE # libdvdread
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE # libdvdread
         select BR2_PACKAGE_LIBDVDREAD
 	help
 	  libdvdnav is a library that allows easy use of sophisticated
@@ -10,4 +10,4 @@ config BR2_PACKAGE_LIBDVDNAV
 	  http://www.mplayerhq.hu
 
 comment "libdvdnav requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/multimedia/libdvdread/Config.in b/package/multimedia/libdvdread/Config.in
index b63f082..e58e029 100644
--- a/package/multimedia/libdvdread/Config.in
+++ b/package/multimedia/libdvdread/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBDVDREAD
 	bool "libdvdread"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBDVDREAD
 	  http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
 
 comment "libdvdread requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index b3491f2..66fc2e4 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -59,13 +59,13 @@ config BR2_PACKAGE_MPD_FLAC
 config BR2_PACKAGE_MPD_FFMPEG
 	bool "ffmpeg"
 	select BR2_PACKAGE_FFMPEG
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  Enable ffmpeg input support.
 	  Select this if you want to play back files supported by ffmpeg.
 
 comment "ffmpeg support requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
 
 config BR2_PACKAGE_MPD_LAME
 	bool "lame"
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 7d45960..ac51ece 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -24,7 +24,7 @@ endif
 
 # mplayer unfortunately uses --disable-largefiles, so we cannot use
 # DISABLE_LARGEFILE
-ifeq ($(BR2_LARGEFILE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 MPLAYER_CONF_OPTS += --enable-largefiles
 else
 # dvdread/dvdcss requires largefile support
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index a09b10b..1cca02a 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -7,7 +7,7 @@
 NBD_VERSION = 2.9.15
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
 NBD_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
-NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
+NBD_CONF_OPT = $(if $(BR2_TOOLCHAIN_HAS_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
 
 ifneq ($(BR2_NBD_CLIENT),y)
diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index a29934a..2b7f1de 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NCFTP
 	bool "ncftp"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  NcFTP Client (also known as just NcFTP) is a set of FREE application
 	  programs implementing the File Transfer Protocol (FTP).
@@ -33,4 +33,4 @@ config BR2_PACKAGE_NCFTP_BOOKMARKS
 endmenu
 
 comment "ncftp requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 774395b..e7b0566 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_INET_RPC
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  The NFS Linux kernel server.
 	  Warning: We do not force largefile support on here on purpose.
@@ -10,7 +10,7 @@ config BR2_PACKAGE_NFS_UTILS
 	  http://sourceforge.net/projects/nfs
 
 comment "nfs-utils requires a toolchain with RPC and LARGEFILE support"
-	depends on !BR2_INET_RPC || !BR2_LARGEFILE
+	depends on !BR2_INET_RPC || !BR2_TOOLCHAIN_HAS_LARGEFILE
 
 menu "NFS utilities selection"
 	depends on BR2_PACKAGE_NFS_UTILS
diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index 865f9b4..e1e3f0d 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NTFS_3G
 	bool "ntfs-3g"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	depends on BR2_USE_WCHAR
 	help
 	  The NTFS-3G driver is an open source, freely available
@@ -13,4 +13,4 @@ config BR2_PACKAGE_NTFS_3G
 	  http://www.ntfs-3g.org/
 
 comment "ntfs-3g requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
+	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/ntfsprogs/Config.in b/package/ntfsprogs/Config.in
index 836a2b6..d09987a 100644
--- a/package/ntfsprogs/Config.in
+++ b/package/ntfsprogs/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_NTFSPROGS
 	bool "ntfsprogs"
 	depends on BR2_USE_WCHAR
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  wide collection of NTFS utilities
 
 	  http://www.linux-ntfs.org/
 
 comment "ntfsprogs requires a toolchain with WCHAR and LARGEFILE support"
-	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/php/php.mk b/package/php/php.mk
index ad0ae43..ae3aec5 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -142,7 +142,7 @@ endif
 ### Legacy sqlite2 support
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 	PHP_CONF_OPT += --with-sqlite
-ifneq ($(BR2_LARGEFILE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 	PHP_CFLAGS += -DSQLITE_DISABLE_LFS
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE_UTF8),y)
@@ -161,7 +161,7 @@ else
 	PHP_CONF_OPT += --with-pdo-sqlite
 endif
 	PHP_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
-ifneq ($(BR2_LARGEFILE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 	PHP_CFLAGS += -DSQLITE_DISABLE_LFS
 endif
 endif
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6974b2f..a4a1fc8 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -36,7 +36,7 @@ endif
 QT_QCONFIG_FILE:=package/qt/qconfig-myfile.h
 QT_QCONFIG_FILE_LOCATION:=/src/corelib/global/
 
-ifeq ($(BR2_LARGEFILE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 QT_CONFIGURE+= -largefile
 else
 QT_CONFIGURE+= -no-largefile
diff --git a/package/sfdisk/sfdisk.mk b/package/sfdisk/sfdisk.mk
index 81c4943..7e5fdaf 100644
--- a/package/sfdisk/sfdisk.mk
+++ b/package/sfdisk/sfdisk.mk
@@ -21,7 +21,7 @@ $(SFDISK_DIR)/.patched: $(DL_DIR)/$(SFDISK_SOURCE)
 $(SFDISK_DIR)/sfdisk: $(SFDISK_DIR)/.patched
 	$(MAKE) \
 		CROSS=$(TARGET_CROSS) DEBUG=false OPTIMIZATION="$(TARGET_CFLAGS)" \
-		DOLFS=$(if $(BR2_LARGEFILE),true,false) -C $(SFDISK_DIR)
+		DOLFS=$(if $(BR2_TOOLCHAIN_HAS_LARGEFILE),true,false) -C $(SFDISK_DIR)
 	-$(STRIPCMD) $(SFDISK_DIR)/sfdisk
 	touch -c $(SFDISK_DIR)/sfdisk
 
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 30e75a2..8531eb3 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -9,7 +9,7 @@ SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
 
-ifneq ($(BR2_LARGEFILE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 # the sqlite configure script fails to define SQLITE_DISABLE_LFS when
 # --disable-largefile is passed, breaking the build. Work around it by
 # simply adding it to CFLAGS for configure instead
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 7d0fc71..8f43b67 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SQUASHFS
 	bool "squashfs"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_PACKAGE_SQUASHFS_GZIP if !(BR2_PACKAGE_SQUASHFS_LZMA || BR2_PACKAGE_SQUASHFS_LZO)
 	help
 	  Tools to generate SquashFS filesystems.
@@ -37,4 +37,4 @@ config BR2_PACKAGE_SQUASHFS_XZ
 endif
 
 comment "squashfs requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/squashfs3/Config.in b/package/squashfs3/Config.in
index 3291272..bc8622c 100644
--- a/package/squashfs3/Config.in
+++ b/package/squashfs3/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_SQUASHFS3
 	bool "squashfs3"
 	depends on BR2_DEPRECATED
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  Tools to generate SquashFS 3.x filesystems.
 
 	  http://squashfs.sourceforge.net/
 
 comment "squashfs3 requires a toolchain with LARGEFILE support"
-	depends on BR2_DEPRECATED && !BR2_LARGEFILE
+	depends on BR2_DEPRECATED && !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 1d9f759..66fdde7 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	help
 	  FUSE makes it possible to implement a filesystem in a userspace
@@ -17,4 +17,4 @@ config BR2_PACKAGE_SSHFS
 	  http://fuse.sourceforge.net/sshfs.html
 
 comment "sshfs requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 85e82c1..08612ae 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -10,7 +10,7 @@ STRACE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/st
 
 STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes \
-	          $(if $(BR2_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
+	          $(if $(BR2_TOOLCHAIN_HAS_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
 
 define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index e3cf2ba..4543013 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SYSKLOGD
 	bool "syslogd & klogd"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  System log daemons syslogd and klogd.
 
 	  http://www.infodrom.org/products/sysklogd/
 
 comment "syslogd requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 4b61ce4..b9730c8 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -14,7 +14,7 @@ UDEV_INSTALL_STAGING=YES
 
 # 094 had _GNU_SOURCE set
 BR2_UDEV_CFLAGS:= -D_GNU_SOURCE $(TARGET_CFLAGS)
-ifeq ($(BR2_LARGEFILE),)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),)
 BR2_UDEV_CFLAGS+=-U_FILE_OFFSET_BITS
 endif
 
diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index d7ccfb4..b7e9691 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_UDPCAST
 	bool "udpcast"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  A multicast protocol implementation which happens to
 	  be very handy for imaging drives over the network.
@@ -8,7 +8,7 @@ config BR2_PACKAGE_UDPCAST
 	  http://www.udpcast.linux.lu/
 
 comment "udpcast requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
 
 menu "udpcast tools selection"
 depends on BR2_PACKAGE_UDPCAST
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index d227389..12b1bbb 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -8,7 +8,7 @@ WIPE_VERSION = 0.22
 WIPE_SITE = http://lambda-diode.com/resources/wipe
 WIPE_CFLAGS = $(TARGET_CFLAGS) -DHAVE_DEV_URANDOM -DHAVE_OSYNC -DHAVE_STRCASECMP -DHAVE_RANDOM -DSYNC_WAITS_FOR_SYNC -DFIND_DEVICE_SIZE_BY_BLKGETSIZE
 
-ifeq ($(BR2_LARGEFILE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 WIPE_CFLAGS += -DSIXTYFOUR
 endif
 
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index c0c0043..f0b731e 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -19,10 +19,10 @@ choice
 
 config BR2_PACKAGE_XSERVER_xorg
 	bool "Modular X.org"
-	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_INSTALL_LIBSTDCPP
 
 comment 'X.org requires largefile and C++ support'
-	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
+	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
 
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "TinyX"
diff --git a/package/x11r7/xlib_libpciaccess/Config.in b/package/x11r7/xlib_libpciaccess/Config.in
index b53aa31..23a91a7 100644
--- a/package/x11r7/xlib_libpciaccess/Config.in
+++ b/package/x11r7/xlib_libpciaccess/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBPCIACCESS
 	bool "libpciaccess"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  X.Org libpciaccess
 
 comment "libpciaccess requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 12bc69e..2131a3b 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -3,11 +3,11 @@ comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCL
 	depends on BR2_PACKAGE_XFSPROGS
 
 comment "xfsprogs requires a toolchain with LARGEFILE support"
-        depends on !BR2_LARGEFILE
+        depends on !BR2_TOOLCHAIN_HAS_LARGEFILE
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
-	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_E2FSPROGS_LIBUUID
 	help
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
index 0eee5c0..63ec81f 100644
--- a/target/xtensa/defconfig
+++ b/target/xtensa/defconfig
@@ -77,7 +77,7 @@ BR2_GDB_VERSION="6.8"
 #
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-BR2_LARGEFILE=y
+BR2_TOOLCHAIN_HAS_LARGEFILE=y
 BR2_INET_RPC=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
 
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 7a1905f..c989b05 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -81,7 +81,7 @@ config BR2_INSTALL_LIBGCJ
 	bool "Build/install java compiler and libgcj?"
 	depends on !BR2_avr32 && BR2_INSTALL_LIBSTDCPP
 	select BR2_GCC_CROSS_JAVA
-	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	depends on BROKEN
 	help
 	  Build/install java compiler and libgcj?
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index db7c7f1..fd587ce 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -142,7 +142,7 @@ check_glibc = \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
-	$(call check_glibc_feature,BR2_LARGEFILE,Large file support) ;\
+	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_LARGEFILE,Large file support) ;\
 	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
 	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
@@ -189,7 +189,7 @@ check_uclibc = \
 	fi; \
 	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
 	$(call check_uclibc_feature,__ARCH_USE_MMU__,BR2_USE_MMU,$${UCLIBC_CONFIG_FILE},MMU support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_TOOLCHAIN_HAS_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 3fd433a..ef786e5 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -6,7 +6,7 @@ comment "Toolchain Options"
 
 config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
 	bool "Enable large file (files > 2 GB) support"
-	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  Enable this option if you want your toolchain to support
 	  files bigger than 2 GB.
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index a641785..31d017c 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -5,7 +5,7 @@
 # so put it here instead
 source "toolchain/gdb/Config.in"
 
-config BR2_LARGEFILE
+config BR2_TOOLCHAIN_HAS_LARGEFILE
 	bool
 
 config BR2_INET_IPV6
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 1a10416..76222f4 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -12,7 +12,7 @@ config BR2_TOOLCHAIN_CTNG_uClibc
 # let's not deal with that for the time being, it's complex...
 config BR2_TOOLCHAIN_CTNG_eglibc
 	bool "eglibc"
-	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_INET_IPV6
 	select BR2_INET_RPC
 	select BR2_ENABLE_LOCALE
@@ -21,7 +21,7 @@ config BR2_TOOLCHAIN_CTNG_eglibc
 
 config BR2_TOOLCHAIN_CTNG_glibc
 	bool "glibc"
-	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_INET_IPV6
 	select BR2_INET_RPC
 	select BR2_ENABLE_LOCALE
@@ -51,7 +51,7 @@ comment "Toolchain Options"
 
 config BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE
 	bool "Enable large file (files > 2 GB) support"
-	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  Enable this option if you want your toolchain to support
 	  files bigger than 2 GB.
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index edd643b..5dd3c57 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -279,7 +279,7 @@ CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_WCHAR)=.*:\# \1 is not set:;
 endif
 
 # Handle the LFS option
-ifneq ($(call qstrip,$(BR2_LARGEFILE)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_HAS_LARGEFILE)),)
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_LFS) is not set:\1=y:;
 else
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_LFS)=.*:\# \1 is not set:;
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2ed65bf..40318e3 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -143,7 +143,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool
-	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_INET_IPV6
 	select BR2_INET_RPC
 	select BR2_USE_WCHAR
@@ -174,7 +174,7 @@ if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_LARGEFILE
 	bool "Toolchain has large file support?"
-	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  Select this option if your external toolchain supports
 	  largefile. If you don't know, leave the default value,
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 19256bb..8422834 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -236,7 +236,7 @@ ifneq ($(UCLIBC_TARGET_ENDIAN),)
 		-e 's/.*\(ARCH_WANTS_$(UCLIBC_TARGET_ENDIAN)_ENDIAN\).*/\1=y/g' \
 		$(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_LARGEFILE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),y)
 	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=n,g' $(UCLIBC_DIR)/.oldconfig
-- 
1.7.0.4
