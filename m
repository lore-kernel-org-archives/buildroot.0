From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Feb 2013 16:03:29 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20130209150319.829969AA62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ccf523713dda8bccbc8bb3dcea591d54d8d9278
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   70 ++++++++++++++++++++++++++++++++++----------------------------
 1 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/CHANGES b/CHANGES
index e824762..63a16fd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,52 +4,58 @@
 	libraries install fixed. Add Linaro ARM
 	2012.11/2012.12/2013.01, AArch64 12.11/12.12/13.01. Sourcery
 	CodeBench MIPS 2012.03/09. Infrastructure to warn about
-	missing 32bit support for binary toolchains. Add GDB 7.5.1 /
-	Remove 6.8 / 7.0 / 7.1.
+	missing 32bit support for binary toolchains. Toolchain wrapper
+	is now relocatable. Add GDB 7.5.1 / Remove 6.8 / 7.0 /
+	7.1. Deprecate uClibc 0.9.31.
 
 	Architecture: Xtensa fixes, add missing powerpc variants, arm
-	1136jf-s rev1, add A5/A15, neon support toggle, Sparc: drop
-	old unused variants
+	1136jf-s rev1, add A5/A15, neon support toggle, OABI
+	deprecated. Sparc: drop old unused variants
 
 	Bootloaders: At91bootstap: fix upstream URL, Barebox: add
-	2012.12/2013.01, remove 2012.08/09, lzop fixes, environment
-	image support, U-Boot: add 2013.01.01
+	2012.12/2013.01/2013.02, remove 2012.08/09/10, lzop fixes,
+	environment image support, U-Boot: add 2013.01.01
 
 	Linux: fix appended dtb handling for v3.8+ kernels, support
 	multiple device trees
 
 	Defconfigs: calao USB-A9260, snowball, QEMU PPC440 on ML507
 	board, QEMU ARM Exynos4210, Kernel version in QEMU defconfigs
-	updated, at91rm9200df: misc fixes
+	updated, at91rm9200df: misc fixes. Lock kernel headers to
+	match kernel.
 
 	Infrastructure: Git download fixes. Toolchain make target
 	renamed from 'cross' to 'toolchain'. Eclipse integration
-	support. Option to set root password.
+	support. Option to set root password, post image scripts,
+	config scripts handling.
 
 	Updated/fixed packages: alsa-lib, argp-standalone, argus,
 	arptables, atk, audiofile, axel, beecrypt, bind, bison,
 	bluez_utils, boost, cairo, can-utils, bmon, boa, busybox,
 	cairo, ccache, cdrkit, cifs-utils, cjson, cmake, collectd,
-	connman, coreutils, cpanminus, dbus, dhcp, dialog, diffutils,
-	directfb, distcc, divine, dnsmasq, docker, dosfstools, dstat,
-	e2fsprogs, ebtables, ed, empty, ethtool, expedite, fbv,
-	ffmpeg, flex, fltk, fluxbox, freetype, gadget-test, gawk, gdb,
-	genext2fs, gettext, giblib, glib-networking, gmp, gmpc, gnupg,
-	gnutls, gpsd, gst-plugins-{bad,base,good}, gstreamer, gzip,
-	haserl, hdparm, heirloom-mailx, hiawanta, hostapd, icu,
-	imlib2, inadyn, infozip, iproute2, ipset, iptables, iw, jpeg,
-	jquery, jquery-sparklines, jqeury-validation, kismet, kmod,
-	lame, libao, libcap, libcurl, libdvdnav, libecore, libedbus,
-	libedje, libeet, libefreet, libeina, libeio, liberation,
-	libelementary, libembryo, libethumb, libev, libevas, libffi,
-	libfribidi, libfuse, libgcrypt, libglib2, libgtk2, libhid,
-	libidn, libmicrohttpd, libmpd, libnl, libnspr, libnss, libogg,
-	libpcap, libplayer, libroxml, librsvg, libseccomp, libsigc,
-	libungif, liburcu, libvncserver, libvorbis, libxml2, libxslt,
-	lighttpd, links, linux-firmware, linux-fusion, ltp-testsuite,
-	ltrace, lttng-{babel,libust,modules,tools}, lvm2, lua, luajit,
-	lzop, matchbox-{desktop,lib}, metacity, midori, minicom, mpd,
-	mpfr, mplayer, mtd, mysql_client, neon, netatalk,
+	connman, coreutils, cpanminus, cups, dbus, dhcp, dialog,
+	diffutils, directfb, distcc, divine, dnsmasq, docker,
+	dosfstools, dstat, e2fsprogs, ebtables, ed, empty, ethtool,
+	expedite, fbset, fbv, ffmpeg, flex, fltk, fluxbox, freetype,
+	gadget-test, gawk, gdb, genext2fs, gettext, giblib,
+	glib-networking, gmp, gmpc, gnupg, gnutls, gpsd,
+	gst-plugins-{bad,base,good}, gstreamer, gzip, haserl, hdparm,
+	heirloom-mailx, hiawanta, hostapd, icu, imagemagick, imlib2,
+	inadyn, infozip, iproute2, ipset, iptables, iw, jpeg, jquery,
+	jquery-sparklines, jqeury-validation, kismet, kmod, lame,
+	libao, libcap, libcurl, libdvdnav, libdvdread, libecore,
+	libedbus, libedje, libeet, libefreet, libeina, libeio,
+	liberation, libelementary, libembryo, libethumb, libev,
+	libevas, libffi, libfribidi, libfuse, libgcrypt, libglib2,
+	libgpg-error, libgtk2, libhid, libidn, libmicrohttpd, libmpd,
+	libnl, libnspr, libnss, libogg, libpcap, libplayer, libpng,
+	libroxml, librsvg, libseccomp, libsigc, libsndfile, libungif,
+	libupnp, liburcu, libusb-compat, libvncserver, libvorbis,
+	libxml2, libxslt, lighttpd, links, linux-firmware,
+	linux-fusion, ltp-testsuite, ltrace,
+	lttng-{babel,libust,modules,tools}, lvm2, lua, luajit, lzop,
+	matchbox-{desktop,lib}, mdadm, metacity, midori, minicom, mpd,
+	mpfr, mplayer, mtd, mysql_client, ncurses, neon, netatalk,
 	networkmanager, nspr, ntfs-3g, nuttcp, ofone, olsr, openssl,
 	openvpn, opkg, oprofile, opus, opus-tools, orc, ortp, pango,
 	pciutils, pcmanfm, pcre, pcsc-lite, perl, php, pixman,
@@ -57,9 +63,9 @@
 	python, python3, qemu, qextserialport, qt, quagga, radvd,
 	readline, rng-tools, rt-tests, rubix, ruby, sam-ba, samba,
 	sane-backends, sconeserver, scons, screen, sdl, sdl_gfx,
-	sdl_mixer, sdl_ttf, sdparm, sed, smartmontools, speex, sqlite,
-	squid, sshfs, strace, sudo, sylpheed, tn5250, taglib, tar,
-	torsmo, transmission, tslib, uboot-tools, ulogd,
+	sdl_mixer, sdl_ttf, sdparm, sed, ser2net, smartmontools,
+	speex, sqlite, squid, sshfs, strace, sudo, sylpheed, tn5250,
+	taglib, tar, torsmo, transmission, tslib, uboot-tools, ulogd,
 	usb_modeswitch, util-linux, valgrind, vim, vsftpd, wavpack,
 	webkit, wipe, wireless_tools, wpa_supplicant, xapp_xinit,
 	xapp_xinput-calibrator, xapp_xman, xapp_xmh, xlib_libX11,
@@ -82,7 +88,7 @@
 	ux500-firmware, vde2, xcb-utils-keysyms, yavta,
 	zd1211-firmware
 
-	Removed packages: xdriver_xf86-input-{acecad,aiptek},
+	Removed packages: customize, xdriver_xf86-input-{acecad,aiptek},
 	xdriver_xf86-video-{apm,chips,i740,rendition,s3,s3virge,sisusb},
 	xdriver_xf86-video-sun{cg14,cg3,cg6,ffb,leo,tcx},
 	xdriver_xf86-video-{tsend,xgi,xgixp}
