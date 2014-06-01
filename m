From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 15:10:56 +0200
Subject: [Buildroot] [PATCH] packages: replace command install by
 $(INSTALL)
In-Reply-To: <1401626281-29034-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1401626281-29034-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140601131056.GD3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-06-01 14:38 +0200, Maxime Hadjinlian spake thusly:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/alsa-utils/alsa-utils.mk               | 2 +-
>  package/boa/boa.mk                             | 8 ++++----
>  package/bonnie/bonnie.mk                       | 4 ++--
>  package/bsdiff/bsdiff.mk                       | 4 ++--
>  package/busybox/busybox.mk                     | 6 +++---
>  package/cramfs/cramfs.mk                       | 8 ++++----
>  package/cvs/cvs.mk                             | 2 +-
>  package/dhcpdump/dhcpdump.mk                   | 2 +-
>  package/dialog/dialog.mk                       | 2 +-
>  package/distcc/distcc.mk                       | 4 ++--
>  package/ezxml/ezxml.mk                         | 8 ++++----
>  package/fan-ctrl/fan-ctrl.mk                   | 2 +-
>  package/fbv/fbv.mk                             | 2 +-
>  package/hwdata/hwdata.mk                       | 4 ++--
>  package/input-tools/input-tools.mk             | 2 +-
>  package/lockfile-progs/lockfile-progs.mk       | 2 +-
>  package/lsof/lsof.mk                           | 2 +-
>  package/makedevs/makedevs.mk                   | 4 ++--
>  package/metacity/metacity.mk                   | 2 +-
>  package/mtd/mtd.mk                             | 2 +-
>  package/ntp/ntp.mk                             | 4 ++--
>  package/omap-u-boot-utils/omap-u-boot-utils.mk | 2 +-
>  package/picocom/picocom.mk                     | 2 +-
>  package/sysvinit/sysvinit.mk                   | 4 ++--
>  package/valgrind/valgrind.mk                   | 2 +-
>  package/vsftpd/vsftpd.mk                       | 8 ++++----
>  26 files changed, 47 insertions(+), 47 deletions(-)
> 
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index 48b4bfd..2083c97 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -41,7 +41,7 @@ ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST) += usr/bin/speaker-tes
>  define ALSA_UTILS_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/var/lib/alsa
>  	for i in $(ALSA_UTILS_TARGETS_y); do \
> -		install -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i; \
> +		$(INSTALL) -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i; \
>  	done
>  	if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ]; then \
>  		mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
> diff --git a/package/boa/boa.mk b/package/boa/boa.mk
> index 39142a9..63a7569 100644
> --- a/package/boa/boa.mk
> +++ b/package/boa/boa.mk
> @@ -10,10 +10,10 @@ BOA_LICENSE = GPLv2+
>  BOA_LICENSE_FILES = COPYING
>  
>  define BOA_INSTALL_TARGET_CMDS
> -	install -D -m 755 $(@D)/src/boa $(TARGET_DIR)/usr/sbin/boa
> -	install -D -m 755 $(@D)/src/boa_indexer $(TARGET_DIR)/usr/lib/boa/boa_indexer
> -	install -D -m 644 package/boa/boa.conf $(TARGET_DIR)/etc/boa/boa.conf
> -	install -D -m 644 package/boa/mime.types $(TARGET_DIR)/etc/mime.types
> +	$(INSTALL) -D -m 755 $(@D)/src/boa $(TARGET_DIR)/usr/sbin/boa
> +	$(INSTALL) -D -m 755 $(@D)/src/boa_indexer $(TARGET_DIR)/usr/lib/boa/boa_indexer
> +	$(INSTALL) -D -m 644 package/boa/boa.conf $(TARGET_DIR)/etc/boa/boa.conf
> +	$(INSTALL) -D -m 644 package/boa/mime.types $(TARGET_DIR)/etc/mime.types
>  endef
>  
>  $(eval $(autotools-package))
> diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
> index 6e879f7..9c576b6 100644
> --- a/package/bonnie/bonnie.mk
> +++ b/package/bonnie/bonnie.mk
> @@ -9,8 +9,8 @@ BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
>  BONNIE_SITE = http://www.coker.com.au/bonnie++/
>  
>  define BONNIE_INSTALL_TARGET_CMDS
> -	install -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin/bonnie++
> -	install -D -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin/zcav
> +	$(INSTALL) -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin/bonnie++
> +	$(INSTALL) -D -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin/zcav
>  endef
>  
>  $(eval $(autotools-package))
> diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
> index 4814e5a..ce6455c 100644
> --- a/package/bsdiff/bsdiff.mk
> +++ b/package/bsdiff/bsdiff.mk
> @@ -16,8 +16,8 @@ define BSDIFF_BUILD_CMDS
>  endef
>  
>  define BSDIFF_INSTALL_TARGET_CMDS
> -	install -D -m 755 $(@D)/bsdiff $(TARGET_DIR)/usr/bin/bsdiff
> -	install -D -m 755 $(@D)/bspatch $(TARGET_DIR)/usr/bin/bspatch
> +	$(INSTALL) -D -m 755 $(@D)/bsdiff $(TARGET_DIR)/usr/bin/bsdiff
> +	$(INSTALL) -D -m 755 $(@D)/bspatch $(TARGET_DIR)/usr/bin/bspatch
>  endef
>  
>  $(eval $(generic-package))
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 150100b..8521a71 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -59,12 +59,12 @@ endef
>  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
>  define BUSYBOX_INSTALL_MDEV_SCRIPT
>  	[ -f $(TARGET_DIR)/etc/init.d/S10mdev ] || \
> -		install -D -m 0755 package/busybox/S10mdev \
> +		$(INSTALL) -D -m 0755 package/busybox/S10mdev \
>  			$(TARGET_DIR)/etc/init.d/S10mdev
>  endef
>  define BUSYBOX_INSTALL_MDEV_CONF
>  	[ -f $(TARGET_DIR)/etc/mdev.conf ] || \
> -		install -D -m 0644 package/busybox/mdev.conf \
> +		$(INSTALL) -D -m 0644 package/busybox/mdev.conf \
>  			$(TARGET_DIR)/etc/mdev.conf
>  endef
>  define BUSYBOX_SET_MDEV
> @@ -182,7 +182,7 @@ define BUSYBOX_SET_WATCHDOG
>  endef
>  define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
>  	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
> -		install -D -m 0755 package/busybox/S15watchdog \
> +		$(INSTALL) -D -m 0755 package/busybox/S15watchdog \
>  			$(TARGET_DIR)/etc/init.d/S15watchdog && \
>  		sed -i s/PERIOD/$(call qstrip,$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD))/ \
>  			$(TARGET_DIR)/etc/init.d/S15watchdog
> diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
> index 710aaa8..bcea6ef 100644
> --- a/package/cramfs/cramfs.mk
> +++ b/package/cramfs/cramfs.mk
> @@ -16,8 +16,8 @@ define CRAMFS_BUILD_CMDS
>  endef
>  
>  define CRAMFS_INSTALL_TARGET_CMDS
> - install -D -m 755 $(@D)/mkcramfs $(TARGET_DIR)/usr/bin/mkcramfs
> - install -D -m 755 $(@D)/cramfsck $(TARGET_DIR)/usr/bin/cramfsck
> + $(INSTALL) -D -m 755 $(@D)/mkcramfs $(TARGET_DIR)/usr/bin/mkcramfs
> + $(INSTALL) -D -m 755 $(@D)/cramfsck $(TARGET_DIR)/usr/bin/cramfsck
>  endef
>  
>  define HOST_CRAMFS_BUILD_CMDS
> @@ -25,8 +25,8 @@ define HOST_CRAMFS_BUILD_CMDS
>  endef
>  
>  define HOST_CRAMFS_INSTALL_CMDS
> - install -D -m 755 $(@D)/mkcramfs $(HOST_DIR)/usr/bin/mkcramfs
> - install -D -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin/cramfsck
> + $(INSTALL) -D -m 755 $(@D)/mkcramfs $(HOST_DIR)/usr/bin/mkcramfs
> + $(INSTALL) -D -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin/cramfsck
>  endef
>  
>  $(eval $(generic-package))
> diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
> index d2a1033..596eabf 100644
> --- a/package/cvs/cvs.mk
> +++ b/package/cvs/cvs.mk
> @@ -46,7 +46,7 @@ endif
>  CVS_POST_PATCH_HOOKS += CVS_DEBIAN_PATCHES
>  
>  define CVS_INSTALL_TARGET_CMDS
> -	install -D $(@D)/src/cvs $(TARGET_DIR)/usr/bin/cvs
> +	$(INSTALL) -D $(@D)/src/cvs $(TARGET_DIR)/usr/bin/cvs
>  endef
>  
>  $(eval $(autotools-package))
> diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
> index ded7c29..76b9def 100644
> --- a/package/dhcpdump/dhcpdump.mk
> +++ b/package/dhcpdump/dhcpdump.mk
> @@ -20,7 +20,7 @@ define DHCPDUMP_BUILD_CMDS
>  endef
>  
>  define DHCPDUMP_INSTALL_TARGET_CMDS
> -	install -m 0755 -D $(@D)/dhcpdump $(TARGET_DIR)/usr/bin/dhcpdump
> +	$(INSTALL) -m 0755 -D $(@D)/dhcpdump $(TARGET_DIR)/usr/bin/dhcpdump
>  endef
>  
>  $(eval $(generic-package))
> diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
> index 9846fd3..e2ce09b 100644
> --- a/package/dialog/dialog.mk
> +++ b/package/dialog/dialog.mk
> @@ -18,7 +18,7 @@ DIALOG_DEPENDENCIES += libiconv
>  endif
>  
>  define DIALOG_INSTALL_TARGET_CMDS
> -	install -c $(@D)/dialog $(TARGET_DIR)/usr/bin/dialog
> +	$(INSTALL) -c $(@D)/dialog $(TARGET_DIR)/usr/bin/dialog
>  endef
>  
>  $(eval $(autotools-package))
> diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
> index b08f176..56f8ff8 100644
> --- a/package/distcc/distcc.mk
> +++ b/package/distcc/distcc.mk
> @@ -12,8 +12,8 @@ DISTCC_LICENSE = GPLv2+
>  DISTCC_LICENSE_FILES = COPYING
>  
>  define DISTCC_INSTALL_TARGET_CMDS
> -	install -D $(@D)/distccd $(TARGET_DIR)/usr/bin/distccd
> -	install -D $(@D)/distcc $(TARGET_DIR)/usr/bin/distcc
> +	$(INSTALL) -D $(@D)/distccd $(TARGET_DIR)/usr/bin/distccd
> +	$(INSTALL) -D $(@D)/distcc $(TARGET_DIR)/usr/bin/distcc
>  endef
>  
>  $(eval $(autotools-package))
> diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
> index 479958a..139bf64 100644
> --- a/package/ezxml/ezxml.mk
> +++ b/package/ezxml/ezxml.mk
> @@ -14,13 +14,13 @@ define EZXML_BUILD_CMDS
>  endef
>  
>  define EZXML_INSTALL_STAGING_CMDS
> -	install -D -m 0644 $(@D)/ezxml.h $(STAGING_DIR)/usr/include/ezxml.h
> -	install -D -m 0644 $(@D)/libezxml.a $(STAGING_DIR)/usr/lib/libezxml.a
> +	$(INSTALL) -D -m 0644 $(@D)/ezxml.h $(STAGING_DIR)/usr/include/ezxml.h
> +	$(INSTALL) -D -m 0644 $(@D)/libezxml.a $(STAGING_DIR)/usr/lib/libezxml.a
>  endef
>  
>  define EZXML_INSTALL_TARGET_CMDS
> -	install -D -m 0644 $(@D)/ezxml.h $(TARGET_DIR)/usr/include/ezxml.h
> -	install -D -m 0644 $(@D)/libezxml.a $(TARGET_DIR)/usr/lib/libezxml.a
> +	$(INSTALL) -D -m 0644 $(@D)/ezxml.h $(TARGET_DIR)/usr/include/ezxml.h
> +	$(INSTALL) -D -m 0644 $(@D)/libezxml.a $(TARGET_DIR)/usr/lib/libezxml.a
>  endef
>  
>  $(eval $(generic-package))
> diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
> index 3be746a..6b361db 100644
> --- a/package/fan-ctrl/fan-ctrl.mk
> +++ b/package/fan-ctrl/fan-ctrl.mk
> @@ -20,7 +20,7 @@ define FAN_CTRL_BUILD_CMDS
>  endef
>  
>  define FAN_CTRL_INSTALL_TARGET_CMDS
> -	install -D -m 755 $(@D)/fan-ctrl $(TARGET_DIR)/usr/sbin/fan-ctrl
> +	$(INSTALL) -D -m 755 $(@D)/fan-ctrl $(TARGET_DIR)/usr/sbin/fan-ctrl
>  endef
>  
>  $(eval $(generic-package))
> diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
> index 309f4be..a702a9b 100644
> --- a/package/fbv/fbv.mk
> +++ b/package/fbv/fbv.mk
> @@ -45,7 +45,7 @@ define FBV_BUILD_CMDS
>  endef
>  
>  define FBV_INSTALL_TARGET_CMDS
> -	install -D $(@D)/fbv $(TARGET_DIR)/usr/bin/fbv
> +	$(INSTALL) -D $(@D)/fbv $(TARGET_DIR)/usr/bin/fbv
>  endef
>  
>  $(eval $(autotools-package))
> diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
> index 9d976d1..8fca346 100644
> --- a/package/hwdata/hwdata.mk
> +++ b/package/hwdata/hwdata.mk
> @@ -12,8 +12,8 @@ HWDATA_LICENSE = GPLv2+ or XFree86 1.0 license
>  HWDATA_LICENSE_FILES = COPYING LICENSE
>  
>  define HWDATA_INSTALL_TARGET_CMDS
> -	install -D -m 644 $(@D)/pci.ids $(TARGET_DIR)/usr/share/hwdata/pci.ids
> -	install -D -m 644 $(@D)/usb.ids $(TARGET_DIR)/usr/share/hwdata/usb.ids
> +	$(INSTALL) -D -m 644 $(@D)/pci.ids $(TARGET_DIR)/usr/share/hwdata/pci.ids
> +	$(INSTALL) -D -m 644 $(@D)/usb.ids $(TARGET_DIR)/usr/share/hwdata/usb.ids
>  endef
>  
>  $(eval $(generic-package))
> diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
> index 52bbea4..7c3fe4e 100644
> --- a/package/input-tools/input-tools.mk
> +++ b/package/input-tools/input-tools.mk
> @@ -35,7 +35,7 @@ endef
>  
>  define INPUT_TOOLS_INSTALL_TARGET_CMDS
>  	for i in $(INPUT_TOOLS_TARGETS_y); do \
> -		install -m 755 -D $(@D)/$$i $(TARGET_DIR)/usr/bin/$$i; \
> +		$(INSTALL) -m 755 -D $(@D)/$$i $(TARGET_DIR)/usr/bin/$$i; \
>  	done
>  endef
>  
> diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
> index 745ac76..a88f1be 100644
> --- a/package/lockfile-progs/lockfile-progs.mk
> +++ b/package/lockfile-progs/lockfile-progs.mk
> @@ -21,7 +21,7 @@ endef
>  
>  define LOCKFILE_PROGS_INSTALL_TARGET_CMDS
>  	for i in $(LOCKFILE_BINS); do \
> -		install -D -m 755 $(@D)/bin/$$i $(TARGET_DIR)/usr/bin/$$i; \
> +		$(INSTALL) -D -m 755 $(@D)/bin/$$i $(TARGET_DIR)/usr/bin/$$i; \
>  	done
>  endef
>  
> diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
> index 332d1f8..ccef3fb 100644
> --- a/package/lsof/lsof.mk
> +++ b/package/lsof/lsof.mk
> @@ -60,7 +60,7 @@ define LSOF_BUILD_CMDS
>  endef
>  
>  define LSOF_INSTALL_TARGET_CMDS
> -	install -D -m 755 $(@D)/lsof $(TARGET_DIR)/bin/lsof
> +	$(INSTALL) -D -m 755 $(@D)/lsof $(TARGET_DIR)/bin/lsof
>  endef
>  
>  $(eval $(generic-package))
> diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
> index 2beae35..ff91c4a 100644
> --- a/package/makedevs/makedevs.mk
> +++ b/package/makedevs/makedevs.mk
> @@ -14,7 +14,7 @@ define MAKEDEVS_BUILD_CMDS
>  endef
>  
>  define MAKEDEVS_INSTALL_TARGET_CMDS
> -	install -D -m 755 $(@D)/makedevs $(TARGET_DIR)/usr/sbin/makedevs
> +	$(INSTALL) -D -m 755 $(@D)/makedevs $(TARGET_DIR)/usr/sbin/makedevs
>  endef
>  
>  define HOST_MAKEDEVS_BUILD_CMDS
> @@ -23,7 +23,7 @@ define HOST_MAKEDEVS_BUILD_CMDS
>  endef
>  
>  define HOST_MAKEDEVS_INSTALL_CMDS
> -	install -D -m 755 $(@D)/makedevs $(HOST_DIR)/usr/bin/makedevs
> +	$(INSTALL) -D -m 755 $(@D)/makedevs $(HOST_DIR)/usr/bin/makedevs
>  endef
>  
>  $(eval $(generic-package))
> diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
> index 6ed1ba6..0df09c4 100644
> --- a/package/metacity/metacity.mk
> +++ b/package/metacity/metacity.mk
> @@ -29,7 +29,7 @@ METACITY_DEPENDENCIES += xlib_libXcursor
>  endif
>  
>  define METACITY_INSTALL_XSESSION
> -	install -D package/metacity/Xsession $(TARGET_DIR)/etc/X11/Xsession
> +	$(INSTALL) -D package/metacity/Xsession $(TARGET_DIR)/etc/X11/Xsession
>  endef
>  
>  METACITY_POST_INSTALL_TARGET_HOOKS += METACITY_INSTALL_XSESSION
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 14e8174..80928b6 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -92,7 +92,7 @@ endif
>  
>  define MTD_INSTALL_TARGET_CMDS
>   for f in $(MTD_TARGETS_y) ; do \
> -  install -D -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$${f##*/} ; \
> +  $(INSTALL) -D -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$${f##*/} ; \
>   done
>  endef
>  
> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index fe64a21..fe6b04b 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -53,8 +53,8 @@ define NTP_INSTALL_TARGET_CMDS
>  	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 $(@D)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd)
>  	test -z "$(NTP_INSTALL_FILES_y)" || install -m 755 $(addprefix $(@D)/,$(NTP_INSTALL_FILES_y)) $(TARGET_DIR)/usr/bin/
>  	@if [ ! -f $(TARGET_DIR)/etc/default/ntpd ]; then \
> -		install -m 755 -d $(TARGET_DIR)/etc/default ; \
> -		install -m 644 package/ntp/ntpd.etc.default $(TARGET_DIR)/etc/default/ntpd ; \
> +		$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/default ; \
> +		$(INSTALL) -m 644 package/ntp/ntpd.etc.default $(TARGET_DIR)/etc/default/ntpd ; \
>  	fi
>  endef
>  
> diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
> index 10c7a07..ad8f430 100644
> --- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
> +++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
> @@ -15,7 +15,7 @@ endef
>  
>  define HOST_OMAP_U_BOOT_UTILS_INSTALL_CMDS
>  	for f in gpsign pserial tagger ucmd ukermit ; do \
> -		install -m 755 -D $(@D)/$$f $(HOST_DIR)/usr/bin/$$f ; \
> +		$(INSTALL) -D -m 755 $(@D)/$$f $(HOST_DIR)/usr/bin/$$f ; \
>  	done
>  endef
>  
> diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
> index f6c423a..b5ce8a0 100644
> --- a/package/picocom/picocom.mk
> +++ b/package/picocom/picocom.mk
> @@ -14,7 +14,7 @@ define PICOCOM_BUILD_CMDS
>  endef
>  
>  define PICOCOM_INSTALL_TARGET_CMDS
> -	install -D -m 0755 $(@D)/picocom $(TARGET_DIR)/usr/bin/picocom
> +	$(INSTALL) -D -m 0755 $(@D)/picocom $(TARGET_DIR)/usr/bin/picocom
>  endef
>  
>  $(eval $(generic-package))
> diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
> index 5d4f4bc..f907bdb 100644
> --- a/package/sysvinit/sysvinit.mk
> +++ b/package/sysvinit/sysvinit.mk
> @@ -32,11 +32,11 @@ endef
>  
>  define SYSVINIT_INSTALL_TARGET_CMDS
>  	for x in halt init shutdown killall5; do \
> -		install -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
> +		$(INSTALL) -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
>  	done
>  	# Override Busybox's inittab with an inittab compatible with
>  	# sysvinit
> -	install -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
> +	$(INSTALL) -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
>  	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
>  	ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
>  	ln -sf killall5 $(TARGET_DIR)/sbin/pidof
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index b9aa019..029acf2 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -23,7 +23,7 @@ VALGRIND_CONF_OPT += \
>  endif
>  
>  define VALGRIND_INSTALL_UCLIBC_SUPP
> -	install -D -m 0644 package/valgrind/uclibc.supp $(TARGET_DIR)/usr/lib/valgrind/uclibc.supp
> +	$(INSTALL) -D -m 0644 package/valgrind/uclibc.supp $(TARGET_DIR)/usr/lib/valgrind/uclibc.supp
>  endef
>  
>  VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_INSTALL_UCLIBC_SUPP
> diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
> index fa6b535..5801656 100644
> --- a/package/vsftpd/vsftpd.mk
> +++ b/package/vsftpd/vsftpd.mk
> @@ -36,10 +36,10 @@ define VSFTPD_BUILD_CMDS
>  endef
>  
>  define VSFTPD_INSTALL_TARGET_CMDS
> -	install -D -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
> -	install -D -m 644 $(@D)/vsftpd.8 \
> +	$(INSTALL) -D -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
> +	$(INSTALL) -D -m 644 $(@D)/vsftpd.8 \
>  		$(TARGET_DIR)/usr/share/man/man8/vsftpd.8
> -	install -D -m 644 $(@D)/vsftpd.conf.5 \
> +	$(INSTALL) -D -m 644 $(@D)/vsftpd.conf.5 \
>  		$(TARGET_DIR)/usr/share/man/man5/vsftpd.conf.5
>  	test -f $(TARGET_DIR)/etc/init.d/S70vsftpd || \
>  		$(INSTALL) -D -m 755 package/vsftpd/vsftpd-init \
> @@ -47,7 +47,7 @@ define VSFTPD_INSTALL_TARGET_CMDS
>  	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
>  		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
>  			$(TARGET_DIR)/etc/vsftpd.conf
> -	install -d -m 700 $(TARGET_DIR)/usr/share/empty
> +	$(INSTALL) -d -m 700 $(TARGET_DIR)/usr/share/empty
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.0.0.rc0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
