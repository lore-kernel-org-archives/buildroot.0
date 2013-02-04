From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 22:33:47 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20130204213437.490619A939@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6de88cabd7b22005a8d40df8aec369eb90525ce5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |  108 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 108 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2c357eb..56bfd63 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,111 @@
+2013.02, Not released yet:
+
+	Toolchain: Crosstool-ng 1.17.0, default to GCC 4.6.3, target
+	libraries install fixed. Add Linaro ARM
+	2012.11/2012.12/2013.01, Aarch4 12.11/12.12/13.01. Sourcery
+	CodeBench MIPS 2012.03/09. Infrastructure to warn about
+	missing 32bit support for binary toolchains. Add GDB 7.5.1 /
+	Remove 6.8 / 7.0 / 7.1.
+
+	Architecture: Xtensa fixes, add missing powerpc variants, arm
+	1136jf-s rev1, add A5/A15, neon support toggle, Sparc: drop
+	old unused variants
+
+	Bootloaders: At91bootstap: fix upstream URL, Barebox: add
+	2012.12/2013.01, remove 2012.08/09, lzop fixes, environment
+	image support, U-Boot: add 2013.01.01
+
+	Linux: fix appended dtb handling for v3.8+ kernels, support
+	multiple device trees
+
+	Defconfigs: calao USB-A9260, snowball, QEMU PPC440 on ML507
+	board, QEMU ARM Exynos4210, Kernel version in QEMU defconfigs
+	updated, at91rm9200df: misc fixes
+
+	Infrastructure: Git download fixes. Toolchain make target
+	renamed from 'cross' to 'toolchain'. Eclipse integration
+	support. Option to set root password.
+
+	Updated/fixed packages: alsa-lib, argp-standalone, argus,
+	arptables, atk, audiofile, axel, beecrypt, bind, bison,
+	bluez_utils, boost, cairo, can-utils, bmon, boa, busybox,
+	cairo, ccache, cdrkit, cifs-utils, cjson, cmake, collectd,
+	connman, coreutils, cpanminus, dbus, dhcp, dialog, diffutils,
+	directfb, distcc, divine, dnsmasq, docker, dosfstools, dstat,
+	e2fsprogs, ebtables, ed, empty, ethtool, expedite, fbv,
+	ffmpeg, flex, fltk, fluxbox, freetype, gadget-test, gawk, gdb,
+	genext2fs, gettext, giblib, glib-networking, gmp, gmpc, gnupg,
+	gnutls, gpsd, gst-plugins-{bad,base,good}, gstreamer, gzip,
+	haserl, hdparm, heirloom-mailx, hiawanta, hostapd, icu,
+	imlib2, inadyn, infozip, iproute2, ipset, iptables, iw, jpeg,
+	jquery, jquery-sparklines, jqeury-validation, kismet, kmod,
+	lame, libao, libcap, libcurl, libdvdnav, libecore, libedbus,
+	libedje, libeet, libefreet, libeina, libeio, liberation,
+	libelementary, libembryo, libethumb, libev, libevas, libffi,
+	libfribidi, libfuse, libgcrypt, libglib2, libgtk2, libhid,
+	libidn, libmicrohttpd, libmpd, libnl, libnspr, libnss, libogg,
+	libpcap, libplayer, libroxml, librsvg, libseccomp, libsigc,
+	libungif, liburcu, libvncserver, libvorbis, libxml2, libxslt,
+	lighttpd, links, linux-firmware, linux-fusion, ltp-testsuite,
+	ltrace, lttng-{babel,libust,modules,tools}, lvm2, lua, luajit,
+	lzop, matchbox-{desktop,lib}, metacity, midori, minicom, mpd,
+	mpfr, mplayer, mtd, mysql_client, neon, netatalk,
+	networkmanager, nspr, ntfs-3g, nuttcp, ofone, olsr, openssl,
+	openvpn, opkg, oprofile, opus, opus-tools, orc, ortp, pango,
+	pciutils, pcmanfm, pcre, pcsc-lite, perl, php, pixman,
+	pkgconf, polarssl, pptp-linux, proxychains, pulseaudio,
+	python, python3, qemu, qextserialport, qt, quagga, radvd,
+	readline, rng-tools, rt-tests, rubix, ruby, sam-ba, samba,
+	sane-backends, sconeserver, scons, screen, sdl, sdl_gfx,
+	sdl_mixer, sdl_ttf, sdparm, sed, smartmontools, speex, sqlite,
+	squid, sshfs, strace, sudo, sylpheed, tn5250, taglib, tar,
+	torsmo, transmission, tslib, uboot-tools, ulogd,
+	usb_modeswitch, util-linux, valgrind, vim, vsftpd, wavpack,
+	webkit, wipe, wireless_tools, wpa_supplicant, xapp_xinit,
+	xapp_xinput-calibrator, xapp_xman, xapp_xmh, xlib_libX11,
+	xlib_libXdmcp, xlib_libXft, xlib_libpthread-stubs,
+	xlib_xtrans, xproto_xcmiscproto, xproto_xextproto,
+	xserver_xorg-server, xstroke, xvkbd, xz
+
+	New packages: b43-firmware, b43-fwcutter, bustle,
+	cache-calibrator, cegui06, celt051, classpath, curlftpfs,
+	dvb-apps, dvbsnoop, elfutils, enlightenment, firmware-imx,
+	flashbench, gd, gesftpserver, gst-fsl-plugins, httping, iftop,
+	imx-lib, jamvm, jpeg-turbo, keyutils, libatasmart, libcofi,
+	libebml, libevas-generic-loaders, libfslcodec, libfslparser,
+	libfslvpuwrap, libgsasl, libiscsi, libmatroska, libmcrypt,
+	libmhash, libqwt, libseccomp, libsha1, linenoise, mcrypt,
+	media-ctl, ncdu, neard, neardal, nettle, perf, polkit,
+	proxychains, python-bottle, python-pyparsing, rpi-firmware,
+	rpi-userland, sg3_utils, slirp, snowball-hdmiservice, spice,
+	spice-protocol, tcllib, tvheadend, udisks, usbredir
+	ux500-firmware, vde2, xcb-utils-keysyms, yavta,
+	zd1211-firmware
+
+	Removed packages: xdriver_xf86-input-{acecad,aiptek},
+	xdriver_xf86-video-{apm,chips,i740,rendition,s3,s3virge,sisusb},
+	xdriver_xf86-video-sun{cg14,cg3,cg6,ffb,leo,tcx},
+	xdriver_xf86-video-{tsend,xgi,xgixp}
+
+	Deprecated packages: xstroke
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#4237: building shared openssl w/-Os fails due to gcc bug
+	#5690: python3 does not obey to BR2_PACKAGE_PYTHON3_PYC_ONLY=y
+	#5602: python3 should install a "python" symbolic link
+	#5846: Extra slash added to last slash in URL
+
+2012.11.1, Released January 3rd, 2013:
+
+	Toolchain: Fixed non-largefile builds on recent Ubuntu
+	versions.
+
+	Arch: fix missing x86/generic handling, Build for Xtensa with
+	longcalls option.
+
+	Updated/fixed packages: dosfstools, qt
+
 2012.11, Released December 2nd, 2012:
 
 	Git shallow clone fix for older git version.
