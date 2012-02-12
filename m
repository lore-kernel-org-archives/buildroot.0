From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Feb 2012 22:56:15 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20120212215629.D719090A6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eaf412b548b99a949bdbb37f26d1ff8555aca613
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   86 ++++++++++++++++++++++++++++++++++++--------------------------
 1 files changed, 50 insertions(+), 36 deletions(-)

diff --git a/CHANGES b/CHANGES
index 30ac42b..22dfd7f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,54 +4,68 @@
 
 	Toolchain: Default to GCC 4.5.x, add binutils 2.22. Java
 	support removed, Powerpc SPE ABI support. GDB ELF support fix,
-	GDB 7.4.
+	GDB 7.4, crosstool-NG 1.13.4.
 
 	Gentargets: scp and mercurial support.
-	Autotools: derrive host dependencies from target by default.
+	Autotools: derive host dependencies from target by default.
+	Packages can now declare device table snippets.
 
-	defconfigs: qemu configs for x86-64, mips and sparc.
+	Host utilities menu with commonly used host tools.
+
+	defconfigs: qemu configs for x86-64, mips and sparc, at91
+	defconfigs now use moder U-Boot / mainline Linux, added
+	lpc3250 defconfigs.
 
 	uClibc: remove 0.9.30, backport unshare() support, add
-	0.9.32.1, use same config for ctng.
+	0.9.32.1 / 0.9.33, use same config for ctng.
 
 	Bootloaders: U-Boot: add 2011.12, remove 2010.xx versions,
-	Barebox: add 2012.01, remove 2011.10.
+	Barebox: add 2012.01/02, remove 2011.10/11, LPC32xx
+	bootloaders added.
+
+	Various manual updates. Release tarballs now contain generated
+	manual in text/html/pdf formats.
 
-	Buildroot now calls the stop function of scripts in /etc/init.d at
-	shutdown.
+	Buildroot now calls the stop function of scripts in
+	/etc/init.d at shutdown.
 
 	Updated/fixed packages: atk, avahi, barebox, bash, beecrypt,
-	bind, binutils, bison, bluez_utils, busybox, cairo, ccache,
-	cdrkit, coreutils, cramfs, dbus, dbus-glib, dialog, diffutils,
-	dmalloc, dropbear, e2fsprogs, ebtables, ed, ethtool, expat,
-	ffmpeg, file, flex, fluxbox, fontconfig, gawk, grep, gst-dsp,
-	gst-ffmpeg, gst-plugins-base, hdparm, hostapd, htop,
-	i2c-tools, icu, iproute2, ipset, iptables, iw, jpeg, kismet,
-	lame, libcap, libcgi, libeXosip2, libffi, libgpg-error,
-	libgtk2, libidn, libmms, libmnl, libnl, libogg, libosip,
-	libpcap, libpng, libraw1394, libroxml, libv4l, libxcb,
-	libxml-parser-perl, libxslt, lighttpd, links, lm-sensors, lua,
-	m4, module-init-tools, mpc, mpd, mpfr, mplayer, mtd-utils,
-	nano, nbd, ncurses, netperf, netsnmp, ntp, opencv, openssl,
-	openvpn, orc, pciutils, pcre, pkg-config, proftpd, python, qt,
-	ruby, samba, squashfs3, sshfs, sqlite, squid, sudo, syslinux,
-	tcl, tcpdump, ti-utils, tiff, tremor, uboot, uboot-tools,
-	usbmount, vala, valgrind, vsftpd, wpa_supplicant,
-	xapp_{bdftopcf,mkfontdir,mkfontscale,xkbcomp,xcursorgen,xman},
-	xcb-util, xdm, xenomai, xf86-video-sis,
-	xfont_{encodings,font-util},
+	bind, binutils, bison, bluez_utils, bzip2, busybox, cairo,
+	ccache, cdrkit, coreutils, cramfs, dbus, dbus-glib, dialog,
+	diffutils, dmalloc, dropbear, e2fsprogs, ebtables, ed,
+	ethtool, expat, ffmpeg, file, fis, flex, fluxbox, fontconfig,
+	freetype, gawk, grep, gst-dsp, gst-ffmpeg, gst-plugins-base,
+	hdparm, hostapd, htop, i2c-tools, icu, iproute2, ipsec-tools,
+	ipset, iptables, iw, jpeg, kismet, lame, libcap, libcgi,
+	libev, libeXosip2, libffi, libftdi, libgpg-error, libgtk2,
+	libidn, libmms, libmnl, libmodbus, libnl, libogg, libosip,
+	libpcap, libpng, libraw1394, libroxml, libusb, libusb-compat,
+	libv4l, libvorbis, libxcb, libxml-parser-perl, libxslt,
+	lighttpd, links, lm-sensors, lua, m4, module-init-tools, mpc,
+	mesa3d, mpd, mpfr, mplayer, mtd-utils, nano, nbd, ncurses,
+	netperf, netsnmp, ntp, opencv, openocd, openssl, openvpn, orc,
+	pciutils, pcre, pixman, pkg-config, poco, popt, proftpd,
+	python, python-serial, qt, ruby, samba, sdl, sdparm,
+	squashfs3, sshfs, sqlite, squid, sudo, syslinux, tcl, tcpdump,
+	ti-utils, tiff, tremor, uboot, uboot-tools, udev, usbmount,
+	util-linux, vala, valgrind, vsftpd, wpa_supplicant,
+	xapp_{bdftopcf,mkfontdir,mkfontscale,xkbcomp,xcursorgen,xinit},
+	xapp_xinput, xapp_xman, xcb-util, xdm, xenomai,
+	xf86-video-sis, xfont_{encodings,font-util},
 	xlib_lib{fontenc,X11,Xau,Xcursor,Xdmcp,Xfixes,Xfont,Xrender},
-	xlib_libxkbfile, xutil_makedepend, yajl
-
-	New packages: boost, connman, expedite, explorercanvas, feh,
-	flot, giblib, igh-ethercat, imlib2, jquery, jquery-sparklines,
-	jquery-validation, jsmin, kmod, libecore, libedbus, libedje,
-	libeet, libeina, libelementary, libesmtp, libethumb, libevas,
-	libical, libmbus, linux-firmware, NetworkManager, open2300,
-	python-distutilscross, python-dpkt, python-netifaces,
-	python-pygame, python-setuptools, rt-tests, sane-backends,
-	sqlcipher, transmission, unionfs, xf86-input-tslib,
-	xinput-calibrator
+	xlib_libxkbfile, xterm, xutil_makedepend, yajl
+
+	New packages: boost, connman, dstat, expedite, explorercanvas,
+	feh, flot, giblib, igh-ethercat, imlib2, jquery,
+	jquery-sparklines, jquery-validation, jsmin, kmod, libecore,
+	libedbus, libedje, libeet, libeina, libelementary, libesmtp,
+	libethumb, libevas, libical, libmbus, liboauth, liburcu,
+	libvncserver, linux-firmware,
+	lttng-{babeltrace,libust,modules,tools}, NetworkManager,
+	open2300, python-distutilscross, python-dpkt,
+	python-netifaces, python-pygame, python-setuptools, rt-tests,
+	sam-ba, sane-backends, sqlcipher, transmission, unionfs,
+	xf86-input-tslib, xinput-calibrator
 
 	Issues resolved (http://bugs.uclibc.org):
 
