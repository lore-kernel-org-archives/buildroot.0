From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Oct 2010 13:24:23 +0200
Subject: [Buildroot] [git commit master 1/1] libintl: needs wchar like
	gettext
Message-ID: <20101005113703.8515E8B884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=06d764401d2dc2f8cee15a0e8a2c68d31b6ad2d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                   |   22 +++++++++++-----------
 package/gettext/Config.in |    1 +
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9ca8a29..d93e9e1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -32,17 +32,17 @@
 	ifplugd, imagemagick, iperf, ipsec-tools, iproute2, iptables,
 	iw, jpeg, kexec, kismet, less, libcgi, libcurl, libdaemon,
 	libdnet, liberation, libevent, libeXosip2, libglade, libgtk2,
-	libiconv, libidn, libmms, libnl, liboil, libosip2, libpcap,
-	libpng, libtool, libungif, libxml2, libxslt, lighttpd, lite,
-	lm-sensors, lockfile-progs, logrotate, m4, mdadm, mesa3d,
-	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
-	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
-	openssh, openvpn, oprofile, pango, patch, pcre, php,
-	pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga, samba,
-	sawman, sdl_mixer, sdl_sound, setserial, shared-mime-info,
-	speex, sqlite, squashfs, strace, sylpheed, taglib, tcpdump,
-	thttpd, tiff, tn5250, udev, udpcast, usbmount, usbutils,
-	vsftpd, vtun, which, wpa_supplicant,
+	libiconv, libidn, libintl, libmms, libnl, liboil, libosip2,
+	libpcap, libpng, libtool, libungif, libxml2, libxslt,
+	lighttpd, lite, lm-sensors, lockfile-progs, logrotate, m4,
+	mdadm, mesa3d, metacity, mtd-utils, mysql_client, nano, nbd,
+	ncftp, neon, netperf, netsnmp, ng-spice-rework, ntfsprogs,
+	ntp, openntpd, openssh, openvpn, oprofile, pango, patch, pcre,
+	php, pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga,
+	samba, sawman, sdl_mixer, sdl_sound, setserial,
+	shared-mime-info, speex, sqlite, squashfs, strace, sylpheed,
+	taglib, tcpdump, thttpd, tiff, tn5250, udev, udpcast,
+	usbmount, usbutils, vsftpd, vtun, which, wpa_supplicant,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index c1ae97f..fabfe1e 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_GETTEXT_STATIC
 config BR2_PACKAGE_LIBINTL
 	bool "libintl"
 	depends on BR2_NEEDS_GETTEXT
+	depends on BR2_USE_WCHAR
 	help
 	  Selecting this package installs all of gettext in the staging
 	  directory and the shared library for it's use in the target.
-- 
1.7.1
