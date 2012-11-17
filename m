From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 23:08:59 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20121117220912.B4B7999ECF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48f0fe07e3dd33137205bcc5bab360a3ff46a763
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   78 ++++++++++++++++++++++++++++++++++++++-------------------------
 1 files changed, 47 insertions(+), 31 deletions(-)

diff --git a/CHANGES b/CHANGES
index f5d4cdf..d1a4888 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,42 +7,57 @@
 	+ nitrogen6x defconfigs.
 
 	Bootloaders: add u-boot 2012.07/10, ais target format, add
-	barebox 2012.08/09/10, linker overlap issue fix for
-	at91bootstrap.
+	barebox 2012.08/09/10/11, linker overlap issue fix for
+	at91bootstrap, mxs-bootlets updated for new Barebox versions.
 
-	Toolchains: binutils 2.23, gcc 4.72, default to gcc 4.6.x,
+	Toolchains: binutils 2.23.1, gcc 4.72, default to gcc 4.6.x,
 	Codebench arm/sh/x86 2012.03/09, Linaro 2012.08/09/10.
-	Libtirpc support for modern glibc variants.
+	Libtirpc support for modern glibc variants. Toolchain on
+	target has been deprecated.
 
-	Initial Aarch64 support.
+	Initial Aarch64 support, Xtensa support re-added.
 
 	Infrastructure: Use shallow git clone when possible, use
 	tarballs rather than git URLs for github. Moved to pkgconf
 	rather than pkg-config. System directory added, default
-	skeleton/device tables moved.
-
-	Updated/fixed packages: acpid, alsa-lib, alsamixergui,
-	automake, bind, binutils, bison, blackbox, busybox, cairo,
-	cifs-utils, cjson, cmake, collectd, connman, conntrack-tools,
-	coreutils, cups, cvs, dbus, dhcp, directfb, dnsmasq,
-	e2fsprogs, ethtool, fbdump, feh, fftw, flashrom, fluxbox, gdb,
-	gdisk, gdk-pixbuf, genext2fs, gettext, gnutls, gpsd, gqview,
-	grep, gst-plugins-{bad,good}, hdparm, hiawatha, hostapd,
-	input-tools, iproute2, ipset, iptables, iw, json-c, kmod,
-	lcdproc, leafpad, less, libcurl, libdrm, libdvdnav,
-	libdvdread, libfuse, libglib2, libhid, libmad, libmbus,
-	libmnl, libnetfilter_{acct,conntrack,cthelper,cttimeout,queue},
-	libnfnetlink, libnl, libnspr, libnss, libpcap, libplayer,
-	libtorrent, liburcu, libv4l, libxcb, libxml2, libxslt, links,
-	linux-firmware, lm-sensors, lmbench, lshw, lttng-babeltrace,
-	lttng-tools, luajit, mesa3d, microperl, mpc, mpd, mpg123,
-	mplayer, mtd-utils, mysql_client, nbd, netatalk, netkitbase,
-	netkittelnet, netsnmp, newt, nfs-utils, openssh, openssl,
-	opkg, patch, pcre, php, poco, portmap, pppd, pulseaudio,
+	skeleton/device tables moved. More than 1 post-build script
+	can now be used. output/target now contains a
+	THIS_IS_NOT_YOUR_ROOT_FILESYSTEM warning, to help people
+	understand how to (not) use it.
+
+	Manual has been reworked and extended.
+
+	Legal-info: Lots of package annotations, CSV file fixes,
+	_LICENSE / _REDISTRIBUTE splitup, per-package hooks.
+
+	Updated/fixed packages: acpid, alsa-lib, alsa-utils,
+	alsamixergui, autoconf, automake, bash, bind, binutils, bison,
+	blackbox, bluez-utils, busybox, cairo, can-utils, cifs-utils,
+	cjson, cmake, collectd, connman, conntrack-tools, coreutils,
+	cups, cvs, dbus, dhcp, directfb, dmalloc, dnsmasq, dropbear,
+	e2fsprogs, ethtool, fbdump, feh, fftw, file, flashrom,
+	fluxbox, gdb, gdisk, gdk-pixbuf, genext2fs, gettext, gnutls,
+	gpsd, gqview, grep, gst-plugins-{bad,good}, hdparm, hiawatha,
+	hostapd, input-tools, iproute2, ipset, iptables, iw, json-c,
+	kexec, kmod, lcdproc, leafpad, less, libcurl, libdrm,
+	libdvdnav, libdvdread, libffi, libfuse, libglib2, libhid,
+	liblockfile, libmad, libmbus, libmnl,
+	libnetfilter_{acct,conntrack,cthelper,cttimeout,queue},
+	libnfc, libnfc-llcp, libnfnetlink, libnl, libnspr, libnss,
+	libpcap, libplayer, libtool, libtorrent, liburcu, libv4l,
+	libxcb, libxml2, libxslt, links, linux-firmware, lm-sensors,
+	lmbench, lockfile-progs, logrotate, lshw, lsof,
+	lttng-babeltrace, lttng-tools, lua, luajit, mesa3d, microperl,
+	mii-diag, module-init-tools, mpc, mpd, mpg123, mplayer,
+	mtd-utils, mysql_client, nbd, ncurses, netatalk, netkitbase,
+	netkittelnet, netsnmp, newt, nfs-utils, openntpd, openssh,
+	openssl, opkg, patch, pciutils, pcre, php, poco, polarssl,
+	popt, portmap, pppd, procps, pulseaudio, python, python-nfc,
 	python-protobuf, qt, quota, rp-pppoe, rtorrent, sam-ba, samba,
 	scons, sdl_gfx, smartmontools, sqlite, squid, strace, sudo,
-	sylpheed, ttcp, tiff, unionfs, usb_modeswitch, vala, vpnc,
-	vsftpd, webkit, wget, wpa_supplicant, x11vnc, xapp_*,
+	sylpheed, tcpdump, tremor, ttcp, tiff, unionfs,
+	usb_modeswitch, usbutils, util-linux, vala, valgrind, vpnc,
+	vsftpd, webkit, wget, which, wpa_supplicant, x11vnc, xapp_*,
 	xdriver_*, xenomai, xfont_*, xinetd, xl2tp, xlib_*, xlsclient,
 	xproto_*, xserver_xorg-server, xutil_util-macros, xz, zeromq
 
@@ -50,10 +65,11 @@
 	ccid, cpanminus, cpuload, erlang, evtest, fb-test-apps,
 	fxload, gdbm, gnupg, googlefontdirectory, grantlee, gsl,
 	lcdapi, liblo, liblog4c-localtime, libtirpc, linux-pam,
-	macchanger, mtdev, mtdev2tuio, nfacct, opus, opus-tools,
-	pcsc-lite, perl, pkgconf, python-meld3, python3, qemu,
-	qextserialport, qtuio, rpcbind, schifra, sconeserver,
-	supervisor, time, ulogd, usb_modeswitch_data, yasm
+	lua-msgpack-native, macchanger, mtdev, mtdev2tuio, nfacct,
+	opus, opus-tools, pcsc-lite, perl, pkgconf, python-meld3,
+	python3, qemu, qextserialport, qtuio, rpcbind, schifra,
+	sconeserver, supervisor, time, ulogd, usb_modeswitch_data,
+	yasm
 
 	Deprecated packages: netkitbase, netkittelnet
 
