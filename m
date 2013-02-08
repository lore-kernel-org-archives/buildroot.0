From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Feb 2013 23:37:59 +0100
Subject: [Buildroot] [RFC 1/5] packages: remove all the <pkg>_CLEAN_CMDS
	commands
In-Reply-To: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360363083-28747-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit removes the <pkg>_CLEAN_CMDS for all packages in
Buildroot's tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/syslinux.mk                          |    4 ----
 package/acpid/acpid.mk                             |    4 ----
 package/axel/axel.mk                               |    4 ----
 package/bsdiff/bsdiff.mk                           |    4 ----
 package/busybox/busybox.mk                         |    4 ----
 package/bzip2/bzip2.mk                             |   10 ----------
 package/cjson/cjson.mk                             |    4 ----
 package/dash/dash.mk                               |    5 -----
 package/devmem2/devmem2.mk                         |    4 ----
 package/dhrystone/dhrystone.mk                     |    4 ----
 package/distcc/distcc.mk                           |    6 ------
 package/dmalloc/dmalloc.mk                         |    8 --------
 package/dosfstools/dosfstools.mk                   |    4 ----
 package/elftosb/elftosb.mk                         |    4 ----
 package/ezxml/ezxml.mk                             |    4 ----
 package/fb-test-app/fb-test-app.mk                 |    4 ----
 package/fbset/fbset.mk                             |    4 ----
 package/fbv/fbv.mk                                 |    5 -----
 package/fconfig/fconfig.mk                         |    4 ----
 package/gadgetfs-test/gadgetfs-test.mk             |    4 ----
 package/hdparm/hdparm.mk                           |    4 ----
 package/httping/httping.mk                         |    4 ----
 package/input-event-daemon/input-event-daemon.mk   |    4 ----
 package/input-tools/input-tools.mk                 |    4 ----
 package/iostat/iostat.mk                           |    4 ----
 package/irda-utils/irda-utils.mk                   |    4 ----
 package/lcdapi/lcdapi.mk                           |    4 ----
 package/liberation/liberation.mk                   |    4 ----
 package/libfuse/libfuse.mk                         |    6 ------
 package/liblockfile/liblockfile.mk                 |    7 -------
 package/libnss/libnss.mk                           |    7 -------
 package/libroxml/libroxml.mk                       |    4 ----
 package/libsvgtiny/libsvgtiny.mk                   |    4 ----
 package/linenoise/linenoise.mk                     |    4 ----
 package/live555/live555.mk                         |    4 ----
 package/lm-sensors/lm-sensors.mk                   |    4 ----
 package/lmbench/lmbench.mk                         |    4 ----
 package/lockfile-progs/lockfile-progs.mk           |    4 ----
 package/logrotate/logrotate.mk                     |    4 ----
 package/lrzsz/lrzsz.mk                             |    5 -----
 package/lsof/lsof.mk                               |    4 ----
 package/lua-msgpack-native/lua-msgpack-native.mk   |    4 ----
 package/lua/lua.mk                                 |    8 --------
 package/luacjson/luacjson.mk                       |    4 ----
 package/luaexpat/luaexpat.mk                       |    4 ----
 package/luafilesystem/luafilesystem.mk             |    4 ----
 package/luajit/luajit.mk                           |    4 ----
 package/luasocket/luasocket.mk                     |    4 ----
 package/memtester/memtester.mk                     |    4 ----
 package/mii-diag/mii-diag.mk                       |    4 ----
 package/mrouted/mrouted.mk                         |    4 ----
 package/mtdev2tuio/mtdev2tuio.mk                   |    4 ----
 package/multimedia/mplayer/mplayer.mk              |    4 ----
 package/netplug/netplug.mk                         |    4 ----
 package/noip/noip.mk                               |    4 ----
 package/olsr/olsr.mk                               |    4 ----
 package/perl/perl.mk                               |    4 ----
 package/portmap/portmap.mk                         |    4 ----
 package/qt/qt.mk                                   |    4 ----
 package/qtuio/qtuio.mk                             |    7 -------
 package/rings/rings.mk                             |    4 ----
 package/schifra/schifra.mk                         |    4 ----
 package/sdl_mixer/sdl_mixer.mk                     |    6 ------
 package/slang/slang.mk                             |    4 ----
 .../snowball-hdmiservice/snowball-hdmiservice.mk   |    4 ----
 package/sredird/sredird.mk                         |    4 ----
 package/sysklogd/sysklogd.mk                       |    4 ----
 package/sysvinit/sysvinit.mk                       |    4 ----
 package/tinyhttpd/tinyhttpd.mk                     |    5 -----
 package/usb_modeswitch/usb_modeswitch.mk           |    4 ----
 package/usb_modeswitch_data/usb_modeswitch_data.mk |    4 ----
 package/vsftpd/vsftpd.mk                           |    4 ----
 package/whetstone/whetstone.mk                     |    4 ----
 package/wireless_tools/wireless_tools.mk           |    4 ----
 package/zlib/zlib.mk                               |    4 ----
 75 files changed, 333 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index f63f2e0..a257c16 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -41,9 +41,5 @@ define HOST_SYSLINUX_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
 endef
 
-define HOST_SYSLINUX_CLEAN_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 4ad9f66..29d1c98 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -29,8 +29,4 @@ define ACPID_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix )$(TARGET_DIR)/usr/share/man/man8/,acpid.8 acpi_listen.8)
 endef
 
-define ACPID_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index f823b4a..666020c 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -42,8 +42,4 @@ define AXEL_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
 endef
 
-define AXEL_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 1e05c83..86ba0ea 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -24,8 +24,4 @@ define BSDIFF_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/bsdiff $(TARGET_DIR)/usr/bin/bspatch
 endef
 
-define BSDIFF_CLEAN_CMDS
-	rm -f $(@D)/bsdiff $(@D)/bspatch
-endef
-
 $(eval $(generic-package))
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 599e145..7043436 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -211,10 +211,6 @@ define BUSYBOX_UNINSTALL_TARGET_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) uninstall
 endef
 
-define BUSYBOX_CLEAN_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
 
 busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index b3e4ad3..7c48d90 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -73,16 +73,6 @@ define BZIP2_INSTALL_TARGET_CMDS
 	)
 endef
 
-define BZIP2_CLEAN_CMDS
-	rm -f $(addprefix $(TARGET_DIR),/lib/libbz2.* \
-					/usr/lib/libbz2.* \
-					/usr/include/bzlib.h)
-	rm -f $(addprefix $(STAGING_DIR),/lib/libbz2.* \
-					/usr/lib/libbz2.* \
-					/usr/include/bzlib.h)
-	-$(MAKE) -C $(@D) clean
-endef
-
 define HOST_BZIP2_FIX_MAKEFILE
 	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(@D)/Makefile
 	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_VERSION) \
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 3722adb..ff4eb26 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -33,8 +33,4 @@ define CJSON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libcJSON.so
 endef
 
-define CJSON_CLEAN_CMDS
-	rm -f $(@D)/libcJSON.so
-endef
-
 $(eval $(generic-package))
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 64f72e0..c4d6b05 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -13,9 +13,4 @@ define DASH_INSTALL_TARGET_CMDS
 	cp -a $(@D)/src/dash $(TARGET_DIR)/bin/dash
 endef
 
-define DASH_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-	rm -f $(TARGET_DIR)/bin/dash
-endef
-
 $(eval $(autotools-package))
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index cc9b218..ef9f59a 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -16,10 +16,6 @@ define DEVMEM2_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) devmem2
 endef
 
-define DEVMEM2_CLEAN_CMDS
-	rm -f $(@D)/devmem2
-endef
-
 define DEVMEM2_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/devmem2 $(TARGET_DIR)/sbin/devmem2
 endef
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index 6d3ddfa..8e808d3 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -17,10 +17,6 @@ define DHRYSTONE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
-define DHRYSTONE_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 define DHRYSTONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/dhrystone $(TARGET_DIR)/usr/bin/dhrystone
 endef
diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index 006c0aa..daab6fd 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -16,10 +16,4 @@ define DISTCC_INSTALL_TARGET_CMDS
 	install -D $(@D)/distcc $(TARGET_DIR)/usr/bin/distcc
 endef
 
-define DISTCC_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/distcc
-	rm -f $(TARGET_DIR)/usr/bin/distccd
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(autotools-package))
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 8623829..976e431 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -51,13 +51,5 @@ define DMALLOC_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/usr/bin/dmalloc
 endef
 
-define DMALLOC_CLEAN_CMDS
-	-rm -f $(TARGET_DIR)/usr/lib/libdmalloc*
-	-rm -f $(STAGING_DIR)/usr/lib/libdmalloc*
-	rm -f $(STAGING_DIR)/usr/include/dmalloc.h
-	rm -f $(TARGET_DIR)/usr/bin/dmalloc
-	-$(MAKE) -C $(DMALLOC_DIR) clean
-endef
-
 
 $(eval $(autotools-package))
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 4f89364..1421fb9 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -32,8 +32,4 @@ define DOSFSTOOLS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/$(DOSFSLABEL_BINARY)
 endef
 
-define DOSFSTOOLS_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index 5803b75..33e1cbd 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -17,9 +17,5 @@ define HOST_ELFTOSB_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bld/linux/sbtool $(HOST_DIR)/usr/bin/sbtool
 endef
 
-define HOST_ELFTOSB_CLEAN_CMDS
-	rm -rf $(@D)/bld/linux
-endef
-
 $(eval $(host-generic-package))
 
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 89e1957..8417f9b 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -33,8 +33,4 @@ define EZXML_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libezxml.a
 endef
 
-define EZXML_CLEAN_CMDS
-	-$(MAKE) -C $(@D) -f GNUmakefile clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 35e210b..ab13354 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -27,8 +27,4 @@ define FB_TEST_APP_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/fb-test-offset
 endef
 
-define FB_TEST_APP_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 3423259..61ac745 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -25,8 +25,4 @@ define FBSET_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/fbset
 endef
 
-define FBSET_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 2a4029e..c79be02 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -49,9 +49,4 @@ define FBV_INSTALL_TARGET_CMDS
 	install -D $(@D)/fbv $(TARGET_DIR)/usr/bin/fbv
 endef
 
-define FBV_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/fbv
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(autotools-package))
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 4eb7c9e..13ef215 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -21,8 +21,4 @@ define FCONFIG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/fconfig
 endef
 
-define FCONFIG_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 0fc8221..df2c0f6 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -25,8 +25,4 @@ define GADGETFS_TEST_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/bin/gadgetfs-test
 endef
 
-define GADGETFS_TEST_CLEAN_CMDS
-	-$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index f70d232..19b54c0 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -31,8 +31,4 @@ define HDPARM_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/hdparm.8
 endef
 
-define HDPARM_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index e92be61..455322c 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -22,8 +22,4 @@ define HTTPING_INSTALL_TARGET_CMDS
 	$(HTTPING_MAKE_OPT) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define HTTPING_CLEAN_CMDS
-       $(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index fdff557..f77f563 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -26,10 +26,6 @@ define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
 			$(TARGET_DIR)/etc/init.d/S99input-event-daemon
 endef
 
-define INPUT_EVENT_DAEMON_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/input-event-daemon
 	rm -f $(TARGET_DIR)/etc/input-event-daemon.conf
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index b1cb093..4e0b1cf 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -42,8 +42,4 @@ define INPUT_TOOLS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(INPUT_TOOLS_TARGETS_y))
 endef
 
-define INPUT_TOOLS_CLEAN_CMDS
-	rm -f $(addprefix $(@D)/,$(INPUT_TOOLS_TARGETS_y))
-endef
-
 $(eval $(generic-package))
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 8d17af5..69377f0 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -15,10 +15,6 @@ define IOSTAT_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
 
-define IOSTAT_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 define IOSTAT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(IOSTAT_DIR)/iostat $(TARGET_DIR)/usr/bin/iostat
 	$(INSTALL) -D $(IOSTAT_DIR)/iostat.8 \
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index 34612c2..e993e5a 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -22,10 +22,6 @@ define IRDA_UTILS_BUILD_CMDS
 		V=1 -C $(@D)
 endef
 
-define IRDA_UTILS_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 IRDA_UTILS_SBINS-  =
 IRDA_UTILS_SBINS-y =
 IRDA_UTILS_SBINS-$(BR2_PACKAGE_IRDA_UTILS_IRATTACH) += irattach
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index b024252..8356554 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -34,8 +34,4 @@ define LCDAPI_UNINSTALL_TARGET_CMDS
 		DESTDIR="$(TARGET_DIR)" uninstall
 endef
 
-define LCDAPI_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 363d327..c136eaf 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -34,8 +34,4 @@ define LIBERATION_INSTALL_TARGET_CMDS
 	$(LIBERATION_INSTALL_SERIF)
 endef
 
-define LIBERATION_CLEAN_CMDS
-	rm -rf $(LIBERATION_TARGET_DIR)
-endef
-
 $(eval $(generic-package))
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index ccd49fe..281e5d2 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -22,10 +22,4 @@ define LIBFUSE_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
 endef
 
-define LIBFUSE_CLEAN_CMDS
-	-$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) uninstall
-	-$(MAKE) -C $(@D) clean
-	rm -f $(TARGET_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/lib/libfuse.so*
-endef
-
 $(eval $(autotools-package))
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 568d010..6a49c46 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -26,11 +26,4 @@ define LIBLOCKFILE_INSTALL_TARGET_CMDS
 	cp -a $(STAGING_DIR)/usr/lib/liblockfile.so* $(TARGET_DIR)/usr/lib
 endef
 
-define LIBLOCKFILE_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/liblockfile.so*
-	rm -f $(STAGING_DIR)/usr/lib/liblockfile*
-	rm -f $(addprefix $(STAGING_DIR)/usr/include/,lockfile.h mailfile.h)
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(autotools-package))
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 96faf37..8aace3f 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -73,11 +73,4 @@ define LIBNSS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/pkgconfig/nss.pc
 endef
 
-define LIBNSS_CLEAN_CMDS
-	-$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR) clobber \
-					clobber_dbm \
-					clobber_coreconf \
-					BUILD_OPT=1
-endef
-
 $(eval $(generic-package))
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 6e690aa..97321da 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -26,10 +26,6 @@ define LIBROXML_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
 endef
 
-define LIBROXML_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 define LIBROXML_DISABLE_DOXYGEN
 	$(SED) 's:) doxy:):' $(@D)/Makefile
 endef
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index 076a783..1fe1343 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -33,8 +33,4 @@ define LIBSVGTINY_UNINSTALL_TARGET_CMDS
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
 endef
 
-define LIBSVGTINY_CLEAN_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 343a107..b4d17fa 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -38,8 +38,4 @@ define LINENOISE_UNINSTALL_TARGET_CMDS
 	rm -f   $(TARGET_DIR)/usr/bin/linenoise_example
 endef
 
-define LINENOISE_CLEAN_CMDS
-	rm -f $(@D)/*.o $(@D)/*.a $(@D)/linenoise_example
-endef
-
 $(eval $(generic-package))
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index b727d94..079027e 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -22,10 +22,6 @@ define LIVE555_BUILD_CMDS
 	$(MAKE) -C $(@D) all
 endef
 
-define LIVE555_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 LIVE555_HEADERS_TO_INSTALL = \
 	liveMedia/include \
 	groupsock/include \
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 3f95676..dc51489 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -42,8 +42,4 @@ define LM_SENSORS_UNINSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
 endef
 
-define LM_SENSORS_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 65ef62b..e9d2906 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -35,8 +35,4 @@ define LMBENCH_INSTALL_TARGET_CMDS
 	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" BASE=$(TARGET_DIR)/usr -C $(@D)/src install
 endef
 
-define LMBENCH_CLEAN_CMDS
-	$(MAKE) -C $(@D)/src clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 1c3cb51..2f86b62 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -28,8 +28,4 @@ define LOCKFILE_PROGS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(LOCKFILE_BINS))
 endef
 
-define LOCKFILE_PROGS_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index da8e4b3..865dc24 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -31,8 +31,4 @@ define LOGROTATE_UNINSTALL_TARGET_CMDS
 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/logrotate.d
 endef
 
-define LOGROTATE_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 14545d1..5f4bf0c 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -26,9 +26,4 @@ define LRZSZ_INSTALL_TARGET_CMDS
 	ln -sf sz $(TARGET_DIR)/usr/bin/lsz
 endef
 
-define LRZSZ_CLEAN_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,rz sz lrz lsz)
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(autotools-package))
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index f74eca4..1b696f6 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -66,8 +66,4 @@ define LSOF_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/bin/lsof
 endef
 
-define LSOF_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 97ce83c..706c96e 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -21,8 +21,4 @@ define LUA_MSGPACK_NATIVE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/lua/msgpack.so
 endef
 
-define LUA_MSGPACK_NATIVE_CLEAN_CMDS
-	rm -f $(@D)/msgpack.so
-endef
-
 $(eval $(generic-package))
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 32acc99..73bd70b 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -129,13 +129,5 @@ define HOST_LUA_UNINSTALL_TARGET_CMDS
 	done
 endef
 
-define LUA_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
-define HOST_LUA_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
index 1f79d5d..6b0db29 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -23,10 +23,6 @@ define LUACJSON_INSTALL_TARGET_CMDS
 	install -D -m 0644 $(@D)/cjson.so $(TARGET_DIR)/usr/lib/lua/cjson.so
 endef
 
-define LUACJSON_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 define LUACJSON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/lua/cjson.so
 endef
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 2d4c517..1257c8e 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -32,8 +32,4 @@ define LUAEXPAT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/lua/lxp/lom.lua
 endef
 
-define LUAEXPAT_CLEAN_CMDS
-	$(MAKE) -C $(@D) $(LUAEXPAT_MFLAGS) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 8553212..95d60bc 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -25,8 +25,4 @@ define LUAFILESYSTEM_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/lib/lua/lfs.so"
 endef
 
-define LUAFILESYSTEM_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 844122e..9636112 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -63,8 +63,4 @@ define LUAJIT_UNINSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) uninstall
 endef
 
-define LUAJIT_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 45fb9a3..65cbd59 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -31,8 +31,4 @@ define LUASOCKET_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/ltn12.lua"
 endef
 
-define LUASOCKET_CLEAN_CMDS
-	$(MAKE) -C $(@D) -f makefile clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 8cca471..2c1f538 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -22,8 +22,4 @@ define MEMTESTER_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/memtester
 endef
 
-define MEMTESTER_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index a4ad474..a3952c2 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -32,8 +32,4 @@ define MII_DIAG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/mii-diag
 endef
 
-define MII_DIAG_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 90f2f59..10281ae 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -20,8 +20,4 @@ define MROUTED_UNINSTALL_TARGET_CMDS
 	$(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
 endef
 
-define MROUTED_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index 9306946..00bbe8f 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -22,8 +22,4 @@ define MTDEV2TUIO_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/mtdev2tuio $(TARGET_DIR)/usr/bin/mtdev2tuio
 endef
 
-define MTDEV2TUIO_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 4a1abf4..4832775 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -170,8 +170,4 @@ define MPLAYER_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
 endef
 
-define MPLAYER_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index e42894f..d22d3ab 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -21,8 +21,4 @@ define NETPLUG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S*netplug
 endef
 
-define NETPLUG_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index e90ff07..09cbf5e 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -23,8 +23,4 @@ define NOIP_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/sbin/noip2"
 endef
 
-define NOIP_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 97088f3..aa73a6c 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -36,8 +36,4 @@ define OLSR_INSTALL_TARGET_CMDS
 		$(INSTALL) -D -m 0644 $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
 endef
 
-define OLSR_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index da54ef1..ba14881 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -102,8 +102,4 @@ define PERL_INSTALL_TARGET_CMDS
 	PERL5LIB=$(@D)/dist/base/lib $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" $(PERL_INSTALL_TARGET_GOALS)
 endef
 
-define PERL_CLEAN_CMDS
-	-$(MAKE1) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 639a72e..80bfd4f 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -19,10 +19,6 @@ define PORTMAP_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
 endef
 
-define PORTMAP_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 define PORTMAP_INSTALL_TARGET_CMDS
 	for sbin in $(PORTMAP_SBINS); do \
 		$(INSTALL) -D $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin; \
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ee1a88b..7304c92 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -632,10 +632,6 @@ define QT_INSTALL_TARGET_CMDS
 	$(QT_INSTALL_TARGET_FONTS_TTF)
 endef
 
-define QT_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 define QT_UNINSTALL_TARGET_CMDS
 	-rm -rf $(TARGET_DIR)/usr/lib/fonts
 	-rm $(TARGET_DIR)/usr/lib/libQt*.so.*
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index 0ac8874..a4719af 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -59,11 +59,4 @@ define QTUIO_INSTALL_STAGING_CMDS
 	cp -dpf $(@D)/lib/libqTUIO.so* $(STAGING_DIR)/usr/lib
 endef
 
-define QTUIO_CLEAN_CMDS
-	$(MAKE) -C $(@D)/src clean
-	for example in $(QTUIO_EXAMPLES) ; do \
-		($(MAKE) -C $(@D)/examples/$${example} clean) ; \
-	done
-endef
-
 $(eval $(generic-package))
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index e2a2bd7..ef54b22 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -23,8 +23,4 @@ define RINGS_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/stable.lua"
 endef
 
-define RINGS_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index 0285b62..44d08c3 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -48,8 +48,4 @@ define SCHIFRA_UNINSTALL_STAGING_CMDS
 	$(RM) $(STAGING_DIR)/usr/include/schifra_*.hpp
 endef
 
-define SCHIFRA_CLEAN_CMDS
-	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPT) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index a062c35..e974a6b 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -38,10 +38,4 @@ define SDL_MIXER_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_mixer*.so* $(TARGET_DIR)/usr/lib/
 endef
 
-define SDL_MIXER_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/libSDL_mixer*.so*
-	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) uninstall
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(autotools-package))
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index a2382ce..02f440d 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -47,8 +47,4 @@ define SLANG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/include/slcurses.h
 endef
 
-define SLANG_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
index ebd65df..ad4c695 100644
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -33,9 +33,5 @@ define SNOWBALL_HDMISERVICE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/hdmistart
 endef
 
-define SNOWBALL_HDMISERVICE_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 
 $(eval $(generic-package))
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index 4e2c481..bc2cbe2 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -20,8 +20,4 @@ define SREDIRD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/sredird
 endef
 
-define SREDIRD_CLEAN_CMDS
-	rm -f $(@D)/sredird
-endef
-
 $(eval $(generic-package))
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index a68adf2..0cdc3fb 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -48,8 +48,4 @@ define SYSKLOGD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/syslog.conf
 endef
 
-define SYSKLOGD_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 10feb96..3f83f81 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -42,8 +42,4 @@ define SYSVINIT_UNINSTALL_TARGET_CMDS
 	done
 endef
 
-define SYSVINIT_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 3d1845d..fb5c015 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -18,9 +18,4 @@ define TINYHTTPD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/var/www
 endef
 
-define TINYHTTPD_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/tinyhttpd
-	rm -f $(TARGET_DIR)/etc/init.d/S85tinyhttpd
-endef
-
 $(eval $(generic-package))
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 653109d..90d5598 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -20,10 +20,6 @@ define USB_MODESWITCH_INSTALL_TARGET_CMDS
 endef
 
 
-define USB_MODESWITCH_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
-endef
-
 define USB_MODESWITCH_UNINSTALL_CMDS
 	$(RM) -f $(TARGET_DIR)/usr/sbin/usb_modeswitch
 	$(RM) -f $(TARGET_DIR)/lib/udev/usb_modeswitch
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 479137c..65b07d1 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -17,8 +17,4 @@ define USB_MODESWITCH_DATA_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-define USB_MODESWITCH_DATA_CLEAN_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 36f2645..21335bd 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -57,8 +57,4 @@ define VSFTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S70vsftpd
 endef
 
-define VSFTPD_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index 4a23485..8e0a081 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -16,10 +16,6 @@ define WHETSTONE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) LDLIBS="-lm" -C $(@D) whetstone
 endef
 
-define WHETSTONE_CLEAN_CMDS
-	rm -f $(@D)/whetstone
-endef
-
 define WHETSTONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/whetstone $(TARGET_DIR)/usr/bin/whetstone
 endef
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 4dd4084..0b360fb 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -31,10 +31,6 @@ define WIRELESS_TOOLS_BUILD_CMDS
 		$(WIRELESS_TOOLS_BUILD_TARGETS)
 endef
 
-define WIRELESS_TOOLS_CLEAN_CMDS
-	$(MAKE) -C $(@D) realclean
-endef
-
 define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true $(WIRELESS_TOOLS_INSTALL_TARGETS)
 	$(MAKE) -C $(@D) INSTALL_MAN="$(TARGET_DIR)/usr/share/man" install-man
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 3723839..37445f6 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -60,10 +60,6 @@ define HOST_ZLIB_INSTALL_CMDS
 	$(MAKE1) -C $(@D) LDCONFIG=true install
 endef
 
-define ZLIB_CLEAN_CMDS
-	-$(MAKE1) -C $(@D) clean
-endef
-
 define ZLIB_UNINSTALL_STAGING_CMDS
 	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) uninstall
 endef
-- 
1.7.9.5
