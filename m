From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Feb 2013 23:38:02 +0100
Subject: [Buildroot] [RFC 4/5] packages: remove all the
	<pkg>_UNINSTALL_TARGET_CMDS commands
In-Reply-To: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360363083-28747-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit removes the <pkg>_UNINSTALL_TARGET_CMDS for all packages
in Buildroot's tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk                                  |    5 -----
 package/acpid/acpid.mk                             |    6 ------
 package/alsa-lib/alsa-lib.mk                       |    6 ------
 package/at/at.mk                                   |   14 --------------
 package/axel/axel.mk                               |    4 ----
 package/bash/bash.mk                               |    9 ---------
 package/bind/bind.mk                               |    7 -------
 package/bmon/bmon.mk                               |    4 ----
 package/boa/boa.mk                                 |    6 ------
 package/bonnie/bonnie.mk                           |    4 ----
 package/bridge-utils/bridge-utils.mk               |    5 -----
 package/bsdiff/bsdiff.mk                           |    4 ----
 package/busybox/busybox.mk                         |    4 ----
 package/cgilua/cgilua.mk                           |    5 -----
 package/cjson/cjson.mk                             |    5 -----
 package/copas/copas.mk                             |    4 ----
 package/coxpcall/coxpcall.mk                       |    4 ----
 package/devmem2/devmem2.mk                         |    4 ----
 package/dhrystone/dhrystone.mk                     |    4 ----
 package/dmraid/dmraid.mk                           |    5 -----
 package/dnsmasq/dnsmasq.mk                         |    5 -----
 package/doom-wad/doom-wad.mk                       |    4 ----
 package/dosfstools/dosfstools.mk                   |    6 ------
 package/dropbear/dropbear.mk                       |    6 ------
 package/dsp-tools/dsp-tools.mk                     |    4 ----
 package/ebtables/ebtables.mk                       |    5 -----
 package/eeprog/eeprog.mk                           |    4 ----
 package/explorercanvas/explorercanvas.mk           |    4 ----
 package/ezxml/ezxml.mk                             |    5 -----
 package/fb-test-app/fb-test-app.mk                 |    7 -------
 package/fbgrab/fbgrab.mk                           |    4 ----
 package/fbset/fbset.mk                             |    4 ----
 package/fconfig/fconfig.mk                         |    4 ----
 package/feh/feh.mk                                 |    5 -----
 package/file/file.mk                               |    5 -----
 package/fis/fis.mk                                 |    4 ----
 package/flot/flot.mk                               |    4 ----
 package/gadgetfs-test/gadgetfs-test.mk             |    4 ----
 package/gawk/gawk.mk                               |    8 --------
 package/gdisk/gdisk.mk                             |    4 ----
 package/googlefontdirectory/googlefontdirectory.mk |    4 ----
 package/hdparm/hdparm.mk                           |    5 -----
 package/hwdata/hwdata.mk                           |    5 -----
 package/input-event-daemon/input-event-daemon.mk   |    5 -----
 package/input-tools/input-tools.mk                 |    4 ----
 package/iostat/iostat.mk                           |    5 -----
 package/iproute2/iproute2.mk                       |    8 --------
 package/iptables/iptables.mk                       |    7 -------
 package/irda-utils/irda-utils.mk                   |    4 ----
 package/iw/iw.mk                                   |    5 -----
 package/jquery-sparkline/jquery-sparkline.mk       |    4 ----
 package/jquery-validation/jquery-validation.mk     |    4 ----
 package/jquery/jquery.mk                           |    4 ----
 package/jsmin/jsmin.mk                             |    4 ----
 package/kismet/kismet.mk                           |    5 -----
 package/lcdapi/lcdapi.mk                           |    5 -----
 package/less/less.mk                               |    4 ----
 package/libidn/libidn.mk                           |    5 -----
 package/libnl/libnl.mk                             |    5 -----
 package/libroxml/libroxml.mk                       |    4 ----
 package/libsvgtiny/libsvgtiny.mk                   |    5 -----
 package/lighttpd/lighttpd.mk                       |    6 ------
 package/linenoise/linenoise.mk                     |    6 ------
 package/linux-fusion/linux-fusion.mk               |    6 ------
 package/live555/live555.mk                         |    6 ------
 package/lm-sensors/lm-sensors.mk                   |    4 ----
 package/lockfile-progs/lockfile-progs.mk           |    4 ----
 package/logrotate/logrotate.mk                     |    8 --------
 package/lsof/lsof.mk                               |    4 ----
 package/lua-msgpack-native/lua-msgpack-native.mk   |    4 ----
 package/lua/lua.mk                                 |   12 ------------
 package/luacjson/luacjson.mk                       |    4 ----
 package/luaexpat/luaexpat.mk                       |    5 -----
 package/luafilesystem/luafilesystem.mk             |    4 ----
 package/luajit/luajit.mk                           |    4 ----
 package/luasocket/luasocket.mk                     |    9 ---------
 package/lvm2/lvm2.mk                               |    5 -----
 package/makedevs/makedevs.mk                       |    4 ----
 package/memstat/memstat.mk                         |    5 -----
 package/memtester/memtester.mk                     |    4 ----
 package/microperl/microperl.mk                     |    6 ------
 package/mii-diag/mii-diag.mk                       |    4 ----
 package/mrouted/mrouted.mk                         |    4 ----
 package/multimedia/alsa-utils/alsa-utils.mk        |    4 ----
 package/multimedia/gst-dsp/gst-dsp.mk              |    4 ----
 package/multimedia/gst-omapfb/gst-omapfb.mk        |    4 ----
 package/multimedia/mplayer/mplayer.mk              |    4 ----
 .../multimedia/tidsp-binaries/tidsp-binaries.mk    |    4 ----
 package/nano/nano.mk                               |    4 ----
 package/nanocom/nanocom.mk                         |    4 ----
 package/ncftp/ncftp.mk                             |    4 ----
 package/netperf/netperf.mk                         |    5 -----
 package/netplug/netplug.mk                         |    6 ------
 package/netsnmp/netsnmp.mk                         |    7 -------
 package/noip/noip.mk                               |    4 ----
 package/ntp/ntp.mk                                 |    7 -------
 package/nuttcp/nuttcp.mk                           |    4 ----
 package/openntpd/openntpd.mk                       |    6 ------
 package/openvpn/openvpn.mk                         |    5 -----
 package/oprofile/oprofile.mk                       |    7 -------
 package/php/php.mk                                 |    5 -----
 package/portmap/portmap.mk                         |    6 ------
 package/pppd/pppd.mk                               |   13 -------------
 package/pptp-linux/pptp-linux.mk                   |    5 -----
 package/proftpd/proftpd.mk                         |    6 ------
 package/python-nfc/python-nfc.mk                   |    4 ----
 package/python-pygame/python-pygame.mk             |    4 ----
 package/qt/qt.mk                                   |    6 ------
 package/rings/rings.mk                             |    5 -----
 package/rp-pppoe/rp-pppoe.mk                       |    9 ---------
 package/rrdtool/rrdtool.mk                         |    6 ------
 package/rsh-redone/rsh-redone.mk                   |    6 ------
 package/schifra/schifra.mk                         |    5 -----
 package/sdl_sound/sdl_sound.mk                     |    5 -----
 package/slang/slang.mk                             |    8 --------
 .../snowball-hdmiservice/snowball-hdmiservice.mk   |    5 -----
 .../sound-theme-borealis/sound-theme-borealis.mk   |    4 ----
 package/sqlcipher/sqlcipher.mk                     |    7 -------
 package/sqlite/sqlite.mk                           |    5 -----
 package/sredird/sredird.mk                         |    4 ----
 package/sstrip/sstrip.mk                           |    4 ----
 package/sysklogd/sysklogd.mk                       |   10 ----------
 package/sysvinit/sysvinit.mk                       |    6 ------
 package/thttpd/thttpd.mk                           |   10 ----------
 package/ti-utils/ti-utils.mk                       |    5 -----
 package/tn5250/tn5250.mk                           |    6 ------
 package/uboot-tools/uboot-tools.mk                 |    5 -----
 package/uemacs/uemacs.mk                           |    4 ----
 package/usbmount/usbmount.mk                       |    7 -------
 package/vsftpd/vsftpd.mk                           |    7 -------
 package/whetstone/whetstone.mk                     |    4 ----
 package/wipe/wipe.mk                               |    5 -----
 package/wireless_tools/wireless_tools.mk           |    4 ----
 package/wsapi/wsapi.mk                             |    4 ----
 package/xavante/xavante.mk                         |    6 ------
 package/zlib/zlib.mk                               |    8 --------
 package/zxing/zxing.mk                             |    4 ----
 137 files changed, 724 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index deffec3..954ae29 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -76,9 +76,4 @@ define GRUB_INSTALL_TARGET_CMDS
 	$(GRUB_INSTALL_SPLASH)
 endef
 
-define GRUB_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/grub
-	rm -rf $(TARGET_DIR)/boot/grub
-endef
-
 $(eval $(autotools-package))
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 29d1c98..ff6ce6b 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -23,10 +23,4 @@ define ACPID_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 package/acpid/S02acpid $(TARGET_DIR)/etc/init.d/S02acpid
 endef
 
-define ACPID_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/acpid
-	rm -f $(TARGET_DIR)/usr/bin/acpi_listen
-	rm -f $(addprefix )$(TARGET_DIR)/usr/share/man/man8/,acpid.8 acpi_listen.8)
-endef
-
 $(eval $(generic-package))
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 92b42fa..b939e71 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -79,10 +79,4 @@ endif
 ALSA_LIB_CONF_ENV = CFLAGS="$(ALSA_LIB_CFLAGS)" \
 		    LDFLAGS="$(TARGET_LDFLAGS) -lm"
 
-define ALSA_LIB_UNINSTALL_TARGET_CMDS
-	-rm -f $(TARGET_DIR)/usr/lib/libasound.so*
-	-rm -rf $(TARGET_DIR)/usr/lib/alsa-lib
-	-rm -rf $(TARGET_DIR)/usr/share/alsa
-endef
-
 $(eval $(autotools-package))
diff --git a/package/at/at.mk b/package/at/at.mk
index 1cea39b..6219bb7 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -24,18 +24,4 @@ endef
 
 AT_POST_INSTALL_TARGET_HOOKS += AT_INSTALL_INITSCRIPT
 
-define AT_UNINSTALL_TARGET_CMDS
-	rm -rf $(addprefix $(TARGET_DIR),/usr/lib/atspool \
-					 /usr/lib/atjobs \
-					 /etc/at.deny \
-					 /etc/init.d/S99at \
-					 /usr/bin/at \
-					 /usr/bin/atrm \
-					 /usr/bin/atq \
-					 /usr/sbin/atd \
-					 /usr/sbin/atrun)
-	rm -f $(addprefix $(TARGET_DIR)/usr/man/man*/, \
-		at.1 atq.1 atrm.1 batch.1 at_allow.5 at_deny.5 atd.8 atrun.8)
-endef
-
 $(eval $(autotools-package))
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 666020c..8fcf5b5 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -38,8 +38,4 @@ define AXEL_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define AXEL_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index d28c615..c2e7d7a 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -33,13 +33,4 @@ define BASH_INSTALL_TARGET_CMDS
 endef
 
 # Restore the old shell file/link if there was one
-define BASH_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
-		-C $(BASH_DIR) exec_prefix=/ uninstall
-	rm -f $(TARGET_DIR)/bin/sh
-	if [ -e $(TARGET_DIR)/bin/sh.prebash ]; then \
-		mv -f $(TARGET_DIR)/bin/sh.prebash $(TARGET_DIR)/bin/sh; \
-	fi
-endef
-
 $(eval $(autotools-package))
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 8a66534..a1b1ca2 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -58,11 +58,4 @@ ifneq ($(BR2_PACKAGE_BIND_TOOLS),y)
 BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_TOOLS
 endif
 
-define BIND_UNINSTALL_TARGET_CMDS
-	$(BIND_TARGET_REMOVE_SERVER)
-	$(BIND_TARGET_REMOVE_TOOLS)
-	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/, $(BIND_TARGET_LIBS))
-	rm -f $(TARGET_DIR)/etc/init.d/S81named
-endef
-
 $(eval $(autotools-package))
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 4ff2f1a..c387667 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -25,8 +25,4 @@ ifneq ($(BR2_PREFER_STATIC_LIB),y)
 BMON_CONF_OPT += --disable-static
 endif
 
-define BMON_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/bmon
-endef
-
 $(eval $(autotools-package))
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index 1430964..7f1d93a 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -14,10 +14,4 @@ define BOA_INSTALL_TARGET_CMDS
 	install -D -m 644 package/boa/mime.types $(TARGET_DIR)/etc/mime.types
 endef
 
-define BOA_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/usr/sbin/boa \
-		$(TARGET_DIR)/usr/lib/boa/ \
-		$(TARGET_DIR)/etc/mime.types $(TARGET_DIR)/etc/boa
-endef
-
 $(eval $(autotools-package))
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index 6d82b8a..5a09de2 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -11,8 +11,4 @@ define BONNIE_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin/zcav
 endef
 
-define BONNIE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/bonnie++ $(TARGET_DIR)/usr/sbin/zcav
-endef
-
 $(eval $(autotools-package))
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index 685b657..b570542 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -10,9 +10,4 @@ BRIDGE_UTILS_SITE = http://downloads.sourceforge.net/project/bridge/bridge
 BRIDGE_UTILS_AUTORECONF = YES
 BRIDGE_UTILS_CONF_OPT = --with-linux-headers=$(LINUX_HEADERS_DIR)
 
-define BRIDGE_UTILS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
-		include/libbridge.h share/man/man8/brctl.8 sbin/brctl)
-endef
-
 $(eval $(autotools-package))
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 86ba0ea..705e4cc 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -20,8 +20,4 @@ define BSDIFF_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/bspatch $(TARGET_DIR)/usr/bin/bspatch
 endef
 
-define BSDIFF_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/bsdiff $(TARGET_DIR)/usr/bin/bspatch
-endef
-
 $(eval $(generic-package))
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7043436..c29f12a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -207,10 +207,6 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 endef
 
-define BUSYBOX_UNINSTALL_TARGET_CMDS
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) uninstall
-endef
-
 $(eval $(generic-package))
 
 busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 48ee005..1cb0619 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -13,9 +13,4 @@ define CGILUA_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) install LUA_DIR="$(TARGET_DIR)/usr/share/lua"
 endef
 
-define CGILUA_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/lua/cgilua"
-	rm -f "$(TARGET_DIR)/usr/share/lua/cgilua.lua"
-endef
-
 $(eval $(generic-package))
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 34a7a67..527495e 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -23,9 +23,4 @@ define CJSON_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
 endef
 
-define CJSON_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/include/cJSON.h
-	rm -f $(TARGET_DIR)/usr/lib/libcJSON.so
-endef
-
 $(eval $(generic-package))
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index c84a6cc..69b13c5 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -14,8 +14,4 @@ define COPAS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/lua/copas.lua
 endef
 
-define COPAS_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/share/lua/copas.lua"
-endef
-
 $(eval $(generic-package))
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index e7fb76d..a11a806 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -14,8 +14,4 @@ define COXPCALL_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/lua/coxpcall.lua
 endef
 
-define COXPCALL_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/share/lua/coxpcall.lua"
-endef
-
 $(eval $(generic-package))
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index ef9f59a..8075ea8 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -20,8 +20,4 @@ define DEVMEM2_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/devmem2 $(TARGET_DIR)/sbin/devmem2
 endef
 
-define DEVMEM2_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/devmem2
-endef
-
 $(eval $(generic-package))
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index 8e808d3..bfe8688 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -21,8 +21,4 @@ define DHRYSTONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/dhrystone $(TARGET_DIR)/usr/bin/dhrystone
 endef
 
-define DHRYSTONE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/dhrystone
-endef
-
 $(eval $(generic-package))
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 66a9d70..ec66cb5 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -22,9 +22,4 @@ endef
 
 DMRAID_POST_INSTALL_TARGET_HOOKS += DMRAID_INSTALL_INITSCRIPT
 
-define DMRAID_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) remove -C $(@D)/$(DMRAID_SUBDIR)
-	rm -f $(TARGET_DIR)/etc/init.d/S20dmraid
-endef
-
 $(eval $(autotools-package))
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index fe75e7b..9605df0 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -92,9 +92,4 @@ define DNSMASQ_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/var/lib/misc/
 endef
 
-define DNSMASQ_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/dnsmasq
-	rm -f $(TARGET_DIR)/usr/share/man/man8/dnsmasq.8
-endef
-
 $(eval $(generic-package))
diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
index ae5dcef..4eddcb1 100644
--- a/package/doom-wad/doom-wad.mk
+++ b/package/doom-wad/doom-wad.mk
@@ -17,8 +17,4 @@ define DOOM_WAD_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/games/doom/doom1.wad
 endef
 
-define DOOM_WAD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/share/games/doom/doom1.wad
-endef
-
 $(eval $(generic-package))
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 1421fb9..7f59d67 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -26,10 +26,4 @@ define DOSFSTOOLS_INSTALL_TARGET_CMDS
 	install -m 755 $(addprefix $(@D)/,$(DOSFSTOOLS_INSTALL_BIN_FILES_y)) $(TARGET_DIR)/sbin/
 endef
 
-define DOSFSTOOLS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/$(MKDOSFS_BINARY)
-	rm -f $(TARGET_DIR)/sbin/$(DOSFSCK_BINARY)
-	rm -f $(TARGET_DIR)/sbin/$(DOSFSLABEL_BINARY)
-endef
-
 $(eval $(generic-package))
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index bd45221..f952a6f 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -66,10 +66,4 @@ define DROPBEAR_INSTALL_TARGET_CMDS
 	fi
 endef
 
-define DROPBEAR_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/dropbear
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(DROPBEAR_TARGET_BINS))
-	rm -f $(TARGET_DIR)/etc/init.d/S50dropbear
-endef
-
 $(eval $(autotools-package))
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index 42aac05..6b729a8 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -11,8 +11,4 @@ define DSP_TOOLS_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 endef
 
-define DSP_TOOLS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/dsp-, load probe test exec)
-endef
-
 $(eval $(generic-package))
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 3f667ba..d0c34dc 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -25,9 +25,4 @@ define EBTABLES_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/sbin/ebtables
 endef
 
-define EBTABLES_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/lib/ebtables
-	rm -f $(TARGET_DIR)/sbin/ebtables
-endef
-
 $(eval $(generic-package))
diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index e64fa06..7fed2bf 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -15,8 +15,4 @@ define EEPROG_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/eeprog $(TARGET_DIR)/usr/bin/eeprog
 endef
 
-define EEPROG_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/eeprog
-endef
-
 $(eval $(generic-package))
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
index 968843c..4adf67f 100644
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -11,8 +11,4 @@ define EXPLORERCANVAS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/var/www/excanvas.js
 endef
 
-define EXPLORERCANVAS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/excanvas.js
-endef
-
 $(eval $(generic-package))
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 4a9f6a8..9d1e7c2 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -23,9 +23,4 @@ define EZXML_INSTALL_TARGET_CMDS
 	install -D -m 0644 $(@D)/libezxml.a $(TARGET_DIR)/usr/lib/libezxml.a
 endef
 
-define EZXML_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/include/ezxml.h
-	rm -f $(TARGET_DIR)/usr/lib/libezxml.a
-endef
-
 $(eval $(generic-package))
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index ab13354..e25cac1 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -20,11 +20,4 @@ define FB_TEST_APP_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/offset $(TARGET_DIR)/usr/bin/fb-test-offset
 endef
 
-define FB_TEST_APP_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/fb-test-perf
-	rm -f $(TARGET_DIR)/usr/bin/fb-test-rect
-	rm -f $(TARGET_DIR)/usr/bin/fb-test
-	rm -f $(TARGET_DIR)/usr/bin/fb-test-offset
-endef
-
 $(eval $(generic-package))
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index b0b46cb..e7640ea 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -11,8 +11,4 @@ define FBGRAB_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/fbgrab $(TARGET_DIR)/usr/bin/fbgrab
 endef
 
-define FBGRAB_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/fbgrab
-endef
-
 $(eval $(generic-package))
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 61ac745..393456d 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -21,8 +21,4 @@ define FBSET_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/fbset $(TARGET_DIR)/usr/sbin/fbset
 endef
 
-define FBSET_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/fbset
-endef
-
 $(eval $(generic-package))
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 13ef215..e808136 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -17,8 +17,4 @@ define FCONFIG_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/fconfig $(TARGET_DIR)/sbin/fconfig
 endef
 
-define FCONFIG_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/fconfig
-endef
-
 $(eval $(generic-package))
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index fab1c0a..f26561e 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -13,9 +13,4 @@ define FEH_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define FEH_UNINSTALL_TARGET_CMDS
-	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
-		DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/file/file.mk b/package/file/file.mk
index db68f66..627aad3 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -11,10 +11,5 @@ FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2c, one file BSD-4c, one file BSD-3c
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 
-define FILE_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(FILE_DIR)
-	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
-endef
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index 60c2ae8..da99743 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -17,8 +17,4 @@ define FIS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/fis $(TARGET_DIR)/sbin/fis
 endef
 
-define FIS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/fis
-endef
-
 $(eval $(generic-package))
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index f4ba604..9e59497 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -16,8 +16,4 @@ define FLOT_INSTALL_TARGET_CMDS
 	done
 endef
 
-define FLOT_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.flot*
-endef
-
 $(eval $(generic-package))
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index df2c0f6..8031a9a 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -21,8 +21,4 @@ define GADGETFS_TEST_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
 endef
 
-define GADGETFS_TEST_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/bin/gadgetfs-test
-endef
-
 $(eval $(generic-package))
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 366dea7..8f663f2 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -24,13 +24,5 @@ endef
 
 GAWK_POST_INSTALL_TARGET_HOOKS += GAWK_CREATE_SYMLINK
 
-define GAWK_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(GAWK_TARGET_BINS))
-	rm -f $(TARGET_DIR)/usr/share/info/gawk*.info
-	rm -f $(TARGET_DIR)/usr/share/man/man*/*gawk.1
-	rm -rf $(TARGET_DIR)/usr/libexec/awk
-	rm -rf $(TARGET_DIR)/usr/share/awk
-endef
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
index f933436..87c0946 100644
--- a/package/gdisk/gdisk.mk
+++ b/package/gdisk/gdisk.mk
@@ -30,10 +30,6 @@ define GDISK_INSTALL_TARGET_CMDS
 	done
 endef
 
-define GDISK_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(GDISK_TARGETS_y))
-endef
-
 endif
 
 $(eval $(generic-package))
diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
index ddc832a..f60dd69 100644
--- a/package/googlefontdirectory/googlefontdirectory.mk
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -20,8 +20,4 @@ define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
 	done
 endef
 
-define GOOGLEFONTDIRECTORY_UNINSTALL_TARGET_CMDS
-	rm -rf $(addprefix $(TARGET_DIR)/usr/share/fonts/,$(GOOGLEFONTDIRECTORY_FONTS))
-endef
-
 $(eval $(generic-package))
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 19b54c0..fb3183a 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -26,9 +26,4 @@ define HDPARM_INSTALL_TARGET_CMDS
 	$(HDPARM_INSTALL_DOCUMENTATION)
 endef
 
-define HDPARM_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/hdparm
-	rm -f $(TARGET_DIR)/usr/share/man/man8/hdparm.8
-endef
-
 $(eval $(generic-package))
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index c56dea4..e34793f 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -13,9 +13,4 @@ define HWDATA_INSTALL_TARGET_CMDS
 	install -D -m 644 $(@D)/usb.ids $(TARGET_DIR)/usr/share/hwdata/usb.ids
 endef
 
-define HWDATA_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/usr/share/hwdata
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
-endef
-
 $(eval $(generic-package))
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index f77f563..f3be138 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -26,9 +26,4 @@ define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
 			$(TARGET_DIR)/etc/init.d/S99input-event-daemon
 endef
 
-define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/input-event-daemon
-	rm -f $(TARGET_DIR)/etc/input-event-daemon.conf
-endef
-
 $(eval $(generic-package))
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 4e0b1cf..07f3cac 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -38,8 +38,4 @@ define INPUT_TOOLS_INSTALL_TARGET_CMDS
 	done
 endef
 
-define INPUT_TOOLS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(INPUT_TOOLS_TARGETS_y))
-endef
-
 $(eval $(generic-package))
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 69377f0..06fd251 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -21,9 +21,4 @@ define IOSTAT_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/man/man8/iostat.8
 endef
 
-define IOSTAT_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/iostat
-	rm -f $(TARGET_DIR)/usr/share/man/man8/iostat.8
-endef
-
 $(eval $(generic-package))
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 7766ab8..1c240a6 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -53,12 +53,4 @@ define IPROUTE2_INSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/ifcfg
 endef
 
-define IPROUTE2_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/lib/tc
-	rm -rf $(TARGET_DIR)/usr/lib/tc
-	rm -rf $(TARGET_DIR)/etc/iproute2
-	rm -rf $(TARGET_DIR)/var/lib/arpd
-	rm -f $(addprefix $(TARGET_DIR)/sbin/, $(IPROUTE2_TARGET_SBINS))
-endef
-
 $(eval $(generic-package))
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 518b90e..cfa17a8 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -38,11 +38,4 @@ else
 IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_IPV6_REMOVE
 endif
 
-define IPTABLES_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/iptables-xml
-	rm -f $(TARGET_DIR)/usr/sbin/iptables* $(TARGET_DIR)/usr/sbin/ip6tables*
-	rm -f $(TARGET_DIR)/usr/sbin/xtables-multi
-	rm -rf $(TARGET_DIR)/usr/lib/xtables
-endef
-
 $(eval $(autotools-package))
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index e993e5a..b28a4fd 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -35,8 +35,4 @@ define IRDA_UTILS_INSTALL_TARGET_CMDS
 	done
 endef
 
-define IRDA_UTILS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(IRDA_UTILS_SBINS-))
-endef
-
 $(eval $(generic-package))
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 54c42d7..c97d62c 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -34,9 +34,4 @@ define IW_INSTALL_TARGET_CMDS
 	$(IW_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-define IW_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/iw
-	rm -f $(TARGET_DIR)/usr/share/man/man8/iw.8*
-endef
-
 $(eval $(generic-package))
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index 76adad6..fe5bdc5 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -11,8 +11,4 @@ define JQUERY_SPARKLINE_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/var/www/jquery.sparkline.js
 endef
 
-define JQUERY_SPARKLINE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.sparkline.js
-endef
-
 $(eval $(generic-package))
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 746b534..b280a54 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -11,8 +11,4 @@ define JQUERY_VALIDATION_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/var/www/jquery.validate.js
 endef
 
-define JQUERY_VALIDATION_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.validate.js
-endef
-
 $(eval $(generic-package))
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 871f7a0..ac86497 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -11,8 +11,4 @@ define JQUERY_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/var/www/jquery.js
 endef
 
-define JQUERY_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.js
-endef
-
 $(eval $(generic-package))
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 0e82008..308fc55 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -9,10 +9,6 @@ define JSMIN_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/jsmin $(TARGET_DIR)/usr/bin/jsmin
 endef
 
-define JSMIN_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/jsmin
-endef
-
 define HOST_JSMIN_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
 endef
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 3787f07..d322310 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -61,9 +61,4 @@ define KISMET_UNINSTALL_TARGET_CONFIGS
 endef
 endif
 
-define KISMET_UNINSTALL_TARGET_CMDS
-	$(KISMET_UNINSTALL_TARGET_BINARIES)
-	$(KISMET_UNINSTALL_TARGET_CONFIGS)
-endef
-
 $(eval $(autotools-package))
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index fa9958e..2ec9f3b 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -24,9 +24,4 @@ define LCDAPI_INSTALL_TARGET_CMDS
 		DESTDIR="$(TARGET_DIR)" install
 endef
 
-define LCDAPI_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		DESTDIR="$(TARGET_DIR)" uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/less/less.mk b/package/less/less.mk
index 72449c3..c7c9066 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -15,8 +15,4 @@ define LESS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
 endef
 
-define LESS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/less
-endef
-
 $(eval $(autotools-package))
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 39f3973..4a7b06f 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -27,9 +27,4 @@ endef
 
 LIBIDN_POST_INSTALL_TARGET_HOOKS += LIBIDN_REMOVE_EMACS_STUFF
 
-define LIBIDN_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/libidn*
-	rm -f $(TARGET_DIR)/usr/bin/idn
-endef
-
 $(eval $(autotools-package))
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 35b2a51..9e2c1f1 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -15,11 +15,6 @@ LIBNL_BINARIES = class-add class-delete class-list classid-lookup cls-add \
 	cls-delete cls-list link-list pktloc-lookup qdisc-add qdisc-delete \
 	qdisc-list
 
-define LIBNL_UNINSTALL_TARGET_CMDS
-	rm -r $(TARGET_DIR)/usr/lib/libnl.* $(TARGET_DIR)/usr/lib/libnl-*.*
-	rm -rf $(TARGET_DIR)/usr/lib/libnl
-endef
-
 define LIBNL_REMOVE_TOOLS
 	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/nl-, $(LIBNL_BINARIES))
 	rm -rf $(TARGET_DIR)/usr/sbin/genl-ctrl-list
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 7f2d885..0eb18d1 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -18,10 +18,6 @@ define LIBROXML_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define LIBROXML_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-endef
-
 define LIBROXML_DISABLE_DOXYGEN
 	$(SED) 's:) doxy:):' $(@D)/Makefile
 endef
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index b5b1e1c..21dfa2d 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -23,9 +23,4 @@ define LIBSVGTINY_INSTALL_TARGET_CMDS
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
-define LIBSVGTINY_UNINSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 18ffbef..5ecbcc5 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -106,10 +106,4 @@ define LIGHTTPD_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
 endef
 
-define LIGHTTPD_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/sbin/lighttpd
-	$(RM) $(TARGET_DIR)/usr/sbin/lighttpd-angel
-	$(RM) -r $(TARGET_DIR)/usr/lib/lighttpd
-endef
-
 $(eval $(autotools-package))
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index a5418a5..e975b2a 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -26,10 +26,4 @@ define LINENOISE_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(TARGET_DIR)/usr/bin/linenoise_example
 endef
 
-define LINENOISE_UNINSTALL_TARGET_CMDS
-	rm -f   $(TARGET_DIR)/usr/include/linenoise.h
-	rm -f   $(TARGET_DIR)/usr/lib/liblinenoise.a
-	rm -f   $(TARGET_DIR)/usr/bin/linenoise_example
-endef
-
 $(eval $(generic-package))
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 162c399..62c04fb 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -38,10 +38,4 @@ define LINUX_FUSION_INSTALL_TARGET_CMDS
 	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
 endef
 
-define LINUX_FUSION_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/include/linux/fusion.h
-	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX_FOR_FUSION)/kernel/drivers/char/fusion
-	rm -f $(LINUX_FUSION_ETC_DIR)/40-fusion.rules
-endef
-
 $(eval $(generic-package))
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index fc33b63..942f801 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -57,10 +57,4 @@ define LIVE555_INSTALL_TARGET_CMDS
 	done
 endef
 
-define LIVE555_UNINSTALL_TARGET_CMDS
-	for i in $(LIVE555_FILES_TO_INSTALL-); do \
-		rm -f $(addprefix $(TARGET_DIR)/usr/bin/, `basename $$i`); \
-	done
-endef
-
 $(eval $(generic-package))
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 1866312..3028fdd 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -34,8 +34,4 @@ define LM_SENSORS_INSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
 endef
 
-define LM_SENSORS_UNINSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 2f86b62..968bdf4 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -24,8 +24,4 @@ define LOCKFILE_PROGS_INSTALL_TARGET_CMDS
 	done
 endef
 
-define LOCKFILE_PROGS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(LOCKFILE_BINS))
-endef
-
 $(eval $(generic-package))
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 865dc24..ba9f91e 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -23,12 +23,4 @@ define LOGROTATE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
 endef
 
-define LOGROTATE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/logrotate
-	rm -f $(TARGET_DIR)/etc/logrotate.conf
-	rm -f $(TARGET_DIR)/usr/man/man5/logrotate.conf.5
-	rm -f $(TARGET_DIR)/usr/man/man8/logrotate.8
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/logrotate.d
-endef
-
 $(eval $(generic-package))
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 1b696f6..72eec68 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -62,8 +62,4 @@ define LSOF_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/lsof $(TARGET_DIR)/bin/lsof
 endef
 
-define LSOF_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/bin/lsof
-endef
-
 $(eval $(generic-package))
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 706c96e..cc5592f 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -17,8 +17,4 @@ define LUA_MSGPACK_NATIVE_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 -D $(@D)/msgpack.so $(TARGET_DIR)/usr/lib/lua/msgpack.so
 endef
 
-define LUA_MSGPACK_NATIVE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/msgpack.so
-endef
-
 $(eval $(generic-package))
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 9aefcde..aaefd87 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -111,17 +111,5 @@ LUA_INSTALLED_FILES = \
 	/usr/lib/liblua.a \
 	/usr/lib/liblua.so*
 
-define LUA_UNINSTALL_TARGET_CMDS
-	for i in $(LUA_INSTALLED_FILES); do \
-		rm -f $(TARGET_DIR)$$i; \
-	done
-endef
-
-define HOST_LUA_UNINSTALL_TARGET_CMDS
-	for i in $(LUA_INSTALLED_FILES); do \
-		rm -f $(HOST_DIR)$$i; \
-	done
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
index 6b0db29..1dfd322 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -23,8 +23,4 @@ define LUACJSON_INSTALL_TARGET_CMDS
 	install -D -m 0644 $(@D)/cjson.so $(TARGET_DIR)/usr/lib/lua/cjson.so
 endef
 
-define LUACJSON_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/cjson.so
-endef
-
 $(eval $(generic-package))
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 1257c8e..8ad0dd7 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -27,9 +27,4 @@ define LUAEXPAT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/src/lxp/lom.lua $(TARGET_DIR)/usr/share/lua/lxp/lom.lua
 endef
 
-define LUAEXPAT_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/lxp.so
-	rm -f $(TARGET_DIR)/usr/share/lua/lxp/lom.lua
-endef
-
 $(eval $(generic-package))
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 95d60bc..d00eef1 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -21,8 +21,4 @@ define LUAFILESYSTEM_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/src/lfs.so $(TARGET_DIR)/usr/lib/lua/lfs.so
 endef
 
-define LUAFILESYSTEM_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/lib/lua/lfs.so"
-endef
-
 $(eval $(generic-package))
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 968fcea..2ac8ba8 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -55,8 +55,4 @@ define LUAJIT_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
 endef
 
-define LUAJIT_UNINSTALL_TARGET_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 65cbd59..cbb150e 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -22,13 +22,4 @@ define LUASOCKET_INSTALL_TARGET_CMDS
 		INSTALL_TOP_LIB="$(TARGET_DIR)/usr/lib/lua" install
 endef
 
-define LUASOCKET_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/lib/lua/mime"
-	rm -rf "$(TARGET_DIR)/usr/lib/lua/socket"
-	rm -rf "$(TARGET_DIR)/usr/share/lua/socket"
-	rm -f "$(TARGET_DIR)/usr/share/lua/socket.lua"
-	rm -f "$(TARGET_DIR)/usr/share/lua/mime.lua"
-	rm -f "$(TARGET_DIR)/usr/share/lua/ltn12.lua"
-endef
-
 $(eval $(generic-package))
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 8cc10a4..463b1c3 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -47,9 +47,4 @@ else
 LVM2_CONF_OPT += --disable-applib
 endif
 
-define LVM2_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(LVM2_BINS))
-	rm -f $(addprefix $(TARGET_DIR)/usr/lib/,libdevmapper.so*)
-endef
-
 $(eval $(autotools-package))
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 5e984c6..05706bf 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -17,10 +17,6 @@ define MAKEDEVS_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/makedevs $(TARGET_DIR)/usr/sbin/makedevs
 endef
 
-define MAKEDEVS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/makedevs
-endef
-
 
 define HOST_MAKEDEVS_BUILD_CMDS
 	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 4adacd1..ca84aa2 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -19,9 +19,4 @@ define MEMSTAT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/memstat $(TARGET_DIR)/usr/bin/memstat
 endef
 
-define MEMSTAT_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/etc/memstat.conf
-	rm -f $(TARGET_DIR)/usr/bin/memstat
-endef
-
 $(eval $(generic-package))
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 2c1f538..0982c0b 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -18,8 +18,4 @@ define MEMTESTER_INSTALL_TARGET_CMDS
 	$(MAKE) $(MEMTESTER_TARGET_INSTALL_OPTS) -C $(@D) install
 endef
 
-define MEMTESTER_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/memtester
-endef
-
 $(eval $(generic-package))
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index b2a912a..b1a68cd 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -146,11 +146,5 @@ define MICROPERL_INSTALL_TARGET_CMDS
 		-exec rm -f {} \;
 endef
 
-define MICROPERL_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/perl
-	rm -f $(TARGET_DIR)/usr/bin/microperl
-	rm -rf $(TARGET_DIR)/usr/lib/perl5
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index a3952c2..88c5e6f 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -28,8 +28,4 @@ define MII_DIAG_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define MII_DIAG_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/mii-diag
-endef
-
 $(eval $(generic-package))
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 10281ae..6d40879 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -16,8 +16,4 @@ define MROUTED_INSTALL_TARGET_CMDS
 	$(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define MROUTED_UNINSTALL_TARGET_CMDS
-	$(MAKE) prefix=/usr DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 6228574..7cf3adb 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -56,8 +56,4 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
 	fi
 endef
 
-define ALSA_UTILS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/,$(ALSA_UTILS_TARGETS_) $(ALSA_UTILS_TARGETS_y))
-endef
-
 $(eval $(autotools-package))
diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index 74b4c98..8f7fd4d 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -9,10 +9,6 @@ define GST_DSP_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 endef
 
-define GST_DSP_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstdsp.so
-endef
-
 GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries host-pkgconf
 
 $(eval $(generic-package))
diff --git a/package/multimedia/gst-omapfb/gst-omapfb.mk b/package/multimedia/gst-omapfb/gst-omapfb.mk
index f23bc86..0579ec8 100644
--- a/package/multimedia/gst-omapfb/gst-omapfb.mk
+++ b/package/multimedia/gst-omapfb/gst-omapfb.mk
@@ -10,10 +10,6 @@ define GST_OMAPFB_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 endef
 
-define GST_OMAPFB_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstomapfb.so
-endef
-
 GST_OMAPFB_DEPENDENCIES = gstreamer
 
 $(eval $(generic-package))
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 4832775..592200b 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -166,8 +166,4 @@ define MPLAYER_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define MPLAYER_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/multimedia/tidsp-binaries/tidsp-binaries.mk b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
index 356baf4..2aeec01 100644
--- a/package/multimedia/tidsp-binaries/tidsp-binaries.mk
+++ b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
@@ -6,8 +6,4 @@ define TIDSP_BINARIES_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 endef
 
-define TIDSP_BINARIES_UNINSTALL_TARGET_CMDS
-	$(RM) -r $(TARGET_DIR)/lib/dsp
-endef
-
 $(eval $(generic-package))
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 61bf218..2c30332 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -20,8 +20,4 @@ define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
 
-define NANO_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/nano
-endef
-
 $(eval $(autotools-package))
diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index de4cc5f..b11e30d 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -22,8 +22,4 @@ define NANOCOM_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/nanocom $(TARGET_DIR)/usr/bin/nanocom
 endef
 
-define NANOCOM_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/bin/nanocom
-endef
-
 $(eval $(generic-package))
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 4056397..7fecf4d 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -37,8 +37,4 @@ define NCFTP_INSTALL_TARGET_CMDS
 	$(NCFTP_INSTALL_NCFTP_BATCH)
 endef
 
-define NCFTP_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS) ncftpspooler)
-endef
-
 $(eval $(autotools-package))
diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 4af5e85..6edc913 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -15,9 +15,4 @@ define NETPERF_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/netserver
 endef
 
-define NETPERF_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/netperf
-	rm -f $(TARGET_DIR)/usr/bin/netserver
-endef
-
 $(eval $(autotools-package))
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index d22d3ab..47e0c95 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -15,10 +15,4 @@ define NETPLUG_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
-define NETPLUG_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/sbin/netplugd
-	rm -rf $(TARGET_DIR)/etc/netplug*
-	rm -f $(TARGET_DIR)/etc/init.d/S*netplug
-endef
-
 $(eval $(generic-package))
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 2670cf3..824af2d 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -73,13 +73,6 @@ define NETSNMP_INSTALL_TARGET_CMDS
 	$(NETSNMP_REMOVE_MIBS_IPV6)
 endef
 
-define NETSNMP_UNINSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) uninstall
-	rm -f $(TARGET_DIR)/etc/init.d/S59snmpd
-	rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
-endef
-
 define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index 09cbf5e..dd8d4bd 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -19,8 +19,4 @@ define NOIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/noip2 $(TARGET_DIR)/usr/sbin/noip2
 endef
 
-define NOIP_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/sbin/noip2"
-endef
-
 $(eval $(generic-package))
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index a9a7f10..6cd2bc9 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -58,13 +58,6 @@ define NTP_INSTALL_TARGET_CMDS
 	fi
 endef
 
-define NTP_UNINSTALL_TARGET_CMDS
-	rm $(TARGET_DIR)/usr/sbin/ntpd
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(NTP_INSTALL_FILES_y))
-	rm $(TARGET_DIR)/etc/init.d/S49ntp
-	rm $(TARGET_DIR)/etc/default/ntpd
-endef
-
 NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS
 
 $(eval $(autotools-package))
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index df03dca..35fef92 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -18,8 +18,4 @@ define NUTTCP_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/nuttcp
 endef
 
-define NUTTCP_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/nuttcp
-endef
-
 $(eval $(generic-package))
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index fab68b6..61be98a 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -10,10 +10,4 @@ OPENNTPD_CONF_OPT = --with-builtin-arc4random --disable-strip
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = LICENCE
 
-define OPENNTPD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/ntpd
-	rm -f $(TARGET_DIR)/etc/ntpd.conf
-	rm -f $(TARGET_DIR)/usr/share/man/man?/ntpd*
-endef
-
 $(eval $(autotools-package))
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index a49daca..27b9f3b 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -46,9 +46,4 @@ define OPENVPN_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/init.d/S60openvpn
 endef
 
-define OPENVPN_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/openvpn
-	rm -f $(TARGET_DIR)/etc/init.d/S60openvpn
-endef
-
 $(eval $(autotools-package))
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index f3ea23f..55e7c8b 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -45,11 +45,4 @@ define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/libopagent/.libs/*.so* $(TARGET_DIR)/usr/lib/oprofile
 endef
 
-define OPROFILE_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(notdir $(OPROFILE_BINARIES)))
-	rm -f $(TARGET_DIR)/usr/bin/opcontrol
-	rm -rf $(TARGET_DIR)/usr/share/oprofile
-	rm -rf $(TARGET_DIR)/usr/lib/oprofile
-endef
-
 $(eval $(autotools-package))
diff --git a/package/php/php.mk b/package/php/php.mk
index a07e84d..f554ee2 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -221,11 +221,6 @@ endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
 
-define PHP_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/etc/php.ini
-	rm -f $(TARGET_DIR)/usr/bin/php*
-endef
-
 PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)"
 
 $(eval $(autotools-package))
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 80bfd4f..a94120a 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -33,10 +33,4 @@ define PORTMAP_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/init.d
 endef
 
-define PORTMAP_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/sbin/,$(PORTMAP_SBINS))
-	rm -f $(addprefix $(TARGET_DIR)/usr/share/man/man8/, \
-		$(addsuffix .8,$(PORTMAP_SBINS)))
-endef
-
 $(eval $(generic-package))
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index b13dbab..6fb6421 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -43,19 +43,6 @@ define PPPD_BUILD_CMDS
 		-C $(@D) $(PPPD_MAKE_OPT)
 endef
 
-define PPPD_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(PPPD_TARGET_BINS))
-	rm -f $(TARGET_DIR)/usr/sbin/pppoe-discovery
-	rm -rf $(TARGET_DIR)/usr/lib/pppd
-	rm -rf $(TARGET_DIR)/etc/ppp/radius
-	for m in $(PPPD_MANPAGES); do \
-		rm -f $(TARGET_DIR)/usr/share/man/man8/$$m.8; \
-	done
-	for m in $(PPPD_RADIUS_MANPAGES); do \
-		rm -f $(TARGET_DIR)/usr/share/man/man8/$$m.8; \
-	done
-endef
-
 ifeq ($(BR2_PACKAGE_PPPD_RADIUS),y)
 define PPPD_INSTALL_RADIUS
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radattr.so \
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index ded2a19..3d8f6b0 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -21,9 +21,4 @@ define PPTP_LINUX_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/pptp.8 $(TARGET_DIR)/usr/share/man/man8/pptp.8
 endef
 
-define PPTP_LINUX_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/pptp
-	rm -f $(TARGET_DIR)/usr/share/man/man8/pptp.8
-endef
-
 $(eval $(generic-package))
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 1d02194..bf85d89 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -37,10 +37,4 @@ define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d
 endef
 
-define PROFTPD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/etc/init.d/S50proftpd
-	rm -f $(TARGET_DIR)/etc/proftpd.conf
-endef
-
 $(eval $(autotools-package))
diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
index a053b2c..deb41ac 100644
--- a/package/python-nfc/python-nfc.mk
+++ b/package/python-nfc/python-nfc.mk
@@ -16,8 +16,4 @@ define PYTHON_NFC_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-define PYTHON_NFC_UNINSTALL_TARGET_CMDS
-	$(RM) -r $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/nfc/
-endef
-
 $(eval $(generic-package))
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index f3426a4..4544eaa 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -104,8 +104,4 @@ define PYTHON_PYGAME_INSTALL_TARGET_CMDS
 	$(PYTHON_PYGAME_REMOVE_DOC)
 endef
 
-define PYTHON_PYGAME_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame*
-endef
-
 $(eval $(generic-package))
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 7304c92..41a1014 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -632,10 +632,4 @@ define QT_INSTALL_TARGET_CMDS
 	$(QT_INSTALL_TARGET_FONTS_TTF)
 endef
 
-define QT_UNINSTALL_TARGET_CMDS
-	-rm -rf $(TARGET_DIR)/usr/lib/fonts
-	-rm $(TARGET_DIR)/usr/lib/libQt*.so.*
-	-rm $(TARGET_DIR)/usr/lib/libphonon.so.*
-endef
-
 $(eval $(generic-package))
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index ef54b22..7bd0b11 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -18,9 +18,4 @@ define RINGS_INSTALL_TARGET_CMDS
 		LUA_DIR="$(TARGET_DIR)/usr/share/lua" install
 endef
 
-define RINGS_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/lib/lua/rings.so"
-	rm -f "$(TARGET_DIR)/usr/share/lua/stable.lua"
-endef
-
 $(eval $(generic-package))
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 106d310..85af370 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -26,13 +26,4 @@ define RP_PPPOE_INSTALL_TARGET_CMDS
 	done
 endef
 
-define RP_PPPOE_UNINSTALL_TARGET_CMDS
-	for ff in $(RP_PPPOE_TARGET_FILES); do \
-		rm -f $(TARGET_DIR)/usr/sbin/$$ff; \
-	done
-	for ff in $(RP_PPPOE_TARGET_FILES); do \
-		rm -f $(TARGET_DIR)/usr/share/man/man8/$$ff.8; \
-	done
-endef
-
 $(eval $(autotools-package))
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index d3b63ea..381ad14 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -24,10 +24,4 @@ endef
 
 RRDTOOL_POST_INSTALL_TARGET_HOOKS += RRDTOOL_REMOVE_EXAMPLES
 
-define RRDTOOL_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-	rm -rf $(TARGET_DIR)/usr/share/rrdtool
-	rm -f $(TARGET_DIR)/usr/lib/librrd*
-endef
-
 $(eval $(autotools-package))
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index 55966f3..49e7271 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -27,10 +27,4 @@ define RSH_REDONE_INSTALL_TARGET_CMDS
 			$(if $(rsh-redone-sbin-y),install-sbin))
 endef
 
-define RSH_REDONE_UNINSTALL_TARGET_CMDS
-	rm -f \
-		$(addprefix $(TARGET_DIR)/usr/bin/,$(rsh-redone-bin-y)) \
-		$(addprefix $(TARGET_DIR)/usr/sbin/,$(rsh-redone-sbin-y))
-endef
-
 $(eval $(generic-package))
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index 3933ddb..f274ac4 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -39,9 +39,4 @@ define SCHIFRA_INSTALL_STAGING_CMDS
 		$(INSTALL) -m 0644 -D $$i $(STAGING_DIR)/usr/include/$$i; done
 endef
 
-define SCHIFRA_UNINSTALL_TARGET_CMDS
-	$(RM) $(TARGET_DIR)/usr/include/schifra_*.hpp
-	$(RM) $(TARGET_DIR)/usr/bin/schifra_*
-endef
-
 $(eval $(generic-package))
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 2f163a2..074ee86 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -48,9 +48,4 @@ endif
 
 # target shared libs doesn't get removed by make uninstall if the .la
 # files are removed (E.G. if BR2_HAVE_DEVFILES isn't set)
-define SDL_SOUND_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)
-	rm -f $(TARGET_DIR)/usr/lib/libSDL_sound*so*
-endef
-
 $(eval $(autotools-package))
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 39a9a69..8b5a1f4 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -31,12 +31,4 @@ define SLANG_INSTALL_TARGET_CMDS
 	(cd $(TARGET_DIR)/usr/lib; ln -fs libslang.so libslang.so.1)
 endef
 
-define SLANG_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/libslang.a
-	rm -f $(TARGET_DIR)/usr/lib/libslang.so
-	rm -f $(TARGET_DIR)/usr/lib/libslang.so.1
-	rm -f $(TARGET_DIR)/usr/include/slang.h
-	rm -f $(TARGET_DIR)/usr/include/slcurses.h
-endef
-
 $(eval $(generic-package))
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
index 198af4c..cb40dcb 100644
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -21,10 +21,5 @@ define SNOWBALL_HDMISERVICE_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" DESTDIR=$(TARGET_DIR) install
 endef
 
-define SNOWBALL_HDMISERVICE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/hdmiservice.so
-	rm -f $(TARGET_DIR)/usr/bin/hdmistart
-endef
-
 
 $(eval $(generic-package))
diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
index afca72a..45d5147 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.mk
+++ b/package/sound-theme-borealis/sound-theme-borealis.mk
@@ -14,8 +14,4 @@ define SOUND_THEME_BOREALIS_INSTALL_TARGET_CMDS
 	done
 endef
 
-define SOUND_THEME_BOREALIS_UNINSTALL_TARGET_CMDS
-	$(RM) -r $(TARGET_DIR)/usr/share/sounds/borealis
-endef
-
 $(eval $(generic-package))
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 091cfa4..1a85524 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -39,11 +39,4 @@ else
 SQLCIPHER_CONF_OPT += --disable-readline
 endif
 
-define SQLCIPHER_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/sqlite3
-	rm -f $(TARGET_DIR)/usr/lib/libsqlite3*
-	rm -f $(TARGET_DIR)/usr/lib/pkgconfig/sqlite3.pc
-	rm -f $(TARGET_DIR)/usr/include/sqlite3*.h
-endef
-
 $(eval $(autotools-package))
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 116f4f7..2e5499a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -55,9 +55,4 @@ else
 SQLITE_CONF_OPT += --disable-readline
 endif
 
-define SQLITE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/sqlite3
-	rm -f $(TARGET_DIR)/usr/lib/libsqlite3*
-endef
-
 $(eval $(autotools-package))
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index bc2cbe2..4d7f7265 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -16,8 +16,4 @@ define SREDIRD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/sredird $(TARGET_DIR)/usr/sbin/sredird
 endef
 
-define SREDIRD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/sredird
-endef
-
 $(eval $(generic-package))
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index e078b2c..fe6f103 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -23,10 +23,6 @@ define SSTRIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/sstrip $(TARGET_DIR)/usr/bin/sstrip
 endef
 
-define SSTRIP_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/sstrip
-endef
-
 define HOST_SSTRIP_BUILD_CMDS
 	cd $(@D) ; \
 	$(HOSTCC) $(HOST_CFLAGS) -include endian.h -include byteswap.h \
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 0cdc3fb..1d138cd 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -38,14 +38,4 @@ define SYSKLOGD_INSTALL_TARGET_CMDS
 	fi
 endef
 
-define SYSKLOGD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/syslogd
-	rm -f $(TARGET_DIR)/usr/sbin/klogd
-	rm -f $(TARGET_DIR)/usr/share/man/man8/sysklogd.8
-	rm -f $(TARGET_DIR)/usr/share/man/man8/syslogd.8
-	rm -f $(TARGET_DIR)/usr/share/man/man5/syslog.conf.5
-	rm -f $(TARGET_DIR)/usr/share/man/man8/klogd.8
-	rm -f $(TARGET_DIR)/etc/syslog.conf
-endef
-
 $(eval $(generic-package))
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 3f83f81..720de32 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -36,10 +36,4 @@ define SYSVINIT_INSTALL_TARGET_CMDS
 	install -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
 endef
 
-define SYSVINIT_UNINSTALL_TARGET_CMDS
-	for x in halt init shutdown; do \
-		rm -f $(TARGET_DIR)/sbin/$$x || exit 1; \
-	done
-endef
-
 $(eval $(generic-package))
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index dc7c285..55b3204 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -38,14 +38,4 @@ define THTTPD_INSTALL_TARGET_CMDS
 	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)/var/www/thttpd_config
 endef
 
-define THTTPD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/thttpd
-	rm -f $(TARGET_DIR)/usr/sbin/thttpd_wrapper
-	rm -rf $(TARGET_DIR)/var/www
-	rm -f $(TARGET_DIR)/etc/init.d/S90thttpd
-	rm -f $(TARGET_DIR)/usr/bin/htpasswd
-	rm -f $(TARGET_DIR)/usr/bin/makeweb
-	rm -f $(TARGET_DIR)/usr/bin/syslogtocern
-endef
-
 $(eval $(autotools-package))
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 956daf4..2f7e6c1 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -23,9 +23,4 @@ define TI_UTILS_INSTALL_TARGET_CMDS
 	cp -r $(@D)/ini_files $(TARGET_DIR)/usr/share/ti-utils
 endef
 
-define TI_UTILS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/calibrator
-	rm -fr $(TARGET_DIR)/usr/share/ti-utils
-endef
-
 $(eval $(generic-package))
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 7b16eb1..7813f2f 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -25,10 +25,4 @@ endef
 
 TN5250_POST_INSTALL_TARGET_HOOKS += TN5250_INSTALL_FIXES
 
-define TN5250_UNINSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(TN5250_DIR)
-	rm -f $(TARGET_DIR)/usr/lib/lib5250.*
-	rm -rf $(TARGET_DIR)/usr/share/tn5250
-endef
-
 $(eval $(autotools-package))
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 9d7596a..2da990c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -36,11 +36,6 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
 endef
 
-define UBOOT_TOOLS_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/,\
-		usr/bin/mkimage usr/sbin/fw_printenv usr/sbin/fw_setenv)
-endef
-
 define HOST_UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE1) -C $(@D) 			\
 		HOSTCC="$(HOSTCC)"		\
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 0cbcc0b..3c060c8 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -19,8 +19,4 @@ define UEMACS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/em $(TARGET_DIR)/usr/bin/em
 endef
 
-define UEMACS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/em
-endef
-
 $(eval $(generic-package))
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 3596c9b..61279c2 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -24,11 +24,4 @@ define USBMOUNT_INSTALL_TARGET_CMDS
 	mkdir -p $(addprefix $(TARGET_DIR)/media/usb,0 1 2 3 4 5 6 7)
 endef
 
-define USBMOUNT_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/etc/usbmount			\
-		$(TARGET_DIR)/usr/share/usbmount/usbmount	\
-		$(TARGET_DIR)/lib/udev/rules.d/usbmount.rules	\
-		$(TARGET_DIR)/media/usb?
-endef
-
 $(eval $(generic-package))
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 21335bd..76e6e33 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -50,11 +50,4 @@ define VSFTPD_INSTALL_TARGET_CMDS
 	install -d -m 700 $(TARGET_DIR)/usr/share/empty
 endef
 
-define VSFTPD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/vsftpd
-	rm -f $(TARGET_DIR)/usr/share/man/man8/vsftpd.8
-	rm -f $(TARGET_DIR)/usr/share/man/man5/vsftpd.conf.5
-	rm -f $(TARGET_DIR)/etc/init.d/S70vsftpd
-endef
-
 $(eval $(generic-package))
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index 8e0a081..ae8e66e 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -20,8 +20,4 @@ define WHETSTONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/whetstone $(TARGET_DIR)/usr/bin/whetstone
 endef
 
-define WHETSTONE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/whetstone
-endef
-
 $(eval $(generic-package))
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index eed90be..20fd7cb 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -16,9 +16,4 @@ define WIPE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/wipe.1 $(TARGET_DIR)/usr/share/man/man1/wipe.1
 endef
 
-define WIPE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/wipe
-	rm -f $(TARGET_DIR)/usr/share/man/man1/wipe.1
-endef
-
 $(eval $(autotools-package))
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 0b360fb..9799dd2 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -36,8 +36,4 @@ define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) INSTALL_MAN="$(TARGET_DIR)/usr/share/man" install-man
 endef
 
-define WIRELESS_TOOLS_UNINSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" uninstall
-endef
-
 $(eval $(generic-package))
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index eb2b51c..f54ccdf 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -15,8 +15,4 @@ define WSAPI_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/lua/wsapi
 endef
 
-define WSAPI_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/lua/wsapi"
-endef
-
 $(eval $(generic-package))
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 0c1c6f1..2a6aa8d 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -15,10 +15,4 @@ define XAVANTE_INSTALL_TARGET_CMDS
 		LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" install
 endef
 
-define XAVANTE_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/xavante"
-	rm -f "$(TARGET_DIR)/usr/share/xavante.lua"
-	rm -f "$(TARGET_DIR)/usr/share/sajax.lua"
-endef
-
 $(eval $(generic-package))
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 8641821..da9c047 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -60,13 +60,5 @@ define HOST_ZLIB_INSTALL_CMDS
 	$(MAKE1) -C $(@D) LDCONFIG=true install
 endef
 
-define ZLIB_UNINSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) uninstall
-endef
-
-define HOST_ZLIB_UNINSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) uninstall
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 7882f6a..9f5e921 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -30,8 +30,4 @@ define ZXING_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) install
 endef
 
-define ZXING_UNINSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) uninstall
-endef
-
 $(eval $(generic-package))
-- 
1.7.9.5
