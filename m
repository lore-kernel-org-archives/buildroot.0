From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Nov 2013 01:04:15 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20131112000451.22E259BBF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9a16cb4fc796cde72c16c757fcd80c6f0716268
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |  105 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 105 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index f1b01a3..12c6b2b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,108 @@
+2013.11, Not yet released:
+
+	Architectures: Nios-II support, MIPS arch handling fixes
+
+	Defconfigs: cubieboard2, freescale i.MX 6sololite evk,
+	sabre-sd, wandboard added, rpi renamed to raspberrypi_defconfig
+
+	Toolchain: glibc support, upstream uClibc fixes, uClibc 0.9.31
+	for avr32, crosstool-ng backend removed, external musl
+	toolchain support, gcc 4.8.2, updated Linaro external
+	toolchains. Fortran and objective-C support deprecated,
+	mudflap support
+
+	Bootloaders: U-Boot: u-boot.imx support, version bumps
+
+	Linux: use kmod instead of module-init-tools
+
+	System: default to devtmpfs for /dev
+
+	Infrastructure: Make 3.82 fixes, locales generation fixes, CVS
+	download support, post-rsync hooks
+
+	Fs: u-boot image support for cpio
+
+	Updated/fixed packages: aircrack-ng, alsamixergui, apr,
+	apr-util, atk, automake, bellagio, berkeleydb, bind, binutils,
+	bison, boost, busybox, can-utils, ccache, ccid, cgilua,
+	chrony, cifs-utils, cjson, collectd, connman, conntrack-tools,
+	copas, cppcms, cppzmq, czmq, dash, dbus, dhcpcd, diffutils,
+	directfb, dmidecode, dnsmaqs, docker, dosfstools, dropbear,
+	dropwatch, ebtables, eglibc, elf2flt, empty, enchant, erlang,
+	ethtool, fbgrab, fbv, fdk-aac, feh, ffmpeg, file, findutils,
+	fltk, fmtools, freetype, gdk-pixbuf, gettext, git,
+	glib-networking, gmp, gnupg, gnutls, gpu-viv-bin-mx6q, gsl,
+	gstreamer, gstreamer1, gst1-plugins-{bad,base,good,ugly},
+	gtest, gutenprint, hplip, i2c-tools, icu, ifplugd,
+	imagemagick, iozone, iproute2, ipset, iptables, iw, jamvm,
+	jansson, jpeg-turbo, kismet, kmod, lcms2, libassuan, libcap,
+	libcap-ng, libcdaudio, libcec, libcue, libcurl, libdrm,
+	libedit, libevas, libevent, libfreefare, libfuse,
+	libgpg-error, libiconv, liblog4c-localtime, libmicrohttpd,
+	libmnl, libmodbus,
+	libnetfilter_{acct,conntrack,cthelper,cttimeout,log,queue},
+	libnfnetlink, libnl, libpng, libqmi, libqrencode, libroxml,
+	libsecret, libsigsegv, libsoup, libtirpc, libunwind, libusb,
+	libvpx, lighttpd, linphone, linux-pam, lmbench,
+	lockfile-progs, log4cxx, logrotate, logsurfer, ltp-testsuite,
+	ltrace, luacrypto, luaposix, lvm2, m4, matchbox-lib,
+	media-ctl, mediastreamer, minicom, minidlna, mongoose, monit,
+	mpc, mpd, mpg123, mplayer, mrouted, mtdev, mutt, mysql_client,
+	nano, ncftp, ndisc6, neard, neardal, neon, net-snmp, netatalk,
+	netcat, netkitbase, netperf, netplug, nettle, nfacct,
+	nfs-utils, ngircd, ngrep, noip, nuttcp, olsr, openssh, opkg,
+	oprofile, opus-tools, orc, ortp, pciutils, pcre, pcsc-lite,
+	perf, perl, perl-cross, php, picocom, pkgconf, polarssl,
+	poppler, pppd, proftpd, protobuf, proxychains-ng, pulseaudio,
+	pv, qemu, qt, qt5base, qt5webkit, quagga, radvd, redis,
+	rpi-{firmware,userland}, rrdtool, rsync, rtorrent, ruby,
+	samba, scons, screen, sdl_sound, ser2net, setserial,
+	smartmontools, socat, socketcand, sqlcipher, sqlite, squid,
+	stress, strongswan, stunnel, sudo, syslinux, systemd,
+	sysvinit, tcl, ti-gfx, time, transmission, tremor, tslib,
+	tvheadend, tzdata, uboot-tools, uclibc, udpcast, uemacs,
+	ulogd, usb_modeswitch{,_data}, util-linux, vala, valgrind,
+	vde2, vorbus-tools, vpnc, vsftpd, vtun, wayland, webkit, webp,
+	webrtc-audio-processing, weston, wget, wireshark, wsapi,
+	xavante, xdriver_xf86-video-geode, xenomai, xinetd,
+	xlib_libpthread-stubs, xl2tp, xmlstarlet, xserver_xorg-server,
+	xz, zeromq, zic, zmqpp
+
+	New packages: aiccu, autossh, bc, civetweb, cppdb, cryptsetup,
+	duma, eigen, harfbuzz, igmpproxy, iputils, jq, knock, kobs-ng,
+	lesstif, libcgroup, libsepol, libsoc, libssh2, luasec, luasql,
+	lxc, nut, ola, omniorb, openpowerlink, orbit, p910nd, psplash,
+	python-crc16, python-ipy, python-pyzmq, qt5sensors,
+	qt5serialport, qt5x11extras, snmppp, subversion, tcping,
+	trace-cmd, xscreensaver, zsh
+
+	Removed packages: module-init-tools
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#1138: Buildroot fails to build packages if BR2_GCC_SHARED_LIBGCC=y
+	#5408: qt build failure with Sourcery CodeBench ARM 2010.09
+	#5630: makefile error with toolchain helpers.mk
+	#5672: htop: remove X11 stuff
+	#5678: linux.mk: linux-menuconfig fails
+	#5696: python3 installation is too large, patches from python2 needed
+	#5978: Erlang does not build for arm in 2013.02-rc3
+	#6392: Extended ARM uImage kernel options
+	#6404: Buildroot's coreutils 'uname -p' reports 'Unknown' on recent..
+	#6428: util-linux libmount segfaults with patch from buildroot
+	#6452: eglibc from Linaro 2013.07 not copied to target correctly
+	#6566: PHP segfault when crosscompiled to mips64 - patch included
+	#6572: [PowerPC] Buildroot uses wrong external toolchain libraries..
+	#6578: udisks package broken
+	#6602: ebtables 64 bit kernel + 32 bit userland alignment error..
+	#6608: ebtables missing ethertypes - fix included
+	#6620: Sysvinit package missing killall5 and symlinks - patch included
+	#6632: CMake use host pkg-config
+	#6638: pkgconf doesn't download
+	#6644: "all" target doesn't work in out-of-tree builds
+	#6650: Segmentation fault when trying to build latest buildroot
+	#6668: iptables limit module alignment problem on mips64
+
 2013.08, Released August 31th, 2013:
 
 	Minor fixes.
