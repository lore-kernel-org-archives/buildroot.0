From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Sep 2010 22:40:31 +0200
Subject: [Buildroot] [git commit master 1/1] libdaemon; bump version
Message-ID: <20100929204137.8B2988B6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=799c1328234bca5c39249ee0fea7cc614c0be680
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |   27 ++++++++++++++-------------
 package/libdaemon/libdaemon.mk |   18 +++++++++---------
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6e6539c..345b927 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,19 +25,20 @@
 	bootutils, bridge-utils, bsdiff, busybox, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
 	ffmpeg, freetype, gamin, gawk, gperf, gtk2-themes, gtkperf,
-	gvfs, haserl, hdparm, hostapd, hwdata, ifplugd, iperf, iproute2,
-	iptables, jpeg, kexec, kismet, less, libcgi, libcurl, libdnet,
-	libevent, libglade, libgtk2, libiconv, libidn, libmms, libnl,
-	liboil, libpcap, libpng, libtool, libungif, libxml2, libxslt,
-	lighttpd, lite, lm-sensors, logrotate, m4, mdadm, mesa3d,
-	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
-	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
-	openssh, openvpn, oprofile, pango, patch, pcre, php,
-	pkg-config, prboom, radvd, rdesktop, ruby, qt, samba, sawman,
-	sdl_mixer, sdl_sound, setserial, shared-mime-info, speex,
-	sqlite, squashfs, strace, sylpheed, taglib, tcpdump, thttpd,
-	tiff, tn5250, udev, udpcast, usbmount, usbutils, vsftpd, vtun,
-	which, wpa_supplicant,
+	gvfs, haserl, hdparm, hostapd, hwdata, ifplugd, iperf,
+	iproute2, iptables, jpeg, kexec, kismet, less, libcgi,
+	libcurl, libdaemon, libdnet, libevent, libglade, libgtk2,
+	libiconv, libidn, libmms, libnl, liboil, libpcap, libpng,
+	libtool, libungif, libxml2, libxslt, lighttpd, lite,
+	lm-sensors, logrotate, m4, mdadm, mesa3d, metacity, mtd-utils,
+	mysql_client, nano, nbd, ncftp, neon, netperf, netsnmp,
+	ng-spice-rework, ntfsprogs, ntp, openntpd, openssh, openvpn,
+	oprofile, pango, patch, pcre, php, pkg-config, prboom, radvd,
+	rdesktop, ruby, qt, samba, sawman, sdl_mixer, sdl_sound,
+	setserial, shared-mime-info, speex, sqlite, squashfs, strace,
+	sylpheed, taglib, tcpdump, thttpd, tiff, tn5250, udev,
+	udpcast, usbmount, usbutils, vsftpd, vtun, which,
+	wpa_supplicant,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index 7a9d5c8..9a78bff 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -4,15 +4,15 @@
 #
 #############################################################
 
-LIBDAEMON_VERSION:=0.13
-LIBDAEMON_SOURCE:=libdaemon-$(LIBDAEMON_VERSION).tar.gz
-LIBDAEMON_SITE:=http://0pointer.de/lennart/projects/libdaemon/
-LIBDAEMON_AUTORECONF:=no
-LIBDAEMON_INSTALL_STAGING:=YES
-LIBDAEMON_INSTALL_TARGET:=YES
-LIBDAEMON_CONF_ENV:=ac_cv_func_setpgrp_void=no
-LIBDAEMON_CONF_OPT:=--disable-lynx 
+LIBDAEMON_VERSION = 0.14
+LIBDAEMON_SOURCE = libdaemon-$(LIBDAEMON_VERSION).tar.gz
+LIBDAEMON_SITE = http://0pointer.de/lennart/projects/libdaemon/
+LIBDAEMON_AUTORECONF = NO
+LIBDAEMON_LIBTOOL_PATCH = NO
+LIBDAEMON_INSTALL_STAGING = YES
+LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
+LIBDAEMON_CONF_OPT = --disable-lynx
 
-LIBDAEMON_DEPENDENCIES:=host-pkg-config
+LIBDAEMON_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS,package,libdaemon))
-- 
1.7.1
