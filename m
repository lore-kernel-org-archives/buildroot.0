From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 13:38:46 +0200
Subject: [Buildroot] [git commit master 1/1] genext2fs: bump to 1.4.1
Message-ID: <20101006113858.3647C8BE58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=285b8fe9047e64e0c63239d2b0b8c667936ca176
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   35 ++++++++++---------
 ...squash.patch => genext2fs-1.4.1-nosquash.patch} |    0
 ... => genext2fs-1.4.1-remove_ugly_warnings.patch} |    0
 package/genext2fs/genext2fs.mk                     |    2 +-
 4 files changed, 19 insertions(+), 18 deletions(-)
 rename package/genext2fs/{genext2fs-1.4-nosquash.patch => genext2fs-1.4.1-nosquash.patch} (100%)
 rename package/genext2fs/{genext2fs-1.4-remove_ugly_warnings.patch => genext2fs-1.4.1-remove_ugly_warnings.patch} (100%)

diff --git a/CHANGES b/CHANGES
index 1f80097..c2ab972 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,23 +27,24 @@
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
 	bootutils, bridge-utils, bsdiff, busybox, cvs, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
-	fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk, gperf,
-	gst-plugins-ugly, gtk2-themes, gtkperf, gvfs, haserl, hdparm,
-	hostapd, hwdata, ifplugd, imagemagick, iperf, ipsec-tools,
-	iproute2, iptables, iw, jpeg, kexec, kismet, less, libcgi,
-	libcurl, libdaemon, libdnet, liberation, libevent, libeXosip2,
-	libglade, libgtk2, libiconv, libidn, libintl, libmms, libnl,
-	liboil, libosip2, libpcap, libpng, libtool, libungif, libxml2,
-	libxslt, lighttpd, lite, lm-sensors, lockfile-progs,
-	logrotate, m4, mdadm, mesa3d, metacity, mtd-utils,
-	mysql_client, nano, nbd, ncftp, neon, netperf, netsnmp,
-	ng-spice-rework, ntfsprogs, ntp, openntpd, openssh, openvpn,
-	oprofile, pango, patch, pcre, php, pkg-config, prboom, radvd,
-	rdesktop, ruby, qt, quagga, samba, sawman, sdl_mixer,
-	sdl_sound, setserial, shared-mime-info, speex, sqlite,
-	squashfs, strace, sylpheed, taglib, tcpdump, thttpd, tiff,
-	tn5250, udev, udpcast, usbmount, usbutils, vsftpd, vtun,
-	which, wpa_supplicant, xapp_twm, xapp_xbacklight,
+	fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk,
+	genext2fs, gperf, gst-plugins-ugly, gtk2-themes, gtkperf,
+	gvfs, haserl, hdparm, hostapd, hwdata, ifplugd, imagemagick,
+	iperf, ipsec-tools, iproute2, iptables, iw, jpeg, kexec,
+	kismet, less, libcgi, libcurl, libdaemon, libdnet, liberation,
+	libevent, libeXosip2, libglade, libgtk2, libiconv, libidn,
+	libintl, libmms, libnl, liboil, libosip2, libpcap, libpng,
+	libtool, libungif, libxml2, libxslt, lighttpd, lite,
+	lm-sensors, lockfile-progs, logrotate, m4, mdadm, mesa3d,
+	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
+	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
+	openssh, openvpn, oprofile, pango, patch, pcre, php,
+	pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga, samba,
+	sawman, sdl_mixer, sdl_sound, setserial, shared-mime-info,
+	speex, sqlite, squashfs, strace, sylpheed, taglib, tcpdump,
+	thttpd, tiff, tn5250, udev, udpcast, usbmount, usbutils,
+	vsftpd, vtun, which, wpa_supplicant, xapp_twm,
+	xapp_xbacklight,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/genext2fs/genext2fs-1.4-nosquash.patch b/package/genext2fs/genext2fs-1.4.1-nosquash.patch
similarity index 100%
rename from package/genext2fs/genext2fs-1.4-nosquash.patch
rename to package/genext2fs/genext2fs-1.4.1-nosquash.patch
diff --git a/package/genext2fs/genext2fs-1.4-remove_ugly_warnings.patch b/package/genext2fs/genext2fs-1.4.1-remove_ugly_warnings.patch
similarity index 100%
rename from package/genext2fs/genext2fs-1.4-remove_ugly_warnings.patch
rename to package/genext2fs/genext2fs-1.4.1-remove_ugly_warnings.patch
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 8c4981e..b4a8e70 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GENEXT2FS_VERSION=1.4
+GENEXT2FS_VERSION=1.4.1
 GENEXT2FS_SOURCE=genext2fs-$(GENEXT2FS_VERSION).tar.gz
 GENEXT2FS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
 
-- 
1.7.1
