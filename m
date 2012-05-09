From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 May 2012 23:17:14 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20120509211726.AD64196C81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82822efe43711a4b0199837da81c73d7fcae2a46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   72 +++++++++++++++++++++++++++++++++++----------------------------
 1 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/CHANGES b/CHANGES
index c17e141..1a2b6ed 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,52 +10,60 @@
 	Apply-patches.sh: cleanups, archived patches handling fixes,
 	support series files.
 
-	Defconfigs: mx53qsb, use 3.2.x for atngw100, use 3.3.x for
-	qemu configs.
+	Defconfigs: beaglebone, mx53qsb, pandaboard, qemu configs for
+	arm-vexpress/microblaze/ppc-mpc88544ds, use 3.2.x for
+	atngw100, use 3.3.x for qemu configs.
 
-	Atom processor support. Microblaze architecture support (using
-	ext toolchain). Cleanup architecture names, deprecate Xtensa
-	support.
+	Menu structure: Libraries moved out of multimedia section
+
+	Atom processor support. Prescott fix, blackfin ABI fix,
+	Microblaze architecture support (using ext toolchain). Cleanup
+	architecture names, deprecate Xtensa support.
 
 	Toolchain: Add GCC 4.4.7, 4.6.3, 4.7.0. uClibc 0.9.33.1,
 	default to uClibc 0.9.33.x, enable
 	UCLIBC_SUPPORT_AI_ADDRCONFIG by default, static and 64bit
 	fixes for external toolchains, linaro ext toolchains, new
-	sourcery codebench ext toolchains, GDB 7.4.1.
+	sourcery codebench ext toolchains, GDB 7.4.1, crosstool-ng
+	1.15.2.
 
-	Bootloaders: U-Boot: add 2012.04.01. Barebox: add 2012.04,
-	remove 2011.12.
+	Bootloaders: U-Boot: add 2012.04.01, SPL and u-boot.img
+	support. Barebox: add 2012.04, remove 2011.12.
 
 	Updated/fixed packages: alsa-lib, alsa-utils, at, atk, avahi,
 	barebox, berkeleydb, bind, bluez_utils, boost, busybox,
-	can-utils, ccache, coreutils, cups, dbus, dhcp, directfb,
-	dnsmasq, doom-wad, dosfstools, e2fsprogs, expat, fakeroot,
-	feh, ffmpeg, file, fis, freetype, gamin, gawk, gdk-pixbuf,
-	giblib, glib-networking, gmp, gnutls, gpsd, grep, gstreamer,
-	gst-plugins-{bad,base,good,ugly}, haserl, hdparm, imagemagick,
-	iproute2, iptable, iw, kexec, kmod, lame, libarchive,
-	libatomic_ops, libconfig, libcurl, libdvdnav, libdvdread,
-	libedbus, libethumb, libffi, libfuse, libglib2, libgtk2,
-	libhid, libmbus, libmpeg2, libnl, libpng, libsigc, libsoup,
-	libupnp, liburcu, libusb, libusb-compat, libxml2,
-	libxml-parser-perl, libxslt, linux-firmware, linux-fusion,
-	lite, lsof, ltrace, lttng-libust, lua, makedevs, microperl,
-	mpd, mpfr, mpg123, mrouted, mtd, mysql_client, nbd, ncurses,
-	neon, netsnmp, network-manager, nfs-utils, ngrep, ntfs-3g,
+	can-utils, ccache, cifs-utils, coreutils, cups, dbus, dhcp,
+	directfb, dnsmasq, doom-wad, dosfstools, e2fsprogs, expat,
+	fakeroot, feh, ffmpeg, file, fis, freetype, gamin, gawk,
+	gdk-pixbuf, gettext, giblib, glib-networking, gmp, gnutls,
+	gpsd, grep, gstreamer, gst-plugins-{bad,base,good,ugly},
+	haserl, hdparm, imagemagick, iproute2, iptable, iw, kexec,
+	kmod, lame, libaio, libarchive, libatomic_ops, libconfig,
+	libcurl, libdvdnav, libdvdread, libedbus, libethumb, libffi,
+	libfuse, libglib2, libgtk2, libhid, libmad, libmbus, libmpeg2,
+	libnl, libplayer, libpng, libsigc, libsoup, libupnp, liburcu,
+	libusb, libusb-compat, libxml2, libxml-parser-perl, libxslt,
+	lighttpd, linux-firmware, linux-fusion, lite, lsof, ltrace,
+	lttng-libust, lua, m4, makedevs, microperl, mpd, mpfr, mpg123,
+	mrouted, mtd, mysql_client, nbd, ncftp, ncurses, neon,
+	netsnmp, network-manager, nfs-utils, ngrep, ntfs-3g, openntpd,
 	openssh, openssl, parted, pango, pcre, php, pixman, poco,
-	psmisc, pulseaudio, python, qt, quagga, radvd, rpm, ruby,
-	samba, sam-ba, sane-backends, sawman, screen, sdl_net,
-	smartmontools, sqlite, squashfs3, squid, sshfs, sudo,
+	psmisc, pulseaudio, python, qt, quagga, radvd, rpm, rsync,
+	ruby, samba, sam-ba, sane-backends, sawman, screen, sdl_net,
+	smartmontools, speex, sqlite, squashfs3, squid, sshfs, sudo,
 	syslinux, sysstat, taglib, tcpdump, tftp-hpa, transmission,
 	tiff, tinyhttpd, uboot-tools, udev, uemacs, unionfs, usbutils,
-	util-linux, vala, valgrind, vim, vsftpd, wipe,
-	xdriver_xf86-{input-vmmouse,video-fbdev}, xfsprogs, zlib
-
-	New packages: apr, audiofile, bellagio, fmtools,
-	glib-networking, heirloom-mailx, hiawatha, latencytop,
-	lcdproc, libcap-ng, libdmtx, libfcgi, libtpl, minicom, msmtp,
-	ndisc6, netatalk, parted, polarssl, protobuf, socketcand,
-	systemd, ushare, zeromq
+	util-linux, vala, valgrind, vim, vsftpd, wget, wipe,
+	wpa_supplicant, xdriver_xf86-{input-vmmouse,video-fbdev},
+	xfsprogs, zlib
+
+	New packages: apr, apr-util, audiofile, bellagio,
+	conntrack-tools, empty, fmtools, glib-networking,
+	heirloom-mailx, hiawatha, latencytop, lcdproc, libcap-ng,
+	libdmtx, libfcgi, libnetfilter_conntrack, libnfnetlink,
+	libtpl, localedef, minicom, msmtp, ndisc6, netatalk,
+	ocf-linux, openswan, parted, polarssl, protobuf, read-edid,
+	socketcand, stress, systemd, ushare, zeromq
 
 	Deprecated packages: ttcp
 
