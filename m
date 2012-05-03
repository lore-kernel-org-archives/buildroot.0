From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 22:52:27 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20120503205243.79C1396C67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a53a3b59165ea88f5c395cc79c7b74ab06f94c5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   72 +++++++++++++++++++++++++++++++++++++-------------------------
 1 files changed, 43 insertions(+), 29 deletions(-)

diff --git a/CHANGES b/CHANGES
index d7138b6..0a20bbb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,40 +18,44 @@
 	support.
 
 	Toolchain: Add GCC 4.4.7, 4.6.3, 4.7.0. uClibc 0.9.33.1,
-	default to uClibc 0.9.33.x, 64bit fixes for external
-	toolchains, linaro ext toolchains, new sourcery codebench ext
-	toolchains.
+	default to uClibc 0.9.33.x, enable
+	UCLIBC_SUPPORT_AI_ADDRCONFIG by default, static and 64bit
+	fixes for external toolchains, linaro ext toolchains, new
+	sourcery codebench ext toolchains, GCC 7.4.1.
 
-	Bootloaders: U-Boot: add 2012.04. Barebox: add 2012.04, remove
-	2011.12.
+	Bootloaders: U-Boot: add 2012.04.01. Barebox: add 2012.04,
+	remove 2011.12.
 
 	Updated/fixed packages: alsa-lib, alsa-utils, at, atk, avahi,
-	barebox, bind, bluez_utils, boost, can-utils, ccache,
-	coreutils, dbus, dhcp, directfb, dnsmasq, doom-wad,
-	dosfstools, e2fsprogs, expat, fakeroot, feh, ffmpeg, file,
-	fis, freetype, gamin, gawk, gdk-pixbuf, giblib,
-	glib-networking, gmp, gnutls, gpsd, grep, gstreamer,
+	barebox, berkeleydb, bind, bluez_utils, boost, busybox,
+	can-utils, ccache, coreutils, cups, dbus, dhcp, directfb,
+	dnsmasq, doom-wad, dosfstools, e2fsprogs, expat, fakeroot,
+	feh, ffmpeg, file, fis, freetype, gamin, gawk, gdk-pixbuf,
+	giblib, glib-networking, gmp, gnutls, gpsd, grep, gstreamer,
 	gst-plugins-{bad,base,good,ugly}, haserl, hdparm, imagemagick,
-	iptable, iw, kexec, kmod, lame, libarchive, libatomic_ops,
-	libconfig, libcurl, libedbus, libethumb, libffi, libfuse,
-	libglib2, libgtk2, libhid, libmpeg2, libnl, libpng, libsigc,
-	libsoup, libupnp, liburcu, libusb, libusb-compat, libxml2,
+	iproute2, iptable, iw, kexec, kmod, lame, libarchive,
+	libatomic_ops, libconfig, libcurl, libdvdnav, libdvdread,
+	libedbus, libethumb, libffi, libfuse, libglib2, libgtk2,
+	libhid, libmbus, libmpeg2, libnl, libpng, libsigc, libsoup,
+	libupnp, liburcu, libusb, libusb-compat, libxml2,
 	libxml-parser-perl, libxslt, linux-firmware, linux-fusion,
-	lite, ltrace, lttng-libust, lua, makedevs, microperl, mpd,
-	mpfr, mpg123, mtd, mysql_client, nbd, neon, netsnmp,
-	network-manager, ntfs-3g, openssl, parted, pango, pcre,
-	pixman, poco, psmisc, pulseaudio, python, qt, radvd, rpm,
-	samba, sam-ba, sane-backends, sawman, screen, sdl_net,
-	smartmontools, sqlite, squashfs3, squid, sshfs, sudo,
-	syslinux, sysstat, taglib, tftp-hpa, transmission, tiff,
-	tinyhttpd, udev, uemacs, unionfs, usbutils, util-linux, vala,
-	valgrind, vim, vsftpd, wipe, xdriver_xf86-video-fbdev,
-	xfsprogs, zlib,
-
-	New packages: apr, audiofile, fmtools, glib-networking,
-	hiawatha, latencytop, lcdproc, libcap-ng, libdmtx, libtpl,
-	minicom, parted, polarssl, protobuf, socketcand, systemd,
-	ushare, zeromq
+	lite, lsof, ltrace, lttng-libust, lua, makedevs, microperl,
+	mpd, mpfr, mpg123, mrouted, mtd, mysql_client, nbd, neon,
+	netsnmp, network-manager, nfs-utils, ngrep, ntfs-3g, openssh,
+	openssl, parted, pango, pcre, php, pixman, poco, psmisc,
+	pulseaudio, python, qt, quagga, radvd, rpm, ruby, samba,
+	sam-ba, sane-backends, sawman, screen, sdl_net, smartmontools,
+	sqlite, squashfs3, squid, sshfs, sudo, syslinux, sysstat,
+	taglib, tcpdump, tftp-hpa, transmission, tiff, tinyhttpd,
+	uboot-tools, udev, uemacs, unionfs, usbutils, util-linux,
+	vala, valgrind, vim, vsftpd, wipe,
+	xdriver_xf86-{input-vmmouse,video-fbdev}, xfsprogs, zlib
+
+	New packages: apr, audiofile, bellagio, fmtools,
+	glib-networking, heirloom-mailx, hiawatha, latencytop,
+	lcdproc, libcap-ng, libdmtx, libfcgi, libtpl, minicom, msmtp,
+	ndisc6, netatalk, parted, polarssl, protobuf, socketcand,
+	systemd, ushare, zeromq
 
 	Deprecated packages: ttcp
 
@@ -60,9 +64,19 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#2353: [lua] fix build with 2010.08-rc1
+	#2503: Microperl fails build on MIPSel or with Fedora13.x86_64
+	#2557: [PATCH] mkfs.xfs complains about missing libxfs.so.0
+	#2881: Can't build project statically with external toolchain
 	#3751: MIPS: fix BR2_GCC_TARGET_ABI for MIPS n64
+	#4808: ccache may build against wrong zlib
 	#4880: New package lcdproc
 	#4886: New package protobuf
+	#4892: build fails on ltp-testsuite-20101031/testcases/kernel/fs/...
+	#4898: * make: [target-finalize] Error 1 (ignored)*
+	#4985: Qt 4.7.4 build crashes with Linux 2.6.29
+	#4970: udev 181 fails to build if kernel version 3.3 is selected
+	#5018: dialog broken: exits with assert in uClibc
+	#5102: qt package moc, uic, rcc read from wrong place
 	#5144: Patch to fix ixon bug in uemacs
 
 2012.02, Released February 29th, 2012:
