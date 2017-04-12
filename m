From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:52 +0200
Subject: [Buildroot] [PATCH 18/53] Globally replace $(HOST_DIR)/usr/bin with
	$(HOST_DIR)/bin
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-19-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since things are no longer installed in $(HOST_DIR)/usr, the callers
should also not refer to it.

This is a mechanical change with
git grep -l '$(HOST_DIR)/usr/bin' | xargs sed -i 's%$(HOST_DIR)/usr/bin%$(HOST_DIR)/bin%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                                           |  4 ++--
 boot/grub2/grub2.mk                                |  2 +-
 boot/mxs-bootlets/mxs-bootlets.mk                  |  2 +-
 boot/syslinux/syslinux.mk                          |  4 ++--
 boot/uboot/uboot.mk                                | 10 ++++-----
 fs/axfs/axfs.mk                                    |  2 +-
 fs/cloop/cloop.mk                                  |  4 ++--
 fs/common.mk                                       |  4 ++--
 fs/cramfs/cramfs.mk                                |  2 +-
 fs/iso9660/iso9660.mk                              |  4 ++--
 fs/romfs/romfs.mk                                  |  2 +-
 fs/squashfs/squashfs.mk                            |  2 +-
 fs/yaffs2/yaffs.mk                                 |  2 +-
 linux/linux.mk                                     |  6 ++---
 package/4th/4th.mk                                 |  6 ++---
 package/Makefile.in                                |  8 +++----
 package/am335x-pru-package/am335x-pru-package.mk   |  2 +-
 package/android-tools/android-tools.mk             |  2 +-
 package/autoconf/autoconf.mk                       |  8 +++----
 package/automake/automake.mk                       |  4 ++--
 package/axfsutils/axfsutils.mk                     |  2 +-
 package/b43-firmware/b43-firmware.mk               |  2 +-
 package/b43-fwcutter/b43-fwcutter.mk               |  2 +-
 package/boost/boost.mk                             |  4 ++--
 package/ca-certificates/ca-certificates.mk         |  2 +-
 package/canfestival/canfestival.mk                 |  6 ++---
 package/checkpolicy/checkpolicy.mk                 |  8 +++----
 package/cloop/cloop.mk                             |  6 ++---
 package/cppcms/cppcms.mk                           |  2 +-
 package/cramfs/cramfs.mk                           |  4 ++--
 package/cups/cups.mk                               |  2 +-
 package/dbus-glib/dbus-glib.mk                     |  2 +-
 package/dbus-python/dbus-python.mk                 |  4 ++--
 package/dbus/dbus.mk                               |  2 +-
 package/directfb/directfb.mk                       |  4 ++--
 package/docker-containerd/docker-containerd.mk     |  2 +-
 package/docker-engine/docker-engine.mk             |  2 +-
 package/efl/efl.mk                                 | 16 ++++++-------
 package/elftosb/elftosb.mk                         |  6 ++---
 package/enlightenment/enlightenment.mk             |  6 ++---
 package/erlang-rebar/erlang-rebar.mk               |  2 +-
 package/fakedate/fakedate.mk                       |  4 ++--
 package/flannel/flannel.mk                         |  2 +-
 package/gcc/gcc.mk                                 |  2 +-
 package/gdb/gdb.mk                                 |  4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk                   |  2 +-
 package/gettext/gettext.mk                         |  4 ++--
 package/go/go.mk                                   |  4 ++--
 package/gob2/gob2.mk                               |  2 +-
 package/gtest/gtest.mk                             |  2 +-
 package/guile/guile.mk                             |  2 +-
 package/gvfs/gvfs.mk                               |  2 +-
 package/heimdal/heimdal.mk                         |  4 ++--
 package/i2c-tools/i2c-tools.mk                     |  4 ++--
 package/iw/iw.mk                                   |  2 +-
 package/jsmin/jsmin.mk                             |  2 +-
 package/libglib2/libglib2.mk                       |  6 ++---
 package/libgtk2/libgtk2.mk                         |  6 ++---
 package/libgtk3/libgtk3.mk                         | 18 +++++++--------
 package/libiio/libiio.mk                           |  4 ++--
 package/libtool/libtool.mk                         |  4 ++--
 package/libv4l/libv4l.mk                           |  6 ++---
 package/libxml2/libxml2.mk                         |  2 +-
 package/libxmlrpc/libxmlrpc.mk                     |  2 +-
 package/localedef/localedef.mk                     |  2 +-
 package/lpc3250loader/lpc3250loader.mk             |  2 +-
 package/luainterpreter/luainterpreter.mk           |  2 +-
 package/luarocks/luarocks.mk                       |  2 +-
 package/lzma/lzma.mk                               |  2 +-
 package/lzop/lzop.mk                               |  2 +-
 package/makedevs/makedevs.mk                       |  2 +-
 package/mfgtools/mfgtools.mk                       |  2 +-
 package/mke2img/mke2img.mk                         |  2 +-
 package/mkpasswd/mkpasswd.mk                       |  4 ++--
 package/mkpimage/mkpimage.mk                       |  2 +-
 package/moarvm/moarvm.mk                           |  2 +-
 package/mono-gtksharp3/mono-gtksharp3.mk           |  2 +-
 package/mplayer/mplayer.mk                         |  2 +-
 package/mxsldr/mxsldr.mk                           |  2 +-
 package/ncftp/ncftp.mk                             |  2 +-
 package/ninja/ninja.mk                             |  2 +-
 package/nodejs/nodejs.mk                           | 26 +++++++++++-----------
 package/ola/ola.mk                                 |  4 ++--
 package/omap-u-boot-utils/omap-u-boot-utils.mk     |  2 +-
 package/omniorb/omniorb.mk                         |  6 ++---
 package/opencv3/opencv3.mk                         |  4 ++--
 package/oracle-mysql/oracle-mysql.mk               |  2 +-
 package/php-amqp/php-amqp.mk                       |  4 ++--
 package/php-geoip/php-geoip.mk                     |  4 ++--
 package/php-gnupg/php-gnupg.mk                     |  4 ++--
 package/php-imagick/php-imagick.mk                 |  4 ++--
 package/php-memcached/php-memcached.mk             |  4 ++--
 package/php-ssh2/php-ssh2.mk                       |  4 ++--
 package/php-yaml/php-yaml.mk                       |  4 ++--
 package/php-zmq/php-zmq.mk                         |  4 ++--
 package/pinentry/pinentry.mk                       |  2 +-
 package/pkg-cmake.mk                               |  4 ++--
 package/pkg-perl.mk                                |  2 +-
 package/pkg-python.mk                              |  6 ++---
 package/pkg-waf.mk                                 | 10 ++++-----
 package/pkgconf/pkgconf.mk                         | 10 ++++-----
 package/policycoreutils/policycoreutils.mk         |  8 +++----
 package/protobuf/protobuf.mk                       |  2 +-
 package/pulseaudio/pulseaudio.mk                   |  2 +-
 package/python-gobject/python-gobject.mk           |  4 ++--
 package/python-lxml/python-lxml.mk                 |  4 ++--
 package/python-pypcap/python-pypcap.mk             |  4 ++--
 package/python-pyqt/python-pyqt.mk                 |  4 ++--
 package/python-pyqt5/python-pyqt5.mk               |  4 ++--
 package/python-sip/python-sip.mk                   |  6 ++---
 package/python-web2py/python-web2py.mk             |  2 +-
 package/python/python.mk                           |  6 ++---
 package/python3/python3.mk                         | 16 ++++++-------
 package/qemu/qemu.mk                               |  8 +++----
 package/qpid-proton/qpid-proton.mk                 |  2 +-
 package/qt/qt.mk                                   | 14 ++++++------
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt53d/qt53d.mk                         |  2 +-
 package/qt5/qt5canvas3d/qt5canvas3d.mk             |  2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |  2 +-
 package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
 package/qt5/qt5enginio/qt5enginio.mk               |  2 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |  2 +-
 package/qt5/qt5location/qt5location.mk             |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |  2 +-
 package/qt5/qt5script/qt5script.mk                 |  2 +-
 package/qt5/qt5sensors/qt5sensors.mk               |  2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk           |  2 +-
 package/qt5/qt5serialport/qt5serialport.mk         |  2 +-
 package/qt5/qt5svg/qt5svg.mk                       |  2 +-
 package/qt5/qt5tools/qt5tools.mk                   |  2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |  2 +-
 package/qt5/qt5webkit/qt5webkit.mk                 |  4 ++--
 package/qt5/qt5websockets/qt5websockets.mk         |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  2 +-
 package/qt5cinex/qt5cinex.mk                       |  2 +-
 package/runc/runc.mk                               |  2 +-
 package/s6-rc/s6-rc.mk                             |  2 +-
 package/sam-ba/sam-ba.mk                           |  4 ++--
 package/scons/scons.mk                             |  2 +-
 package/setools/setools.mk                         |  2 +-
 package/shared-mime-info/shared-mime-info.mk       |  4 ++--
 package/socat/socat.mk                             |  2 +-
 package/softether/softether.mk                     |  2 +-
 package/sqlcipher/sqlcipher.mk                     |  2 +-
 package/squashfs/squashfs.mk                       |  2 +-
 package/sunxi-tools/sunxi-tools.mk                 |  2 +-
 package/swig/swig.mk                               |  8 +++----
 package/systemd/systemd.mk                         |  2 +-
 package/tcllib/tcllib.mk                           |  2 +-
 package/terminology/terminology.mk                 |  2 +-
 package/thrift/thrift.mk                           |  4 ++--
 package/tvheadend/tvheadend.mk                     |  4 ++--
 package/uboot-tools/uboot-tools.mk                 |  8 +++----
 package/uclibc/uclibc.mk                           |  8 +++----
 package/upx/upx.mk                                 |  2 +-
 package/vala/vala.mk                               |  8 +++----
 package/vlc/vlc.mk                                 |  6 ++---
 package/waf/waf.mk                                 |  2 +-
 package/wireshark/wireshark.mk                     |  6 ++---
 package/x11r7/libxcb/libxcb.mk                     |  4 ++--
 .../xfont_font-adobe-100dpi.mk                     |  4 ++--
 .../xfont_font-adobe-75dpi.mk                      |  4 ++--
 .../xfont_font-adobe-utopia-100dpi.mk              |  4 ++--
 .../xfont_font-adobe-utopia-75dpi.mk               |  4 ++--
 .../xfont_font-adobe-utopia-type1.mk               |  4 ++--
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |  4 ++--
 .../xfont_font-arabic-misc.mk                      |  4 ++--
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |  4 ++--
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |  4 ++--
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |  4 ++--
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |  4 ++--
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |  4 ++--
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |  4 ++--
 .../xfont_font-bitstream-100dpi.mk                 |  4 ++--
 .../xfont_font-bitstream-75dpi.mk                  |  4 ++--
 .../xfont_font-bitstream-type1.mk                  |  4 ++--
 .../xfont_font-cronyx-cyrillic.mk                  |  4 ++--
 .../xfont_font-cursor-misc.mk                      |  4 ++--
 .../xfont_font-daewoo-misc.mk                      |  4 ++--
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |  4 ++--
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |  4 ++--
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |  4 ++--
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |  4 ++--
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |  4 ++--
 .../xfont_font-misc-cyrillic.mk                    |  4 ++--
 .../xfont_font-misc-ethiopic.mk                    |  4 ++--
 .../xfont_font-misc-meltho.mk                      |  4 ++--
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |  4 ++--
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |  4 ++--
 .../xfont_font-schumacher-misc.mk                  |  4 ++--
 .../xfont_font-screen-cyrillic.mk                  |  4 ++--
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |  4 ++--
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |  4 ++--
 .../xfont_font-winitzki-cyrillic.mk                |  4 ++--
 .../xfont_font-xfree86-type1.mk                    |  4 ++--
 package/x264/x264.mk                               |  2 +-
 package/xen/xen.mk                                 |  2 +-
 package/yaffs2utils/yaffs2utils.mk                 |  2 +-
 package/zynq-boot-bin/zynq-boot-bin.mk             |  2 +-
 support/dependencies/check-host-cmake.mk           |  2 +-
 support/dependencies/check-host-lzip.mk            |  2 +-
 support/dependencies/check-host-tar.mk             |  2 +-
 support/dependencies/check-host-xzcat.mk           |  2 +-
 .../toolchain-external/pkg-toolchain-external.mk   |  8 +++----
 toolchain/toolchain-wrapper.c                      |  4 ++--
 toolchain/toolchain-wrapper.mk                     |  2 +-
 211 files changed, 400 insertions(+), 400 deletions(-)

diff --git a/Makefile b/Makefile
index 565385ec48..fb1883f604 100644
--- a/Makefile
+++ b/Makefile
@@ -446,7 +446,7 @@ BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 ifeq ($(BR2_CCACHE),y)
-CCACHE := $(HOST_DIR)/usr/bin/ccache
+CCACHE := $(HOST_DIR)/bin/ccache
 BR_CACHE_DIR ?= $(call qstrip,$(BR2_CCACHE_DIR))
 export BR_CACHE_DIR
 HOSTCC := $(CCACHE) $(HOSTCC)
@@ -609,7 +609,7 @@ define GENERATE_GLIBC_LOCALES
 		fi ; \
 		echo "Generating locale $${inputfile}.$${charmap}" ; \
 		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
-		$(HOST_DIR)/usr/bin/localedef \
+		$(HOST_DIR)/bin/localedef \
 			--prefix=$(TARGET_DIR) \
 			--$(call LOWERCASE,$(BR2_ENDIAN))-endian \
 			-i $${inputfile} -f $${charmap} \
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index dc019835ab..698cb19980 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -86,7 +86,7 @@ endif
 
 define GRUB2_IMAGE_INSTALLATION
 	mkdir -p $(dir $(GRUB2_IMAGE))
-	$(HOST_DIR)/usr/bin/grub-mkimage \
+	$(HOST_DIR)/bin/grub-mkimage \
 		-d $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE) \
 		-O $(GRUB2_TUPLE) \
 		-o $(GRUB2_IMAGE) \
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 1955a37cdf..b7f3c44c98 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -93,7 +93,7 @@ define MXS_BOOTLETS_BUILD_CMDS
 	$(MXS_BOOTLETS_SED_BAREBOX)
 	$(MXS_BOOTLETS_SED_LINUX)
 	$(MXS_BOOTLETS_SED_UBOOT)
-	$(HOST_DIR)/usr/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
+	$(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
 		-z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
 		-o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM)
 endef
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 2b3b9a75f4..9feb48a666 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -54,7 +54,7 @@ define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		CC="$(TARGET_CC)" \
 		LD="$(TARGET_LD)" \
-		NASM="$(HOST_DIR)/usr/bin/nasm" \
+		NASM="$(HOST_DIR)/bin/nasm" \
 		CC_FOR_BUILD="$(HOSTCC)" \
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
@@ -77,7 +77,7 @@ endef
 # However, buildroot makes no usage of it, so better delete it than have it
 # installed at the wrong place
 define SYSLINUX_POST_INSTALL_CLEANUP
-	rm -rf $(HOST_DIR)/usr/bin/syslinux
+	rm -rf $(HOST_DIR)/bin/syslinux
 endef
 SYSLINUX_POST_INSTALL_TARGET_HOOKS += SYSLINUX_POST_INSTALL_CLEANUP
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 91f8ec4e72..2f4f89868d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -214,7 +214,7 @@ define UBOOT_BUILD_CMDS
 endef
 
 define UBOOT_BUILD_OMAP_IFT
-	$(HOST_DIR)/usr/bin/gpsign -f $(@D)/u-boot.bin \
+	$(HOST_DIR)/bin/gpsign -f $(@D)/u-boot.bin \
 		-c $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))
 endef
 
@@ -231,7 +231,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
 		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
-			$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
+			$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 			$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
 			$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
 			-o $(BINARIES_DIR)/uboot-env.bin -)
@@ -257,8 +257,8 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
 define UBOOT_GENERATE_ZYNQ_IMAGE
-	$(HOST_DIR)/usr/bin/python2 \
-		$(HOST_DIR)/usr/bin/zynq-boot-bin.py \
+	$(HOST_DIR)/bin/python2 \
+		$(HOST_DIR)/bin/zynq-boot-bin.py \
 		-u $(@D)/$(firstword $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))) \
 		-o $(BINARIES_DIR)/BOOT.BIN
 endef
@@ -276,7 +276,7 @@ UBOOT_CRC_ALTERA_SOCFPGA_HEADER_VERSION = 1
 endif
 define UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
 	$(foreach f,$(UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES), \
-		$(HOST_DIR)/usr/bin/mkpimage \
+		$(HOST_DIR)/bin/mkpimage \
 			-v $(UBOOT_CRC_ALTERA_SOCFPGA_HEADER_VERSION) \
 			-o $(BINARIES_DIR)/$(notdir $(call qstrip,$(f))).crc \
 			$(@D)/$(call qstrip,$(f))
diff --git a/fs/axfs/axfs.mk b/fs/axfs/axfs.mk
index 05d6e5d395..6c795d7062 100644
--- a/fs/axfs/axfs.mk
+++ b/fs/axfs/axfs.mk
@@ -7,7 +7,7 @@
 ROOTFS_AXFS_DEPENDENCIES = host-axfsutils
 
 define ROOTFS_AXFS_CMD
-	$(HOST_DIR)/usr/bin/mkfs.axfs -s -a $(TARGET_DIR) $@
+	$(HOST_DIR)/bin/mkfs.axfs -s -a $(TARGET_DIR) $@
 endef
 
 $(eval $(call ROOTFS_TARGET,axfs))
diff --git a/fs/cloop/cloop.mk b/fs/cloop/cloop.mk
index 9e42a3a27f..cbfc79b0d1 100644
--- a/fs/cloop/cloop.mk
+++ b/fs/cloop/cloop.mk
@@ -7,8 +7,8 @@
 ROOTFS_CLOOP_DEPENDENCIES = host-cloop host-cdrkit
 
 define ROOTFS_CLOOP_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | \
-		$(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $@
+	$(HOST_DIR)/bin/genisoimage -r $(TARGET_DIR) | \
+		$(HOST_DIR)/bin/create_compressed_fs - 65536 > $@
 endef
 
 $(eval $(call ROOTFS_TARGET,cloop))
diff --git a/fs/common.mk b/fs/common.mk
index 396b1c2bdf..14e0a6b868 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -91,7 +91,7 @@ ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 endif
 endif
 	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(FULL_DEVICE_TABLE)
-	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	echo "$$(HOST_DIR)/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
 		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
@@ -100,7 +100,7 @@ ifeq ($$(BR2_REPRODUCIBLE),y)
 endif
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 747237290f..85b98b8ccd 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -11,7 +11,7 @@ CRAMFS_OPTS = -l
 endif
 
 define ROOTFS_CRAMFS_CMD
-	$(HOST_DIR)/usr/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $@
+	$(HOST_DIR)/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $@
 endef
 
 ROOTFS_CRAMFS_DEPENDENCIES = host-cramfs
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index d1d9cbf1a4..fec6fe17c2 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -144,14 +144,14 @@ endif # ROOTFS_ISO9660_USE_INITRD
 
 
 define ROOTFS_ISO9660_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
+	$(HOST_DIR)/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
 		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
 define ROOTFS_ISO9660_GEN_HYBRID
-	$(HOST_DIR)/usr/bin/isohybrid -t 0x96 $@
+	$(HOST_DIR)/bin/isohybrid -t 0x96 $@
 endef
 
 ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
index 2738b6b292..eded91df0a 100644
--- a/fs/romfs/romfs.mk
+++ b/fs/romfs/romfs.mk
@@ -7,7 +7,7 @@
 ROOTFS_ROMFS_DEPENDENCIES = host-genromfs
 
 define ROOTFS_ROMFS_CMD
-	$(HOST_DIR)/usr/bin/genromfs -d $(TARGET_DIR) -f $@
+	$(HOST_DIR)/bin/genromfs -d $(TARGET_DIR) -f $@
 endef
 
 $(eval $(call ROOTFS_TARGET,romfs))
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index c4d9ca50b3..68a57b074a 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -25,7 +25,7 @@ endif
 endif
 
 define ROOTFS_SQUASHFS_CMD
-	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
+	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
 		$(ROOTFS_SQUASHFS_ARGS)
 endef
 
diff --git a/fs/yaffs2/yaffs.mk b/fs/yaffs2/yaffs.mk
index 19bdbe842e..30570735fa 100644
--- a/fs/yaffs2/yaffs.mk
+++ b/fs/yaffs2/yaffs.mk
@@ -7,7 +7,7 @@
 ROOTFS_YAFFS2_DEPENDENCIES = host-yaffs2utils
 
 define ROOTFS_YAFFS2_CMD
-	$(HOST_DIR)/usr/bin/mkyaffs2 --all-root $(TARGET_DIR) $@
+	$(HOST_DIR)/bin/mkyaffs2 --all-root $(TARGET_DIR) $@
 endef
 
 $(eval $(call ROOTFS_TARGET,yaffs2))
diff --git a/linux/linux.mk b/linux/linux.mk
index 7973677d05..f4a77a8a9f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -381,9 +381,9 @@ endif
 define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
 	if grep -q "CONFIG_DTC=y" $(@D)/.config; then	\
-		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/linux-dtc ;	\
-		if [ ! -e $(HOST_DIR)/usr/bin/dtc ]; then	\
-			ln -sf linux-dtc $(HOST_DIR)/usr/bin/dtc ;	\
+		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/bin/linux-dtc ;	\
+		if [ ! -e $(HOST_DIR)/bin/dtc ]; then	\
+			ln -sf linux-dtc $(HOST_DIR)/bin/dtc ;	\
 		fi	\
 	fi
 endef
diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index d7daeb3b32..7076519d16 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -27,7 +27,7 @@ define 4TH_BUILD_CMDS
 	$(4TH_MAKE_ENV) $(MAKE) -C $(@D)/sources all \
 		CROSS="$(TARGET_CROSS)" \
 		CFLAGS="$(4TH_CFLAGS)" \
-		FOURTH=$(HOST_DIR)/usr/bin/4th
+		FOURTH=$(HOST_DIR)/bin/4th
 endef
 
 define 4TH_INSTALL_STAGING_CMDS
@@ -59,10 +59,10 @@ define HOST_4TH_BUILD_CMDS
 endef
 
 define HOST_4TH_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/usr/bin
+	mkdir -p $(HOST_DIR)/bin
 	mkdir -p $(HOST_DIR)/usr/lib
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/sources mostlyinstall \
-		BINARIES=$(HOST_DIR)/usr/bin \
+		BINARIES=$(HOST_DIR)/bin \
 		LIBRARIES=$(HOST_DIR)/usr/lib
 endef
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 579e40b1ba..e287af03df 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -182,9 +182,9 @@ TARGET_FCFLAGS += -fstack-protector-all
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_CROSS = $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
+TARGET_CROSS = $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-
 else
-TARGET_CROSS = $(HOST_DIR)/usr/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+TARGET_CROSS = $(HOST_DIR)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 endif
 
 # Define TARGET_xx variables for all common binutils/gcc
@@ -215,7 +215,7 @@ FLEX := $(shell which flex || type -p flex)
 BISON := $(shell which bison || type -p bison)
 UNZIP := $(shell which unzip || type -p unzip) -q
 
-APPLY_PATCHES = PATH=$(HOST_DIR)/usr/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
+APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
@@ -225,7 +225,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 
 # host-intltool should be executed with the system perl, so we save
 # the path to the system perl, before a host-perl built by Buildroot
-# might get installed into $(HOST_DIR)/usr/bin and therefore appears
+# might get installed into $(HOST_DIR)/bin and therefore appears
 # in our PATH. This system perl will be used as INTLTOOL_PERL.
 export PERL=$(shell which perl)
 
diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index a2465b1155..b2e89d3710 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -67,7 +67,7 @@ define HOST_AM335X_PRU_PACKAGE_BUILD_CMDS
 endef
 
 define HOST_AM335X_PRU_PACKAGE_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/pru_sw/utils/pasm $(HOST_DIR)/usr/bin/pasm
+	$(INSTALL) -m 0755 -D $(@D)/pru_sw/utils/pasm $(HOST_DIR)/bin/pasm
 endef
 
 $(eval $(generic-package))
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 45103923eb..f6c6913a68 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -73,7 +73,7 @@ endef
 
 define HOST_ANDROID_TOOLS_INSTALL_CMDS
 	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
-		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(HOST_DIR)/usr/bin/$(t)$(sep))
+		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(HOST_DIR)/bin/$(t)$(sep))
 endef
 
 define ANDROID_TOOLS_INSTALL_TARGET_CMDS
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 904fadab74..e5f474c72d 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -13,7 +13,7 @@ AUTOCONF_LICENSE_FILES = COPYINGv3 COPYING.EXCEPTION
 
 HOST_AUTOCONF_CONF_ENV = \
 	EMACS="no" \
-	ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
+	ac_cv_path_M4=$(HOST_DIR)/bin/m4 \
 	ac_cv_prog_gnu_m4_gnu=no
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
@@ -21,6 +21,6 @@ HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 $(eval $(host-autotools-package))
 
 # variables used by other packages
-AUTOCONF = $(HOST_DIR)/usr/bin/autoconf
-AUTOHEADER = $(HOST_DIR)/usr/bin/autoheader
-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
+AUTOCONF = $(HOST_DIR)/bin/autoconf
+AUTOHEADER = $(HOST_DIR)/bin/autoheader
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index e62038cfc2..13041213bb 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -30,6 +30,6 @@ HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL
 $(eval $(host-autotools-package))
 
 # variables used by other packages
-AUTOMAKE = $(HOST_DIR)/usr/bin/automake
+AUTOMAKE = $(HOST_DIR)/bin/automake
 ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
-ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
+ACLOCAL = $(HOST_DIR)/bin/aclocal -I $(ACLOCAL_DIR)
diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
index e1f7427206..00d3a3a8b0 100644
--- a/package/axfsutils/axfsutils.mk
+++ b/package/axfsutils/axfsutils.mk
@@ -18,7 +18,7 @@ endef
 
 define HOST_AXFSUTILS_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/mkfs.axfs-legacy/mkfs.axfs \
-		$(HOST_DIR)/usr/bin/mkfs.axfs
+		$(HOST_DIR)/bin/mkfs.axfs
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/b43-firmware/b43-firmware.mk b/package/b43-firmware/b43-firmware.mk
index 601ab6661c..8e9e877692 100644
--- a/package/b43-firmware/b43-firmware.mk
+++ b/package/b43-firmware/b43-firmware.mk
@@ -23,7 +23,7 @@ B43_FIRMWARE_DEPENDENCIES = host-b43-fwcutter
 
 define B43_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/
-	$(HOST_DIR)/usr/bin/b43-fwcutter -w $(TARGET_DIR)/lib/firmware/ $(@D)/$(B43_FIRMWARE_DRIVER_FILE)
+	$(HOST_DIR)/bin/b43-fwcutter -w $(TARGET_DIR)/lib/firmware/ $(@D)/$(B43_FIRMWARE_DRIVER_FILE)
 endef
 
 $(eval $(generic-package))
diff --git a/package/b43-fwcutter/b43-fwcutter.mk b/package/b43-fwcutter/b43-fwcutter.mk
index 2d024f6384..91ba3dc758 100644
--- a/package/b43-fwcutter/b43-fwcutter.mk
+++ b/package/b43-fwcutter/b43-fwcutter.mk
@@ -15,7 +15,7 @@ define HOST_B43_FWCUTTER_BUILD_CMDS
 endef
 
 define HOST_B43_FWCUTTER_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/b43-fwcutter $(HOST_DIR)/usr/bin/b43-fwcutter
+	$(INSTALL) -D -m 0755 $(@D)/b43-fwcutter $(HOST_DIR)/bin/b43-fwcutter
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 3600cdea84..035fa029b6 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -65,11 +65,11 @@ endif
 ifeq ($(BR2_PACKAGE_BOOST_PYTHON),y)
 BOOST_FLAGS += --with-python-root=$(HOST_DIR)
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-BOOST_FLAGS += --with-python=$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)
+BOOST_FLAGS += --with-python=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
 BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m
 BOOST_DEPENDENCIES += python3
 else
-BOOST_FLAGS += --with-python=$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)
+BOOST_FLAGS += --with-python=$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR)
 BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 BOOST_DEPENDENCIES += python
 endif
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 199c6b684e..f712e7988e 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -37,7 +37,7 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	done
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/usr/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
 endef
 
 $(eval $(generic-package))
diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
index 4a44470b73..760f14aecd 100644
--- a/package/canfestival/canfestival.mk
+++ b/package/canfestival/canfestival.mk
@@ -37,13 +37,13 @@ endef
 
 define CANFESTIVAL_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) all \
-		PYTHON=$(HOST_DIR)/usr/bin/python2
+		PYTHON=$(HOST_DIR)/bin/python2
 endef
 
 define CANFESTIVAL_INSTALL_TARGET_CMDS
 	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
 		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
-			PYTHON=$(HOST_DIR)/usr/bin/python2 \
+			PYTHON=$(HOST_DIR)/bin/python2 \
 			DESTDIR=$(TARGET_DIR) || exit 1 ; \
 	done
 endef
@@ -51,7 +51,7 @@ endef
 define CANFESTIVAL_INSTALL_STAGING_CMDS
 	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
 		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
-			PYTHON=$(HOST_DIR)/usr/bin/python2 \
+			PYTHON=$(HOST_DIR)/bin/python2 \
 			DESTDIR=$(STAGING_DIR) || exit 1 ; \
 	done
 endef
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 7b98b743b1..d80bb792b4 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -12,8 +12,8 @@ CHECKPOLICY_LICENSE_FILES = COPYING
 CHECKPOLICY_DEPENDENCIES = libselinux flex host-flex host-bison
 
 TARGET_CHECKPOLICY_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
-	LEX="$(HOST_DIR)/usr/bin/flex" \
-	YACC="$(HOST_DIR)/usr/bin/bison -y"
+	LEX="$(HOST_DIR)/bin/flex" \
+	YACC="$(HOST_DIR)/bin/bison -y"
 
 # DESTDIR is used at build time to find libselinux
 define CHECKPOLICY_BUILD_CMDS
@@ -32,8 +32,8 @@ endef
 HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
 
 HOST_CHECKPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
-	LEX="$(HOST_DIR)/usr/bin/flex" \
-	YACC="$(HOST_DIR)/usr/bin/bison -y"
+	LEX="$(HOST_DIR)/bin/flex" \
+	YACC="$(HOST_DIR)/bin/bison -y"
 
 # DESTDIR is used at build time to find host-libselinux
 define HOST_CHECKPOLICY_BUILD_CMDS
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 6a6e790b22..ad50d0a94a 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -17,9 +17,9 @@ define HOST_CLOOP_BUILD_CMDS
 endef
 
 define HOST_CLOOP_INSTALL_CMDS
-	$(INSTALL) -m 0755 -d $(HOST_DIR)/usr/bin
-	$(INSTALL) -m 755 $(@D)/create_compressed_fs $(HOST_DIR)/usr/bin
-	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 0755 -d $(HOST_DIR)/bin
+	$(INSTALL) -m 755 $(@D)/create_compressed_fs $(HOST_DIR)/bin
+	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/bin
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 1f6c09dfa9..2632345aaf 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -27,7 +27,7 @@ endif
 # needed for compiling packages using cppcms. And it is not worth
 # creating a host package just for a python script.
 define CPPCMS_INSTALL_HOST_TOOLS
-	cp $(STAGING_DIR)/usr/bin/cppcms_tmpl_cc $(HOST_DIR)/usr/bin/cppcms_tmpl_cc
+	cp $(STAGING_DIR)/usr/bin/cppcms_tmpl_cc $(HOST_DIR)/bin/cppcms_tmpl_cc
 endef
 CPPCMS_POST_INSTALL_STAGING_HOOKS += CPPCMS_INSTALL_HOST_TOOLS
 
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 2391b24a12..70010e8e2f 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -26,8 +26,8 @@ define HOST_CRAMFS_BUILD_CMDS
 endef
 
 define HOST_CRAMFS_INSTALL_CMDS
-	$(INSTALL) -D -m 755 $(@D)/mkcramfs $(HOST_DIR)/usr/bin/mkcramfs
-	$(INSTALL) -D -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin/cramfsck
+	$(INSTALL) -D -m 755 $(@D)/mkcramfs $(HOST_DIR)/bin/mkcramfs
+	$(INSTALL) -D -m 755 $(@D)/cramfsck $(HOST_DIR)/bin/cramfsck
 endef
 
 $(eval $(generic-package))
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 292d87e11d..6e95a436b0 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -15,7 +15,7 @@ CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
 
 # Using autoconf, not autoheader, so we cannot use AUTORECONF = YES.
 define CUPS_RUN_AUTOCONF
-	cd $(@D); $(HOST_DIR)/usr/bin/autoconf -f
+	cd $(@D); $(HOST_DIR)/bin/autoconf -f
 endef
 CUPS_PRE_CONFIGURE_HOOKS += CUPS_RUN_AUTOCONF
 
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 22dcdb15fe..2257c8e4f9 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -39,4 +39,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # dbus-glib for the host
-DBUS_GLIB_HOST_BINARY = $(HOST_DIR)/usr/bin/dbus-binding-tool
+DBUS_GLIB_HOST_BINARY = $(HOST_DIR)/bin/dbus-binding-tool
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 599d019857..da04b7404f 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -16,14 +16,14 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 DBUS_PYTHON_DEPENDENCIES += python host-python
 
 DBUS_PYTHON_CONF_ENV += \
-	PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	PYTHON=$(HOST_DIR)/bin/python2 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`"
 else
 DBUS_PYTHON_DEPENDENCIES += python3 host-python3
 
 DBUS_PYTHON_CONF_ENV += \
-	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
 endif
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 52c1912e07..b5a2f466c4 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -121,7 +121,7 @@ HOST_DBUS_CONF_OPTS = \
 DBUS_HOST_INTROSPECT = $(HOST_DBUS_DIR)/introspect.xml
 
 HOST_DBUS_GEN_INTROSPECT = \
-	$(HOST_DIR)/usr/bin/dbus-daemon --introspect > $(DBUS_HOST_INTROSPECT)
+	$(HOST_DIR)/bin/dbus-daemon --introspect > $(DBUS_HOST_INTROSPECT)
 
 HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
 
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index a27d6a736b..5723151b14 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -164,10 +164,10 @@ HOST_DIRECTFB_BUILD_CMDS = \
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools directfb-csource
 
 HOST_DIRECTFB_INSTALL_CMDS = \
-	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/usr/bin
+	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/bin
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # directfb-csource for the host
-DIRECTFB_HOST_BINARY = $(HOST_DIR)/usr/bin/directfb-csource
+DIRECTFB_HOST_BINARY = $(HOST_DIR)/bin/directfb-csource
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index c0b0012854..e89d9fede4 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -33,7 +33,7 @@ endef
 
 define DOCKER_CONTAINERD_BUILD_CMDS
 	$(foreach d,ctr containerd containerd-shim,\
-		cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build \
+		cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/bin/go build \
 			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./$(d)$(sep))
 endef
 
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 5101702045..49970120a4 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -101,7 +101,7 @@ endif
 define DOCKER_ENGINE_BUILD_CMDS
 	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
 		cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) \
-		$(HOST_DIR)/usr/bin/go build -v \
+		$(HOST_DIR)/bin/go build -v \
 			-o $(@D)/bin/$(target) \
 			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
 			-ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 364400035b..466ea3d9f1 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -31,13 +31,13 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 # --enable-liblz4: use liblz4 from lz4 package.
 # --with-doxygen: disable doxygen documentation
 EFL_CONF_OPTS = \
-	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
-	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
-	--with-elementary-codegen=$(HOST_DIR)/usr/bin/elementary_codegen \
-	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
-	--with-elua=$(HOST_DIR)/usr/bin/elua \
-	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
+	--with-edje-cc=$(HOST_DIR)/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/bin/eet \
+	--with-eldbus_codegen=$(HOST_DIR)/bin/eldbus-codegen \
+	--with-elementary-codegen=$(HOST_DIR)/bin/elementary_codegen \
+	--with-elm-prefs-cc=$(HOST_DIR)/bin/elm_prefs_cc \
+	--with-elua=$(HOST_DIR)/bin/elua \
+	--with-eolian-gen=$(HOST_DIR)/bin/eolian_gen \
 	--disable-image-loader-jp2k \
 	--disable-lua-old \
 	--disable-poppler \
@@ -55,7 +55,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
 EFL_CONF_OPTS += --enable-cxx-bindings \
-	--with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx
+	--with-eolian-cxx=$(HOST_DIR)/bin/eolian_cxx
 else
 EFL_CONF_OPTS += --disable-cxx-bindings
 endif
diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index a24e5159fd..44eb98c8ad 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -14,9 +14,9 @@ define HOST_ELFTOSB_BUILD_CMDS
 endef
 
 define HOST_ELFTOSB_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bld/linux/elftosb $(HOST_DIR)/usr/bin/elftosb
-	$(INSTALL) -D -m 0755 $(@D)/bld/linux/keygen $(HOST_DIR)/usr/bin/keygen
-	$(INSTALL) -D -m 0755 $(@D)/bld/linux/sbtool $(HOST_DIR)/usr/bin/sbtool
+	$(INSTALL) -D -m 0755 $(@D)/bld/linux/elftosb $(HOST_DIR)/bin/elftosb
+	$(INSTALL) -D -m 0755 $(@D)/bld/linux/keygen $(HOST_DIR)/bin/keygen
+	$(INSTALL) -D -m 0755 $(@D)/bld/linux/sbtool $(HOST_DIR)/bin/sbtool
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 7bfc25b3a2..6a08ca4097 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -17,9 +17,9 @@ ENLIGHTENMENT_DEPENDENCIES = \
 	xcb-util-keysyms
 
 ENLIGHTENMENT_CONF_OPTS = \
-	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
-	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
+	--with-edje-cc=$(HOST_DIR)/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/bin/eet \
+	--with-eldbus_codegen=$(HOST_DIR)/bin/eldbus-codegen \
 	--disable-pam \
 	--disable-rpath
 
diff --git a/package/erlang-rebar/erlang-rebar.mk b/package/erlang-rebar/erlang-rebar.mk
index 031ff47460..ce082dc639 100644
--- a/package/erlang-rebar/erlang-rebar.mk
+++ b/package/erlang-rebar/erlang-rebar.mk
@@ -25,7 +25,7 @@ define HOST_ERLANG_REBAR_BUILD_CMDS
 endef
 
 define HOST_ERLANG_REBAR_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/rebar $(HOST_DIR)/usr/bin/rebar
+	$(INSTALL) -m 0755 -D $(@D)/rebar $(HOST_DIR)/bin/rebar
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/fakedate/fakedate.mk b/package/fakedate/fakedate.mk
index f47a5ee38c..bba81f928b 100644
--- a/package/fakedate/fakedate.mk
+++ b/package/fakedate/fakedate.mk
@@ -8,8 +8,8 @@
 HOST_FAKEDATE_LICENSE = GPL-2.0+
 
 define HOST_FAKEDATE_INSTALL_CMDS
-	$(INSTALL) -D -m 755 package/fakedate/fakedate $(HOST_DIR)/usr/bin/fakedate
-	ln -sfn fakedate $(HOST_DIR)/usr/bin/date
+	$(INSTALL) -D -m 755 package/fakedate/fakedate $(HOST_DIR)/bin/fakedate
+	ln -sfn fakedate $(HOST_DIR)/bin/date
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 8393c5992a..bbb2c72a72 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -33,7 +33,7 @@ define FLANNEL_CONFIGURE_CMDS
 endef
 
 define FLANNEL_BUILD_CMDS
-	cd $(@D) && $(FLANNEL_MAKE_ENV) $(HOST_DIR)/usr/bin/go \
+	cd $(@D) && $(FLANNEL_MAKE_ENV) $(HOST_DIR)/bin/go \
 		build -v -o $(@D)/bin/flanneld -ldflags "$(FLANNEL_GLDFLAGS)" .
 endef
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b52f9456b3..bdeb956972 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -333,7 +333,7 @@ endif # BR2_CCACHE
 # Avoid that a .br_real is symlinked a second time.
 # Also create <arch>-linux-<tool> symlinks.
 define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
-	$(Q)cd $(HOST_DIR)/usr/bin; \
+	$(Q)cd $(HOST_DIR)/bin; \
 	for i in $(GNU_TARGET_NAME)-*; do \
 		case "$$i" in \
 		*.br_real) \
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9a97cb77a7..9b4d50e9d8 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -210,7 +210,7 @@ HOST_GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
-HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/usr/bin/python2
+HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python2
 HOST_GDB_DEPENDENCIES += host-python
 else
 HOST_GDB_CONF_OPTS += --without-python
@@ -232,7 +232,7 @@ endif
 
 # legacy $arch-linux-gdb symlink
 define HOST_GDB_ADD_SYMLINK
-	cd $(HOST_DIR)/usr/bin && \
+	cd $(HOST_DIR)/bin && \
 		ln -snf $(GNU_TARGET_NAME)-gdb $(ARCH)-linux-gdb
 endef
 
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index a060f82222..688688316b 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -59,7 +59,7 @@ endif
 ifeq ($(BR2_STATIC_LIBS),)
 define GDK_PIXBUF_UPDATE_CACHE
 	GDK_PIXBUF_MODULEDIR=$(HOST_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders \
-		$(HOST_DIR)/usr/bin/gdk-pixbuf-query-loaders \
+		$(HOST_DIR)/bin/gdk-pixbuf-query-loaders \
 		> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 	$(SED) "s,$(HOST_DIR),,g" \
 		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index b6663a6f21..c2971a70d9 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -71,7 +71,7 @@ endif
 
 # Disable interactive confirmation in host gettextize for package fixups
 define HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
-	$(SED) '/read dummy/d' $(HOST_DIR)/usr/bin/gettextize
+	$(SED) '/read dummy/d' $(HOST_DIR)/bin/gettextize
 endef
 HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
 
@@ -85,7 +85,7 @@ endef
 
 HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_ADD_ABOUT_NLS
 
-GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/usr/bin/autom4te $(HOST_DIR)/usr/bin/gettextize -f
+GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/go/go.mk b/package/go/go.mk
index a461342581..0bbf9430b0 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -99,8 +99,8 @@ define HOST_GO_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(HOST_GO_TMP)/bin/go $(HOST_GO_ROOT)/bin/go
 	$(INSTALL) -D -m 0755 $(HOST_GO_TMP)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
 
-	ln -sf ../lib/go/bin/go $(HOST_DIR)/usr/bin/
-	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/usr/bin/
+	ln -sf ../lib/go/bin/go $(HOST_DIR)/bin/
+	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/bin/
 
 	cp -a $(@D)/lib $(HOST_GO_ROOT)/
 
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 04d02e115c..fe60673821 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -12,4 +12,4 @@ HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
 $(eval $(host-autotools-package))
 
 # gob2 for the host
-GOB2_HOST_BINARY = $(HOST_DIR)/usr/bin/gob2
+GOB2_HOST_BINARY = $(HOST_DIR)/bin/gob2
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 9e6914109a..c82287e501 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -77,7 +77,7 @@ endif
 
 define HOST_GTEST_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
-		$(HOST_DIR)/usr/bin/gmock_gen
+		$(HOST_DIR)/bin/gmock_gen
 	cp -rp $(@D)/googlemock/scripts/generator/cpp \
 		$(HOST_GTEST_GMOCK_PYTHONPATH)
 endef
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 2ccd8e63b5..dfecb10c39 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -47,7 +47,7 @@ else
 GUILE_CONF_OPTS += --without-libreadline-prefix
 endif
 
-GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
+GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/bin/guile \
 	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
 
 GUILE_CONF_OPTS += \
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index d6211fdc6d..4be655429b 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -128,7 +128,7 @@ define GVFS_REMOVE_TARGET_SCHEMAS
 endef
 
 define GVFS_COMPILE_SCHEMAS
-	$(HOST_DIR)/usr/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
+	$(HOST_DIR)/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
 endef
 
 GVFS_POST_INSTALL_TARGET_HOOKS += \
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index d81973195a..1658740839 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -31,8 +31,8 @@ HEIMDAL_LICENSE_FILES = LICENSE
 # We need asn1_compile in the PATH for samba4
 define HOST_HEIMDAL_MAKE_SYMLINK
 	ln -sf $(HOST_DIR)/usr/libexec/heimdal/asn1_compile \
-		$(HOST_DIR)/usr/bin/asn1_compile
-	ln -sf $(HOST_DIR)/usr/bin/compile_et \
+		$(HOST_DIR)/bin/asn1_compile
+	ln -sf $(HOST_DIR)/bin/compile_et \
 		$(HOST_DIR)/usr/libexec/heimdal/compile_et
 endef
 
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 1995ca22cb..134f51ddf6 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -32,14 +32,14 @@ I2C_TOOLS_PYTHON_BASE_ENV = \
 define I2C_TOOLS_BUILD_PYSMBUS
 	(cd $(@D)/py-smbus;  \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
-		$(HOST_DIR)/usr/bin/python setup.py build \
+		$(HOST_DIR)/bin/python setup.py build \
 		$(PKG_PYTHON_DISTUTILS_BUILD_OPTS))
 endef
 
 define I2C_TOOLS_INSTALL_PYSMBUS
 	(cd $(@D)/py-smbus; \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
-		$(HOST_DIR)/usr/bin/python setup.py install \
+		$(HOST_DIR)/bin/python setup.py install \
 		$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS))
 endef
 
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index faff5fc717..aa85cbb5b9 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -13,7 +13,7 @@ IW_DEPENDENCIES = host-pkgconf libnl
 IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
 IW_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
-	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
+	PKG_CONFIG="$(HOST_DIR)/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
 define IW_BUILD_CMDS
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index a66ba71582..84c39a7b42 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -22,7 +22,7 @@ define HOST_JSMIN_BUILD_CMDS
 endef
 
 define HOST_JSMIN_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/jsmin $(HOST_DIR)/usr/bin/jsmin
+	$(INSTALL) -m 0755 -D $(@D)/jsmin $(HOST_DIR)/bin/jsmin
 endef
 
 $(eval $(generic-package))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 47d9f6313e..25132ff6ba 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -65,7 +65,7 @@ LIBGLIB2_CONF_ENV = \
 	jm_cv_func_working_re_compile_pattern=yes \
 	ac_use_included_regex=no \
 	gl_cv_c_restrict=no \
-	ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal \
+	ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/bin/glib-genmarshal \
 	ac_cv_prog_F77=no \
 	ac_cv_func_posix_getgrgid_r=no \
 	glib_cv_long_long_format=ll \
@@ -160,7 +160,7 @@ endef
 # them as well, and better do it in a central place.
 # It's used at run time so it doesn't matter defering it.
 define LIBGLIB2_COMPILE_SCHEMAS
-	$(HOST_DIR)/usr/bin/glib-compile-schemas \
+	$(HOST_DIR)/bin/glib-compile-schemas \
 		$(STAGING_DIR)/usr/share/glib-2.0/schemas \
 		--targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas
 endef
@@ -171,4 +171,4 @@ LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_COMPILE_SCHEMAS
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-LIBGLIB2_HOST_BINARY = $(HOST_DIR)/usr/bin/glib-genmarshal
+LIBGLIB2_HOST_BINARY = $(HOST_DIR)/bin/glib-genmarshal
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 83f69ac3e8..0b26d7205b 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -15,8 +15,8 @@ LIBGTK2_LICENSE_FILES = COPYING
 LIBGTK2_AUTORECONF = YES
 
 LIBGTK2_CONF_ENV = \
-	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
-	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
+	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/bin/gtk-update-icon-cache \
+	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/bin/gdk-pixbuf-csource \
 	DB2HTML=false
 
 LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
@@ -120,7 +120,7 @@ define HOST_LIBGTK2_BUILD_CMDS
 endef
 
 define HOST_LIBGTK2_INSTALL_CMDS
-	cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
+	cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/bin
 endef
 
 $(eval $(autotools-package))
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index ed843fc29a..1f3c0a4d7c 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -14,9 +14,9 @@ LIBGTK3_INSTALL_STAGING = YES
 LIBGTK3_AUTORECONF = YES
 
 LIBGTK3_CONF_ENV = \
-	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
-	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
-	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/usr/bin/pkgconf
+	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/bin/gtk-update-icon-cache \
+	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/bin/gdk-pixbuf-csource \
+	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/bin/pkgconf
 
 LIBGTK3_CONF_OPTS = \
 	--disable-glibtest \
@@ -123,7 +123,7 @@ LIBGTK3_CONF_OPTS += --disable-installed-tests
 endif
 
 define LIBGTK3_COMPILE_GLIB_SCHEMAS
-	$(HOST_DIR)/usr/bin/glib-compile-schemas \
+	$(HOST_DIR)/bin/glib-compile-schemas \
 		$(TARGET_DIR)/usr/share/glib-2.0/schemas
 endef
 
@@ -151,8 +151,8 @@ HOST_LIBGTK3_DEPENDENCIES = \
 	host-librsvg
 
 HOST_LIBGTK3_CFLAGS = \
-	`$(HOST_DIR)/usr/bin/pkgconf --cflags --libs gdk-pixbuf-2.0` \
-	`$(HOST_DIR)/usr/bin/pkgconf --cflags --libs gio-2.0`
+	`$(HOST_DIR)/bin/pkgconf --cflags --libs gdk-pixbuf-2.0` \
+	`$(HOST_DIR)/bin/pkgconf --cflags --libs gio-2.0`
 
 define HOST_LIBGTK3_CONFIGURE_CMDS
 	echo "#define GETTEXT_PACKAGE \"gtk30\"" >> $(@D)/gtk/config.h
@@ -173,16 +173,16 @@ endef
 
 define HOST_LIBGTK3_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/gtk/gtk-update-icon-cache \
-		$(HOST_DIR)/usr/bin/gtk-update-icon-cache
+		$(HOST_DIR)/bin/gtk-update-icon-cache
 	$(INSTALL) -D -m 0755 $(@D)/gtk/gtk-encode-symbolic-svg \
-		$(HOST_DIR)/usr/bin/gtk-encode-symbolic-svg
+		$(HOST_DIR)/bin/gtk-encode-symbolic-svg
 endef
 
 # Create icon-theme.cache for each of the icon directories/themes
 # It's not strictly necessary but speeds up lookups
 define LIBGTK3_UPDATE_ICON_CACHE
 	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
-		-exec $(HOST_DIR)/usr/bin/gtk-update-icon-cache {} \;
+		-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
 endef
 LIBGTK3_TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
 
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 35eb23d00f..194880d8cd 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -69,11 +69,11 @@ endif
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP),y)
 define LIBIIO_INSTALL_CSHARP_BINDINGS_TO_TARGET
 	rm $(TARGET_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll.mdb
-	$(HOST_DIR)/usr/bin/gacutil -root $(TARGET_DIR)/usr/lib -i \
+	$(HOST_DIR)/bin/gacutil -root $(TARGET_DIR)/usr/lib -i \
 		$(TARGET_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll
 endef
 define LIBIIO_INSTALL_CSHARP_BINDINGS_TO_STAGING
-	$(HOST_DIR)/usr/bin/gacutil -root $(STAGING_DIR)/usr/lib -i \
+	$(HOST_DIR)/bin/gacutil -root $(STAGING_DIR)/usr/lib -i \
 		$(STAGING_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll
 endef
 LIBIIO_POST_INSTALL_TARGET_HOOKS += LIBIIO_INSTALL_CSHARP_BINDINGS_TO_TARGET
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index b1a4f48d1d..bf97ee12b5 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -41,5 +41,5 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # variables used by other packages
-LIBTOOL = $(HOST_DIR)/usr/bin/libtool
-LIBTOOLIZE = $(HOST_DIR)/usr/bin/libtoolize
+LIBTOOL = $(HOST_DIR)/bin/libtool
+LIBTOOLIZE = $(HOST_DIR)/bin/libtoolize
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 465f6ccb6c..b8e291a623 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -61,9 +61,9 @@ LIBV4L_CONF_OPTS += --enable-qv4l2
 LIBV4L_DEPENDENCIES += qt5base
 # protect against host version detection of moc-qt5/rcc-qt5/uic-qt5
 LIBV4L_CONF_ENV += \
-	ac_cv_prog_MOC=$(HOST_DIR)/usr/bin/moc \
-	ac_cv_prog_RCC=$(HOST_DIR)/usr/bin/rcc \
-	ac_cv_prog_UIC=$(HOST_DIR)/usr/bin/uic
+	ac_cv_prog_MOC=$(HOST_DIR)/bin/moc \
+	ac_cv_prog_RCC=$(HOST_DIR)/bin/rcc \
+	ac_cv_prog_UIC=$(HOST_DIR)/bin/uic
 # qt5 needs c++11 (since qt-5.7)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 2a7153ad17..7073169fde 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -49,4 +49,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # libxml2 for the host
-LIBXML2_HOST_BINARY = $(HOST_DIR)/usr/bin/xmllint
+LIBXML2_HOST_BINARY = $(HOST_DIR)/bin/xmllint
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 135c5f64f1..80acfb8eaa 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -16,7 +16,7 @@ LIBXMLRPC_MAKE = $(MAKE1)
 
 # Using autoconf, not automake, so we cannot use AUTORECONF = YES.
 define LIBXMLRPC_RUN_AUTOCONF
-	cd $(@D); $(HOST_DIR)/usr/bin/autoconf
+	cd $(@D); $(HOST_DIR)/bin/autoconf
 endef
 
 LIBXMLRPC_PRE_CONFIGURE_HOOKS += LIBXMLRPC_RUN_AUTOCONF
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 1fe431aac0..11d9ba3848 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -16,7 +16,7 @@ HOST_LOCALEDEF_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -fgnu89-inline"
 
 # The makefile does not implement an install target
 define HOST_LOCALEDEF_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/localedef $(HOST_DIR)/usr/bin/localedef
+	$(INSTALL) -D -m 0755 $(@D)/localedef $(HOST_DIR)/bin/localedef
 endef
 
 $(eval $(host-autotools-package))
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index 1a02235e3c..ee153fefd9 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -11,7 +11,7 @@ LPC3250LOADER_LICENSE_FILES = LPC3250loader.py
 
 define HOST_LPC3250LOADER_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/LPC3250loader.py \
-		$(HOST_DIR)/usr/bin/LPC3250loader.py
+		$(HOST_DIR)/bin/LPC3250loader.py
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index 90382fa78f..cb1d5dde18 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -20,4 +20,4 @@ endif
 $(eval $(virtual-package))
 $(eval $(host-virtual-package))
 
-LUA_RUN = $(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
+LUA_RUN = $(HOST_DIR)/bin/$(call qstrip,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 646e43b668..cf449ac52c 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -54,7 +54,7 @@ endef
 $(eval $(host-generic-package))
 
 LUAROCKS_RUN_ENV = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua"
-LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
+LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/bin/luarocks
 
 define LUAROCKS_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 90f0771780..1b4d7febb1 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -10,4 +10,4 @@ LZMA_SITE = http://tukaani.org/lzma
 
 $(eval $(host-autotools-package))
 
-LZMA = $(HOST_DIR)/usr/bin/lzma
+LZMA = $(HOST_DIR)/bin/lzma
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 14d417f604..55157c4d48 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -14,4 +14,4 @@ HOST_LZOP_DEPENDENCIES = host-lzo
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-LZOP = $(HOST_DIR)/usr/bin/lzop
+LZOP = $(HOST_DIR)/bin/lzop
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 3e78892163..36837a191e 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -21,7 +21,7 @@ define HOST_MAKEDEVS_BUILD_CMDS
 endef
 
 define HOST_MAKEDEVS_INSTALL_CMDS
-	$(INSTALL) -D -m 755 $(@D)/makedevs $(HOST_DIR)/usr/bin/makedevs
+	$(INSTALL) -D -m 755 $(@D)/makedevs $(HOST_DIR)/bin/makedevs
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index a1a1fb3ef8..e37c4dc719 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -28,7 +28,7 @@ define HOST_MFGTOOLS_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/MfgToolLib/libMfgToolLib.so \
 		$(HOST_DIR)/usr/lib/libMfgToolLib.so
 	$(INSTALL) -D -m 755 $(@D)/TestPrgm/mfgtoolcli \
-		$(HOST_DIR)/usr/bin/mfgtoolcli
+		$(HOST_DIR)/bin/mfgtoolcli
 endef
 
 $(eval $(host-cmake-package))
diff --git a/package/mke2img/mke2img.mk b/package/mke2img/mke2img.mk
index 9de387a3a3..f09b0106c5 100644
--- a/package/mke2img/mke2img.mk
+++ b/package/mke2img/mke2img.mk
@@ -7,7 +7,7 @@
 HOST_MKE2IMG_DEPENDENCIES = host-genext2fs host-e2fsprogs
 
 define HOST_MKE2IMG_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 package/mke2img/mke2img $(HOST_DIR)/usr/bin/mke2img
+	$(INSTALL) -D -m 0755 package/mke2img/mke2img $(HOST_DIR)/bin/mke2img
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
index ba4bd29c38..b013390572 100644
--- a/package/mkpasswd/mkpasswd.mk
+++ b/package/mkpasswd/mkpasswd.mk
@@ -16,9 +16,9 @@ define HOST_MKPASSWD_BUILD_CMDS
 endef
 
 define HOST_MKPASSWD_INSTALL_CMDS
-	$(INSTALL) -D -m 755 $(@D)/mkpasswd $(HOST_DIR)/usr/bin/mkpasswd
+	$(INSTALL) -D -m 755 $(@D)/mkpasswd $(HOST_DIR)/bin/mkpasswd
 endef
 
 $(eval $(host-generic-package))
 
-MKPASSWD = $(HOST_DIR)/usr/bin/mkpasswd
+MKPASSWD = $(HOST_DIR)/bin/mkpasswd
diff --git a/package/mkpimage/mkpimage.mk b/package/mkpimage/mkpimage.mk
index bba2eb4077..8e08013f91 100644
--- a/package/mkpimage/mkpimage.mk
+++ b/package/mkpimage/mkpimage.mk
@@ -15,7 +15,7 @@ define HOST_MKPIMAGE_BUILD_CMDS
 endef
 
 define HOST_MKPIMAGE_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/mkpimage $(HOST_DIR)/usr/bin/mkpimage
+	$(INSTALL) -D -m 0755 $(@D)/mkpimage $(HOST_DIR)/bin/mkpimage
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index f88c6f9c0b..82467ab403 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -20,7 +20,7 @@ MOARVM_CONF_OPTS = \
 	--ld="$(TARGET_CC)" \
 	--prefix="/usr" \
 	--pkgconfig=$(PKG_CONFIG_HOST_BINARY) \
-	--lua=$(HOST_DIR)/usr/bin/luajit \
+	--lua=$(HOST_DIR)/bin/luajit \
 	--has-libuv \
 	--has-libtommath \
 	--has-libatomic
diff --git a/package/mono-gtksharp3/mono-gtksharp3.mk b/package/mono-gtksharp3/mono-gtksharp3.mk
index 9ddf932631..126aabeda2 100644
--- a/package/mono-gtksharp3/mono-gtksharp3.mk
+++ b/package/mono-gtksharp3/mono-gtksharp3.mk
@@ -12,6 +12,6 @@ MONO_GTKSHARP3_LICENSE = LGPL-2.0, MIT (cairo)
 MONO_GTKSHARP3_LICENSE_FILES = COPYING
 MONO_GTKSHARP3_INSTALL_STAGING = YES
 MONO_GTKSHARP3_DEPENDENCIES = mono libgtk3
-MONO_GTKSHARP3_CONF_OPTS += CSC=$(HOST_DIR)/usr/bin/mcs
+MONO_GTKSHARP3_CONF_OPTS += CSC=$(HOST_DIR)/bin/mcs
 
 $(eval $(autotools-package))
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 14ab8aceed..c0b3227a12 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -297,7 +297,7 @@ endif
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 MPLAYER_CONF_OPTS += \
 	--enable-mmx \
-	--yasm=$(HOST_DIR)/usr/bin/yasm
+	--yasm=$(HOST_DIR)/bin/yasm
 MPLAYER_DEPENDENCIES += host-yasm
 else
 MPLAYER_CONF_OPTS += \
diff --git a/package/mxsldr/mxsldr.mk b/package/mxsldr/mxsldr.mk
index 07ef8da49b..239b40ad29 100644
--- a/package/mxsldr/mxsldr.mk
+++ b/package/mxsldr/mxsldr.mk
@@ -15,7 +15,7 @@ define HOST_MXSLDR_BUILD_CMDS
 endef
 
 define HOST_MXSLDR_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/mxsldr $(HOST_DIR)/usr/bin/mxsldr
+	$(INSTALL) -m 0755 -D $(@D)/mxsldr $(HOST_DIR)/bin/mxsldr
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 11bfccaa25..7de1198589 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -19,7 +19,7 @@ NCFTP_CONF_OPTS = --disable-ccdv
 # We need to pass -I because of the non-standard m4 directory name, and
 # none of the other autotools are used, so the below is the easiest.
 define NCFTP_RUN_AUTOCONF
-	(cd $(@D); $(HOST_DIR)/usr/bin/autoconf -I$(@D)/autoconf_local/)
+	(cd $(@D); $(HOST_DIR)/bin/autoconf -I$(@D)/autoconf_local/)
 endef
 NCFTP_PRE_CONFIGURE_HOOKS += NCFTP_RUN_AUTOCONF
 
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 3cfe4faf2b..b0655766ab 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -16,7 +16,7 @@ define HOST_NINJA_BUILD_CMDS
 endef
 
 define HOST_NINJA_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/usr/bin/ninja
+	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index a9c96cad91..1472d5d220 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -44,7 +44,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 	# The build system directly calls python. Work around this by forcing python2
 	# into PATH. See https://github.com/nodejs/node/issues/2735
 	mkdir -p $(@D)/bin
-	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
+	ln -sf $(HOST_DIR)/bin/python2 $(@D)/bin/python
 
 	# Build with the static, built-in OpenSSL which is supplied as part of
 	# the nodejs source distribution.  This is needed on the host because
@@ -53,8 +53,8 @@ define HOST_NODEJS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
-		PYTHON=$(HOST_DIR)/usr/bin/python2 \
-		$(HOST_DIR)/usr/bin/python2 ./configure \
+		PYTHON=$(HOST_DIR)/bin/python2 \
+		$(HOST_DIR)/bin/python2 ./configure \
 		--prefix=$(HOST_DIR) \
 		--without-snapshot \
 		--without-dtrace \
@@ -65,19 +65,19 @@ define HOST_NODEJS_CONFIGURE_CMDS
 endef
 
 define HOST_NODEJS_BUILD_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH)
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH)
 
-	$(INSTALL) -m755 -D $(@D)/out/Release/mkpeephole $(HOST_DIR)/usr/bin/mkpeephole
+	$(INSTALL) -m755 -D $(@D)/out/Release/mkpeephole $(HOST_DIR)/bin/mkpeephole
 endef
 
 ifeq ($(BR2_i386),y)
@@ -110,14 +110,14 @@ endif
 
 define NODEJS_CONFIGURE_CMDS
 	mkdir -p $(@D)/bin
-	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
+	ln -sf $(HOST_DIR)/bin/python2 $(@D)/bin/python
 
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
 		LD="$(TARGET_CXX)" \
-		PYTHON=$(HOST_DIR)/usr/bin/python2 \
-		$(HOST_DIR)/usr/bin/python2 ./configure \
+		PYTHON=$(HOST_DIR)/bin/python2 \
+		$(HOST_DIR)/bin/python2 ./configure \
 		--prefix=/usr \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
@@ -127,11 +127,11 @@ define NODEJS_CONFIGURE_CMDS
 	)
 
 	# use host version of mkpeephole
-	sed "s#<(mkpeephole_exec)#$(HOST_DIR)/usr/bin/mkpeephole#g" -i $(@D)/deps/v8/src/v8.gyp
+	sed "s#<(mkpeephole_exec)#$(HOST_DIR)/bin/mkpeephole#g" -i $(@D)/deps/v8/src/v8.gyp
 endef
 
 define NODEJS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(TARGET_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
@@ -155,7 +155,7 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
 	npm_config_build_from_source=true \
 	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
 	npm_config_prefix=$(TARGET_DIR)/usr \
-	$(HOST_DIR)/usr/bin/npm
+	$(HOST_DIR)/bin/npm
 
 #
 # We can only call NPM if there's something to install.
@@ -170,7 +170,7 @@ endef
 endif
 
 define NODEJS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(TARGET_DIR) \
 		$(TARGET_CONFIGURE_OPTS) \
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 251dda331e..be0700dbe4 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -22,7 +22,7 @@ OLA_CONF_OPTS = \
 	--disable-root-check \
 	--disable-java-libs \
 	--disable-fatal-warnings \
-	--with-ola-protoc-plugin=$(HOST_DIR)/usr/bin/ola_protoc_plugin
+	--with-ola-protoc-plugin=$(HOST_DIR)/bin/ola_protoc_plugin
 
 HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf
 
@@ -46,7 +46,7 @@ HOST_OLA_CONF_OPTS = \
 # only.
 HOST_OLA_MAKE_OPTS = protoc/ola_protoc_plugin
 define HOST_OLA_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc_plugin $(HOST_DIR)/usr/bin/ola_protoc_plugin
+	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc_plugin $(HOST_DIR)/bin/ola_protoc_plugin
 endef
 
 # sets where to find python libs built for target and required by ola
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index e2aeefa9f2..d68b1300bf 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -15,7 +15,7 @@ endef
 
 define HOST_OMAP_U_BOOT_UTILS_INSTALL_CMDS
 	for f in gpsign pserial tagger ucmd ukermit ; do \
-		$(INSTALL) -D -m 755 $(@D)/$$f $(HOST_DIR)/usr/bin/$$f ; \
+		$(INSTALL) -D -m 755 $(@D)/$$f $(HOST_DIR)/bin/$$f ; \
 	done
 endef
 
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 103930f264..557e5d1613 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -14,8 +14,8 @@ OMNIORB_DEPENDENCIES = host-omniorb
 HOST_OMNIORB_DEPENDENCIES = host-python
 
 # omniorb is not python3 friendly, so force the python interpreter
-OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
-HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
+OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
+HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
 
 # Defaulting long double support to a safe option for the
 # mix of embedded targets, this could later be automated
@@ -65,7 +65,7 @@ endif
 # cross compiled target OMNIORB application.
 define OMNIORB_ADJUST_TOOLDIR
 	# Point to the host folder to get HOST_OMNIORB tools
-	$(SED) 's:TOOLBINDIR = $$(TOP)/$$(BINDIR):TOOLBINDIR = $(HOST_DIR)/usr/bin:g' $(@D)/mk/beforeauto.mk
+	$(SED) 's:TOOLBINDIR = $$(TOP)/$$(BINDIR):TOOLBINDIR = $(HOST_DIR)/bin:g' $(@D)/mk/beforeauto.mk
 	# Disables OMNIORB app/service/tool building
 	echo "EmbeddedSystem=1" >> $(@D)/mk/beforeauto.mk
 endef
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 10e0dfef80..b8a0c78781 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -321,7 +321,7 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python2=ON \
 	-DBUILD_opencv_python3=OFF \
-	-DPYTHON2_EXECUTABLE=$(HOST_DIR)/usr/bin/python2 \
+	-DPYTHON2_EXECUTABLE=$(HOST_DIR)/bin/python2 \
 	-DPYTHON2_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
 	-DPYTHON2_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so \
 	-DPYTHON2_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core/include \
@@ -332,7 +332,7 @@ else
 OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python2=OFF \
 	-DBUILD_opencv_python3=ON \
-	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/usr/bin/python3 \
+	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DPYTHON3_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m \
 	-DPYTHON3_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)m.so \
 	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include \
diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 4307008d47..7da5c547d9 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -58,7 +58,7 @@ define HOST_ORACLE_MYSQL_BUILD_CMDS
 endef
 
 define HOST_ORACLE_MYSQL_INSTALL_CMDS
-	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash $(HOST_DIR)/usr/bin/
+	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash $(HOST_DIR)/bin/
 endef
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index fe49f4ba09..6d04889ca7 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -16,8 +16,8 @@ PHP_AMQP_LICENSE_FILES = LICENSE
 
 define PHP_AMQP_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
index 8f4e3bf6d8..374df64120 100644
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -15,8 +15,8 @@ PHP_GEOIP_LICENSE_FILES = geoip.c
 
 define PHP_GEOIP_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index e595cd3fe5..84e6955071 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -15,8 +15,8 @@ PHP_GNUPG_LICENSE_FILES = LICENSE
 
 define PHP_GNUPG_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index c8c2b85afe..5b99de0023 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -16,8 +16,8 @@ PHP_IMAGICK_LICENSE_FILES = LICENSE
 
 define PHP_IMAGICK_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index c4b76365ed..9cd03ec03e 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -17,8 +17,8 @@ PHP_MEMCACHED_LICENSE_FILES = LICENSE fastlz/LICENSE g_fmt.h
 
 define PHP_MEMCACHED_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index 931cde91c8..faf354a84c 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -15,8 +15,8 @@ PHP_SSH2_LICENSE_FILES = LICENSE
 
 define PHP_SSH2_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index 27118906d4..84da60709e 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -16,8 +16,8 @@ PHP_YAML_LICENSE_FILES = LICENSE
 
 define PHP_YAML_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
index ba141139fb..fed71955b6 100644
--- a/package/php-zmq/php-zmq.mk
+++ b/package/php-zmq/php-zmq.mk
@@ -15,8 +15,8 @@ PHP_ZMQ_LICENSE_FILES = LICENSE
 
 define PHP_ZMQ_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index e4f68b5217..7e6878db4d 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -55,7 +55,7 @@ endif
 ifeq ($(BR2_PACKAGE_PINENTRY_QT4),y)
 # -pthread needs to be passed for certain toolchains
 # http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/
-PINENTRY_CONF_OPTS += LIBS=-pthread MOC=$(HOST_DIR)/usr/bin/moc
+PINENTRY_CONF_OPTS += LIBS=-pthread MOC=$(HOST_DIR)/bin/moc
 PINENTRY_CONF_OPTS += --enable-pinentry-qt4
 PINENTRY_DEPENDENCIES += qt
 else
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 1bb3652a13..401084fb12 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -22,8 +22,8 @@
 
 # Set compiler variables.
 ifeq ($(BR2_CCACHE),y)
-CMAKE_HOST_C_COMPILER = $(HOST_DIR)/usr/bin/ccache
-CMAKE_HOST_CXX_COMPILER = $(HOST_DIR)/usr/bin/ccache
+CMAKE_HOST_C_COMPILER = $(HOST_DIR)/bin/ccache
+CMAKE_HOST_CXX_COMPILER = $(HOST_DIR)/bin/ccache
 CMAKE_HOST_C_COMPILER_ARG1 = $(HOSTCC_NOCCACHE)
 CMAKE_HOST_CXX_COMPILER_ARG1 = $(HOSTCXX_NOCCACHE)
 else
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index cc94cd9f8b..b0d5789ac5 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -20,7 +20,7 @@
 ################################################################################
 
 PERL_ARCHNAME = $(ARCH)-linux
-PERL_RUN = PERL5LIB= PERL_USE_UNSAFE_INC=1 $(HOST_DIR)/usr/bin/perl
+PERL_RUN = PERL5LIB= PERL_USE_UNSAFE_INC=1 $(HOST_DIR)/bin/perl
 
 ################################################################################
 # inner-perl-package -- defines how the configuration, compilation and
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 6e411ab5c5..f57e486dad 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -204,12 +204,12 @@ endif
 #   - otherwise, we use the one requested by *_NEEDS_HOST_PYTHON.
 #
 ifeq ($(4),target)
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/python
+$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
 else
 ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/python
+$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
 else
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/$$($(2)_NEEDS_HOST_PYTHON)
+$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
 endif
 endif
 
diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 45b9c4136f..e5b606f063 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -44,7 +44,7 @@ $(2)_NEEDS_EXTERNAL_WAF ?= NO
 # If the package does not have its own waf, use our own.
 ifeq ($$($(2)_NEEDS_EXTERNAL_WAF),YES)
 $(2)_DEPENDENCIES += host-waf
-$(2)_WAF = $(HOST_DIR)/usr/bin/waf
+$(2)_WAF = $(HOST_DIR)/bin/waf
 else
 $(2)_WAF = ./waf
 endif
@@ -63,7 +63,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$(@D) && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$($(2)_CONF_ENV) \
-	$$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) configure \
+	$$(HOST_DIR)/bin/python2 $$($(2)_WAF) configure \
 		--prefix=/usr \
 		--libdir=/usr/lib \
 		$$($(2)_CONF_OPTS) \
@@ -78,7 +78,7 @@ endif
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$(@D) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
 		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
 endef
@@ -91,7 +91,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	cd $$(@D) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
 		install --destdir=$$(STAGING_DIR) \
 		$$($(2)_INSTALL_STAGING_OPTS) \
 		$$($(2)_WAF_OPTS)
@@ -105,7 +105,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$(@D) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
 		install --destdir=$$(TARGET_DIR) \
 		$$($(2)_INSTALL_TARGET_OPTS) \
 		$$($(2)_WAF_OPTS)
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index c8b0cbaf51..cc190d26da 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -10,7 +10,7 @@ PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 
-PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config
+PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
 
 define PKGCONF_LINK_PKGCONFIG
 	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
@@ -18,18 +18,18 @@ endef
 
 define HOST_PKGCONF_INSTALL_WRAPPER
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
-		$(HOST_DIR)/usr/bin/pkg-config
+		$(HOST_DIR)/bin/pkg-config
 	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
 		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
-		$(HOST_DIR)/usr/bin/pkg-config
+		$(HOST_DIR)/bin/pkg-config
 endef
 
 define HOST_PKGCONF_STATIC
-	$(SED) 's, at STATIC@,--static,' $(HOST_DIR)/usr/bin/pkg-config
+	$(SED) 's, at STATIC@,--static,' $(HOST_DIR)/bin/pkg-config
 endef
 
 define HOST_PKGCONF_SHARED
-	$(SED) 's, at STATIC@,,' $(HOST_DIR)/usr/bin/pkg-config
+	$(SED) 's, at STATIC@,,' $(HOST_DIR)/bin/pkg-config
 endef
 
 PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index c9dca4ca9b..480fd6e09d 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -91,7 +91,7 @@ HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
 	CPPFLAGS="$(HOST_CPPFLAGS) -U_FILE_OFFSET_BITS" \
-	PYTHON="$(HOST_DIR)/usr/bin/python" \
+	PYTHON="$(HOST_DIR)/bin/python" \
 	PYTHON_INSTALL_ARGS="$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)" \
 	ARCH="$(HOSTARCH)"
 
@@ -127,9 +127,9 @@ define HOST_POLICYCOREUTILS_INSTALL_CMDS
 			DESTDIR=$(HOST_DIR) install
 	)
 	# Fix python paths
-	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/audit2allow
-	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/sepolgen-ifgen
-	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/sepolicy
+	$(SED) 's%/usr/bin/%$(HOST_DIR)/bin/%g' $(HOST_DIR)/bin/audit2allow
+	$(SED) 's%/usr/bin/%$(HOST_DIR)/bin/%g' $(HOST_DIR)/bin/sepolgen-ifgen
+	$(SED) 's%/usr/bin/%$(HOST_DIR)/bin/%g' $(HOST_DIR)/bin/sepolicy
 endef
 
 $(eval $(generic-package))
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 72930c1fef..72890e6617 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -16,7 +16,7 @@ PROTOBUF_AUTORECONF = YES
 
 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
-PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/usr/bin/protoc
+PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/bin/protoc
 
 PROTOBUF_INSTALL_STAGING = YES
 
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 0c409a74fe..cc1b12d802 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -52,7 +52,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_ORC),y)
 PULSEAUDIO_DEPENDENCIES += orc
-PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/usr/bin/orcc
+PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/bin/orcc
 PULSEAUDIO_CONF_OPTS += --enable-orc
 else
 PULSEAUDIO_CONF_OPTS += --disable-orc
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index a52eebfc1a..cf5c874151 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -19,13 +19,13 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON_GOBJECT_DEPENDENCIES += python host-python
 
 PYTHON_GOBJECT_CONF_ENV = \
-	PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	PYTHON=$(HOST_DIR)/bin/python2 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`"
 else
 PYTHON_GOBJECT_DEPENDENCIES += python3 host-python3
 
 PYTHON_GOBJECT_CONF_ENV = \
-	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`"
 endif
 
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 40fb77351e..db6591fc1e 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -29,8 +29,8 @@ PYTHON_LXML_BUILD_OPTS = \
 	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
 	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
 HOST_PYTHON_LXML_BUILD_OPTS = \
-	--with-xslt-config=$(HOST_DIR)/usr/bin/xslt-config \
-	--with-xml2-config=$(HOST_DIR)/usr/bin/xml2-config
+	--with-xslt-config=$(HOST_DIR)/bin/xslt-config \
+	--with-xml2-config=$(HOST_DIR)/bin/xml2-config
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-pypcap/python-pypcap.mk b/package/python-pypcap/python-pypcap.mk
index 185ab1d3dc..fc6fc6ed92 100644
--- a/package/python-pypcap/python-pypcap.mk
+++ b/package/python-pypcap/python-pypcap.mk
@@ -12,9 +12,9 @@ PYTHON_PYPCAP_SETUP_TYPE = distutils
 PYTHON_PYPCAP_DEPENDENCIES = host-python-pyrex libpcap
 
 define PYTHON_PYPCAP_CONFIGURE_CMDS
-	$(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/pyrexc $(@D)/pcap.pyx
+	$(HOST_DIR)/bin/python2 $(HOST_DIR)/bin/pyrexc $(@D)/pcap.pyx
 	(cd $(@D); \
-		$(HOST_DIR)/usr/bin/python setup.py \
+		$(HOST_DIR)/bin/python setup.py \
 		config --with-pcap=$(STAGING_DIR)/usr)
 endef
 
diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index ab658e90b7..57f18b533d 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -72,7 +72,7 @@ endef
 PYTHON_PYQT_CONF_OPTS = \
 	--bindir $(TARGET_DIR)/usr/bin \
 	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages \
-	--qmake $(HOST_DIR)/usr/bin/qmake \
+	--qmake $(HOST_DIR)/bin/qmake \
 	--sysroot $(STAGING_DIR)/usr \
 	-w --confirm-license \
 	--no-designer-plugin \
@@ -93,7 +93,7 @@ define PYTHON_PYQT_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		$(TARGET_CONFIGURE_OPTS) \
-		$(HOST_DIR)/usr/bin/python configure-ng.py \
+		$(HOST_DIR)/bin/python configure-ng.py \
 			$(PYTHON_PYQT_CONF_OPTS) \
 	)
 endef
diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index 965c2d8536..cde026ef63 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -47,7 +47,7 @@ endef
 PYTHON_PYQT5_CONF_OPTS = \
 	--bindir $(TARGET_DIR)/usr/bin \
 	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages \
-	--qmake $(HOST_DIR)/usr/bin/qmake \
+	--qmake $(HOST_DIR)/bin/qmake \
 	--sysroot $(STAGING_DIR)/usr \
 	-w --confirm-license \
 	--no-designer-plugin \
@@ -59,7 +59,7 @@ define PYTHON_PYQT5_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		$(TARGET_CONFIGURE_OPTS) \
-		$(HOST_DIR)/usr/bin/python configure.py \
+		$(HOST_DIR)/bin/python configure.py \
 			$(PYTHON_PYQT5_CONF_OPTS) \
 	)
 endef
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 1d84e83517..54406b841b 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -30,7 +30,7 @@ endif
 
 define HOST_PYTHON_SIP_CONFIGURE_CMDS
 	(cd $(@D); \
-		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py)
+		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(HOST_DIR)/bin/python configure.py)
 endef
 
 define HOST_PYTHON_SIP_BUILD_CMDS
@@ -43,14 +43,14 @@ endef
 
 define PYTHON_SIP_CONFIGURE_CMDS
 	(cd $(@D); \
-		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py \
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/bin/python configure.py \
 			--bindir $(TARGET_DIR)/usr/bin \
 			--destdir $(TARGET_DIR)/$(PYTHON_SIP_LIB_DIR) \
 			--incdir $(STAGING_DIR)/$(PYTHON_SIP_INCLUDE_DIR)  \
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
 			--use-qmake && \
-		$(HOST_DIR)/usr/bin/qmake)
+		$(HOST_DIR)/bin/qmake)
 endef
 
 define PYTHON_SIP_BUILD_CMDS
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 7fe9f82f8b..a30632c24e 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -11,7 +11,7 @@ PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
 
 define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
-	$(HOST_DIR)/usr/bin/python2 -c 'import os; \
+	$(HOST_DIR)/bin/python2 -c 'import os; \
 		os.chdir("$(@D)"); \
 		from gluon.main import save_password; \
 		save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
diff --git a/package/python/python.mk b/package/python/python.mk
index 7ba5e37754..d1c01674b3 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -231,8 +231,8 @@ PYTHON_AUTORECONF = YES
 # for the target, otherwise the default python program may be missing.
 ifneq ($(BR2_PACKAGE_PYTHON3),y)
 define HOST_PYTHON_INSTALL_PYTHON_SYMLINK
-	ln -sf python2 $(HOST_DIR)/usr/bin/python
-	ln -sf python2-config $(HOST_DIR)/usr/bin/python-config
+	ln -sf python2 $(HOST_DIR)/bin/python
+	ln -sf python2-config $(HOST_DIR)/bin/python-config
 endef
 
 HOST_PYTHON_POST_INSTALL_HOOKS += HOST_PYTHON_INSTALL_PYTHON_SYMLINK
@@ -254,7 +254,7 @@ endif
 define PYTHON_CREATE_PYC_FILES
 	$(PYTHON_FIX_TIME)
 	PYTHONPATH="$(PYTHON_PATH)" \
-	cd $(TARGET_DIR) && $(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
+	cd $(TARGET_DIR) && $(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
 		$(if $(BR2_REPRODUCIBLE),--force) \
 		usr/lib/python$(PYTHON_VERSION_MAJOR)
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2532dee489..c674278dc3 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -166,17 +166,17 @@ PYTHON3_CONF_OPTS += \
 # '_freeze_importlib'. Unfortunately, for the target Python, they are
 # built for the target, while we need to run them at build time. So
 # when installing host-python, we copy them to
-# $(HOST_DIR)/usr/bin. And then, when building the target python
+# $(HOST_DIR)/bin. And then, when building the target python
 # package, we tell the configure script where they are located.
 define HOST_PYTHON3_INSTALL_TOOLS
-	cp $(@D)/Parser/pgen $(HOST_DIR)/usr/bin/python-pgen
-	cp $(@D)/Programs/_freeze_importlib $(HOST_DIR)/usr/bin/python-freeze-importlib
+	cp $(@D)/Parser/pgen $(HOST_DIR)/bin/python-pgen
+	cp $(@D)/Programs/_freeze_importlib $(HOST_DIR)/bin/python-freeze-importlib
 endef
 HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_TOOLS
 
 PYTHON3_CONF_ENV += \
-	PGEN_FOR_BUILD=$(HOST_DIR)/usr/bin/python-pgen \
-	FREEZE_IMPORTLIB_FOR_BUILD=$(HOST_DIR)/usr/bin/python-freeze-importlib
+	PGEN_FOR_BUILD=$(HOST_DIR)/bin/python-pgen \
+	FREEZE_IMPORTLIB_FOR_BUILD=$(HOST_DIR)/bin/python-freeze-importlib
 
 #
 # Remove useless files. In the config/ directory, only the Makefile
@@ -224,8 +224,8 @@ endif
 # for the target.
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define HOST_PYTHON3_INSTALL_SYMLINK
-	ln -fs python3 $(HOST_DIR)/usr/bin/python
-	ln -fs python3-config $(HOST_DIR)/usr/bin/python-config
+	ln -fs python3 $(HOST_DIR)/bin/python
+	ln -fs python3-config $(HOST_DIR)/bin/python-config
 endef
 
 HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
@@ -247,7 +247,7 @@ endif
 define PYTHON3_CREATE_PYC_FILES
 	$(PYTHON3_FIX_TIME)
 	PYTHONPATH="$(PYTHON3_PATH)" \
-	cd $(TARGET_DIR) && $(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
+	cd $(TARGET_DIR) && $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
 		$(TOPDIR)/support/scripts/pycompile.py \
 		$(if $(BR2_REPRODUCIBLE),--force) \
 		usr/lib/python$(PYTHON3_VERSION_MAJOR)
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6df3b3db8b..3868c252d8 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -130,7 +130,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--interp-prefix=$(STAGING_DIR) \
 		--cc="$(HOSTCC)" \
 		--host-cc="$(HOSTCC)" \
-		--python=$(HOST_DIR)/usr/bin/python2 \
+		--python=$(HOST_DIR)/bin/python2 \
 		--extra-cflags="$(HOST_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
 		$(HOST_QEMU_OPTS)
@@ -147,7 +147,7 @@ endef
 $(eval $(host-generic-package))
 
 # variable used by other packages
-QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)
+QEMU_USER = $(HOST_DIR)/bin/qemu-$(HOST_QEMU_ARCH)
 
 #-------------------------------------------------------------
 # Target-qemu
@@ -161,8 +161,8 @@ QEMU_LIBS = -lrt -lm
 QEMU_OPTS =
 
 QEMU_VARS = \
-	LIBTOOL=$(HOST_DIR)/usr/bin/libtool \
-	PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	LIBTOOL=$(HOST_DIR)/bin/libtool \
+	PYTHON=$(HOST_DIR)/bin/python2 \
 	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
 # If we want to specify only a subset of targets, we must still enable all
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index 2e8c1d0e92..c501e48c86 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -26,7 +26,7 @@ QPID_PROTON_CONF_OPTS = \
 	-DBUILD_RUBY=OFF \
 	-DENABLE_VALGRIND=OFF \
 	-DENABLE_WARNING_ERROR=OFF \
-	-DPYTHON_EXECUTABLE=$(HOST_DIR)/usr/bin/python2
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python2
 
 define QPID_PROTON_REMOVE_USELESS_FILES
 	rm -fr $(TARGET_DIR)/usr/share/proton-*/
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 2580ee7c0b..e941f89624 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -475,7 +475,7 @@ endif
 # End of workaround.
 
 # Variable for other Qt applications to use
-QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
+QT_QMAKE = $(HOST_DIR)/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set <variable> = <value> in
@@ -516,7 +516,7 @@ define QT_CONFIGURE_CMDS
 	$(call QT_QMAKE_SET,QMAKE_CFLAGS,$(QT_CFLAGS),$(@D))
 	$(call QT_QMAKE_SET,QMAKE_CXXFLAGS,$(QT_CXXFLAGS),$(@D))
 	$(call QT_QMAKE_SET,QMAKE_LFLAGS,$(QT_LDFLAGS),$(@D))
-	$(call QT_QMAKE_SET,PKG_CONFIG,$(HOST_DIR)/usr/bin/pkg-config,$(@D))
+	$(call QT_QMAKE_SET,PKG_CONFIG,$(HOST_DIR)/bin/pkg-config,$(@D))
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then. So set PKG_CONFIG* manually.
 	(cd $(@D); \
@@ -604,7 +604,7 @@ ifeq ($(BR2_PACKAGE_QT_TEST),y)
 QT_INSTALL_LIBS += QtTest
 endif
 
-QT_CONF_FILE = $(HOST_DIR)/usr/bin/qt.conf
+QT_CONF_FILE = $(HOST_DIR)/bin/qt.conf
 
 # Since host programs and spec files have been moved to $(HOST_DIR),
 # we need to tell qmake the new location of the various elements,
@@ -616,7 +616,7 @@ define QT_INSTALL_QT_CONF
 	echo "Headers=$(STAGING_DIR)/usr/include" >> $(QT_CONF_FILE)
 	echo "Libraries=$(STAGING_DIR)/usr/lib"   >> $(QT_CONF_FILE)
 	echo "Data=$(HOST_DIR)/usr"               >> $(QT_CONF_FILE)
-	echo "Binaries=$(HOST_DIR)/usr/bin"       >> $(QT_CONF_FILE)
+	echo "Binaries=$(HOST_DIR)/bin"       >> $(QT_CONF_FILE)
 endef
 
 # After running Qt normal installation process (which installs
@@ -628,12 +628,12 @@ endef
 # automatically.
 define QT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	mkdir -p $(HOST_DIR)/usr/bin
-	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
+	mkdir -p $(HOST_DIR)/bin
+	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/bin
 	ln -sf $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr/mkspecs
 	$(QT_INSTALL_QT_CONF)
 	for i in moc uic rcc lupdate lrelease ; do \
-		$(SED) "s,^$${i}_location=.*,$${i}_location=$(HOST_DIR)/usr/bin/$${i}," \
+		$(SED) "s,^$${i}_location=.*,$${i}_location=$(HOST_DIR)/bin/$${i}," \
 			$(STAGING_DIR)/usr/lib/pkgconfig/Qt*.pc ; \
 	done
 	$(SED) "s,$(STAGING_DIR)/,,g" $(STAGING_DIR)/usr/lib/pkgconfig/Qt*.pc
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 9e77ce351c..d390c04fe8 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -28,4 +28,4 @@ define QT5_LA_PRL_FILES_FIXUP
 endef
 
 # Variable for other Qt applications to use
-QT5_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec devices/linux-buildroot-g++
+QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 9d890204ca..c41f2451f1 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -23,7 +23,7 @@ QT53D_REDISTRIBUTE = NO
 endif
 
 define QT53D_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT53D_BUILD_CMDS
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index f49113b538..8dfbc5157c 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -19,7 +19,7 @@ QT5CANVAS3D_REDISTRIBUTE = NO
 endif
 
 define QT5CANVAS3D_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5CANVAS3D_BUILD_CMDS
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index a9518cb4cb..e18baa06f5 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -32,7 +32,7 @@ QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_NEARD),neard)
 
 define QT5CONNECTIVITY_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5CONNECTIVITY_BUILD_CMDS
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index c4b3f07402..7c3e53a52c 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -24,7 +24,7 @@ QT5DECLARATIVE_REDISTRIBUTE = NO
 endif
 
 define QT5DECLARATIVE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5DECLARATIVE_BUILD_CMDS
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index e550fccfdc..62d519a0c2 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -28,7 +28,7 @@ QT5ENGINIO_DEPENDENCIES += qt5declarative
 endif
 
 define QT5ENGINIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5ENGINIO_BUILD_CMDS
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 9354a4d250..839cd8a8a6 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -24,7 +24,7 @@ QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
 endif
 
 define QT5GRAPHICALEFFECTS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5GRAPHICALEFFECTS_BUILD_CMDS
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 5d31e14a2f..7333ff2ffd 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -24,7 +24,7 @@ QT5IMAGEFORMATS_REDISTRIBUTE = NO
 endif
 
 define QT5IMAGEFORMATS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5IMAGEFORMATS_BUILD_CMDS
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 96263e89b9..29bd4ae4eb 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -28,7 +28,7 @@ QT5LOCATION_DEPENDENCIES += qt5declarative
 endif
 
 define QT5LOCATION_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5LOCATION_BUILD_CMDS
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index e66ce40851..2f7397c6f7 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -32,7 +32,7 @@ QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
 endif
 
 define QT5MULTIMEDIA_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5MULTIMEDIA_BUILD_CMDS
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index d28993244e..fa5b39ef63 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -19,7 +19,7 @@ QT5QUICKCONTROLS_REDISTRIBUTE = NO
 endif
 
 define QT5QUICKCONTROLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5QUICKCONTROLS_BUILD_CMDS
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index d6c3ee3e48..83d3911863 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -19,7 +19,7 @@ QT5QUICKCONTROLS2_REDISTRIBUTE = NO
 endif
 
 define QT5QUICKCONTROLS2_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5QUICKCONTROLS2_BUILD_CMDS
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index c24ef3336e..e58edc3d95 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -19,7 +19,7 @@ QT5SCRIPT_REDISTRIBUTE = NO
 endif
 
 define QT5SCRIPT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5SCRIPT_BUILD_CMDS
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index f73ae5b8d0..c0ef5c4263 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -28,7 +28,7 @@ QT5SENSORS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5SENSORS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5SENSORS_BUILD_CMDS
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 05ca181eae..7c8cea5106 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -19,7 +19,7 @@ QT5SERIALBUS_REDISTRIBUTE = NO
 endif
 
 define QT5SERIALBUS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5SERIALBUS_BUILD_CMDS
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 1a137fde11..eca544b5a6 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -24,7 +24,7 @@ QT5SERIALPORT_REDISTRIBUTE = NO
 endif
 
 define QT5SERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5SERIALPORT_BUILD_CMDS
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 8986332b43..e408d9104f 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -24,7 +24,7 @@ QT5SVG_REDISTRIBUTE = NO
 endif
 
 define QT5SVG_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5SVG_BUILD_CMDS
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index c7d2e8f88c..03f5a650fa 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -54,7 +54,7 @@ QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 
 define QT5TOOLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5TOOLS_BUILD_CMDS
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index e12e945703..5ff477b6ec 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -31,7 +31,7 @@ QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBCHANNEL_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5WEBCHANNEL_BUILD_CMDS
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 295d24d16f..5fc6196d4a 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -38,12 +38,12 @@ endif
 QT5WEBKIT_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
 define QT5WEBKIT_PYTHON2_SYMLINK
 	mkdir -p $(@D)/host-bin
-	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/host-bin/python
+	ln -sf $(HOST_DIR)/bin/python2 $(@D)/host-bin/python
 endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
 define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5WEBKIT_BUILD_CMDS
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index bcbc56f1c7..dfe7ca83ef 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -31,7 +31,7 @@ QT5WEBSOCKETS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBSOCKETS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5WEBSOCKETS_BUILD_CMDS
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 7dc371cbac..dc8defb63d 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -24,7 +24,7 @@ QT5X11EXTRAS_REDISTRIBUTE = NO
 endif
 
 define QT5X11EXTRAS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5X11EXTRAS_BUILD_CMDS
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 123e1abf1a..81833459a1 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -27,7 +27,7 @@ QT5XMLPATTERNS_REDISTRIBUTE = NO
 endif
 
 define QT5XMLPATTERNS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5XMLPATTERNS_BUILD_CMDS
diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index bfe14ce74e..d9254f53c5 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -18,7 +18,7 @@ QT5CINEX_LICENSE = CC-BY-3.0
 QT5CINEX_LICENSE_FILES = README
 
 define QT5CINEX_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake
+	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake
 endef
 
 define QT5CINEX_BUILD_CMDS
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 88bc03fcb1..fb3fec20f5 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -38,7 +38,7 @@ define RUNC_CONFIGURE_CMDS
 endef
 
 define RUNC_BUILD_CMDS
-	cd $(@D) && $(RUNC_MAKE_ENV) $(HOST_DIR)/usr/bin/go \
+	cd $(@D) && $(RUNC_MAKE_ENV) $(HOST_DIR)/bin/go \
 		build -v -o $(@D)/bin/runc \
 		-tags "$(RUNC_GOTAGS)" -ldflags "$(RUNC_GLDFLAGS)" .
 endef
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 39c18852f1..23c3c091ca 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -66,7 +66,7 @@ endef
 
 define HOST_S6_RC_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install-dynlib install-bin
-	rm -f $(HOST_DIR)/usr/bin/s6-rc-dryrun
+	rm -f $(HOST_DIR)/bin/s6-rc-dryrun
 endef
 
 $(eval $(generic-package))
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 7fc65c01a9..c695f75979 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -20,13 +20,13 @@ endef
 
 # Since it's a prebuilt application and it does not conform to the
 # usual Unix hierarchy, we install it in $(HOST_DIR)/opt/sam-ba and
-# then create a symbolic link from $(HOST_DIR)/usr/bin to the
+# then create a symbolic link from $(HOST_DIR)/bin to the
 # application binary, for easier usage.
 
 define HOST_SAM_BA_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/opt/sam-ba/
 	cp -a $(@D)/* $(HOST_DIR)/opt/sam-ba/
-	ln -sf ../../opt/sam-ba/sam-ba $(HOST_DIR)/usr/bin/sam-ba
+	ln -sf ../../opt/sam-ba/sam-ba $(HOST_DIR)/bin/sam-ba
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 39fb258d0d..8e1e8a99f2 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -18,4 +18,4 @@ HOST_SCONS_INSTALL_OPTS = \
 $(eval $(host-python-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons $(if $(QUIET),-s)
+SCONS = $(HOST_DIR)/bin/python2 $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 532e3d036a..9aa74d5e65 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -73,7 +73,7 @@ HOST_SETOOLS_CONF_OPTS = \
 
 HOST_SETOOLS_CONF_ENV += \
 	am_cv_pathless_PYTHON=python \
-	ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
+	ac_cv_path_PYTHON=$(HOST_DIR)/bin/python \
 	am_cv_python_platform=linux2 \
 	am_cv_python_version=$(HOST_SETOOLS_PYTHON_VERSION) \
 	am_cv_python_pythondir=$(HOST_SETOOLS_PYTHON_SITE_PACKAGES) \
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 300c3e06a9..b31f0aaedc 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -8,7 +8,7 @@ SHARED_MIME_INFO_VERSION = 1.8
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.xz
 SHARED_MIME_INFO_SITE = https://people.freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
-SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
+SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/bin/xmllint
 SHARED_MIME_INFO_DEPENDENCIES = host-shared-mime-info libxml2 libglib2
 SHARED_MIME_INFO_CONF_OPTS = \
 	--disable-update-mimedb \
@@ -31,4 +31,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # shared-mime-info for the host
-SHARED_MIME_INFO_HOST_BINARY = $(HOST_DIR)/usr/bin/update-mime-database
+SHARED_MIME_INFO_HOST_BINARY = $(HOST_DIR)/bin/update-mime-database
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index ba46263f84..a4cc6bd77c 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -35,7 +35,7 @@ SOCAT_CONF_OPTS += --disable-readline
 endif
 
 define SOCAT_RUN_AUTOCONF
-	(cd $(@D); $(HOST_DIR)/usr/bin/autoconf)
+	(cd $(@D); $(HOST_DIR)/bin/autoconf)
 endef
 
 SOCAT_PRE_CONFIGURE_HOOKS += SOCAT_RUN_AUTOCONF
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 02226296fd..79949da4a1 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -40,7 +40,7 @@ define HOST_SOFTETHER_BUILD_CMDS
 endef
 
 define HOST_SOFTETHER_INSTALL_CMDS
-	$(INSTALL) -m 0755 $(@D)/src/hamcorebuilder/hamcorebuilder $(HOST_DIR)/usr/bin/hamcorebuilder
+	$(INSTALL) -m 0755 $(@D)/src/hamcorebuilder/hamcorebuilder $(HOST_DIR)/bin/hamcorebuilder
 endef
 
 $(eval $(autotools-package))
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 196f16275b..db94d06c54 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -11,7 +11,7 @@ SQLCIPHER_INSTALL_STAGING = YES
 
 SQLCIPHER_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) $(SQLCIPHER_CFLAGS)" \
-	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
+	TCLSH_CMD=$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)
 
 SQLCIPHER_CONF_OPTS = \
 	--enable-threadsafe \
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 65c39c1f0f..7fef338583 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -81,7 +81,7 @@ endef
 
 define HOST_SQUASHFS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_SQUASHFS_MAKE_ARGS) \
-		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
+		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/bin install
 endef
 
 $(eval $(generic-package))
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index c193769c10..3a44cf6fdd 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -9,7 +9,7 @@ SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPL-2.0+
 SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
-FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
+FEX2BIN = $(HOST_DIR)/bin/fex2bin
 
 define HOST_SUNXI_TOOLS_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" PREFIX=$(HOST_DIR) \
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 740b597c60..329455e618 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -18,19 +18,19 @@ SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 # CMake looks first at swig3.0, then swig2.0 and then swig. However,
 # when doing the search, it will look into the PATH for swig2.0 first,
 # and then for swig.
-# While the PATH contains first our $(HOST_DIR)/usr/bin, it also contains
+# While the PATH contains first our $(HOST_DIR)/bin, it also contains
 # /usr/bin and other system directories. Therefore, if there is an
 # installed swig3.0 on the system, it will get the preference over the
-# swig installed in $(HOST_DIR)/usr/bin, which isn't nice. To prevent
+# swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
 # this from happening we create a symbolic link swig3.0 -> swig, so that
 # our swig always gets used.
 
 define HOST_SWIG_INSTALL_SYMLINK
-	ln -fs swig $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
+	ln -fs swig $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
 endef
 
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
 
 $(eval $(host-autotools-package))
 
-SWIG = $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
+SWIG = $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d8872c46d7..00fdd921d2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -48,7 +48,7 @@ SYSTEMD_CONF_ENV = \
 	ac_cv_path_KMOD=/usr/bin/kmod
 
 define SYSTEMD_RUN_INTLTOOLIZE
-	cd $(@D) && $(HOST_DIR)/usr/bin/intltoolize --force --automake
+	cd $(@D) && $(HOST_DIR)/bin/intltoolize --force --automake
 endef
 SYSTEMD_PRE_CONFIGURE_HOOKS += SYSTEMD_RUN_INTLTOOLIZE
 
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index 9eb3b7dbe9..bd98dd641e 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -10,6 +10,6 @@ TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VE
 TCLLIB_LICENSE = tcl license
 TCLLIB_LICENSE_FILES = license.terms
 TCLLIB_DEPENDENCIES = host-tcl
-TCLLIB_CONF_ENV = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)"
+TCLLIB_CONF_ENV = ac_cv_path_tclsh="$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)"
 
 $(eval $(autotools-package))
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index a62a8e8a0d..dbfec2ed36 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -11,6 +11,6 @@ TERMINOLOGY_LICENSE = BSD-2-Clause
 TERMINOLOGY_LICENSE_FILES = COPYING
 
 TERMINOLOGY_DEPENDENCIES = efl host-pkgconf
-TERMINOLOGY_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
+TERMINOLOGY_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/bin/edje_cc
 
 $(eval $(autotools-package))
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 185e1ec1c3..cbd5401dce 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -63,7 +63,7 @@ endef
 THRIFT_POST_PATCH_HOOKS += THRIFT_TOOL_NO_HARDCODE
 
 define THRIFT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) THRIFT=$(HOST_DIR)/usr/bin/thrift -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) THRIFT=$(HOST_DIR)/bin/thrift -C $(@D)
 endef
 
 # Install runtime only
@@ -75,4 +75,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # to be used by other packages
-THRIFT = $(HOST_DIR)/usr/bin/thrift
+THRIFT = $(HOST_DIR)/bin/thrift
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 0336019bc0..86b1d964b2 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -79,7 +79,7 @@ define TVHEADEND_CONFIGURE_CMDS
 			--arch="$(ARCH)"			\
 			--cpu="$(BR2_GCC_TARGET_CPU)"		\
 			--nowerror				\
-			--python="$(HOST_DIR)/usr/bin/python"	\
+			--python="$(HOST_DIR)/bin/python"	\
 			--enable-dvbscan			\
 			--enable-bundle				\
 			--enable-pngquant			\
@@ -90,7 +90,7 @@ define TVHEADEND_CONFIGURE_CMDS
 endef
 
 define TVHEADEND_FIX_PNGQUANT_PATH
-	$(SED) "s%^pngquant_bin =.*%pngquant_bin = '$(HOST_DIR)/usr/bin/pngquant'%" \
+	$(SED) "s%^pngquant_bin =.*%pngquant_bin = '$(HOST_DIR)/bin/pngquant'%" \
 		$(@D)/support/mkbundle
 endef
 TVHEADEND_POST_CONFIGURE_HOOKS += TVHEADEND_FIX_PNGQUANT_PATH
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 2585c7b60a..7f808f6917 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -102,9 +102,9 @@ define HOST_UBOOT_TOOLS_BUILD_CMDS
 endef
 
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin/mkimage
-	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/usr/bin/mkenvimage
-	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/usr/bin/dumpimage
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/bin/mkimage
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/bin/mkenvimage
+	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
 endef
 
 $(eval $(generic-package))
@@ -112,7 +112,7 @@ $(eval $(host-generic-package))
 
 # Convenience variables for other mk files that make use of mkimage
 
-MKIMAGE = $(HOST_DIR)/usr/bin/mkimage
+MKIMAGE = $(HOST_DIR)/bin/mkimage
 
 # mkimage supports arm blackfin m68k microblaze mips mips64 nios2 powerpc ppc sh sparc sparc64 x86
 # KERNEL_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 45bb6dede8..0dcc8ff8c5 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -450,10 +450,10 @@ endef
 # STATIC has no ld* tools, only getconf
 ifeq ($(BR2_STATIC_LIBS),)
 define UCLIBC_INSTALL_UTILS_STAGING
-	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd
-	ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd
-	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig
-	ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig
+	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/bin/ldd
+	ln -sf ldd $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ldd
+	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/bin/ldconfig
+	ln -sf ldconfig $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ldconfig
 endef
 endif
 
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 5ed86b3d92..eec88c743a 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -23,7 +23,7 @@ endef
 
 # UPX has no install procedure, so install it manually.
 define HOST_UPX_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/upx.out $(HOST_DIR)/usr/bin/upx
+	$(INSTALL) -D -m 0755 $(@D)/src/upx.out $(HOST_DIR)/bin/upx
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 0ef3000d76..ad0a5650f7 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -20,12 +20,12 @@ HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
 # Otherwise we'll get host directory data which isn't enough
 define HOST_VALA_INSTALL_WRAPPER
 	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
-		$(HOST_DIR)/usr/bin/vala
+		$(HOST_DIR)/bin/vala
 	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
-		$(HOST_DIR)/usr/bin/valac
+		$(HOST_DIR)/bin/valac
 	$(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
-		$(HOST_DIR)/usr/bin/vala \
-		$(HOST_DIR)/usr/bin/valac
+		$(HOST_DIR)/bin/vala \
+		$(HOST_DIR)/bin/valac
 endef
 HOST_VALA_POST_INSTALL_HOOKS += HOST_VALA_INSTALL_WRAPPER
 
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 36b5fd3ea8..d6f843e66a 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -359,9 +359,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPTS += --enable-qt
 VLC_CONF_ENV += \
-	ac_cv_path_MOC=$(HOST_DIR)/usr/bin/moc \
-	ac_cv_path_RCC=$(HOST_DIR)/usr/bin/rcc \
-	ac_cv_path_UIC=$(HOST_DIR)/usr/bin/uic
+	ac_cv_path_MOC=$(HOST_DIR)/bin/moc \
+	ac_cv_path_RCC=$(HOST_DIR)/bin/rcc \
+	ac_cv_path_UIC=$(HOST_DIR)/bin/uic
 VLC_DEPENDENCIES += qt
 else
 VLC_CONF_OPTS += --disable-qt
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 3d61f267e6..e7ac891b39 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -13,7 +13,7 @@ define HOST_WAF_EXTRACT_CMDS
 endef
 
 define HOST_WAF_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/waf $(HOST_DIR)/usr/bin/waf
+	$(INSTALL) -D -m 0755 $(@D)/waf $(HOST_DIR)/bin/waf
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 14c29431fc..20371e3798 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -44,9 +44,9 @@ WIRESHARK_DEPENDENCIES += qt5base qt5tools
 WIRESHARK_CONF_ENV += ac_cv_path_QTCHOOSER=""
 # Seems it expects wrappers and passes a -qt=X parameter for version
 WIRESHARK_MAKE_OPTS += \
-	MOC="$(HOST_DIR)/usr/bin/moc" \
-	RCC="$(HOST_DIR)/usr/bin/rcc" \
-	UIC="$(HOST_DIR)/usr/bin/uic"
+	MOC="$(HOST_DIR)/bin/moc" \
+	RCC="$(HOST_DIR)/bin/rcc" \
+	UIC="$(HOST_DIR)/bin/uic"
 else
 WIRESHARK_CONF_OPTS += --with-qt=no
 endif
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index ba42418633..32edbb9e90 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -23,8 +23,8 @@ LIBXCB_CONF_OPTS = --with-doxygen=no
 HOST_LIBXCB_CONF_OPTS = --with-doxygen=no
 
 # libxcb is not python3 friendly, so force the python interpreter
-HOST_LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
-LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
+HOST_LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
+LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 85a6884aee..9f01838688 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ADOBE_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/f
 XFONT_FONT_ADOBE_100DPI_LICENSE = MIT
 XFONT_FONT_ADOBE_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index bb0a184322..1a8af2bd59 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ADOBE_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_ADOBE_75DPI_LICENSE = MIT
 XFONT_FONT_ADOBE_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 390ca6784a..4ff89f6b1a 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ADOBE_UTOPIA_100DPI_SITE = http://xorg.freedesktop.org/releases/indiv
 XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index 7ecd46ef11..61005f79bd 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = http://xorg.freedesktop.org/releases/indivi
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 6c780e20dc..9264eaf436 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ADOBE_UTOPIA_TYPE1_SITE = http://xorg.freedesktop.org/releases/indivi
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index e2ac2363df..f6b3008aa0 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ALIAS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ALIAS_LICENSE = MIT
 XFONT_FONT_ALIAS_LICENSE_FILES = COPYING
 
-XFONT_FONT_ALIAS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ALIAS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ALIAS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ALIAS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index fa1269b41d..0043a00c48 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ARABIC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_ARABIC_MISC_LICENSE = MIT
 XFONT_FONT_ARABIC_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index fb1665898f..9197272785 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_100DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index c8ade590b8..62bee4202c 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_75DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index a1b61db4c8..0f039a1d48 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SITE = http://xorg.freedesktop.org/release
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 00a6bd6dc7..892f9eeab5 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SITE = http://xorg.freedesktop.org/releases
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index f393dd3244..f4fcde9c2a 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_TTF_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_TTF_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_TTF_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_TTF_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_TTF_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_TTF_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_TTF_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index bf418d52cb..f5e6e89242 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BH_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_TYPE1_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index 5ddca73e7c..931058f77c 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BITSTREAM_100DPI_SITE = http://xorg.freedesktop.org/releases/individu
 XFONT_FONT_BITSTREAM_100DPI_LICENSE = MIT
 XFONT_FONT_BITSTREAM_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index d7fea275bc..9e77524343 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BITSTREAM_75DPI_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_BITSTREAM_75DPI_LICENSE = MIT
 XFONT_FONT_BITSTREAM_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 813e3cb5a8..a4d4f73ccd 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -10,8 +10,8 @@ XFONT_FONT_BITSTREAM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_BITSTREAM_TYPE1_LICENSE = MIT
 XFONT_FONT_BITSTREAM_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 6dc9015236..83ded01ef4 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -10,8 +10,8 @@ XFONT_FONT_CRONYX_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_CRONYX_CYRILLIC_LICENSE = MIT
 XFONT_FONT_CRONYX_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 59d6a84003..00867a6f26 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_CURSOR_MISC_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_CURSOR_MISC_LICENSE = unencumbered
 XFONT_FONT_CURSOR_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index 59a84c701c..f33088eb50 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -9,8 +9,8 @@ XFONT_FONT_DAEWOO_MISC_SOURCE = font-daewoo-misc-$(XFONT_FONT_DAEWOO_MISC_VERSIO
 XFONT_FONT_DAEWOO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DAEWOO_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index b26296d2d0..fd7e286561 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_DEC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DEC_MISC_LICENSE = MIT
 XFONT_FONT_DEC_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 6cec198686..045a6bfe2a 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -10,8 +10,8 @@ XFONT_FONT_IBM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_IBM_TYPE1_LICENSE = IBM/MIT X Consortium Courier Typefont agreement (no modification)
 XFONT_FONT_IBM_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 4ac4b9b14d..7ca1388e1f 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_ISAS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ISAS_MISC_LICENSE = MIT
 XFONT_FONT_ISAS_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 5f8b00161a..12cf8c863c 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -9,8 +9,8 @@ XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.bz
 XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_JIS_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 11b4199e4b..ea119b63bc 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MICRO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/fon
 XFONT_FONT_MICRO_MISC_LICENSE = Public Domain
 XFONT_FONT_MICRO_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 16fd46b09d..d72f988589 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MISC_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/
 XFONT_FONT_MISC_CYRILLIC_LICENSE = MIT / Public Domain
 XFONT_FONT_MISC_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index 7d0825ee5c..8214040f9f 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MISC_ETHIOPIC_SITE = http://xorg.freedesktop.org/releases/individual/
 XFONT_FONT_MISC_ETHIOPIC_LICENSE = MIT
 XFONT_FONT_MISC_ETHIOPIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index 5667869951..1b801df60c 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MISC_MELTHO_SITE = http://xorg.freedesktop.org/releases/individual/fo
 XFONT_FONT_MISC_MELTHO_LICENSE = Meltho License
 XFONT_FONT_MISC_MELTHO_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index 700837c1ed..f9e1ba6481 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MISC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_MISC_LICENSE = Public Domain
 XFONT_FONT_MISC_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 53fc192a9a..1312e379c5 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_MUTT_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MUTT_MISC_LICENSE = MIT
 XFONT_FONT_MUTT_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 0fa4d39616..65256ad977 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_SCHUMACHER_MISC_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_SCHUMACHER_MISC_LICENSE = MIT
 XFONT_FONT_SCHUMACHER_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index 8158ce5614..5687fd66cf 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -10,8 +10,8 @@ XFONT_FONT_SCREEN_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individua
 XFONT_FONT_SCREEN_CYRILLIC_LICENSE = MIT
 XFONT_FONT_SCREEN_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 035255f77a..f13fca5da3 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_SONY_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SONY_MISC_LICENSE = MIT
 XFONT_FONT_SONY_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 395cb87e76..4b1a06c0a8 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -10,8 +10,8 @@ XFONT_FONT_SUN_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SUN_MISC_LICENSE = MIT
 XFONT_FONT_SUN_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 665fb90896..f8945227ef 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -10,8 +10,8 @@ XFONT_FONT_WINITZKI_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individ
 XFONT_FONT_WINITZKI_CYRILLIC_LICENSE = Public Domain
 XFONT_FONT_WINITZKI_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index e1a2ef6067..5aced63097 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -10,8 +10,8 @@ XFONT_FONT_XFREE86_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/
 XFONT_FONT_XFREE86_TYPE1_LICENSE = MIT
 XFONT_FONT_XFREE86_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
+XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
 XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(autotools-package))
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 7214c967f1..8a90add79e 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -15,7 +15,7 @@ X264_CONF_OPTS = --disable-avs
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 # yasm needed for assembly files
 X264_DEPENDENCIES += host-yasm
-X264_CONF_ENV += AS="$(HOST_DIR)/usr/bin/yasm"
+X264_CONF_ENV += AS="$(HOST_DIR)/bin/yasm"
 else ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_aarch64),y)
 # We need to pass gcc as AS, because the ARM assembly files have to be
 # preprocessed
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 2e388fc3c1..b3d4b8e972 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -19,7 +19,7 @@ endif
 
 XEN_CONF_OPTS = --disable-ocamltools
 
-XEN_CONF_ENV = PYTHON=$(HOST_DIR)/usr/bin/python2
+XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python2
 XEN_MAKE_ENV = \
 	XEN_TARGET_ARCH=$(XEN_ARCH) \
 	CROSS_COMPILE=$(TARGET_CROSS) \
diff --git a/package/yaffs2utils/yaffs2utils.mk b/package/yaffs2utils/yaffs2utils.mk
index 927ffd6a11..c2a87eac7b 100644
--- a/package/yaffs2utils/yaffs2utils.mk
+++ b/package/yaffs2utils/yaffs2utils.mk
@@ -15,7 +15,7 @@ define HOST_YAFFS2UTILS_BUILD_CMDS
 endef
 
 define HOST_YAFFS2UTILS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLDIR=$(HOST_DIR)/usr/bin install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLDIR=$(HOST_DIR)/bin install
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
index f5f2f10d1d..3648c63654 100644
--- a/package/zynq-boot-bin/zynq-boot-bin.mk
+++ b/package/zynq-boot-bin/zynq-boot-bin.mk
@@ -16,7 +16,7 @@ define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
 endef
 
 define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/$(ZYNQ_BOOT_BIN_SOURCE) $(HOST_DIR)/usr/bin/$(ZYNQ_BOOT_BIN_SOURCE)
+	$(INSTALL) -D -m 0755 $(@D)/$(ZYNQ_BOOT_BIN_SOURCE) $(HOST_DIR)/bin/$(ZYNQ_BOOT_BIN_SOURCE)
 endef
 
 $(eval $(host-generic-package))
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 8002278a3b..39341f9573 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -13,6 +13,6 @@ BR2_CMAKE_VERSION_MIN = 3.1
 BR2_CMAKE ?= cmake
 ifeq ($(call suitable-host-package,cmake,\
 	$(BR2_CMAKE) $(BR2_CMAKE_VERSION_MIN)),)
-BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
+BR2_CMAKE = $(HOST_DIR)/bin/cmake
 BR2_CMAKE_HOST_DEPENDENCY = host-cmake
 endif
diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
index 6acfdc6dfa..00cdd0a236 100644
--- a/support/dependencies/check-host-lzip.mk
+++ b/support/dependencies/check-host-lzip.mk
@@ -1,5 +1,5 @@
 ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
 DEPENDENCIES_HOST_PREREQ += host-lzip
 EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
-LZCAT = $(HOST_DIR)/usr/bin/lzip -d -c
+LZCAT = $(HOST_DIR)/bin/lzip -d -c
 endif
diff --git a/support/dependencies/check-host-tar.mk b/support/dependencies/check-host-tar.mk
index 9840a55e28..ad0b32e277 100644
--- a/support/dependencies/check-host-tar.mk
+++ b/support/dependencies/check-host-tar.mk
@@ -2,5 +2,5 @@ TAR ?= tar
 
 ifeq (,$(call suitable-host-package,tar,$(TAR)))
 DEPENDENCIES_HOST_PREREQ += host-tar
-TAR = $(HOST_DIR)/usr/bin/tar
+TAR = $(HOST_DIR)/bin/tar
 endif
diff --git a/support/dependencies/check-host-xzcat.mk b/support/dependencies/check-host-xzcat.mk
index c6d9eebe4d..9be75c7311 100644
--- a/support/dependencies/check-host-xzcat.mk
+++ b/support/dependencies/check-host-xzcat.mk
@@ -4,5 +4,5 @@
 ifeq (,$(call suitable-host-package,xzcat,$(XZCAT)))
 DEPENDENCIES_HOST_PREREQ += host-xz
 EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .xz .lzma
-XZCAT = $(HOST_DIR)/usr/bin/xzcat
+XZCAT = $(HOST_DIR)/bin/xzcat
 endif
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 9dc6e31df3..364173bd5a 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -55,7 +55,7 @@
 #  so we're sure the correct configuration is always used and the
 #  toolchain behaves similar to an internal toolchain.
 #  This toolchain wrapper and symlinks are installed into
-#  $(HOST_DIR)/usr/bin like for the internal toolchains, and the rest
+#  $(HOST_DIR)/bin like for the internal toolchains, and the rest
 #  of Buildroot is handled identical for the 2 toolchain types.
 ################################################################################
 
@@ -231,13 +231,13 @@ endif
 
 #
 # The following functions creates the symbolic links needed to get the
-# cross-compilation tools visible in $(HOST_DIR)/usr/bin. Some of
+# cross-compilation tools visible in $(HOST_DIR)/bin. Some of
 # links are done directly to the corresponding tool in the external
 # toolchain installation directory, while some other links are done to
 # the toolchain wrapper (preprocessor, C, C++ and Fortran compiler)
 #
 # We skip gdb symlink when we are building our own gdb to prevent two
-# gdb's in $(HOST_DIR)/usr/bin.
+# gdb's in $(HOST_DIR)/bin.
 #
 # The LTO support in gcc creates wrappers for ar, ranlib and nm which load
 # the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
@@ -246,7 +246,7 @@ endif
 # match the *cc-* pattern. Therefore, an additional case is added for *-ar,
 # *-ranlib and *-nm.
 define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
-	$(Q)cd $(HOST_DIR)/usr/bin; \
+	$(Q)cd $(HOST_DIR)/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
 		case "$$base" in \
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 3a4455ff82..9778d0b0a4 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -208,14 +208,14 @@ int main(int argc, char **argv)
 #elif defined(BR_CROSS_PATH_ABS)
 	ret = snprintf(path, sizeof(path), BR_CROSS_PATH_ABS "/%s" BR_CROSS_PATH_SUFFIX, basename);
 #else
-	ret = snprintf(path, sizeof(path), "%s/usr/bin/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
+	ret = snprintf(path, sizeof(path), "%s/bin/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
 #endif
 	if (ret >= sizeof(path)) {
 		perror(__FILE__ ": overflow");
 		return 3;
 	}
 #ifdef BR_CCACHE
-	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/usr/bin/ccache", absbasedir);
+	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/bin/ccache", absbasedir);
 	if (ret >= sizeof(ccache_path)) {
 		perror(__FILE__ ": overflow");
 		return 3;
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index c7b50195d3..7f72a0cade 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -44,5 +44,5 @@ endef
 
 define TOOLCHAIN_WRAPPER_INSTALL
 	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper \
-		$(HOST_DIR)/usr/bin/toolchain-wrapper
+		$(HOST_DIR)/bin/toolchain-wrapper
 endef
-- 
2.11.0
