From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:31:15 +0200
Subject: [Buildroot] [PATCH 07/15] package: remove useless arguments from
	GENTARGETS
In-Reply-To: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a77b71b25996dcc8c7f28e2816790d1e0564116a.1314826231.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to the pkgdir and pkgname functions, we can rewrite the
GENTARGETS macro in a way that avoids the need for each package to
repeat its name and the directory in which it is present.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk                |    2 +-
 boot/at91dataflashboot/at91dataflashboot.mk        |    2 +-
 boot/barebox/barebox.mk                            |    2 +-
 boot/syslinux/syslinux.mk                          |    2 +-
 boot/uboot/uboot.mk                                |    2 +-
 boot/xloader/xloader.mk                            |    2 +-
 linux/linux.mk                                     |    2 +-
 package/Makefile.package.in                        |   10 ++++------
 package/acpid/acpid.mk                             |    2 +-
 package/axel/axel.mk                               |    2 +-
 package/bsdiff/bsdiff.mk                           |    2 +-
 package/busybox/busybox.mk                         |    2 +-
 package/bzip2/bzip2.mk                             |    4 ++--
 package/cgilua/cgilua.mk                           |    2 +-
 package/cloop/cloop.mk                             |    4 ++--
 package/cmake/cmake.mk                             |    4 ++--
 package/copas/copas.mk                             |    2 +-
 package/coxpcall/coxpcall.mk                       |    2 +-
 package/cramfs/cramfs.mk                           |    4 ++--
 package/dhcpdump/dhcpdump.mk                       |    2 +-
 package/dhrystone/dhrystone.mk                     |    2 +-
 package/dnsmasq/dnsmasq.mk                         |    2 +-
 package/dosfstools/dosfstools.mk                   |    2 +-
 package/dsp-tools/dsp-tools.mk                     |    2 +-
 package/ebtables/ebtables.mk                       |    2 +-
 package/eeprog/eeprog.mk                           |    2 +-
 package/ezxml/ezxml.mk                             |    2 +-
 package/fbgrab/fbgrab.mk                           |    2 +-
 package/fbset/fbset.mk                             |    2 +-
 package/fconfig/fconfig.mk                         |    2 +-
 package/gadgetfs-test/gadgetfs-test.mk             |    2 +-
 package/gdisk/gdisk.mk                             |    2 +-
 package/genromfs/genromfs.mk                       |    4 ++--
 package/hdparm/hdparm.mk                           |    2 +-
 package/hwdata/hwdata.mk                           |    2 +-
 package/i2c-tools/i2c-tools.mk                     |    2 +-
 package/input-event-daemon/input-event-daemon.mk   |    2 +-
 package/input-tools/input-tools.mk                 |    2 +-
 package/iostat/iostat.mk                           |    2 +-
 package/iproute2/iproute2.mk                       |    2 +-
 package/irda-utils/irda-utils.mk                   |    2 +-
 package/iw/iw.mk                                   |    2 +-
 package/libaio/libaio.mk                           |    2 +-
 package/libcap/libcap.mk                           |    4 ++--
 package/liberation/liberation.mk                   |    2 +-
 package/libnss/libnss.mk                           |    2 +-
 package/libroxml/libroxml.mk                       |    2 +-
 package/libsvgtiny/libsvgtiny.mk                   |    2 +-
 package/libv4l/libv4l.mk                           |    2 +-
 package/libxml-parser-perl/libxml-parser-perl.mk   |    4 ++--
 package/linux-fusion/linux-fusion.mk               |    2 +-
 package/lm-sensors/lm-sensors.mk                   |    2 +-
 package/lmbench/lmbench.mk                         |    2 +-
 package/lockfile-progs/lockfile-progs.mk           |    2 +-
 package/logrotate/logrotate.mk                     |    2 +-
 package/lsof/lsof.mk                               |    2 +-
 package/ltrace/ltrace.mk                           |    2 +-
 package/lua/lua.mk                                 |    2 +-
 package/luafilesystem/luafilesystem.mk             |    2 +-
 package/luasocket/luasocket.mk                     |    2 +-
 package/makedevs/makedevs.mk                       |    4 ++--
 package/memstat/memstat.mk                         |    2 +-
 package/memtester/memtester.mk                     |    2 +-
 package/midori/midori.mk                           |    2 +-
 package/mii-diag/mii-diag.mk                       |    2 +-
 package/mrouted/mrouted.mk                         |    2 +-
 package/mtd/mtd.mk                                 |    4 ++--
 package/multimedia/gst-dsp/gst-dsp.mk              |    2 +-
 package/multimedia/gst-omapfb/gst-omapfb.mk        |    2 +-
 package/multimedia/live555/live555.mk              |    2 +-
 package/multimedia/mplayer/mplayer.mk              |    2 +-
 package/multimedia/python-mad/python-mad.mk        |    2 +-
 .../multimedia/tidsp-binaries/tidsp-binaries.mk    |    2 +-
 package/netplug/netplug.mk                         |    2 +-
 package/nuttcp/nuttcp.mk                           |    2 +-
 package/olsr/olsr.mk                               |    2 +-
 package/openssl/openssl.mk                         |    2 +-
 package/pciutils/pciutils.mk                       |    2 +-
 package/portmap/portmap.mk                         |    2 +-
 package/pppd/pppd.mk                               |    2 +-
 package/pptp-linux/pptp-linux.mk                   |    2 +-
 package/procps/procps.mk                           |    2 +-
 package/python-serial/python-serial.mk             |    2 +-
 package/qt/qt.mk                                   |    2 +-
 package/rings/rings.mk                             |    2 +-
 package/rsh-redone/rsh-redone.mk                   |    2 +-
 package/slang/slang.mk                             |    2 +-
 package/squashfs/squashfs.mk                       |    4 ++--
 package/squashfs3/squashfs3.mk                     |    4 ++--
 package/sredird/sredird.mk                         |    2 +-
 package/sstrip/sstrip.mk                           |    4 ++--
 package/statserial/statserial.mk                   |    2 +-
 package/sysklogd/sysklogd.mk                       |    2 +-
 package/sysvinit/sysvinit.mk                       |    2 +-
 package/ti-utils/ti-utils.mk                       |    2 +-
 package/uboot-tools/uboot-tools.mk                 |    4 ++--
 package/usb_modeswitch/usb_modeswitch.mk           |    2 +-
 package/usbmount/usbmount.mk                       |    2 +-
 package/vsftpd/vsftpd.mk                           |    2 +-
 package/whetstone/whetstone.mk                     |    2 +-
 package/wipe/wipe.mk                               |    2 +-
 package/wireless_tools/wireless_tools.mk           |    2 +-
 package/wsapi/wsapi.mk                             |    2 +-
 package/xavante/xavante.mk                         |    2 +-
 package/xl2tp/xl2tp.mk                             |    2 +-
 package/zlib/zlib.mk                               |    4 ++--
 106 files changed, 123 insertions(+), 125 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 871b0ff..a7a856c 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -29,7 +29,7 @@ define AT91BOOTSTRAP_INSTALL_IMAGES_CMDS
 	cp $(@D)/$(AT91BOOTSTRAP_BINARY) $(BINARIES_DIR)
 endef
 
-$(eval $(call GENTARGETS,boot,at91bootstrap))
+$(eval $(call GENTARGETS))
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
 # we NEED a board name unless we're at make source
diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 14fb8c5..6c0188a 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -19,4 +19,4 @@ define AT91DATAFLASHBOOT_INSTALL_IMAGES_CMDS
 	cp $(@D)/DataflashBoot-$(AT91DATAFLASHBOOT_VERSION).bin $(BINARIES_DIR)
 endef
 
-$(eval $(call GENTARGETS,boot,at91dataflashboot))
+$(eval $(call GENTARGETS))
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index d3143e6..c6af143 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -51,7 +51,7 @@ define BAREBOX_INSTALL_TARGET_CMDS
 endef
 endif
 
-$(eval $(call GENTARGETS,boot,barebox))
+$(eval $(call GENTARGETS))
 
 ifeq ($(BR2_TARGET_BAREBOX),y)
 # we NEED a board defconfig file unless we're at make source
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 686124f..fa5af07 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -26,4 +26,4 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS,boot,syslinux))
+$(eval $(call GENTARGETS))
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 776bdef..0be5e5c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -88,7 +88,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
 endef
 
-$(eval $(call GENTARGETS,boot,uboot))
+$(eval $(call GENTARGETS))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
 # we NEED a board name unless we're at make source
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index 8d8cce3..e8dd380 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -19,7 +19,7 @@ define XLOADER_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/MLO $(BINARIES_DIR)/
 endef
 
-$(eval $(call GENTARGETS,boot,xloader))
+$(eval $(call GENTARGETS))
 
 #############################################################
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 6662f7b..984871b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -177,7 +177,7 @@ define LINUX_INSTALL_TARGET_CMDS
 	fi
 endef
 
-$(eval $(call GENTARGETS,,linux))
+$(eval $(call GENTARGETS))
 
 linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX_DIR)/.stamp_configured
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 9755b95..c4bb2a2 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -646,18 +646,16 @@ endef # GENTARGETS_INNER
 ################################################################################
 # GENTARGETS -- the target generator macro for generic packages
 #
-# Argument 1 is the package directory prefix [mandatory]
-# Argument 2 is the lowercase package name   [mandatory]
-# Argument 3 is "target" or "host"           [optional, default: "target"]
+# Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
 define GENTARGETS
-ifeq ($(3),host)
+ifeq ($(1),host)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-$(call GENTARGETS_INNER,$(3)-$(2),$(call UPPERCASE,$(3)-$(2)),$(call UPPERCASE,$(2)),$(1),host)
+$(call GENTARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
 else
 # In the case of target packages, keep the package name "pkg"
-$(call GENTARGETS_INNER,$(2),$(call UPPERCASE,$(2)),$(call UPPERCASE,$(2)),$(1),target)
+$(call GENTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
 endif
 endef
 
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index d61ca41..c96512b 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -30,4 +30,4 @@ define ACPID_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,acpid))
+$(eval $(call GENTARGETS))
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 1bf4d81..91f6d1e 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -44,4 +44,4 @@ define AXEL_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,axel))
+$(eval $(call GENTARGETS))
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 276c6be..66a7722 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -28,4 +28,4 @@ define BSDIFF_CLEAN_CMDS
 	rm -f $(@D)/bsdiff $(@D)/bspatch
 endef
 
-$(eval $(call GENTARGETS,package,bsdiff))
+$(eval $(call GENTARGETS))
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1782a73..0751f6a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -176,7 +176,7 @@ define BUSYBOX_CLEAN_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,busybox))
+$(eval $(call GENTARGETS))
 
 busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 123e579..d3bb2b0 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -101,5 +101,5 @@ define HOST_BZIP2_INSTALL_CMDS
 	$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
 endef
 
-$(eval $(call GENTARGETS,package,bzip2))
-$(eval $(call GENTARGETS,package,bzip2,host))
\ No newline at end of file
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
\ No newline at end of file
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 9d524cd..d46c2a6 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -17,4 +17,4 @@ define CGILUA_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/cgilua.lua"
 endef
 
-$(eval $(call GENTARGETS,package,cgilua))
+$(eval $(call GENTARGETS))
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index fa47a5f..52567dd 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -14,5 +14,5 @@ define HOST_CLOOP_INSTALL_CMDS
 	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
 endef
 
-$(eval $(call GENTARGETS,package,cloop))
-$(eval $(call GENTARGETS,package,cloop,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1b458c2..af88eea 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -17,5 +17,5 @@ define HOST_CMAKE_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-$(eval $(call GENTARGETS,package,cmake))
-$(eval $(call GENTARGETS,package,cmake,host))
\ No newline at end of file
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 1baed83..28b822c 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -17,4 +17,4 @@ define COPAS_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/copas.lua"
 endef
 
-$(eval $(call GENTARGETS,package,copas))
+$(eval $(call GENTARGETS))
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index b947571..81125d7 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -17,4 +17,4 @@ define COXPCALL_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/coxpcall.lua"
 endef
 
-$(eval $(call GENTARGETS,package,coxpcall))
+$(eval $(call GENTARGETS))
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 9073ae5..4a0ec1c 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -29,5 +29,5 @@ define HOST_CRAMFS_INSTALL_CMDS
  install -D -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin/cramfsck
 endef
 
-$(eval $(call GENTARGETS,package,cramfs))
-$(eval $(call GENTARGETS,package,cramfs,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index cca6749..dd454bf 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -18,4 +18,4 @@ define DHCPDUMP_INSTALL_TARGET_CMDS
 	install -m 0755 -D $(@D)/dhcpdump $(TARGET_DIR)/usr/bin/dhcpdump
 endef
 
-$(eval $(call GENTARGETS,package,dhcpdump))
+$(eval $(call GENTARGETS))
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index a03beec..45eb91c 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -24,7 +24,7 @@ define DHRYSTONE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/dhrystone
 endef
 
-$(eval $(call GENTARGETS,package,dhrystone))
+$(eval $(call GENTARGETS))
 
 $(BUILD_DIR)/dhrystone-$(DHRYSTONE_VERSION)/.stamp_extracted:
 	@$(call MESSAGE,"Extracting")
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index d8f4d77..5b7ec0d 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -64,4 +64,4 @@ define DNSMASQ_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/dnsmasq.8
 endef
 
-$(eval $(call GENTARGETS,package,dnsmasq))
+$(eval $(call GENTARGETS))
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index c2d763d..e1b6a33 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -34,4 +34,4 @@ define DOSFSTOOLS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,dosfstools))
+$(eval $(call GENTARGETS))
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index ab31afb..b9fed0b 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -15,4 +15,4 @@ define DSP_TOOLS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/dsp-, load probe test exec)
 endef
 
-$(eval $(call GENTARGETS,package,dsp-tools))
+$(eval $(call GENTARGETS))
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 67c0d92..6cfdfdc 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -27,4 +27,4 @@ define EBTABLES_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/ebtables
 endef
 
-$(eval $(call GENTARGETS,package,ebtables))
+$(eval $(call GENTARGETS))
diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index e61aecb..40b059e 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -19,4 +19,4 @@ define EEPROG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/eeprog
 endef
 
-$(eval $(call GENTARGETS,package,eeprog))
+$(eval $(call GENTARGETS))
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 58d2624..321e466 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -37,4 +37,4 @@ define EZXML_CLEAN_CMDS
 	-$(MAKE) -C $(@D) -f GNUmakefile clean
 endef
 
-$(eval $(call GENTARGETS,package,ezxml))
+$(eval $(call GENTARGETS))
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 37f82ea..892043e 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -15,4 +15,4 @@ define FBGRAB_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/fbgrab
 endef
 
-$(eval $(call GENTARGETS,package,fbgrab))
+$(eval $(call GENTARGETS))
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index b5b5ab8..95d8aa7 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -29,4 +29,4 @@ define FBSET_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,fbset))
+$(eval $(call GENTARGETS))
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index c595678..8144a16 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -25,4 +25,4 @@ define FCONFIG_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,fconfig))
+$(eval $(call GENTARGETS))
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 1464ec1..46bfd24 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -29,4 +29,4 @@ define GADGETFS_TEST_CLEAN_CMDS
 	-$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS) clean
 endef
 
-$(eval $(call GENTARGETS,package,gadgetfs-test))
+$(eval $(call GENTARGETS))
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
index bc7bc32..a53ee83 100644
--- a/package/gdisk/gdisk.mk
+++ b/package/gdisk/gdisk.mk
@@ -36,4 +36,4 @@ endef
 
 endif
 
-$(eval $(call GENTARGETS,package,gdisk))
+$(eval $(call GENTARGETS))
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 10b8d7d..d6f4875 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -27,5 +27,5 @@ define HOST_GENROMFS_INSTALL_CMDS
   $(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
-$(eval $(call GENTARGETS,package,genromfs))
-$(eval $(call GENTARGETS,package,genromfs,host))
\ No newline at end of file
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
\ No newline at end of file
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 4e3cfe5..d19dff0 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -33,4 +33,4 @@ define HDPARM_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,hdparm))
+$(eval $(call GENTARGETS))
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 7a0cef8..e4f72a5 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -18,4 +18,4 @@ define HWDATA_UNINSTALL_TARGET_CMDS
 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 endef
 
-$(eval $(call GENTARGETS,package,hwdata))
+$(eval $(call GENTARGETS))
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index d96bad3..8628eaf 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -19,4 +19,4 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS,package,i2c-tools))
+$(eval $(call GENTARGETS))
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index c335be3..a938ae7 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -33,4 +33,4 @@ define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/input-event-daemon.conf
 endef
 
-$(eval $(call GENTARGETS,package,input-event-daemon))
+$(eval $(call GENTARGETS))
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index daf0755..9dc4eee 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -45,4 +45,4 @@ define INPUT_TOOLS_CLEAN_CMDS
 	rm -f $(addprefix $(@D)/,$(INPUT_TOOLS_TARGETS_y))
 endef
 
-$(eval $(call GENTARGETS,package,input-tools))
+$(eval $(call GENTARGETS))
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index de7e1ff..83eea07 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -28,4 +28,4 @@ define IOSTAT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/iostat.8
 endef
 
-$(eval $(call GENTARGETS,package,iostat))                                                   
+$(eval $(call GENTARGETS))
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 0e6a431..dd2506c 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -54,4 +54,4 @@ define IPROUTE2_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/sbin/, $(IPROUTE2_TARGET_SBINS))
 endef
 
-$(eval $(call GENTARGETS,package,iproute2))
+$(eval $(call GENTARGETS))
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index e1935c6..cbc6886 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -43,4 +43,4 @@ define IRDA_UTILS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(IRDA_UTILS_SBINS-))
 endef
 
-$(eval $(call GENTARGETS,package,irda-utils))
+$(eval $(call GENTARGETS))
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index be3edc2..144c351 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -32,4 +32,4 @@ define IW_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/iw.8*
 endef
 
-$(eval $(call GENTARGETS,package,iw))
+$(eval $(call GENTARGETS))
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 6124e1a..3ffc49c 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -20,5 +20,5 @@ define LIBAIO_INSTALL_TARGET_CMDS
   $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call GENTARGETS,package,libaio))
+$(eval $(call GENTARGETS))
 
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 458f8e8..a7b33a0 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -34,5 +34,5 @@ define HOST_LIBCAP_INSTALL_CMDS
 		prefix=/usr lib=lib install
 endef
 
-$(eval $(call GENTARGETS,package,libcap))
-$(eval $(call GENTARGETS,package,libcap,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 89987d6..3686d55 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -18,4 +18,4 @@ define LIBERATION_CLEAN_CMDS
 	rm -rf $(LIBERATION_TARGET_DIR)
 endef
 
-$(eval $(call GENTARGETS,package,liberation))
+$(eval $(call GENTARGETS))
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 3f7642f..ea6a329 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -64,4 +64,4 @@ define LIBNSS_CLEAN_CMDS
 					BUILD_OPT=1
 endef
 
-$(eval $(call GENTARGETS,package,libnss))
+$(eval $(call GENTARGETS))
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 88d3e66..bdb076b 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -30,4 +30,4 @@ define LIBROXML_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,libroxml))
+$(eval $(call GENTARGETS))
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index d9ac41b..0b97723 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -39,4 +39,4 @@ define LIBSVGTINY_CLEAN_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,libsvgtiny))
+$(eval $(call GENTARGETS))
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 1ea859a..4df64fc 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -38,5 +38,5 @@ define LIBV4L_INSTALL_TARGET_CMDS
 			DESTDIR=$(TARGET_DIR) $(LIBV4L_MAKE_OPTS) install; done
 endef
 
-$(eval $(call GENTARGETS,package,libv4l))
+$(eval $(call GENTARGETS))
 
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 9f80cf9..ecc2cc9 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -30,6 +30,6 @@ define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-$(eval $(call GENTARGETS,package,libxml-parser-perl))
-$(eval $(call GENTARGETS,package,libxml-parser-perl,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
 
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index be1cc71..4dba98f 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -48,4 +48,4 @@ define LINUX_FUSION_UNINSTALL_TARGET_CMDS
 	rm -f $(LINUX_FUSION_ETC_DIR)/40-fusion.rules
 endef
 
-$(eval $(call GENTARGETS,package,linux-fusion))
+$(eval $(call GENTARGETS))
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index eec969d..99a8e3b 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -42,4 +42,4 @@ define LM_SENSORS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,lm-sensors))
+$(eval $(call GENTARGETS))
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index fefb34f..0c33651 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -27,4 +27,4 @@ define LMBENCH_CLEAN_CMDS
 	$(MAKE) -C $(@D)/src clean
 endef
 
-$(eval $(call GENTARGETS,package,lmbench))
+$(eval $(call GENTARGETS))
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 031712e..4a7f25c 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -30,4 +30,4 @@ define LOCKFILE_PROGS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,lockfile-progs))
+$(eval $(call GENTARGETS))
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 0e41d6a..20317f1 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -33,4 +33,4 @@ define LOGROTATE_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,logrotate))
+$(eval $(call GENTARGETS))
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 167cb20..547382f 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -63,4 +63,4 @@ define LSOF_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,lsof))
+$(eval $(call GENTARGETS))
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index e7947f1..23094c8 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -39,4 +39,4 @@ define LTRACE_INSTALL_TARGET_CMDS
 	$(LTRACE_INSTALL_DOCUMENTATION)
 endef
 
-$(eval $(call GENTARGETS,package,ltrace))
+$(eval $(call GENTARGETS))
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 598eea1..c95e18a 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -121,4 +121,4 @@ define LUA_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,lua))
+$(eval $(call GENTARGETS))
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 5f1119a..928e154 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -28,4 +28,4 @@ define LUAFILESYSTEM_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,luafilesystem))
+$(eval $(call GENTARGETS))
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index e0faf03..daca248 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -33,4 +33,4 @@ define LUASOCKET_CLEAN_CMDS
 	$(MAKE) -C $(@D) -f makefile clean
 endef
 
-$(eval $(call GENTARGETS,package,luasocket))
+$(eval $(call GENTARGETS))
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index b7c9343..31dc95d 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -31,5 +31,5 @@ define HOST_MAKEDEVS_INSTALL_CMDS
 	install -D -m 755 $(@D)/makedevs $(HOST_DIR)/usr/bin/makedevs
 endef
 
-$(eval $(call GENTARGETS,package,makedevs))
-$(eval $(call GENTARGETS,package,makedevs,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 0ad8eba..7d3f5b2 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -24,4 +24,4 @@ define MEMSTAT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/memstat
 endef
 
-$(eval $(call GENTARGETS,package,memstat))
+$(eval $(call GENTARGETS))
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index a92c5d2..00e3124 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -26,4 +26,4 @@ define MEMTESTER_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,memtester))
+$(eval $(call GENTARGETS))
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 0bf431b..99b5a48 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -35,4 +35,4 @@ define MIDORI_INSTALL_TARGET_CMDS
        (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
 endef
 
-$(eval $(call GENTARGETS,package,midori))
+$(eval $(call GENTARGETS))
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index 01a8b5f..3fa2a58 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -32,4 +32,4 @@ define MII_DIAG_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,mii-diag))
+$(eval $(call GENTARGETS))
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 9ebb857..99b54bc 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -24,4 +24,4 @@ define MROUTED_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,mrouted))
+$(eval $(call GENTARGETS))
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 58b5ce1..ef876e2 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -98,5 +98,5 @@ define MTD_INSTALL_TARGET_CMDS
  done
 endef
 
-$(eval $(call GENTARGETS,package,mtd))
-$(eval $(call GENTARGETS,package,mtd,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index f55f510..17eb189 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -16,4 +16,4 @@ endef
 
 GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries
 
-$(eval $(call GENTARGETS,package/multimedia,gst-dsp))
+$(eval $(call GENTARGETS))
diff --git a/package/multimedia/gst-omapfb/gst-omapfb.mk b/package/multimedia/gst-omapfb/gst-omapfb.mk
index 726ef83..f3956bc 100644
--- a/package/multimedia/gst-omapfb/gst-omapfb.mk
+++ b/package/multimedia/gst-omapfb/gst-omapfb.mk
@@ -16,4 +16,4 @@ endef
 
 GST_OMAPFB_DEPENDENCIES = gstreamer
 
-$(eval $(call GENTARGETS,package/multimedia,gst-omapfb))
+$(eval $(call GENTARGETS))
diff --git a/package/multimedia/live555/live555.mk b/package/multimedia/live555/live555.mk
index 45a0375..0051ea0 100644
--- a/package/multimedia/live555/live555.mk
+++ b/package/multimedia/live555/live555.mk
@@ -45,4 +45,4 @@ define LIVE555_UNINSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS,package/multimedia,live555))
+$(eval $(call GENTARGETS))
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index f735464..4c03440 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -145,4 +145,4 @@ define MPLAYER_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package/multimedia,mplayer))
+$(eval $(call GENTARGETS))
diff --git a/package/multimedia/python-mad/python-mad.mk b/package/multimedia/python-mad/python-mad.mk
index 52d13a6..7d898ed 100644
--- a/package/multimedia/python-mad/python-mad.mk
+++ b/package/multimedia/python-mad/python-mad.mk
@@ -38,4 +38,4 @@ define PYTHON_MAD_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS,package,python-mad))
+$(eval $(call GENTARGETS))
diff --git a/package/multimedia/tidsp-binaries/tidsp-binaries.mk b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
index 102791f..0b64fb8 100644
--- a/package/multimedia/tidsp-binaries/tidsp-binaries.mk
+++ b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
@@ -10,4 +10,4 @@ define TIDSP_BINARIES_UNINSTALL_TARGET_CMDS
 	$(RM) -r $(TARGET_DIR)/lib/dsp
 endef
 
-$(eval $(call GENTARGETS,package/multimedia,tidsp-binaries))
+$(eval $(call GENTARGETS))
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index 98d1504..db76021 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -25,4 +25,4 @@ define NETPLUG_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,netplug))
+$(eval $(call GENTARGETS))
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index e3867ea..8c0203c 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -22,4 +22,4 @@ define NUTTCP_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/nuttcp
 endef
 
-$(eval $(call GENTARGETS,package,nuttcp))
+$(eval $(call GENTARGETS))
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 03a8a02..9ed4d5b 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -38,4 +38,4 @@ define OLSR_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,olsr))
+$(eval $(call GENTARGETS))
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 0163ef8..8080eea 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -120,4 +120,4 @@ define OPENSSL_UNINSTALL_CMDS
 	rm -rf $(addprefix $(STAGING_DIR)/usr/lib/,ssl engines libcrypto* libssl* pkgconfig/libcrypto.pc)
 endef
 
-$(eval $(call GENTARGETS,package,openssl))
+$(eval $(call GENTARGETS))
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 782d348..52f5f67 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -45,4 +45,4 @@ define PCIUTILS_INSTALL_TARGET_CMDS
 		SHARED=$(PCIUTILS_SHARED) install-lib
 endef
 
-$(eval $(call GENTARGETS,package,pciutils))
+$(eval $(call GENTARGETS))
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index e996824..cb7c0e3 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -43,4 +43,4 @@ define PORTMAP_UNINSTALL_TARGET_CMDS
 		$(addsuffix .8,$(PORTMAP_SBINS)))
 endef
 
-$(eval $(call GENTARGETS,package,portmap))
+$(eval $(call GENTARGETS))
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 05c1c32..2137f6a 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -102,4 +102,4 @@ define PPPD_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS,package,pppd))
+$(eval $(call GENTARGETS))
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 605f30d..77ae34d 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -25,4 +25,4 @@ define PPTP_LINUX_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/pptp.8
 endef
 
-$(eval $(call GENTARGETS,package,pptp-linux))
+$(eval $(call GENTARGETS))
diff --git a/package/procps/procps.mk b/package/procps/procps.mk
index a279987..8228052 100644
--- a/package/procps/procps.mk
+++ b/package/procps/procps.mk
@@ -20,4 +20,4 @@ define PROCPS_INSTALL_TARGET_CMDS
 		ldconfig=true install
 endef
 
-$(eval $(call GENTARGETS,package,procps))
+$(eval $(call GENTARGETS))
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index 048930b..4c8a891 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -18,4 +18,4 @@ define PYTHON_SERIAL_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS,package,python-serial))
+$(eval $(call GENTARGETS))
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ff67058..a6c0f1d 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -637,4 +637,4 @@ define QT_UNINSTALL_TARGET_CMDS
 	-rm $(TARGET_DIR)/usr/lib/libphonon.so.*
 endef
 
-$(eval $(call GENTARGETS,package,qt))
+$(eval $(call GENTARGETS))
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index 36fe666..4862fad 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -26,4 +26,4 @@ define RINGS_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,rings))
+$(eval $(call GENTARGETS))
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index 6217cb1..0c2b838 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -33,4 +33,4 @@ define RSH_REDONE_UNINSTALL_TARGET_CMDS
 		$(addprefix $(TARGET_DIR)/usr/sbin/,$(rsh-redone-sbin-y))
 endef
 
-$(eval $(call GENTARGETS,package,rsh-redone))
+$(eval $(call GENTARGETS))
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 0c604d9..2f5787c 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -51,4 +51,4 @@ define SLANG_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,slang))
+$(eval $(call GENTARGETS))
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 7aa8ca9..4d0ad51 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -72,5 +72,5 @@ define HOST_SQUASHFS_INSTALL_CMDS
    -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
 endef
 
-$(eval $(call GENTARGETS,package,squashfs))
-$(eval $(call GENTARGETS,package,squashfs,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index 69aab14..178543b 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -25,6 +25,6 @@ define HOST_SQUASHFS3_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
 endef
 
-$(eval $(call GENTARGETS,package,squashfs3))
-$(eval $(call GENTARGETS,package,squashfs3,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
 
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index ad91f6a..44fe16d 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -24,4 +24,4 @@ define SREDIRD_CLEAN_CMDS
 	rm -f $(@D)/sredird
 endef
 
-$(eval $(call GENTARGETS,package,sredird))
+$(eval $(call GENTARGETS))
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index 2dc383d..9a5aede 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -41,5 +41,5 @@ define HOST_SSTRIP_UNINSTALL_CMDS
 	rm -f $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
 endef
 
-$(eval $(call GENTARGETS,package,sstrip))
-$(eval $(call GENTARGETS,package,sstrip,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index b6a8a0f..8c39693 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -16,4 +16,4 @@ define STATSERIAL_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/statserial $(TARGET_DIR)/usr/bin/statserial
 endef
 
-$(eval $(call GENTARGETS,package,statserial))
+$(eval $(call GENTARGETS))
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 11aee2a..b28b827 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -52,4 +52,4 @@ define SYSKLOGD_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,sysklogd))
+$(eval $(call GENTARGETS))
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index adcc1ad..40c6b5e 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -46,4 +46,4 @@ define SYSVINIT_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,sysvinit))
+$(eval $(call GENTARGETS))
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 037e0c9..15e620c 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -28,4 +28,4 @@ define TI_UTILS_UNINSTALL_TARGET_CMDS
 	rm -fr $(TARGET_DIR)/usr/share/ti-utils
 endef
 
-$(eval $(call GENTARGETS,package,ti-utils))
+$(eval $(call GENTARGETS))
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index b9e0f21..e20560a 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -51,5 +51,5 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	install -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin
 endef
 
-$(eval $(call GENTARGETS,package,uboot-tools))
-$(eval $(call GENTARGETS,package,uboot-tools,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 620c5d0..7b982d8 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -25,5 +25,5 @@ define USB_MODESWITCH_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man1/usb_modeswitch.1
 endef
 
-$(eval $(call GENTARGETS,package,usb_modeswitch))
+$(eval $(call GENTARGETS))
 
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 0f93e5b..8434570 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -31,4 +31,4 @@ define USBMOUNT_UNINSTALL_TARGET_CMDS
 		$(TARGET_DIR)/media/usb?
 endef
 
-$(eval $(call GENTARGETS,package,usbmount))
+$(eval $(call GENTARGETS))
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 64a56cc..4490287 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -51,4 +51,4 @@ define VSFTPD_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,vsftpd))
+$(eval $(call GENTARGETS))
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index d47fbcd..48a3adf 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -24,7 +24,7 @@ define WHETSTONE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/whetstone
 endef
 
-$(eval $(call GENTARGETS,package,whetstone))
+$(eval $(call GENTARGETS))
 
 $(BUILD_DIR)/whetstone-$(WHETSTONE_VERSION)/.stamp_extracted:
 	@$(call MESSAGE,"Extracting")
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index d227389..54283f9 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -33,4 +33,4 @@ define WIPE_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,wipe))
+$(eval $(call GENTARGETS))
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index d8358ba..b059839 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -42,4 +42,4 @@ define WIRELESS_TOOLS_UNINSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" uninstall
 endef
 
-$(eval $(call GENTARGETS,package,wireless_tools))
+$(eval $(call GENTARGETS))
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index c0f9c8b..f9ab334 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -18,4 +18,4 @@ define WSAPI_UNINSTALL_TARGET_CMDS
 	rm -rf "$(TARGET_DIR)/usr/share/lua/wsapi"
 endef
 
-$(eval $(call GENTARGETS,package,wsapi))
+$(eval $(call GENTARGETS))
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 525b09f..e6dd312 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -20,4 +20,4 @@ define XAVANTE_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/sajax.lua"
 endef
 
-$(eval $(call GENTARGETS,package,xavante))
+$(eval $(call GENTARGETS))
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index bcaacf3..e44b75f 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -30,4 +30,4 @@ define XL2TP_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS,package,xl2tp))
+$(eval $(call GENTARGETS))
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 18e7068..fbe923e 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -73,5 +73,5 @@ define HOST_ZLIB_UNINSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) uninstall
 endef
 
-$(eval $(call GENTARGETS,package,zlib))
-$(eval $(call GENTARGETS,package,zlib,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
-- 
1.7.4.1
