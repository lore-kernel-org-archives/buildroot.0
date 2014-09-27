From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 27 Sep 2014 21:32:52 +0200
Subject: [Buildroot] [PATCH 15 of 15] .mk files: remove alignment of
	assignments
In-Reply-To: <patchbomb.1411846357@localhost>
References: <patchbomb.1411846357@localhost>
Message-ID: <9b503c35f580df2ae921.1411846372@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Buildroot coding style does not align assignments nor line continuation
characters (\). This patch updates the .mk files to reflect this.

Command used:
    find * -name "*.mk" | xargs sed -i 's/\s\+\(.\?=\)\s\+/ \1 /g'

Manual fixup:
    pkg-utils.mk: fix alignment of FROM/TO variables in caseconvert-helper


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: new patch

 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk          |  10 +-
 boot/grub/grub.mk                                          |   4 +-
 boot/mxs-bootlets/mxs-bootlets.mk                          |   2 +-
 boot/syslinux/syslinux.mk                                  |   4 +-
 boot/uboot/uboot.mk                                        |  42 ++--
 boot/xloader/xloader.mk                                    |   4 +-
 fs/ext2/ext2.mk                                            |   2 +-
 package/atftp/atftp.mk                                     |   2 +-
 package/atk/atk.mk                                         |   2 +-
 package/bcusdk/bcusdk.mk                                   |   2 +-
 package/bind/bind.mk                                       |   2 +-
 package/ccache/ccache.mk                                   |   4 +-
 package/cegui06/cegui06.mk                                 |  14 +-
 package/celt051/celt051.mk                                 |  12 +-
 package/cjson/cjson.mk                                     |  10 +-
 package/copas/copas.mk                                     |   2 +-
 package/coxpcall/coxpcall.mk                               |   2 +-
 package/dhcpdump/dhcpdump.mk                               |   2 +-
 package/dmidecode/dmidecode.mk                             |   2 +-
 package/dropbear/dropbear.mk                               |   2 +-
 package/dtc/dtc.mk                                         |  18 +-
 package/dvbsnoop/dvbsnoop.mk                               |   8 +-
 package/ecryptfs-utils/ecryptfs-utils.mk                   |  14 +-
 package/efl/libedje/libedje.mk                             |   2 +-
 package/eigen/eigen.mk                                     |   2 +-
 package/freescale-imx/freescale-imx.mk                     |   2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk |   4 +-
 package/freescale-imx/imx-lib/imx-lib.mk                   |   2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk                   |   2 +-
 package/gcc/gcc-final/gcc-final.mk                         |   6 +-
 package/gcc/gcc-initial/gcc-initial.mk                     |   4 +-
 package/gd/gd.mk                                           |  24 +-
 package/gdb/gdb.mk                                         |   2 +-
 package/genimage/genimage.mk                               |  10 +-
 package/genpart/genpart.mk                                 |   8 +-
 package/git/git.mk                                         |  10 +-
 package/grantlee/grantlee.mk                               |   2 +-
 package/heirloom-mailx/heirloom-mailx.mk                   |   4 +-
 package/igh-ethercat/igh-ethercat.mk                       |   6 +-
 package/input-tools/input-tools.mk                         |   4 +-
 package/irda-utils/irda-utils.mk                           |   2 +-
 package/keyutils/keyutils.mk                               |  10 +-
 package/lbase64/lbase64.mk                                 |   2 +-
 package/lftp/lftp.mk                                       |   2 +-
 package/libatasmart/libatasmart.mk                         |   2 +-
 package/libffi/libffi.mk                                   |   2 +-
 package/libmbim/libmbim.mk                                 |   4 +-
 package/libnspr/libnspr.mk                                 |   2 +-
 package/libqmi/libqmi.mk                                   |   4 +-
 package/libreplaygain/libreplaygain.mk                     |   2 +-
 package/libseccomp/libseccomp.mk                           |  16 +-
 package/libsvg-cairo/libsvg-cairo.mk                       |  10 +-
 package/libsvg/libsvg.mk                                   |  10 +-
 package/liburcu/liburcu.mk                                 |   4 +-
 package/linux-fusion/linux-fusion.mk                       |   2 +-
 package/ljlinenoise/ljlinenoise.mk                         |   2 +-
 package/lmbench/lmbench.mk                                 |   2 +-
 package/localedef/localedef.mk                             |   4 +-
 package/lpty/lpty.mk                                       |   2 +-
 package/lrandom/lrandom.mk                                 |   2 +-
 package/lsqlite3/lsqlite3.mk                               |   2 +-
 package/ltp-testsuite/ltp-testsuite.mk                     |   4 +-
 package/lttng-babeltrace/lttng-babeltrace.mk               |   4 +-
 package/lttng-libust/lttng-libust.mk                       |   6 +-
 package/lttng-modules/lttng-modules.mk                     |   4 +-
 package/lttng-tools/lttng-tools.mk                         |   4 +-
 package/lua-coat/lua-coat.mk                               |   2 +-
 package/lua-coatpersistent/lua-coatpersistent.mk           |   2 +-
 package/lua-csnappy/lua-csnappy.mk                         |   2 +-
 package/lua-messagepack/lua-messagepack.mk                 |   2 +-
 package/lua-testmore/lua-testmore.mk                       |   2 +-
 package/luabitop/luabitop.mk                               |   2 +-
 package/luajit/luajit.mk                                   |   4 +-
 package/luajson/luajson.mk                                 |   2 +-
 package/lualogging/lualogging.mk                           |   2 +-
 package/luarocks/luarocks.mk                               |   2 +-
 package/luasec/luasec.mk                                   |   2 +-
 package/luasocket/luasocket.mk                             |   2 +-
 package/luasql-sqlite3/luasql-sqlite3.mk                   |   2 +-
 package/lunit/lunit.mk                                     |   2 +-
 package/lzlib/lzlib.mk                                     |   2 +-
 package/mesa3d/mesa3d.mk                                   |  10 +-
 package/mii-diag/mii-diag.mk                               |   6 +-
 package/mmc-utils/mmc-utils.mk                             |   2 +-
 package/mplayer/mplayer.mk                                 |   4 +-
 package/mtd/mtd.mk                                         |  76 +++++-----
 package/musepack/musepack.mk                               |   2 +-
 package/on2-8170-modules/on2-8170-modules.mk               |   2 +-
 package/open2300/open2300.mk                               |   6 +-
 package/orbit/orbit.mk                                     |   2 +-
 package/perl/perl.mk                                       |   4 +-
 package/php/php.mk                                         |   2 +-
 package/picocom/picocom.mk                                 |   2 +-
 package/pinentry/pinentry.mk                               |   2 +-
 package/pkg-autotools.mk                                   |   6 +-
 package/pkg-cmake.mk                                       |  12 +-
 package/pkg-generic.mk                                     |  56 +++---
 package/pkg-luarocks.mk                                    |  10 +-
 package/pkg-perl.mk                                        |   2 +-
 package/pkg-python.mk                                      |  26 +-
 package/pkg-utils.mk                                       |  22 +-
 package/python-dialog/python-dialog.mk                     |   4 +-
 package/python-ipy/python-ipy.mk                           |   2 +-
 package/python-netifaces/python-netifaces.mk               |   4 +-
 package/python-protobuf/python-protobuf.mk                 |   4 +-
 package/python-pyparsing/python-pyparsing.mk               |  12 +-
 package/python-pyro/python-pyro.mk                         |   4 +-
 package/python-serial/python-serial.mk                     |   4 +-
 package/python-setuptools/python-setuptools.mk             |   4 +-
 package/python/python.mk                                   |  10 +-
 package/python3/python3.mk                                 |   2 +-
 package/qextserialport/qextserialport.mk                   |   4 +-
 package/qjson/qjson.mk                                     |   2 +-
 package/qt/qt.mk                                           |  76 +++++-----
 package/qt5/qt5base/qt5base.mk                             |  50 +++---
 package/qwt/qwt.mk                                         |   2 +-
 package/rings/rings.mk                                     |   2 +-
 package/rpcbind/rpcbind.mk                                 |   4 +-
 package/rtai/rtai.mk                                       |   4 +-
 package/sam-ba/sam-ba.mk                                   |   4 +-
 package/sg3_utils/sg3_utils.mk                             |   2 +-
 package/slirp/slirp.mk                                     |   8 +-
 package/spice-protocol/spice-protocol.mk                   |  10 +-
 package/spice/spice.mk                                     |  12 +-
 package/squid/squid.mk                                     |   4 +-
 package/sysvinit/sysvinit.mk                               |   6 +-
 package/tcllib/tcllib.mk                                   |  12 +-
 package/tftpd/tftpd.mk                                     |   6 +-
 package/tstools/tstools.mk                                 |   4 +-
 package/tvheadend/tvheadend.mk                             |   2 +-
 package/uboot-tools/uboot-tools.mk                         |   4 +-
 package/udisks/udisks.mk                                   |   2 +-
 package/usbredir/usbredir.mk                               |  16 +-
 package/valgrind/valgrind.mk                               |   4 +-
 package/vde2/vde2.mk                                       |  12 +-
 package/vpnc/vpnc.mk                                       |  10 +-
 package/xinetd/xinetd.mk                                   |   6 +-
 toolchain/toolchain-external/toolchain-external.mk         |   6 +-
 138 files changed, 490 insertions(+), 490 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-BOOT_WRAPPER_AARCH64_VERSION        = 4266507a84f8c06452109d38e0350d4759740694
-BOOT_WRAPPER_AARCH64_SITE           = git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/boot-wrapper-aarch64.git
-BOOT_WRAPPER_AARCH64_LICENSE        = BSD3c
-BOOT_WRAPPER_AARCH64_LICENSE_FILES  = LICENSE.txt
-BOOT_WRAPPER_AARCH64_DEPENDENCIES   = linux
+BOOT_WRAPPER_AARCH64_VERSION = 4266507a84f8c06452109d38e0350d4759740694
+BOOT_WRAPPER_AARCH64_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/boot-wrapper-aarch64.git
+BOOT_WRAPPER_AARCH64_LICENSE = BSD3c
+BOOT_WRAPPER_AARCH64_LICENSE_FILES = LICENSE.txt
+BOOT_WRAPPER_AARCH64_DEPENDENCIES = linux
 BOOT_WRAPPER_AARCH64_INSTALL_IMAGES = YES
 
 # The Git repository does not have the generated configure script and
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -6,8 +6,8 @@
 
 GRUB_VERSION = 0.97
 GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
-GRUB_PATCH  = grub_$(GRUB_VERSION)-67.diff.gz
-GRUB_SITE   = http://snapshot.debian.org/archive/debian/20130129T225227Z/pool/main/g/grub
+GRUB_PATCH = grub_$(GRUB_VERSION)-67.diff.gz
+GRUB_SITE = http://snapshot.debian.org/archive/debian/20130129T225227Z/pool/main/g/grub
 
 GRUB_LICENSE = GPLv2+
 GRUB_LICENSE_FILES = COPYING
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -7,7 +7,7 @@
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL),y)
 	MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
 	MXS_BOOTLETS_SITE = $(patsubst %/,%,$(dir $(MXS_BOOTLETS_TARBALL)))
-	MXS_BOOTLETS_SOURCE  = $(notdir $(MXS_BOOTLETS_TARBALL))
+	MXS_BOOTLETS_SOURCE = $(notdir $(MXS_BOOTLETS_TARBALL))
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT),y)
 	MXS_BOOTLETS_SITE = $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL)
 	MXS_BOOTLETS_SITE_METHOD = git
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 SYSLINUX_VERSION = 6.02
-SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.xz
-SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
+SYSLINUX_SOURCE = syslinux-$(SYSLINUX_VERSION).tar.xz
+SYSLINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
 
 SYSLINUX_LICENSE = GPLv2+
 SYSLINUX_LICENSE_FILES = COPYING
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_VERSION    = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
+UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
 UBOOT_LICENSE = GPLv2+
@@ -15,45 +15,45 @@
 ifeq ($(UBOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
-UBOOT_SITE    = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
-UBOOT_SOURCE  = $(notdir $(UBOOT_TARBALL))
+UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
+UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
-UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
+UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = git
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
-UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
+UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = hg
 else
 # Handle stable official U-Boot versions
-UBOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
-UBOOT_SOURCE  = u-boot-$(UBOOT_VERSION).tar.bz2
+UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
+UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
-UBOOT_BIN          = u-boot
+UBOOT_BIN = u-boot
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
-UBOOT_BIN          = u-boot.kwb
-UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
+UBOOT_BIN = u-boot.kwb
+UBOOT_MAKE_TARGET = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
-UBOOT_BIN          = u-boot.ais
-UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
+UBOOT_BIN = u-boot.ais
+UBOOT_MAKE_TARGET = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
-UBOOT_BIN          = u-boot.ldr
+UBOOT_BIN = u-boot.ldr
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
-UBOOT_BIN          = u-boot-nand.bin
+UBOOT_BIN = u-boot-nand.bin
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
-UBOOT_BIN          = u-boot.img
+UBOOT_BIN = u-boot.img
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
-UBOOT_BIN          = u-boot.imx
+UBOOT_BIN = u-boot.imx
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
-UBOOT_BIN          = u-boot.sb
-UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
+UBOOT_BIN = u-boot.sb
+UBOOT_MAKE_TARGET = $(UBOOT_BIN)
 UBOOT_DEPENDENCIES += host-elftosb
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
-UBOOT_BIN          = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
+UBOOT_BIN = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 else
-UBOOT_BIN          = u-boot.bin
-UBOOT_BIN_IFT      = $(UBOOT_BIN).ift
+UBOOT_BIN = u-boot.bin
+UBOOT_BIN_IFT = $(UBOOT_BIN).ift
 endif
 
 UBOOT_ARCH=$(KERNEL_ARCH)
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLOADER_VERSION    = 6f3a26101303051e0f91b6213735b68ce804e94e
-XLOADER_SITE       = git://gitorious.org/x-loader/x-loader.git
+XLOADER_VERSION = 6f3a26101303051e0f91b6213735b68ce804e94e
+XLOADER_SITE = git://gitorious.org/x-loader/x-loader.git
 XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
 
 XLOADER_LICENSE = GPLv2+
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -20,7 +20,7 @@
 
 ROOTFS_EXT2_DEPENDENCIES = host-genext2fs host-e2fsprogs
 
-EXT2_ENV  = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
+EXT2_ENV = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
 EXT2_ENV += REV=$(BR2_TARGET_ROOTFS_EXT2_REV)
 
 define ROOTFS_EXT2_CMD
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATFTP_VERSION  = 0.7.1
+ATFTP_VERSION = 0.7.1
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPLv2+
 ATFTP_LICENSE_FILES = LICENSE
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -41,7 +41,7 @@
 		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
 		gl_cv_c_restrict=no ac_cv_prog_F77=no
 
-ATK_CONF_OPTS =  --disable-glibtest --enable-explicit-deps=no \
+ATK_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no \
 		--disable-debug
 
 ATK_DEPENDENCIES = libglib2 host-pkgconf
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -10,7 +10,7 @@
 BCUSDK_LICENSE = GPLv2+
 BCUSDK_LICENSE_FILES = COPYING
 BCUSDK_INSTALL_STAGING = YES
-BCUSDK_CONF_OPTS =  --enable-onlyeibd --enable-ft12 --enable-pei16 \
+BCUSDK_CONF_OPTS = --enable-onlyeibd --enable-ft12 --enable-pei16 \
 		 --enable-eibnetip --enable-eibnetipserver \
 		 --enable-eibnetiptunnel --without-pth-test \
 		 --with-pth=$(STAGING_DIR)/usr
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -18,7 +18,7 @@
 BIND_TARGET_SERVER_SBIN += named-compilezone rndc rndc-confgen dnssec-dsfromkey
 BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
-BIND_CONF_ENV =	BUILD_CC="$(TARGET_CC)" \
+BIND_CONF_ENV = BUILD_CC="$(TARGET_CC)" \
 		BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = --localstatedir=/var \
 		--with-randomdev=/dev/urandom \
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 CCACHE_VERSION = 3.1.8
-CCACHE_SITE    = http://samba.org/ftp/ccache
-CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.xz
+CCACHE_SITE = http://samba.org/ftp/ccache
+CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
 CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 
diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
--- a/package/cegui06/cegui06.mk
+++ b/package/cegui06/cegui06.mk
@@ -5,15 +5,15 @@
 ################################################################################
 
 # Do not update the version, we need exactly that one for Spice.
-CEGUI06_VERSION_MAJOR   = 0.6.2
-CEGUI06_VERSION         = $(CEGUI06_VERSION_MAJOR)b
-CEGUI06_SOURCE          = CEGUI-$(CEGUI06_VERSION).tar.gz
-CEGUI06_SITE            = http://downloads.sourceforge.net/project/crayzedsgui/CEGUI%20Mk-2/$(CEGUI06_VERSION_MAJOR)
-CEGUI06_LICENSE         = MIT
-CEGUI06_LICENSE_FILES   = COPYING
+CEGUI06_VERSION_MAJOR = 0.6.2
+CEGUI06_VERSION = $(CEGUI06_VERSION_MAJOR)b
+CEGUI06_SOURCE = CEGUI-$(CEGUI06_VERSION).tar.gz
+CEGUI06_SITE = http://downloads.sourceforge.net/project/crayzedsgui/CEGUI%20Mk-2/$(CEGUI06_VERSION_MAJOR)
+CEGUI06_LICENSE = MIT
+CEGUI06_LICENSE_FILES = COPYING
 CEGUI06_INSTALL_STAGING = YES
 
-CEGUI06_DEPENDENCIES    = \
+CEGUI06_DEPENDENCIES = \
     expat \
     freetype \
     pcre \
diff --git a/package/celt051/celt051.mk b/package/celt051/celt051.mk
--- a/package/celt051/celt051.mk
+++ b/package/celt051/celt051.mk
@@ -6,13 +6,13 @@
 
 # Although version newer than 0.5.1.3 exists, we're
 # stuck with 0.5.1.3 for use by Spice (coming later)
-CELT051_VERSION         = 0.5.1.3
-CELT051_SOURCE          = celt-$(CELT051_VERSION).tar.gz
-CELT051_SITE            = http://downloads.xiph.org/releases/celt
-CELT051_LICENSE         = BSD-2c
-CELT051_LICENSE_FILES   = COPYING
+CELT051_VERSION = 0.5.1.3
+CELT051_SOURCE = celt-$(CELT051_VERSION).tar.gz
+CELT051_SITE = http://downloads.xiph.org/releases/celt
+CELT051_LICENSE = BSD-2c
+CELT051_LICENSE_FILES = COPYING
 CELT051_INSTALL_STAGING = YES
-CELT051_DEPENDENCIES    = libogg
+CELT051_DEPENDENCIES = libogg
 
 # Need to specify --with-ogg, otherwise /usr/lib may be searched for
 # if target is the same kind as host (ie. same arch, same bitness,
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-CJSON_VERSION         = 58
-CJSON_SITE_METHOD     = svn
-CJSON_SITE            = http://svn.code.sf.net/p/cjson/code
+CJSON_VERSION = 58
+CJSON_SITE_METHOD = svn
+CJSON_SITE = http://svn.code.sf.net/p/cjson/code
 CJSON_INSTALL_STAGING = YES
-CJSON_LICENSE         = MIT
-CJSON_LICENSE_FILES   = LICENSE
+CJSON_LICENSE = MIT
+CJSON_LICENSE_FILES = LICENSE
 
 define CJSON_BUILD_CMDS
 	cd $(@D) && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC -lm \
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 COPAS_VERSION = 1.2.1-1
-COPAS_SUBDIR  = copas-1_2_1
+COPAS_SUBDIR = copas-1_2_1
 COPAS_LICENSE = MIT
 
 $(eval $(luarocks-package))
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 COXPCALL_VERSION = 1.15.0-1
-COXPCALL_SUBDIR  = coxpcall
+COXPCALL_SUBDIR = coxpcall
 COXPCALL_LICENSE = MIT
 
 $(eval $(luarocks-package))
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DHCPDUMP_VERSION = 1.8
-DHCPDUMP_SITE  = http://www.mavetju.org/download
+DHCPDUMP_SITE = http://www.mavetju.org/download
 DHCPDUMP_DEPENDENCIES = libpcap
 DHCPDUMP_LICENSE = BSD-2c
 DHCPDUMP_LICENSE_FILES = LICENSE
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DMIDECODE_VERSION = 2.12
-DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode
+DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPLv2+
 DMIDECODE_LICENSE_FILES = LICENSE
 
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -8,7 +8,7 @@
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
-DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
+DROPBEAR_MAKE = $(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-DTC_VERSION         = v1.4.0
-DTC_SITE            = git://git.jdl.com/software/dtc.git
-DTC_LICENSE         = GPLv2+/BSD-2c
-DTC_LICENSE_FILES   = README.license GPL
+DTC_VERSION = v1.4.0
+DTC_SITE = git://git.jdl.com/software/dtc.git
+DTC_LICENSE = GPLv2+/BSD-2c
+DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
-DTC_DEPENDENCIES    = host-bison host-flex
+DTC_DEPENDENCIES = host-bison host-flex
 
 define DTC_POST_INSTALL_TARGET_RM_DTDIFF
 	rm -f $(TARGET_DIR)/usr/bin/dtdiff
@@ -17,19 +17,19 @@
 
 ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
 
-DTC_LICENSE        += (for the library), GPLv2+ (for the executables)
+DTC_LICENSE += (for the library), GPLv2+ (for the executables)
 # Use default goal to build everything
 DTC_BUILD_GOAL      =
-DTC_INSTALL_GOAL    = install
+DTC_INSTALL_GOAL = install
 ifeq ($(BR2_PACKAGE_BASH),)
 DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
 endif
 
 else # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
-DTC_BUILD_GOAL      = libfdt
+DTC_BUILD_GOAL = libfdt
 #?libfdt_install is our own install rule added by our patch
-DTC_INSTALL_GOAL    = libfdt_install
+DTC_INSTALL_GOAL = libfdt_install
 
 endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
diff --git a/package/dvbsnoop/dvbsnoop.mk b/package/dvbsnoop/dvbsnoop.mk
--- a/package/dvbsnoop/dvbsnoop.mk
+++ b/package/dvbsnoop/dvbsnoop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DVBSNOOP_VERSION        = 1.4.50
-DVBSNOOP_SITE           = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
-DVBSNOOP_LICENSE        = GPLv2
-DVBSNOOP_LICENSE_FILES  = COPYING
+DVBSNOOP_VERSION = 1.4.50
+DVBSNOOP_SITE = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
+DVBSNOOP_LICENSE = GPLv2
+DVBSNOOP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-ECRYPTFS_UTILS_VERSION         = 104
-ECRYPTFS_UTILS_SOURCE          = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
-ECRYPTFS_UTILS_SITE            = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
-ECRYPTFS_UTILS_LICENSE         = GPLv2+
-ECRYPTFS_UTILS_LICENSE_FILES   = COPYING
+ECRYPTFS_UTILS_VERSION = 104
+ECRYPTFS_UTILS_SOURCE = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
+ECRYPTFS_UTILS_SITE = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
+ECRYPTFS_UTILS_LICENSE = GPLv2+
+ECRYPTFS_UTILS_LICENSE_FILES = COPYING
 
-ECRYPTFS_UTILS_DEPENDENCIES    = keyutils libnss host-intltool
-ECRYPTFS_UTILS_CONF_OPTS        = --disable-pywrap --disable-pam
+ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
+ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap --disable-pam
 
 #Needed for build system to find pk11func.h and libnss3.so
 ECRYPTFS_UTILS_CONF_ENV = \
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -6,7 +6,7 @@
 
 LIBEDJE_VERSION = $(EFL_VERSION)
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
-LIBEDJE_SITE =  http://download.enlightenment.org/releases
+LIBEDJE_SITE = http://download.enlightenment.org/releases
 LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
 LIBEDJE_LICENSE_FILES = COPYING
 
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -6,7 +6,7 @@
 
 # version 3.2
 EIGEN_VERSION = ffa86ffb5570
-EIGEN_SITE    = https://bitbucket.org/eigen/eigen
+EIGEN_SITE = https://bitbucket.org/eigen/eigen
 EIGEN_SITE_METHOD = hg
 EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -5,6 +5,6 @@
 ################################################################################
 
 FREESCALE_IMX_VERSION = 3.10.17-1.0.0
-FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
+FREESCALE_IMX_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -9,8 +9,8 @@
 else
 GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-sfp
 endif
-GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_SITE)
-GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
+GPU_VIV_BIN_MX6Q_SITE = $(FREESCALE_IMX_SITE)
+GPU_VIV_BIN_MX6Q_SOURCE = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
 
 GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
 
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
-IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
+IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
 IMX_LIB_LICENSE = LGPLv2.1+
 IMX_LIB_LICENSE_FILES = EULA
 
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMX_VPU_VERSION = $(FREESCALE_IMX_VERSION)
-IMX_VPU_SITE    = $(FREESCALE_IMX_SITE)
+IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_LICENSE = Freescale License
 IMX_VPU_LICENSE_FILES = EULA vpu/EULA.txt
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 GCC_FINAL_VERSION = $(GCC_VERSION)
-GCC_FINAL_SITE    = $(GCC_SITE)
-GCC_FINAL_SOURCE  = $(GCC_SOURCE)
+GCC_FINAL_SITE = $(GCC_SITE)
+GCC_FINAL_SOURCE = $(GCC_SOURCE)
 
 HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
@@ -45,7 +45,7 @@
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_FORTRAN) += fortran
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_OBJC)    += objc
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_OBJC) += objc
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
 HOST_GCC_FINAL_CONF_OPTS = \
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 GCC_INITIAL_VERSION = $(GCC_VERSION)
-GCC_INITIAL_SITE    = $(GCC_SITE)
-GCC_INITIAL_SOURCE  = $(GCC_SOURCE)
+GCC_INITIAL_SITE = $(GCC_SITE)
+GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -47,18 +47,18 @@
 GD_DEPENDENCIES += zlib
 endif
 
-GD_TOOLS_$(BR2_PACKAGE_GD_ANNOTATE)	+= annotate
-GD_TOOLS_$(BR2_PACKAGE_GD_BDFTOGD)	+= bdftogd
-GD_TOOLS_$(BR2_PACKAGE_GD_GD2COPYPAL)	+= gd2copypal
-GD_TOOLS_$(BR2_PACKAGE_GD_GD2TOGIF)	+= gd2togif
-GD_TOOLS_$(BR2_PACKAGE_GD_GD2TOPNG)	+= gd2topng
-GD_TOOLS_$(BR2_PACKAGE_GD_GDCMPGIF)	+= gdcmpgif
-GD_TOOLS_$(BR2_PACKAGE_GD_GDPARTTOPNG)	+= gdparttopng
-GD_TOOLS_$(BR2_PACKAGE_GD_GDTOPNG)	+= gdtopng
-GD_TOOLS_$(BR2_PACKAGE_GD_GIFTOGD2)	+= giftogd2
-GD_TOOLS_$(BR2_PACKAGE_GD_PNGTOGD)	+= pngtogd
-GD_TOOLS_$(BR2_PACKAGE_GD_PNGTOGD2)	+= pngtogd2
-GD_TOOLS_$(BR2_PACKAGE_GD_WEBPNG)	+= webpng
+GD_TOOLS_$(BR2_PACKAGE_GD_ANNOTATE) += annotate
+GD_TOOLS_$(BR2_PACKAGE_GD_BDFTOGD) += bdftogd
+GD_TOOLS_$(BR2_PACKAGE_GD_GD2COPYPAL) += gd2copypal
+GD_TOOLS_$(BR2_PACKAGE_GD_GD2TOGIF) += gd2togif
+GD_TOOLS_$(BR2_PACKAGE_GD_GD2TOPNG) += gd2topng
+GD_TOOLS_$(BR2_PACKAGE_GD_GDCMPGIF) += gdcmpgif
+GD_TOOLS_$(BR2_PACKAGE_GD_GDPARTTOPNG) += gdparttopng
+GD_TOOLS_$(BR2_PACKAGE_GD_GDTOPNG) += gdtopng
+GD_TOOLS_$(BR2_PACKAGE_GD_GIFTOGD2) += giftogd2
+GD_TOOLS_$(BR2_PACKAGE_GD_PNGTOGD) += pngtogd
+GD_TOOLS_$(BR2_PACKAGE_GD_PNGTOGD2) += pngtogd2
+GD_TOOLS_$(BR2_PACKAGE_GD_WEBPNG) += webpng
 
 define GD_REMOVE_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(GD_TOOLS_))
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
-GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
+GDB_SITE = $(BR2_GNU_MIRROR)/gdb
 
 ifeq ($(BR2_arc),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION        = 7
-GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
-GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download
-GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
-GENIMAGE_LICENSE        = GPLv2
+GENIMAGE_VERSION = 7
+GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
+GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
+GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
+GENIMAGE_LICENSE = GPLv2
 
 $(eval $(host-autotools-package))
diff --git a/package/genpart/genpart.mk b/package/genpart/genpart.mk
--- a/package/genpart/genpart.mk
+++ b/package/genpart/genpart.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-GENPART_VERSION       = 1.0.2
-GENPART_SOURCE        = genpart-$(GENPART_VERSION).tar.bz2
-GENPART_SITE          = http://www.pengutronix.de/software/genpart/download
+GENPART_VERSION = 1.0.2
+GENPART_SOURCE = genpart-$(GENPART_VERSION).tar.bz2
+GENPART_SITE = http://www.pengutronix.de/software/genpart/download
 # genpart has no license embedded in its source release.
 # However, their project page mentions:
 #   > This community portal offers an overview about our own OSS
 #   > projects and projects Pengutronix is or was involved with.
 # We can thus assume genpart is under a FLOSS license.
 # So, until the authors have clarified the licensing terms:
-GENPART_LICENSE       = Unknown (clarification has been asked to the authors)
+GENPART_LICENSE = Unknown (clarification has been asked to the authors)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/git/git.mk b/package/git/git.mk
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GIT_VERSION         = 1.8.5.4
-GIT_SITE            = http://git-core.googlecode.com/files
-GIT_LICENSE         = GPLv2 LGPLv2.1+
-GIT_LICENSE_FILES   = COPYING LGPL-2.1
-GIT_DEPENDENCIES    = zlib host-gettext
+GIT_VERSION = 1.8.5.4
+GIT_SITE = http://git-core.googlecode.com/files
+GIT_LICENSE = GPLv2 LGPLv2.1+
+GIT_LICENSE_FILES = COPYING LGPL-2.1
+GIT_DEPENDENCIES = zlib host-gettext
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	GIT_DEPENDENCIES += openssl
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -7,7 +7,7 @@
 GRANTLEE_VERSION = 0.2.0
 GRANTLEE_SITE = http://downloads.grantlee.org
 GRANTLEE_INSTALL_STAGING = YES
-GRANTLEE_DEPENDENCIES =  qt
+GRANTLEE_DEPENDENCIES = qt
 GRANTLEE_LICENSE = LGPLv2.1+
 GRANTLEE_LICENSE_FILES = COPYING.LIB
 
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 HEIRLOOM_MAILX_VERSION = 12.5
-HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
-HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
+HEIRLOOM_MAILX_SOURCE = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
+HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
 HEIRLOOM_MAILX_LICENSE = BSD-4c, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)
 HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 IGH_ETHERCAT_VERSION = 1.5.2
-IGH_ETHERCAT_SITE    = http://etherlab.org/download/ethercat
-IGH_ETHERCAT_SOURCE  = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
+IGH_ETHERCAT_SITE = http://etherlab.org/download/ethercat
+IGH_ETHERCAT_SOURCE = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
 IGH_ETHERCAT_LICENSE = GPLv2 (IgH EtherCAT master), LGPLv2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
 
-IGH_ETHERCAT_DEPENDENCIES    = linux
+IGH_ETHERCAT_DEPENDENCIES = linux
 IGH_ETHERCAT_INSTALL_STAGING = YES
 
 IGH_ETHERCAT_CONF_OPTS = \
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -12,8 +12,8 @@
 INPUT_TOOLS_LICENSE_FILES = utils/Makefile
 
 INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH) += inputattach
-INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSCAL)       += jscal
-INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSTEST)      += jstest
+INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSCAL) += jscal
+INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSTEST) += jstest
 
 define INPUT_TOOLS_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -27,7 +27,7 @@
 IRDA_UTILS_SBINS-y =
 IRDA_UTILS_SBINS-$(BR2_PACKAGE_IRDA_UTILS_IRATTACH) += irattach
 IRDA_UTILS_SBINS-$(BR2_PACKAGE_IRDA_UTILS_IRDAPING) += irdaping
-IRDA_UTILS_SBINS-$(BR2_PACKAGE_IRDA_UTILS_IRNETD)   += irnetd
+IRDA_UTILS_SBINS-$(BR2_PACKAGE_IRDA_UTILS_IRNETD) += irnetd
 IRDA_UTILS_SBINS- += $(IRDA_UTILS_SBINS-y)
 
 define IRDA_UTILS_INSTALL_TARGET_CMDS
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-KEYUTILS_VERSION         = 1.5.5
-KEYUTILS_SOURCE          = keyutils-$(KEYUTILS_VERSION).tar.bz2
-KEYUTILS_SITE            = http://people.redhat.com/~dhowells/keyutils
-KEYUTILS_LICENSE         = GPLv2+ LGPLv2.1+
-KEYUTILS_LICENSE_FILES   = LICENCE.GPL LICENCE.LGPL
+KEYUTILS_VERSION = 1.5.5
+KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
+KEYUTILS_SITE = http://people.redhat.com/~dhowells/keyutils
+KEYUTILS_LICENSE = GPLv2+ LGPLv2.1+
+KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
 KEYUTILS_INSTALL_STAGING = YES
 
 KEYUTILS_MAKE_ENV = \
diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
--- a/package/lbase64/lbase64.mk
+++ b/package/lbase64/lbase64.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LBASE64_VERSION = 20120820-1
-LBASE64_SUBDIR  = base64
+LBASE64_SUBDIR = base64
 LBASE64_LICENSE = Public domain
 LBASE64_LICENSE_FILES = $(LBASE64_SUBDIR)/README
 
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LFTP_VERSION = 4.5.5
-LFTP_SITE    = http://lftp.yar.ru/ftp
+LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
 LFTP_AUTORECONF = YES
diff --git a/package/libatasmart/libatasmart.mk b/package/libatasmart/libatasmart.mk
--- a/package/libatasmart/libatasmart.mk
+++ b/package/libatasmart/libatasmart.mk
@@ -6,7 +6,7 @@
 
 LIBATASMART_VERSION = 0.19
 LIBATASMART_SOURCE = libatasmart-$(LIBATASMART_VERSION).tar.xz
-LIBATASMART_SITE    = http://0pointer.de/public
+LIBATASMART_SITE = http://0pointer.de/public
 LIBATASMART_LICENSE = LGPLv2.1
 LIBATASMART_LICENSE_FILES = LGPL
 LIBATASMART_INSTALL_STAGING = YES
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBFFI_VERSION = 3.1
-LIBFFI_SITE    = ftp://sourceware.org/pub/libffi
+LIBFFI_SITE = ftp://sourceware.org/pub/libffi
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
 LIBFFI_INSTALL_STAGING = YES
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LIBMBIM_VERSION = 1.10.0
-LIBMBIM_SITE    = http://www.freedesktop.org/software/libmbim
-LIBMBIM_SOURCE  = libmbim-$(LIBMBIM_VERSION).tar.xz
+LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
+LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING
 LIBMBIM_INSTALL_STAGING = YES
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -17,7 +17,7 @@
 LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
 		   HOST_LDFLAGS="-lc"
 # NSPR mixes up --build and --host
-LIBNSPR_CONF_OPTS  = --host=$(GNU_HOST_NAME)
+LIBNSPR_CONF_OPTS = --host=$(GNU_HOST_NAME)
 LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
 LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LIBQMI_VERSION = 1.10.2
-LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi
-LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.xz
+LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
+LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
 LIBQMI_LICENSE_FILES = COPYING
 LIBQMI_INSTALL_STAGING = YES
diff --git a/package/libreplaygain/libreplaygain.mk b/package/libreplaygain/libreplaygain.mk
--- a/package/libreplaygain/libreplaygain.mk
+++ b/package/libreplaygain/libreplaygain.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBREPLAYGAIN_VERSION =  r475
+LIBREPLAYGAIN_VERSION = r475
 LIBREPLAYGAIN_SITE = http://files.musepack.net/source
 LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 # upstream doesn't ship configure
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION         = 2.1.1
-LIBSECCOMP_SITE            = http://downloads.sourceforge.net/project/libseccomp/libseccomp-$(LIBSECCOMP_VERSION)/
-LIBSECCOMP_LICENSE         = LGPLv2.1
-LIBSECCOMP_LICENSE_FILES   = LICENSE
+LIBSECCOMP_VERSION = 2.1.1
+LIBSECCOMP_SITE = http://downloads.sourceforge.net/project/libseccomp/libseccomp-$(LIBSECCOMP_VERSION)/
+LIBSECCOMP_LICENSE = LGPLv2.1
+LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_INSTALL_STAGING = YES
 
 # Needed for configure to find our system headers:
-LIBSECCOMP_CONF_ENV            = SYSROOT=$(STAGING_DIR)
-LIBSECCOMP_MAKE_ENV            = $(TARGET_CONFIGURE_OPTS)
-LIBSECCOMP_MAKE_OPTS            = SUBDIRS_BUILD=src
+LIBSECCOMP_CONF_ENV = SYSROOT=$(STAGING_DIR)
+LIBSECCOMP_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
+LIBSECCOMP_MAKE_OPTS = SUBDIRS_BUILD=src
 LIBSECCOMP_INSTALL_STAGING_OPTS = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(STAGING_DIR) install
-LIBSECCOMP_INSTALL_TARGET_OPTS  = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
+LIBSECCOMP_INSTALL_TARGET_OPTS = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
 
 # Not a real autotools package, but works quite OK nonetheless
 $(eval $(autotools-package))
diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
--- a/package/libsvg-cairo/libsvg-cairo.mk
+++ b/package/libsvg-cairo/libsvg-cairo.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBSVG_CAIRO_VERSION         = 0.1.6
-LIBSVG_CAIRO_SITE            = http://cairographics.org/snapshots
-LIBSVG_CAIRO_DEPENDENCIES    = cairo libsvg
+LIBSVG_CAIRO_VERSION = 0.1.6
+LIBSVG_CAIRO_SITE = http://cairographics.org/snapshots
+LIBSVG_CAIRO_DEPENDENCIES = cairo libsvg
 LIBSVG_CAIRO_INSTALL_STAGING = YES
-LIBSVG_CAIRO_LICENSE         = LGPLv2.1+
-LIBSVG_CAIRO_LICENSE_FILES   = COPYING
+LIBSVG_CAIRO_LICENSE = LGPLv2.1+
+LIBSVG_CAIRO_LICENSE_FILES = COPYING
 
 LIBSVG_CAIRO_CONF_OPTS = --without-x
 
diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
--- a/package/libsvg/libsvg.mk
+++ b/package/libsvg/libsvg.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBSVG_VERSION         = 0.1.4
-LIBSVG_SITE            = http://cairographics.org/snapshots
-LIBSVG_DEPENDENCIES    = host-pkgconf libpng libjpeg
+LIBSVG_VERSION = 0.1.4
+LIBSVG_SITE = http://cairographics.org/snapshots
+LIBSVG_DEPENDENCIES = host-pkgconf libpng libjpeg
 LIBSVG_INSTALL_STAGING = YES
-LIBSVG_LICENSE         = LGPLv2+
-LIBSVG_LICENSE_FILES   = COPYING
+LIBSVG_LICENSE = LGPLv2+
+LIBSVG_LICENSE_FILES = COPYING
 
 # libsvg needs at last a XML parser
 ifeq ($(BR2_PACKAGE_EXPAT),y)
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LIBURCU_VERSION = 0.8.4
-LIBURCU_SITE    = http://lttng.org/files/urcu
-LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
+LIBURCU_SITE = http://lttng.org/files/urcu
+LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -14,7 +14,7 @@
 LINUX_FOR_FUSION=$(LINUX_VERSION_PROBED)
 LINUX_FUSION_ETC_DIR=$(TARGET_DIR)/etc/udev/rules.d
 
-LINUX_FUSION_MAKE_OPTS =  KERNEL_VERSION=$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPTS = KERNEL_VERSION=$(LINUX_FOR_FUSION)
 LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX_DIR)
 LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX_DIR)
 
diff --git a/package/ljlinenoise/ljlinenoise.mk b/package/ljlinenoise/ljlinenoise.mk
--- a/package/ljlinenoise/ljlinenoise.mk
+++ b/package/ljlinenoise/ljlinenoise.mk
@@ -6,7 +6,7 @@
 
 LJLINENOISE_VERSION_UPSTREAM = 0.1.1
 LJLINENOISE_VERSION = $(LJLINENOISE_VERSION_UPSTREAM)-1
-LJLINENOISE_SUBDIR  = ljlinenoise-$(LJLINENOISE_VERSION_UPSTREAM)
+LJLINENOISE_SUBDIR = ljlinenoise-$(LJLINENOISE_VERSION_UPSTREAM)
 LJLINENOISE_LICENSE = MIT
 LJLINENOISE_LICENSE_FILES = $(LJLINENOISE_SUBDIR)/COPYRIGHT
 
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -7,7 +7,7 @@
 LMBENCH_VERSION = 3.0-a9
 LMBENCH_SOURCE = lmbench-$(LMBENCH_VERSION).tgz
 LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)
-LMBENCH_LICENSE =  lmbench license (based on GPLv2)
+LMBENCH_LICENSE = lmbench license (based on GPLv2)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
 LMBENCH_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LOCALEDEF_VERSION = 2.14.1-r17443-ptx1
-LOCALEDEF_SOURCE  = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
-LOCALEDEF_SITE    = http://www.pengutronix.de/software/ptxdist/temporary-src
+LOCALEDEF_SOURCE = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
+LOCALEDEF_SITE = http://www.pengutronix.de/software/ptxdist/temporary-src
 
 HOST_LOCALEDEF_CONF_OPTS += \
 	--prefix=/usr \
diff --git a/package/lpty/lpty.mk b/package/lpty/lpty.mk
--- a/package/lpty/lpty.mk
+++ b/package/lpty/lpty.mk
@@ -6,7 +6,7 @@
 
 LPTY_VERSION_UPSTREAM = 1.0.1
 LPTY_VERSION = $(LPTY_VERSION_UPSTREAM)-1
-LPTY_SUBDIR  = lpty-$(LPTY_VERSION)
+LPTY_SUBDIR = lpty-$(LPTY_VERSION)
 LPTY_LICENSE = MIT
 LPTY_LICENSE_FILES = $(LPTY_SUBDIR)/doc/LICENSE
 
diff --git a/package/lrandom/lrandom.mk b/package/lrandom/lrandom.mk
--- a/package/lrandom/lrandom.mk
+++ b/package/lrandom/lrandom.mk
@@ -9,7 +9,7 @@
 else
 LRANDOM_VERSION = 20120430.51-1
 endif
-LRANDOM_SUBDIR  = random
+LRANDOM_SUBDIR = random
 LRANDOM_LICENSE = Public domain
 
 $(eval $(luarocks-package))
diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
--- a/package/lsqlite3/lsqlite3.mk
+++ b/package/lsqlite3/lsqlite3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LSQLITE3_VERSION = 0.9.1-2
-LSQLITE3_SUBDIR  = lsqlite3_fsl09t
+LSQLITE3_SUBDIR = lsqlite3_fsl09t
 LSQLITE3_DEPENDENCIES = sqlite
 LSQLITE3_LICENSE = MIT
 
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LTP_TESTSUITE_VERSION = 20140115
-LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
-LTP_TESTSUITE_SITE    = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
+LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
+LTP_TESTSUITE_SITE = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace
+LTTNG_BABELTRACE_SITE = http://lttng.org/files/babeltrace
 LTTNG_BABELTRACE_VERSION = 1.2.2
-LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
+LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT; LGPL2.1 for include/babeltrace/list.h; GPLv2+ for test code
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust
+LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
 LTTNG_LIBUST_VERSION = 2.5.0
-LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
+LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
-LTTNG_LIBUST_DEPENDENCIES    = liburcu util-linux
+LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LTTNG_MODULES_VERSION = 2.5.0
-LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules
-LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
+LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
+LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
 LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
 
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LTTNG_TOOLS_VERSION = 2.5.0
-LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools
-LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
+LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
+LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr
diff --git a/package/lua-coat/lua-coat.mk b/package/lua-coat/lua-coat.mk
--- a/package/lua-coat/lua-coat.mk
+++ b/package/lua-coat/lua-coat.mk
@@ -6,7 +6,7 @@
 
 LUA_COAT_VERSION_UPSTREAM = 0.9.0
 LUA_COAT_VERSION = $(LUA_COAT_VERSION_UPSTREAM)-1
-LUA_COAT_SUBDIR  = lua-Coat-$(LUA_COAT_VERSION_UPSTREAM)
+LUA_COAT_SUBDIR = lua-Coat-$(LUA_COAT_VERSION_UPSTREAM)
 LUA_COAT_LICENSE = MIT
 LUA_COAT_LICENSE_FILES = $(LUA_COAT_SUBDIR)/COPYRIGHT
 
diff --git a/package/lua-coatpersistent/lua-coatpersistent.mk b/package/lua-coatpersistent/lua-coatpersistent.mk
--- a/package/lua-coatpersistent/lua-coatpersistent.mk
+++ b/package/lua-coatpersistent/lua-coatpersistent.mk
@@ -6,7 +6,7 @@
 
 LUA_COATPERSISTENT_VERSION_UPSTREAM = 0.2.0
 LUA_COATPERSISTENT_VERSION = $(LUA_COATPERSISTENT_VERSION_UPSTREAM)-1
-LUA_COATPERSISTENT_SUBDIR  = lua-CoatPersistent-$(LUA_COATPERSISTENT_VERSION_UPSTREAM)
+LUA_COATPERSISTENT_SUBDIR = lua-CoatPersistent-$(LUA_COATPERSISTENT_VERSION_UPSTREAM)
 LUA_COATPERSISTENT_LICENSE = MIT
 LUA_COATPERSISTENT_LICENSE_FILES = $(LUA_COATPERSISTENT_SUBDIR)/COPYRIGHT
 
diff --git a/package/lua-csnappy/lua-csnappy.mk b/package/lua-csnappy/lua-csnappy.mk
--- a/package/lua-csnappy/lua-csnappy.mk
+++ b/package/lua-csnappy/lua-csnappy.mk
@@ -6,7 +6,7 @@
 
 LUA_CSNAPPY_VERSION_UPSTREAM = 0.1.1
 LUA_CSNAPPY_VERSION = $(LUA_CSNAPPY_VERSION_UPSTREAM)-1
-LUA_CSNAPPY_SUBDIR  = lua-csnappy-$(LUA_CSNAPPY_VERSION_UPSTREAM)
+LUA_CSNAPPY_SUBDIR = lua-csnappy-$(LUA_CSNAPPY_VERSION_UPSTREAM)
 LUA_CSNAPPY_LICENSE = BSD-3c
 LUA_CSNAPPY_LICENSE_FILES = $(LUA_CSNAPPY_SUBDIR)/COPYRIGHT
 
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -6,7 +6,7 @@
 
 LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.1
 LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
-LUA_MESSAGEPACK_SUBDIR  = lua-MessagePack-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)
+LUA_MESSAGEPACK_SUBDIR = lua-MessagePack-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)
 LUA_MESSAGEPACK_LICENSE = MIT
 LUA_MESSAGEPACK_LICENSE_FILES = $(LUA_MESSAGEPACK_SUBDIR)/COPYRIGHT
 
diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -6,7 +6,7 @@
 
 LUA_TESTMORE_VERSION_UPSTREAM = 0.3.1
 LUA_TESTMORE_VERSION = $(LUA_TESTMORE_VERSION_UPSTREAM)-1
-LUA_TESTMORE_SUBDIR  = lua-TestMore-$(LUA_TESTMORE_VERSION_UPSTREAM)
+LUA_TESTMORE_SUBDIR = lua-TestMore-$(LUA_TESTMORE_VERSION_UPSTREAM)
 LUA_TESTMORE_LICENSE = MIT
 LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
 
diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
--- a/package/luabitop/luabitop.mk
+++ b/package/luabitop/luabitop.mk
@@ -6,7 +6,7 @@
 
 LUABITOP_VERSION_UPSTREAM = 1.0.2
 LUABITOP_VERSION = $(LUABITOP_VERSION_UPSTREAM)-1
-LUABITOP_SUBDIR  = LuaBitOp-$(LUABITOP_VERSION_UPSTREAM)
+LUABITOP_SUBDIR = LuaBitOp-$(LUABITOP_VERSION_UPSTREAM)
 LUABITOP_LICENSE = MIT
 LUABITOP_LICENSE_FILES = $(LUABITOP_SUBDIR)/README
 
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LUAJIT_VERSION = 2.0.3
-LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
-LUAJIT_SITE    = http://luajit.org/download
+LUAJIT_SOURCE = LuaJIT-$(LUAJIT_VERSION).tar.gz
+LUAJIT_SITE = http://luajit.org/download
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
 
diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
--- a/package/luajson/luajson.mk
+++ b/package/luajson/luajson.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUAJSON_VERSION = 1.3.3-1
-LUAJSON_SUBDIR  = luajson
+LUAJSON_SUBDIR = luajson
 LUAJSON_LICENSE = MIT
 LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
 
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUALOGGING_VERSION = 1.3.0-1
-LUALOGGING_SUBDIR  = lualogging
+LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
 
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -11,7 +11,7 @@
 
 HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 
-LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
+LUAROCKS_CONFIG_DIR = $(HOST_DIR)/usr/etc/luarocks
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
 
 HOST_LUAROCKS_CONF_OPTS = \
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -6,7 +6,7 @@
 
 LUASEC_VERSION_UPSTREAM = 0.5
 LUASEC_VERSION = $(LUASEC_VERSION_UPSTREAM)-2
-LUASEC_SUBDIR  = luasec
+LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
 LUASEC_DEPENDENCIES = openssl
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUASOCKET_VERSION = 3.0rc1-1
-LUASOCKET_SUBDIR  = luasocket-3.0-rc1
+LUASOCKET_SUBDIR = luasocket-3.0-rc1
 LUASOCKET_LICENSE = MIT
 LUASOCKET_LICENSE_FILES = $(LUASOCKET_SUBDIR)/LICENSE
 
diff --git a/package/luasql-sqlite3/luasql-sqlite3.mk b/package/luasql-sqlite3/luasql-sqlite3.mk
--- a/package/luasql-sqlite3/luasql-sqlite3.mk
+++ b/package/luasql-sqlite3/luasql-sqlite3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUASQL_SQLITE3_VERSION = 2.3.0-1
-LUASQL_SQLITE3_SUBDIR  = luasql
+LUASQL_SQLITE3_SUBDIR = luasql
 LUASQL_SQLITE3_LICENSE = MIT
 LUASQL_SQLITE3_LICENSE_FILES = $(LUASQL_SQLITE3_SUBDIR)/README
 LUASQL_SQLITE3_DEPENDENCIES = sqlite
diff --git a/package/lunit/lunit.mk b/package/lunit/lunit.mk
--- a/package/lunit/lunit.mk
+++ b/package/lunit/lunit.mk
@@ -6,7 +6,7 @@
 
 LUNIT_VERSION_UPSTREAM = 0.5
 LUNIT_VERSION = $(LUNIT_VERSION_UPSTREAM)-2
-LUNIT_SUBDIR  = lunit-$(LUNIT_VERSION_UPSTREAM)
+LUNIT_SUBDIR = lunit-$(LUNIT_VERSION_UPSTREAM)
 LUNIT_LICENSE = MIT
 LUNIT_LICENSE_FILES = $(LUNIT_SUBDIR)/LICENSE
 
diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
--- a/package/lzlib/lzlib.mk
+++ b/package/lzlib/lzlib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LZLIB_VERSION = 0.4.work3-1
-LZLIB_SUBDIR  = lzlib-0.4-work3
+LZLIB_SUBDIR = lzlib-0.4-work3
 LZLIB_DEPENDENCIES = zlib
 LZLIB_LICENSE = MIT
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -55,13 +55,13 @@
 # Drivers
 
 #Gallium Drivers
-MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
-MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
-MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU) += nouveau
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA) += svga
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST) += swrast
 # DRI Drivers
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915) += i915
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965) += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
 
 ifeq ($(MESA3D_GALLIUM_DRIVERS-y),)
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 MII_DIAG_VERSION = 2.11
-MII_DIAG_SOURCE  = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
-MII_DIAG_PATCH   = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
-MII_DIAG_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
+MII_DIAG_SOURCE = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
+MII_DIAG_PATCH = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
+MII_DIAG_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
 MII_DIAG_LICENSE = GPL # No version specified
 MII_DIAG_LICENSE_FILES = mii-diag.c
 
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MMC_UTILS_VERSION = 11f2ceabc4ad3f0dd568e0ce68166e4803e0615b
-MMC_UTILS_SITE    = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
+MMC_UTILS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
 MMC_UTILS_LICENSE = GPLv2
 
 define MMC_UTILS_BUILD_CMDS
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -14,9 +14,9 @@
 # mplayer needs pcm+mixer support, but configure fails to check for it
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
 MPLAYER_DEPENDENCIES += alsa-lib
-MPLAYER_CONF_OPTS    += --enable-alsa
+MPLAYER_CONF_OPTS += --enable-alsa
 else
-MPLAYER_CONF_OPTS    += --disable-alsa
+MPLAYER_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_ENDIAN),"BIG")
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -36,45 +36,45 @@
 MKFS_JFFS2 = $(HOST_DIR)/usr/sbin/mkfs.jffs2
 SUMTOOL = $(HOST_DIR)/usr/sbin/sumtool
 
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
-MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP)		+= flashcp
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE)	+= flash_erase
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK)	+= flash_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP)	+= flash_otp_dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO)	+= flash_otp_info
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_LOCK)	+= flash_otp_lock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_WRITE)	+= flash_otp_write
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK)	+= flash_unlock
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK)	+= ftl_check
-MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)	+= jffs2dump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)	+= mkfs.jffs2
-MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)	+= mtd_debug
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP)		+= nanddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST)		+= nandtest
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE)	+= nandwrite
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP)		+= nftldump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT)	+= nftl_format
-MTD_TARGETS_$(BR2_PACKAGE_MTD_RECV_IMAGE)	+= recv_image
-MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDDUMP)		+= rfddump
-MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDFORMAT)	+= rfdformat
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SERVE_IMAGE)	+= serve_image
-MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL)		+= sumtool
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
+MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_DUMP) += flash_otp_dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_INFO) += flash_otp_info
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_LOCK) += flash_otp_lock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_OTP_WRITE) += flash_otp_write
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST) += nandtest
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RECV_IMAGE) += recv_image
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDDUMP) += rfddump
+MTD_TARGETS_$(BR2_PACKAGE_MTD_RFDFORMAT) += rfdformat
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SERVE_IMAGE) += serve_image
+MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
 
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_MTDINFO)	+= mtdinfo
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH)	+= ubiattach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32)	+= ubicrc32
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH)	+= ubidetach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIFORMAT)	+= ubiformat
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL)	+= ubimkvol
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO)	+= ubinfo
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINIZE)	+= ubinize
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRENAME)	+= ubirename
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL)	+= ubirmvol
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL)	+= ubirsvol
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIBLOCK)	+= ubiblock
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_MTDINFO) += mtdinfo
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH) += ubiattach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32) += ubicrc32
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH) += ubidetach
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIFORMAT) += ubiformat
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL) += ubimkvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO) += ubinfo
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINIZE) += ubinize
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRENAME) += ubirename
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL) += ubirmvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL) += ubirsvol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL) += ubiupdatevol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIBLOCK) += ubiblock
 
 MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs/mkfs.ubifs
diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSEPACK_VERSION =  r475
+MUSEPACK_VERSION = r475
 MUSEPACK_SITE = http://files.musepack.net/source
 MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
--- a/package/on2-8170-modules/on2-8170-modules.mk
+++ b/package/on2-8170-modules/on2-8170-modules.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ON2_8170_MODULES_VERSION = 73b08061d30789178e692bc332b73d1d9922bf39
-ON2_8170_MODULES_SITE    = $(call github,alexandrebelloni,on2-8170-modules,$(ON2_8170_MODULES_VERSION))
+ON2_8170_MODULES_SITE = $(call github,alexandrebelloni,on2-8170-modules,$(ON2_8170_MODULES_VERSION))
 
 ON2_8170_MODULES_DEPENDENCIES = linux
 
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -17,9 +17,9 @@
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 	OPEN2300_DEPENDENCIES += mysql
-	OPEN2300_BINS         += mysql2300 mysqlhistlog2300
-	OPEN2300_CFLAGS       += -I$(STAGING_DIR)/usr/include/mysql
-	OPEN2300_LDFLAGS      += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
+	OPEN2300_BINS += mysql2300 mysqlhistlog2300
+	OPEN2300_CFLAGS += -I$(STAGING_DIR)/usr/include/mysql
+	OPEN2300_LDFLAGS += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
 endif
 
 define OPEN2300_BUILD_CMDS
diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -6,7 +6,7 @@
 
 ORBIT_VERSION_UPSTREAM = 2.2.1
 ORBIT_VERSION = $(ORBIT_VERSION_UPSTREAM)-1
-ORBIT_SUBDIR  = orbit
+ORBIT_SUBDIR = orbit
 ORBIT_LICENSE = MIT
 ORBIT_LICENSE_FILES = $(ORBIT_SUBDIR)/doc/us/license.md
 
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -15,8 +15,8 @@
 PERL_CROSS_VERSION = 0.8.5
 PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
 # DO NOT refactor with the github helper (the result is not the same)
-PERL_CROSS_SITE    = http://raw.github.com/arsv/perl-cross/releases
-PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
+PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
+PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
 PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
 
diff --git a/package/php/php.mk b/package/php/php.mk
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -13,7 +13,7 @@
 PHP_DEPENDENCIES = host-pkgconf
 PHP_LICENSE = PHP
 PHP_LICENSE_FILES = LICENSE
-PHP_CONF_OPTS =  --mandir=/usr/share/man \
+PHP_CONF_OPTS = --mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		--disable-all \
 		--without-pear \
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PICOCOM_VERSION = 1.7
-PICOCOM_SITE    = http://picocom.googlecode.com/files
+PICOCOM_SITE = http://picocom.googlecode.com/files
 PICOCOM_LICENSE = GPLv2+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -10,7 +10,7 @@
 PINENTRY_LICENSE = GPLv2+
 PINENTRY_LICENSE_FILES = COPYING
 PINENTRY_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-PINENTRY_CONF_OPTS =  --disable-pinentry-gtk # gtk1
+PINENTRY_CONF_OPTS = --disable-pinentry-gtk # gtk1
 PINENTRY_CONF_OPTS += --disable-pinentry-qt  # qt3
 PINENTRY_CONF_OPTS += --without-libcap       # requires PAM
 
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -107,9 +107,9 @@
 $(2)_CONF_OPTS			?=
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
-$(2)_INSTALL_OPTS                ?= install
-$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
-$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR)  install
+$(2)_INSTALL_OPTS ?= install
+$(2)_INSTALL_STAGING_OPTS ?= DESTDIR=$$(STAGING_DIR) install
+$(2)_INSTALL_TARGET_OPTS ?= DESTDIR=$$(TARGET_DIR)  install
 
 
 #
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -38,15 +38,15 @@
 
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPTS			?=
-$(2)_MAKE			?= $$(MAKE)
+$(2)_MAKE ?= $$(MAKE)
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
-$(2)_INSTALL_HOST_OPTS		?= install
-$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
-$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
+$(2)_INSTALL_HOST_OPTS ?= install
+$(2)_INSTALL_STAGING_OPTS ?= DESTDIR=$$(STAGING_DIR) install
+$(2)_INSTALL_TARGET_OPTS ?= DESTDIR=$$(TARGET_DIR) install
 
-$(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
-$(2)_BUILDDIR			= $$($(2)_SRCDIR)
+$(2)_SRCDIR = $$($(2)_DIR)/$$($(2)_SUBDIR)
+$(2)_BUILDDIR = $$($(2)_SRCDIR)
 
 #
 # Configure step. Only define it if not already defined by the package
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -140,7 +140,7 @@
 #
 # For BR2_GLOBAL_PATCH_DIR, only generate if it is defined
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
-$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $(PKGDIR)
+$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $(PKGDIR)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
@@ -322,9 +322,9 @@
 # this information has only to be specified once, for both the
 # target and host packages of a given .mk file.
 
-$(2)_TYPE                       =  $(4)
-$(2)_NAME			=  $(1)
-$(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
+$(2)_TYPE = $(4)
+$(2)_NAME = $(1)
+$(2)_RAWNAME = $$(patsubst host-%,%,$(1))
 
 # Keep the package version that may contain forward slashes in the _DL_VERSION
 # variable, then replace all forward slashes ('/') by underscores ('_') to
@@ -344,9 +344,9 @@
   $(2)_VERSION := $$(subst /,_,$$($(2)_VERSION))
 endif
 
-$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
-$(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
-$(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
+$(2)_BASE_NAME = $(1)-$$($(2)_VERSION)
+$(2)_DL_DIR = $$(DL_DIR)/$$($(2)_BASE_NAME)
+$(2)_DIR = $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
 ifndef $(2)_SUBDIR
  ifdef $(3)_SUBDIR
@@ -356,8 +356,8 @@
  endif
 endif
 
-$(2)_SRCDIR		       = $$($(2)_DIR)/$$($(2)_SUBDIR)
-$(2)_BUILDDIR		       ?= $$($(2)_SRCDIR)
+$(2)_SRCDIR = $$($(2)_DIR)/$$($(2)_SUBDIR)
+$(2)_BUILDDIR ?= $$($(2)_SRCDIR)
 
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
@@ -367,7 +367,7 @@
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
  else
-  $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
+  $(2)_SOURCE ?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
  endif
 endif
 
@@ -404,7 +404,7 @@
  endif
 endif
 
-$(2)_LICENSE			?= unknown
+$(2)_LICENSE ?= unknown
 
 ifndef $(2)_LICENSE_FILES
  ifdef $(3)_LICENSE_FILES
@@ -418,12 +418,12 @@
  endif
 endif
 
-$(2)_REDISTRIBUTE		?= YES
+$(2)_REDISTRIBUTE ?= YES
 
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency
-$(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
+$(2)_ADD_TOOLCHAIN_DEPENDENCY ?= YES
 
 ifeq ($(4),host)
 $(2)_DEPENDENCIES ?= $$(filter-out  host-toolchain $(1),\
@@ -438,23 +438,23 @@
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 
-$(2)_INSTALL_STAGING		?= NO
-$(2)_INSTALL_IMAGES		?= NO
-$(2)_INSTALL_TARGET		?= YES
+$(2)_INSTALL_STAGING ?= NO
+$(2)_INSTALL_IMAGES ?= NO
+$(2)_INSTALL_TARGET ?= YES
 
 # define sub-target stamps
-$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
-$(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
-$(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
-$(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
-$(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
-$(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
-$(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
-$(2)_TARGET_RSYNC_SOURCE =      $$($(2)_DIR)/.stamp_rsync_sourced
-$(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
-$(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
-$(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
-$(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
+$(2)_TARGET_INSTALL_TARGET = $$($(2)_DIR)/.stamp_target_installed
+$(2)_TARGET_INSTALL_STAGING = $$($(2)_DIR)/.stamp_staging_installed
+$(2)_TARGET_INSTALL_IMAGES = $$($(2)_DIR)/.stamp_images_installed
+$(2)_TARGET_INSTALL_HOST = $$($(2)_DIR)/.stamp_host_installed
+$(2)_TARGET_BUILD = $$($(2)_DIR)/.stamp_built
+$(2)_TARGET_CONFIGURE = $$($(2)_DIR)/.stamp_configured
+$(2)_TARGET_RSYNC = $$($(2)_DIR)/.stamp_rsynced
+$(2)_TARGET_RSYNC_SOURCE = $$($(2)_DIR)/.stamp_rsync_sourced
+$(2)_TARGET_PATCH = $$($(2)_DIR)/.stamp_patched
+$(2)_TARGET_EXTRACT = $$($(2)_DIR)/.stamp_extracted
+$(2)_TARGET_SOURCE = $$($(2)_DIR)/.stamp_downloaded
+$(2)_TARGET_DIRCLEAN = $$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -34,14 +34,14 @@
 define inner-luarocks-package
 
 $(2)_BUILD_OPTS		?=
-$(2)_SUBDIR		?= $(1)-$$(shell echo "$$($(3)_VERSION)" | sed -e "s/-[0-9]$$$$//")
-$(2)_ROCKSPEC		?= $(1)-$$($(3)_VERSION).rockspec
-$(2)_SOURCE		?= $(1)-$$($(3)_VERSION).src.rock
-$(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
+$(2)_SUBDIR ?= $(1)-$$(shell echo "$$($(3)_VERSION)" | sed -e "s/-[0-9]$$$$//")
+$(2)_ROCKSPEC ?= $(1)-$$($(3)_VERSION).rockspec
+$(2)_SOURCE ?= $(1)-$$($(3)_VERSION).src.rock
+$(2)_SITE ?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
 
 # Since we do not support host-luarocks-package, we know this is
 # a target package, and can just add the required dependencies
-$(2)_DEPENDENCIES	+= host-luarocks luainterpreter
+$(2)_DEPENDENCIES += host-luarocks luainterpreter
 
 #
 # Extract step
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -19,7 +19,7 @@
 #
 ################################################################################
 
-PERL_ARCHNAME	= $(ARCH)-linux
+PERL_ARCHNAME = $(ARCH)-linux
 
 ################################################################################
 # inner-perl-package -- defines how the configuration, compilation and
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -91,8 +91,8 @@
 
 define inner-python-package
 
-$(2)_SRCDIR	= $$($(2)_DIR)/$$($(2)_SUBDIR)
-$(2)_BUILDDIR	= $$($(2)_SRCDIR)
+$(2)_SRCDIR = $$($(2)_DIR)/$$($(2)_SUBDIR)
+$(2)_BUILDDIR = $$($(2)_SRCDIR)
 
 $(2)_ENV         ?=
 $(2)_BUILD_OPTS   ?=
@@ -109,28 +109,28 @@
 # Distutils
 ifeq ($$($(2)_SETUP_TYPE),distutils)
 ifeq ($(4),target)
-$(2)_BASE_ENV         = $$(PKG_PYTHON_DISTUTILS_ENV)
-$(2)_BASE_BUILD_TGT   = build
-$(2)_BASE_BUILD_OPTS   = $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
-$(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
+$(2)_BASE_ENV = $$(PKG_PYTHON_DISTUTILS_ENV)
+$(2)_BASE_BUILD_TGT = build
+$(2)_BASE_BUILD_OPTS = $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
+$(2)_BASE_INSTALL_TARGET_OPTS = $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
-$(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
-$(2)_BASE_BUILD_TGT   = build
+$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
+$(2)_BASE_BUILD_TGT = build
 $(2)_BASE_BUILD_OPTS   =
 $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
 else ifeq ($$($(2)_SETUP_TYPE),setuptools)
 ifeq ($(4),target)
-$(2)_BASE_ENV         = $$(PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_TGT   = build
+$(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
+$(2)_BASE_BUILD_TGT = build
 $(2)_BASE_BUILD_OPTS   =
-$(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
+$(2)_BASE_INSTALL_TARGET_OPTS = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
 $(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
-$(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_TGT   = build
+$(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
+$(2)_BASE_BUILD_TGT = build
 $(2)_BASE_BUILD_OPTS   =
 $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -52,30 +52,30 @@
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
 # variable provided by make. This is used by the *TARGETS macros to
 # automagically find where the package is located.
-pkgdir       = $(dir $(lastword $(MAKEFILE_LIST)))
-pkgname      = $(lastword $(subst /, ,$(pkgdir)))
+pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
+pkgname = $(lastword $(subst /, ,$(pkgdir)))
 
 # Define extractors for different archive suffixes
-INFLATE.bz2  = $(BZCAT)
-INFLATE.gz   = $(ZCAT)
-INFLATE.tbz  = $(BZCAT)
+INFLATE.bz2 = $(BZCAT)
+INFLATE.gz = $(ZCAT)
+INFLATE.tbz = $(BZCAT)
 INFLATE.tbz2 = $(BZCAT)
-INFLATE.tgz  = $(ZCAT)
-INFLATE.xz   = $(XZCAT)
-INFLATE.tar  = cat
+INFLATE.tgz = $(ZCAT)
+INFLATE.xz = $(XZCAT)
+INFLATE.tar = cat
 # suitable-extractor(filename): returns extractor based on suffix
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
-TERM_BOLD  := $(shell tput smso)
+MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
+TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
 # Utility functions for 'find'
 # findfileclauses(filelist) => -name 'X' -o -name 'Y'
 findfileclauses = $(call notfirstword,$(patsubst %,-o -name '%',$(1)))
 # finddirclauses(base, dirlist) => -path 'base/dirX' -o -path 'base/dirY'
-finddirclauses  = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
+finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
 
 # Miscellaneous utility functions
 # notfirstword(wordlist): returns all but the first word in wordlist
diff --git a/package/python-dialog/python-dialog.mk b/package/python-dialog/python-dialog.mk
--- a/package/python-dialog/python-dialog.mk
+++ b/package/python-dialog/python-dialog.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_DIALOG_VERSION = 3.0.1
-PYTHON_DIALOG_SOURCE  = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
-PYTHON_DIALOG_SITE    = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
+PYTHON_DIALOG_SOURCE = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
+PYTHON_DIALOG_SITE = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
 PYTHON_DIALOG_LICENSE = LGPLv2.1+
 PYTHON_DIALOG_LICENSE_FILES = COPYING
 PYTHON_DIALOG_SETUP_TYPE = distutils
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_IPY_VERSION = IPy-0.75
-PYTHON_IPY_SITE    = $(call github,haypo,python-ipy,$(PYTHON_IPY_VERSION))
+PYTHON_IPY_SITE = $(call github,haypo,python-ipy,$(PYTHON_IPY_VERSION))
 PYTHON_IPY_LICENSE = BSD-3c
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = distutils
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_NETIFACES_VERSION = 0.7
-PYTHON_NETIFACES_SOURCE  = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE    = http://alastairs-place.net/projects/netifaces
+PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
+PYTHON_NETIFACES_SITE = http://alastairs-place.net/projects/netifaces
 PYTHON_NETIFACES_LICENSE = MIT
 PYTHON_NETIFACES_LICENSE_FILES = README
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
-PYTHON_PROTOBUF_SOURCE  = $(PROTOBUF_SOURCE)
-PYTHON_PROTOBUF_SITE    = $(PROTOBUF_SITE)
+PYTHON_PROTOBUF_SOURCE = $(PROTOBUF_SOURCE)
+PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
 PYTHON_PROTOBUF_LICENSE = BSD-3c
 PYTHON_PROTOBUF_LICENSE_FILES = COPYING.txt
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION         = 1.5.6
-PYTHON_PYPARSING_SOURCE          = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE            = http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-$(PYTHON_PYPARSING_VERSION)
-PYTHON_PYPARSING_LICENSE         = MIT
-PYTHON_PYPARSING_LICENSE_FILES   = LICENSE
-PYTHON_PYPARSING_SETUP_TYPE      = distutils
+PYTHON_PYPARSING_VERSION = 1.5.6
+PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
+PYTHON_PYPARSING_SITE = http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-$(PYTHON_PYPARSING_VERSION)
+PYTHON_PYPARSING_LICENSE = MIT
+PYTHON_PYPARSING_LICENSE_FILES = LICENSE
+PYTHON_PYPARSING_SETUP_TYPE = distutils
 
 $(eval $(python-package))
diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
--- a/package/python-pyro/python-pyro.mk
+++ b/package/python-pyro/python-pyro.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_PYRO_VERSION = 3.14
-PYTHON_PYRO_SOURCE  = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
-PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro
+PYTHON_PYRO_SOURCE = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
+PYTHON_PYRO_SITE = https://pypi.python.org/packages/source/P/Pyro
 PYTHON_PYRO_LICENSE = MIT
 PYTHON_PYRO_LICENSE_FILES = LICENSE
 PYTHON_PYRO_SETUP_TYPE = distutils
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_SERIAL_VERSION = 2.6
-PYTHON_SERIAL_SOURCE  = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
-PYTHON_SERIAL_SITE    = http://pypi.python.org/packages/source/p/pyserial
+PYTHON_SERIAL_SOURCE = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
+PYTHON_SERIAL_SITE = http://pypi.python.org/packages/source/p/pyserial
 PYTHON_SERIAL_LICENSE = Python Software Foundation License
 PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_SETUP_TYPE = distutils
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_SETUPTOOLS_VERSION = 2.1.2
-PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
+PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE = http://pypi.python.org/packages/source/s/setuptools
 PYTHON_SETUPTOOLS_LICENSE = Python Software Foundation or Zope Public License
 PYTHON_SETUPTOOLS_LICENSE_FILES = PKG-INFO
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
diff --git a/package/python/python.mk b/package/python/python.mk
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).8
-PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.xz
-PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
-PYTHON_LICENSE       = Python software foundation license v2, others
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).8
+PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
+PYTHON_SITE = http://python.org/ftp/python/$(PYTHON_VERSION)
+PYTHON_LICENSE = Python software foundation license v2, others
 PYTHON_LICENSE_FILES = LICENSE
 
 # Python needs itself to be built, so in order to cross-compile
@@ -48,7 +48,7 @@
 # MAKE1 has shown to workaround the problem.
 HOST_PYTHON_MAKE = $(MAKE1)
 
-PYTHON_DEPENDENCIES  = host-python libffi
+PYTHON_DEPENDENCIES = host-python libffi
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -37,7 +37,7 @@
 HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags"
 
-PYTHON3_DEPENDENCIES  = host-python3 libffi
+PYTHON3_DEPENDENCIES = host-python3 libffi
 
 HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib
 
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QEXTSERIALPORT_VERSION     = 6c47244de4ce6db43c2f05caee957666c951dae1
-QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/git
+QEXTSERIALPORT_VERSION = 6c47244de4ce6db43c2f05caee957666c951dae1
+QEXTSERIALPORT_SITE = https://qextserialport.googlecode.com/git
 QEXTSERIALPORT_SITE_METHOD = git
 
 QEXTSERIALPORT_LICENSE = MIT
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
--- a/package/qjson/qjson.mk
+++ b/package/qjson/qjson.mk
@@ -8,7 +8,7 @@
 
 QJSON_SITE = $(call github,flavio,qjson,$(QJSON_VERSION))
 QJSON_INSTALL_STAGING = YES
-QJSON_DEPENDENCIES =  qt
+QJSON_DEPENDENCIES = qt
 QJSON_LICENSE = LGPLv2.1
 QJSON_LICENSE_FILES = COPYING.lib
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -13,8 +13,8 @@
 
 QT_VERSION_MAJOR = 4.8
 QT_VERSION = $(QT_VERSION_MAJOR).6
-QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
-QT_SITE    = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
+QT_SOURCE = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
+QT_SITE = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
@@ -252,7 +252,7 @@
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMZLIB),y)
 QT_CONFIGURE_OPTS += -system-zlib
-QT_DEPENDENCIES   += zlib
+QT_DEPENDENCIES += zlib
 endif
 endif
 
@@ -261,7 +261,7 @@
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMJPEG),y)
 QT_CONFIGURE_OPTS += -system-libjpeg
-QT_DEPENDENCIES   += jpeg
+QT_DEPENDENCIES += jpeg
 else
 QT_CONFIGURE_OPTS += -no-libjpeg
 endif
@@ -272,7 +272,7 @@
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMPNG),y)
 QT_CONFIGURE_OPTS += -system-libpng
-QT_DEPENDENCIES   += libpng
+QT_DEPENDENCIES += libpng
 else
 QT_CONFIGURE_OPTS += -no-libpng
 endif
@@ -283,7 +283,7 @@
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMTIFF),y)
 QT_CONFIGURE_OPTS += -system-libtiff
-QT_DEPENDENCIES   += tiff
+QT_DEPENDENCIES += tiff
 else
 QT_CONFIGURE_OPTS += -no-libtiff
 endif
@@ -302,29 +302,29 @@
 ifeq ($(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
 QT_CONFIGURE_OPTS += -system-freetype
 QT_CONFIGURE_OPTS += -I $(STAGING_DIR)/usr/include/freetype2/
-QT_DEPENDENCIES   += freetype
+QT_DEPENDENCIES += freetype
 else
 QT_CONFIGURE_OPTS += -no-freetype
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_DBUS),y)
-QT_DEPENDENCIES   += dbus
+QT_DEPENDENCIES += dbus
 endif
 
 ifeq ($(BR2_PACKAGE_QT_OPENSSL),y)
 QT_CONFIGURE_OPTS += -openssl
-QT_DEPENDENCIES   += openssl
+QT_DEPENDENCIES += openssl
 else
 QT_CONFIGURE_OPTS += -no-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
 QT_CONFIGURE_OPTS += -opengl es2 -egl
-QT_DEPENDENCIES   += libgles libegl
-QT_CFLAGS   += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
+QT_DEPENDENCIES += libgles libegl
+QT_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
 QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
-QT_LDFLAGS  += $(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)
+QT_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)
 else
 QT_CONFIGURE_OPTS += -no-opengl
 endif
@@ -336,22 +336,22 @@
 endif
 ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
 QT_CONFIGURE_OPTS += -qt-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
-QT_DEPENDENCIES   += mysql
+QT_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
 QT_CONFIGURE_OPTS += -qt-sql-odbc
 endif
 ifeq ($(BR2_PACKAGE_QT_PSQL),y)
 QT_CONFIGURE_OPTS += -qt-sql-psql
-QT_CONFIGURE_ENV  += PSQL_LIBS=-L$(STAGING_DIR)/usr/lib
-QT_DEPENDENCIES   += postgresql
+QT_CONFIGURE_ENV += PSQL_LIBS=-L$(STAGING_DIR)/usr/lib
+QT_DEPENDENCIES += postgresql
 endif
 ifeq ($(BR2_PACKAGE_QT_SQLITE_QT),y)
 QT_CONFIGURE_OPTS += -qt-sql-sqlite
 else
 ifeq ($(BR2_PACKAGE_QT_SQLITE_SYSTEM),y)
 QT_CONFIGURE_OPTS += -system-sqlite
-QT_DEPENDENCIES   += sqlite
+QT_DEPENDENCIES += sqlite
 else
 QT_CONFIGURE_OPTS += -no-sql-sqlite
 endif
@@ -380,14 +380,14 @@
 
 ifeq ($(BR2_PACKAGE_QT_AUDIO_BACKEND),y)
 QT_CONFIGURE_OPTS += -audio-backend
-QT_DEPENDENCIES   += alsa-lib
+QT_DEPENDENCIES += alsa-lib
 else
 QT_CONFIGURE_OPTS += -no-audio-backend
 endif
 
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
 QT_CONFIGURE_OPTS += -phonon
-QT_DEPENDENCIES   += gstreamer gst-plugins-base
+QT_DEPENDENCIES += gstreamer gst-plugins-base
 else
 QT_CONFIGURE_OPTS += -no-phonon
 endif
@@ -532,60 +532,60 @@
 
 # Build the list of libraries and plugins to install to the target
 
-QT_INSTALL_LIBS    += QtCore
-QT_HOST_PROGRAMS   += moc rcc qmake lrelease
+QT_INSTALL_LIBS += QtCore
+QT_HOST_PROGRAMS += moc rcc qmake lrelease
 
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-QT_INSTALL_LIBS    += QtGui
-QT_HOST_PROGRAMS   += uic
+QT_INSTALL_LIBS += QtGui
+QT_HOST_PROGRAMS += uic
 endif
 ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
-QT_INSTALL_LIBS    += QtSql
+QT_INSTALL_LIBS += QtSql
 endif
 ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
-QT_INSTALL_LIBS    += QtMultimedia
+QT_INSTALL_LIBS += QtMultimedia
 endif
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
-QT_INSTALL_LIBS    += phonon
+QT_INSTALL_LIBS += phonon
 endif
 ifeq ($(BR2_PACKAGE_QT_SVG),y)
-QT_INSTALL_LIBS    += QtSvg
+QT_INSTALL_LIBS += QtSvg
 endif
 ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
-QT_INSTALL_LIBS    += QtNetwork
+QT_INSTALL_LIBS += QtNetwork
 endif
 ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
-QT_INSTALL_LIBS    += QtWebKit
+QT_INSTALL_LIBS += QtWebKit
 endif
 ifeq ($(BR2_PACKAGE_QT_XML),y)
-QT_INSTALL_LIBS    += QtXml
+QT_INSTALL_LIBS += QtXml
 endif
 ifeq ($(BR2_PACKAGE_QT_DBUS),y)
-QT_INSTALL_LIBS    += QtDBus
+QT_INSTALL_LIBS += QtDBus
 endif
 ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
-QT_INSTALL_LIBS    += QtXmlPatterns
+QT_INSTALL_LIBS += QtXmlPatterns
 endif
 ifeq ($(BR2_PACKAGE_QT_SCRIPT),y)
-QT_INSTALL_LIBS    += QtScript
+QT_INSTALL_LIBS += QtScript
 endif
 ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
-QT_INSTALL_LIBS    += QtScriptTools
+QT_INSTALL_LIBS += QtScriptTools
 endif
 ifeq ($(BR2_PACKAGE_QT_DECLARATIVE),y)
-QT_INSTALL_LIBS    += QtDeclarative
+QT_INSTALL_LIBS += QtDeclarative
 endif
 ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
-QT_INSTALL_LIBS    += Qt3Support
+QT_INSTALL_LIBS += Qt3Support
 endif
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
-QT_INSTALL_LIBS    += QtOpenGL
+QT_INSTALL_LIBS += QtOpenGL
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_POWERVR),y)
-QT_INSTALL_LIBS    += pvrQWSWSEGL
+QT_INSTALL_LIBS += pvrQWSWSEGL
 endif
 ifeq ($(BR2_PACKAGE_QT_TEST),y)
-QT_INSTALL_LIBS    += QtTest
+QT_INSTALL_LIBS += QtTest
 endif
 
 QT_CONF_FILE=$(HOST_DIR)/usr/bin/qt.conf
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -61,22 +61,22 @@
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
 QT5BASE_CONFIGURE_OPTS += -plugin-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
-QT5BASE_DEPENDENCIES   += mysql
+QT5BASE_DEPENDENCIES += mysql
 else
 QT5BASE_CONFIGURE_OPTS += -no-sql-mysql
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_PSQL),y)
 QT5BASE_CONFIGURE_OPTS += -plugin-sql-psql
-QT5BASE_CONFIGURE_ENV  += PSQL_LIBS=-L$(STAGING_DIR)/usr/lib
-QT5BASE_DEPENDENCIES   += postgresql
+QT5BASE_CONFIGURE_ENV += PSQL_LIBS=-L$(STAGING_DIR)/usr/lib
+QT5BASE_DEPENDENCIES += postgresql
 else
 QT5BASE_CONFIGURE_OPTS += -no-sql-psql
 endif
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_QT),-plugin-sql-sqlite)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),-system-sqlite)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),sqlite)
+QT5BASE_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM),sqlite)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_SQLITE_NONE),-no-sql-sqlite)
 endif
 
@@ -86,11 +86,11 @@
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-no-linuxfb)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
+QT5BASE_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
 
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon
-QT5BASE_DEPENDENCIES   += \
+QT5BASE_DEPENDENCIES += \
 	libxcb \
 	xcb-util-wm \
 	xcb-util-image \
@@ -98,7 +98,7 @@
 	xlib_libX11 \
 	libxkbcommon
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
-QT5BASE_DEPENDENCIES   += xlib_libXext
+QT5BASE_DEPENDENCIES += xlib_libXext
 endif
 else
 QT5BASE_CONFIGURE_OPTS += -no-xcb
@@ -106,10 +106,10 @@
 
 ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),y)
 QT5BASE_CONFIGURE_OPTS += -opengl desktop
-QT5BASE_DEPENDENCIES   += libgl
+QT5BASE_DEPENDENCIES += libgl
 else ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL_ES2),y)
 QT5BASE_CONFIGURE_OPTS += -opengl es2
-QT5BASE_DEPENDENCIES   += libgles
+QT5BASE_DEPENDENCIES += libgles
 else
 QT5BASE_CONFIGURE_OPTS += -no-opengl
 endif
@@ -119,7 +119,7 @@
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -eglfs
-QT5BASE_DEPENDENCIES   += libegl
+QT5BASE_DEPENDENCIES += libegl
 ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
 QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
 	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
@@ -133,41 +133,41 @@
 endif
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
+QT5BASE_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENSSL),openssl)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
+QT5BASE_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_GIF),,-no-gif)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_JPEG),-system-libjpeg,-no-libjpeg)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_JPEG),jpeg)
+QT5BASE_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5BASE_JPEG),jpeg)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_PNG),-system-libpng,-no-libpng)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
+QT5BASE_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DBUS),dbus)
+QT5BASE_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5BASE_DBUS),dbus)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),-tslib,-no-tslib)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),tslib)
+QT5BASE_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),tslib)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
+QT5BASE_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu,-no-icu)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
+QT5BASE_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
 # Build the list of libraries to be installed on the target
-QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
+QT5BASE_INSTALL_LIBS_y += Qt5Core
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK) += Qt5Network
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL) += Qt5Sql
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST) += Qt5Test
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML) += Qt5Xml
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
 
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI) += Qt5Gui
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS) += Qt5Widgets
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -10,7 +10,7 @@
 QWT_INSTALL_STAGING = YES
 QWT_DEPENDENCIES = qt
 
-QWT_CONFIG  =    's%QWT_INSTALL_PREFIX.*/usr/local/.*%QWT_INSTALL_PREFIX = /usr%'
+QWT_CONFIG = 's%QWT_INSTALL_PREFIX.*/usr/local/.*%QWT_INSTALL_PREFIX = /usr%'
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDesigner.*$$/\# QWT_CONFIG += QwtDesigner/'
 QWT_CONFIG += -e 's%/features%/mkspecs/features%'
 
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -6,7 +6,7 @@
 
 RINGS_VERSION_MAJOR = 1.3.0
 RINGS_VERSION = $(RINGS_VERSION_MAJOR)-1
-RINGS_SUBDIR  = rings-v_$(subst .,_,$(RINGS_VERSION_MAJOR))
+RINGS_SUBDIR = rings-v_$(subst .,_,$(RINGS_VERSION_MAJOR))
 RINGS_LICENSE = MIT
 
 $(eval $(luarocks-package))
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 RPCBIND_VERSION = 0.2.1
-RPCBIND_SITE    = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
-RPCBIND_SOURCE  = rpcbind-$(RPCBIND_VERSION).tar.bz2
+RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
+RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3c
 RPCBIND_LICENSE_FILES = COPYING
 RPCBIND_AUTORECONF = YES
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 RTAI_VERSION = 3.8.1
-RTAI_SOURCE  = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE    = https://www.rtai.org/userfiles/downloads/RTAI
+RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
+RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
 RTAI_INSTALL_STAGING = YES
 
 # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents
+SAM_BA_SITE = http://www.atmel.com/dyn/resources/prod_documents
 SAM_BA_VERSION = 2.12
-SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
+SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION).zip
 SAM_BA_PATCH = sam-ba_$(SAM_BA_VERSION)_patch5.gz
 SAM_BA_LICENSE = BSD-like (partly binary-only)
 SAM_BA_LICENSE_FILES = doc/readme.txt
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -6,7 +6,7 @@
 
 SG3_UTILS_VERSION = 1.39
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
-SG3_UTILS_SITE  = http://sg.danny.cz/sg/p
+SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-3c
 # utils progs are GPLv2+ licenced
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -7,15 +7,15 @@
 # There's no tarball releases of slirp, so we use the git repo
 # Also, there's no tag, so we use a random SHA1 (master's HEAD
 # of today)
-SLIRP_VERSION         = 8c2da74c1385242f20799fec8c04f8378edc6550
-SLIRP_SITE            = git://anongit.freedesktop.org/spice/slirp
-SLIRP_LICENSE         = BSD-4c BSD-2c
+SLIRP_VERSION = 8c2da74c1385242f20799fec8c04f8378edc6550
+SLIRP_SITE = git://anongit.freedesktop.org/spice/slirp
+SLIRP_LICENSE = BSD-4c BSD-2c
 # Note: The license file 'COPYRIGHT' is missing from the sources,
 # although some files refer to it.
 SLIRP_INSTALL_STAGING = YES
 
 # As we're using the git tree, there's no ./configure,
 # so we need to autoreconf.
-SLIRP_AUTORECONF      = YES
+SLIRP_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-SPICE_PROTOCOL_VERSION         = 0.12.6
-SPICE_PROTOCOL_SOURCE          = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
-SPICE_PROTOCOL_SITE            = http://www.spice-space.org/download/releases
-SPICE_PROTOCOL_LICENSE         = BSD-3c
-SPICE_PROTOCOL_LICENSE_FILES   = COPYING
+SPICE_PROTOCOL_VERSION = 0.12.6
+SPICE_PROTOCOL_SOURCE = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
+SPICE_PROTOCOL_SITE = http://www.spice-space.org/download/releases
+SPICE_PROTOCOL_LICENSE = BSD-3c
+SPICE_PROTOCOL_LICENSE_FILES = COPYING
 SPICE_PROTOCOL_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SPICE_VERSION         = 0.12.4
-SPICE_SOURCE          = spice-$(SPICE_VERSION).tar.bz2
-SPICE_SITE            = http://www.spice-space.org/download/releases
-SPICE_LICENSE         = LGPLv2.1+
-SPICE_LICENSE_FILES   = COPYING
+SPICE_VERSION = 0.12.4
+SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
+SPICE_SITE = http://www.spice-space.org/download/releases
+SPICE_LICENSE = LGPLv2.1+
+SPICE_LICENSE_FILES = COPYING
 SPICE_INSTALL_STAGING = YES
-SPICE_DEPENDENCIES    = \
+SPICE_DEPENDENCIES = \
     alsa-lib \
     celt051 \
     jpeg \
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -14,10 +14,10 @@
 SQUID_AUTORECONF = YES
 SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
-SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
+SQUID_CONF_ENV = ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
 			ac_cv_func_va_copy=yes ac_cv_func___va_copy=yes \
 			ac_cv_func_strnstr=no ac_cv_have_squid=yes
-SQUID_CONF_OPTS =	--enable-async-io=8 --enable-linux-netfilter \
+SQUID_CONF_OPTS = --enable-async-io=8 --enable-linux-netfilter \
 			--enable-removal-policies="lru,heap" \
 			--with-filedescriptors=1024 --disable-ident-lookups \
 			--with-krb5-config=no \
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 SYSVINIT_VERSION = 2.88
-SYSVINIT_SOURCE  = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
-SYSVINIT_PATCH   = sysvinit_$(SYSVINIT_VERSION)dsf-13.1.diff.gz
-SYSVINIT_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
+SYSVINIT_SOURCE = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
+SYSVINIT_PATCH = sysvinit_$(SYSVINIT_VERSION)dsf-13.1.diff.gz
+SYSVINIT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
 SYSVINIT_LICENSE = GPLv2+
 SYSVINIT_LICENSE_FILES = COPYING
 
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-TCLLIB_VERSION       = 1.13
-TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.bz2
-TCLLIB_SITE          = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
-TCLLIB_LICENSE       = tcl license
+TCLLIB_VERSION = 1.13
+TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.bz2
+TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
+TCLLIB_LICENSE = tcl license
 TCLLIB_LICENSE_FILES = license.terms
-TCLLIB_DEPENDENCIES  = host-tcl
-TCLLIB_CONF_ENV      = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)"
+TCLLIB_DEPENDENCIES = host-tcl
+TCLLIB_CONF_ENV = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)"
 
 $(eval $(autotools-package))
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TFTPD_VERSION  = 5.2
-TFTPD_SOURCE   = tftp-hpa-$(TFTPD_VERSION).tar.xz
-TFTPD_SITE     = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
+TFTPD_VERSION = 5.2
+TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
+TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
 TFTPD_CONF_OPTS = --without-tcpwrappers
 
 ifneq ($(BR2_INET_IPV6),y)
diff --git a/package/tstools/tstools.mk b/package/tstools/tstools.mk
--- a/package/tstools/tstools.mk
+++ b/package/tstools/tstools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 TSTOOLS_VERSION = 1_11
-TSTOOLS_SITE    = https://tstools.googlecode.com/files
-TSTOOLS_SOURCE  = tstools-$(TSTOOLS_VERSION).tgz
+TSTOOLS_SITE = https://tstools.googlecode.com/files
+TSTOOLS_SOURCE = tstools-$(TSTOOLS_VERSION).tgz
 TSTOOLS_LICENSE = MPL v1.1
 
 define TSTOOLS_BUILD_CMDS
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -51,7 +51,7 @@
 	              $(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
 	chmod -R go-rwx $(TARGET_DIR)/home/tvheadend
 endef
-TVHEADEND_POST_INSTALL_TARGET_HOOKS  = TVHEADEND_INSTALL_DB
+TVHEADEND_POST_INSTALL_TARGET_HOOKS = TVHEADEND_INSTALL_DB
 
 define TVHEADEND_INSTALL_INIT_SYSV
 	$(INSTALL) -D package/tvheadend/etc.default.tvheadend $(TARGET_DIR)/etc/default/tvheadend
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 UBOOT_TOOLS_VERSION = 2014.07
-UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
-UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
+UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
+UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UDISKS_VERSION = 1.0.4
-UDISKS_SITE    = http://hal.freedesktop.org/releases
+UDISKS_SITE = http://hal.freedesktop.org/releases
 UDISKS_LICENSE = GPLv2+
 UDISKS_LICENSE_FILES = COPYING
 
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-USBREDIR_VERSION         = 0.6
-USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
-USBREDIR_SITE            = http://spice-space.org/download/usbredir
-USBREDIR_LICENSE         = LGPLv2.1+
-USBREDIR_LICENSE_FILES   = COPYING.LIB
+USBREDIR_VERSION = 0.6
+USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.bz2
+USBREDIR_SITE = http://spice-space.org/download/usbredir
+USBREDIR_LICENSE = LGPLv2.1+
+USBREDIR_LICENSE_FILES = COPYING.LIB
 USBREDIR_INSTALL_STAGING = YES
-USBREDIR_DEPENDENCIES    = host-pkgconf libusb
+USBREDIR_DEPENDENCIES = host-pkgconf libusb
 
 ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
 
-USBREDIR_LICENSE         += (for the library), GPLv2+ (for the server)
-USBREDIR_LICENSE_FILES   += COPYING
+USBREDIR_LICENSE += (for the library), GPLv2+ (for the server)
+USBREDIR_LICENSE_FILES += COPYING
 
 else # BR2_PACKAGE_USBREDIR_SERVER != y
 
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 VALGRIND_VERSION = 3.10.0
-VALGRIND_SITE    = http://valgrind.org/downloads
-VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
+VALGRIND_SITE = http://valgrind.org/downloads
+VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 VALGRIND_CONF_OPTS = --disable-tls
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-VDE2_VERSION         = 2.3.2
-VDE2_SOURCE          = vde2-$(VDE2_VERSION).tar.bz2
-VDE2_SITE            = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
-VDE2_LICENSE         = GPLv2+ LGPLv2.1+ BSD-3c
-VDE2_LICENSE_FILES   = COPYING COPYING.libvdeplug COPYING.slirpvde
+VDE2_VERSION = 2.3.2
+VDE2_SOURCE = vde2-$(VDE2_VERSION).tar.bz2
+VDE2_SITE = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
+VDE2_LICENSE = GPLv2+ LGPLv2.1+ BSD-3c
+VDE2_LICENSE_FILES = COPYING COPYING.libvdeplug COPYING.slirpvde
 VDE2_INSTALL_STAGING = YES
 
 # We touch configure.ac, so we need to autoreconf
-VDE2_AUTORECONF      = YES
+VDE2_AUTORECONF = YES
 
 # Reasons for enabling/disabling stuff:
 #?- tuntap is enabled in the hope we're using a recent-enough toolchain
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-VPNC_VERSION       = 0.5.3
-VPNC_SITE          = http://www.unix-ag.uni-kl.de/~massar/vpnc
-VPNC_LICENSE       = GPLv2+
+VPNC_VERSION = 0.5.3
+VPNC_SITE = http://www.unix-ag.uni-kl.de/~massar/vpnc
+VPNC_LICENSE = GPLv2+
 VPNC_LICENSE_FILES = COPYING
 
-VPNC_DEPENDENCIES  = libgcrypt libgpg-error
+VPNC_DEPENDENCIES = libgcrypt libgpg-error
 
-VPNC_LDFLAGS  = $(TARGET_LDFLAGS) -lgcrypt -lgpg-error
+VPNC_LDFLAGS = $(TARGET_LDFLAGS) -lgcrypt -lgpg-error
 VPNC_CPPFLAGS = -DVERSION=\\\"$(VPNC_VERSION)\\\"
 
 define VPNC_BUILD_CMDS
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XINETD_VERSION       = 2.3.15
-XINETD_SITE          = http://www.xinetd.org
-XINETD_LICENSE       = xinetd license
+XINETD_VERSION = 2.3.15
+XINETD_SITE = http://www.xinetd.org
+XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
 XINETD_CFLAGS = $(TARGET_CFLAGS)
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -333,15 +333,15 @@
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
-TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386/
+TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
-TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386/
+TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
-TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386/
+TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
