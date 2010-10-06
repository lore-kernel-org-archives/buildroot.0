From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 11:48:58 +0200
Subject: [Buildroot] [git commit master 1/1] gst-plugins-ugle: add option
	for mpeg2dec support
Message-ID: <20101006103554.549228B7C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3506706dad5234a33d862bdc7baac6a732d1b466
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   32 ++++++++++----------
 package/multimedia/gst-plugins-ugly/Config.in      |    4 ++
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    7 ++++
 3 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index a8bd699..1f80097 100644
--- a/CHANGES
+++ b/CHANGES
@@ -28,22 +28,22 @@
 	bootutils, bridge-utils, bsdiff, busybox, cvs, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
 	fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk, gperf,
-	gtk2-themes, gtkperf, gvfs, haserl, hdparm, hostapd, hwdata,
-	ifplugd, imagemagick, iperf, ipsec-tools, iproute2, iptables,
-	iw, jpeg, kexec, kismet, less, libcgi, libcurl, libdaemon,
-	libdnet, liberation, libevent, libeXosip2, libglade, libgtk2,
-	libiconv, libidn, libintl, libmms, libnl, liboil, libosip2,
-	libpcap, libpng, libtool, libungif, libxml2, libxslt,
-	lighttpd, lite, lm-sensors, lockfile-progs, logrotate, m4,
-	mdadm, mesa3d, metacity, mtd-utils, mysql_client, nano, nbd,
-	ncftp, neon, netperf, netsnmp, ng-spice-rework, ntfsprogs,
-	ntp, openntpd, openssh, openvpn, oprofile, pango, patch, pcre,
-	php, pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga,
-	samba, sawman, sdl_mixer, sdl_sound, setserial,
-	shared-mime-info, speex, sqlite, squashfs, strace, sylpheed,
-	taglib, tcpdump, thttpd, tiff, tn5250, udev, udpcast,
-	usbmount, usbutils, vsftpd, vtun, which, wpa_supplicant,
-	xapp_twm, xapp_xbacklight,
+	gst-plugins-ugly, gtk2-themes, gtkperf, gvfs, haserl, hdparm,
+	hostapd, hwdata, ifplugd, imagemagick, iperf, ipsec-tools,
+	iproute2, iptables, iw, jpeg, kexec, kismet, less, libcgi,
+	libcurl, libdaemon, libdnet, liberation, libevent, libeXosip2,
+	libglade, libgtk2, libiconv, libidn, libintl, libmms, libnl,
+	liboil, libosip2, libpcap, libpng, libtool, libungif, libxml2,
+	libxslt, lighttpd, lite, lm-sensors, lockfile-progs,
+	logrotate, m4, mdadm, mesa3d, metacity, mtd-utils,
+	mysql_client, nano, nbd, ncftp, neon, netperf, netsnmp,
+	ng-spice-rework, ntfsprogs, ntp, openntpd, openssh, openvpn,
+	oprofile, pango, patch, pcre, php, pkg-config, prboom, radvd,
+	rdesktop, ruby, qt, quagga, samba, sawman, sdl_mixer,
+	sdl_sound, setserial, shared-mime-info, speex, sqlite,
+	squashfs, strace, sylpheed, taglib, tcpdump, thttpd, tiff,
+	tn5250, udev, udpcast, usbmount, usbutils, vsftpd, vtun,
+	which, wpa_supplicant, xapp_twm, xapp_xbacklight,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/multimedia/gst-plugins-ugly/Config.in
index 190c4d8..9f738cf 100644
--- a/package/multimedia/gst-plugins-ugly/Config.in
+++ b/package/multimedia/gst-plugins-ugly/Config.in
@@ -47,4 +47,8 @@ config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD
 	select BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ID3TAG
 	select BR2_PACKAGE_LIBMAD
 
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEG2DEC
+	bool "mpeg2dec"
+	select BR2_PACKAGE_LIBMPEG2
+
 endif
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index c87451f..fc2fcff 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -75,4 +75,11 @@ else
 GST_PLUGINS_UGLY_CONF_OPT += --disable-mad
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-mpeg2dec
+GST_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-mpeg2dec
+endif
+
 $(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-ugly))
-- 
1.7.1
