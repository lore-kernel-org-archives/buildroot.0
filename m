From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:03:28 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20140512200428.59B139CBAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2e4f742f2210e92612ffc7543e3ea2d15d44125
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |  164 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1487a29..d7e0582 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,10 +1,164 @@
 2014.05, Not yet released:
 
-Support for MIPS o32 ABI on MIPS-64 targets has been removed. Building
-o32 ELF files for MIPS64 is an exotic configuration that nobody should
-be using. If o32 is required, then is better if it's built for MIPS
-32-bit cores so only 32-bit instructions will be used leading to a more
-efficient o32 usage.
+	Fixes all over the tree and new features.
+
+	Architectures: Support for MIPS o32 ABI on MIPS-64 targets has
+	been removed. Building o32 ELF files for MIPS64 is an exotic
+	configuration that nobody should be using. If o32 is required,
+	then is better if it's built for MIPS 32-bit cores so only
+	32-bit instructions will be used leading to a more efficient
+	o32 usage.
+	Support for the ARM A12 variant and Intel corei7.
+
+	Configs: Minnowboard and Altera SoCkit added, QEMU updates.
+
+	Bootloaders: Grub2 and gummiboot support, syslinux support
+	extended.
+
+	Toolchains: GCC 4.9. Glibc 2.19. Support for the musl C
+	library for internal and external toolchains. 4.8-R3 support
+	for ARC, Internal toolchain support for Aarch64 and
+	Microblaze. Environment variable to control debug output of
+	toolchain wrapper renamed to BR2_DEBUG_WRAPPER to match the
+	other variables. Toolchain tupple vendor name can now be
+	customized. Updated external Linaro ARM/Aarch64
+	toolchains. Added external Linaro ARMEB toolchain.
+	A GDB gdbinit file is now generated for external toolchains to
+	automatically set the correct sysroot.
+
+	Kconfig handling for minimum kernel headers version required
+	for packages. Now packages needing specific kernel header
+	features can specify these requirements in Kconfig.
+
+	Infrastructure: Support for (but disabled as it leads to
+	unreproducable builds) toplevel parallel builds. See the
+	comment at the top of Makefile for details about how to enable
+	it and what the problems are if you want to test it.
+	Python package infrastructure extended to support Python 3.x
+	Perl and virtual package infrastructure support added.
+	PRE_*_HOOKS support for all build steps.
+
+	Updated/fixed packages: acpid, agentpp, apr, avahi, barebox,
+	bash, beecrypt, bellagio, binutils, boost,
+	boot-wrapper-aarch64, bustle, busybox, ca-certificates, cairo,
+	ccache, ccid, cgilua, chrony, cifs-utils, civetweb, cmake,
+	collectd, connman, coreutils, coxpcall, cppcms, cppzmq, crda,
+	cryptodev, cryptsetup, cups, czmq, dbus, dhcpdump, directfb,
+	dmalloc, dmraid, dnsmasq, dosfstools, dsp-tools, dtc,
+	dvb-apps, ecryptfs-utils, eigen, erlang, ethtool, evemu,
+	evtest, f2fs-tools, fdk-aac, feh, ffmpeg, file, filemq, flac,
+	flot, fmtools, fping, freetype, fswebcam, gcc, gd, gdb,
+	gettext, giblib, git, glibc, glibmm, glib-networking, gmp,
+	gnutls, gpm, gpsd, gpu-viv-bin-mx6q, grep, gst1-libav,
+	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
+	gst1-plugins-ugly, gst-ffmpeg, gst-fsl-plugins, gst-omx,
+	gst-plugins-good, gstreamer1, gvfs, harfbuzz, haveged,
+	hostapd, htop, httping, ifplugd, iftop, igmpproxy,
+	imagemagick, imlib2, imx-lib, infozip, intltool, iproute2,
+	ipsec-tools, ipset, jansson, jpeg, jpeg-turbo, jquery,
+	jquery-keyboard, jquery-ui, jquery-ui-themes, json-glib,
+	json-javascript, kexec, kmod, lame, lbase64, lbreakout2,
+	lcdproc, lftp, libao, libatasmart, libatomic_ops, libcap,
+	libcdio, libcec, libcgicc, libcurl, libdrm, libdvdnav,
+	libdvdread, libegl, libeio, libenca, libesmtp, libevas,
+	libevdev, libfribidi, libfslcodec, libfslparser,
+	libfslvpuwrap, libgail, libgles, libglib2, libgtk2, libhid,
+	libjpeg, libmbim, libmicrohttpd, libmodplug, libnftnl,
+	libnspr, libogg, libopenmax, libopenvg, libpcap, libplayer,
+	libpng, libpthread-stubs, librsvg, libsigsegv, libsocketcan,
+	libsoup, libtasn1, libtool, libtpl, libunwind, liburcu,
+	libusb, libwebsockets, libxcb, libxml2, libxmlpp, libyaml,
+	lighttpd, linphone, linux-firmware, linux-headers, ljsyscall,
+	lmbench, lsof, ltp-testsuite, ltris, lttng-babeltrace,
+	lttng-libust, lttng-modules, lttng-tools, lua, lua-cjson,
+	luacrypto, lua-ev, luaexpat, luaexpatutils, luafilesystem,
+	luainterpreter, luajit, lua-msgpack-native, luaposix,
+	luarocks, luasec, luasocket, luasql-sqlite3, lvm2, macchanger,
+	memstat, mesa3d, metacity, minidlna, mmc-utils,
+	mobile-broadband-provider-info, modem-manager, mongrel2,
+	monit, mpd, mplayer, msmtp, mtd, mtools, mutt, mysql, nasm,
+	ncurses, ne10, netatalk, netsnmp, nettle, network-manager,
+	newt, nfs-utils, nmap, nodejs, ntfs-3g, ntp, nut, ofono, ola,
+	olsr, omniorb, opencv, opengl, openpgm, openssh, openssl,
+	openswan, openvpn, orbit, orc, p11-kit, pango, parted,
+	pciutils, pcre, pcsc-lite, perf, perl, perl-xml-parser, php,
+	picocom, pixman, pkgconf, poppler, popt, portmap, powervr,
+	pppd, pptp-linux, proftpd, protobuf, protobuf-c, ptpd2,
+	pulseaudio, python, python3, python-bottle, python-m2crypto,
+	python-netifaces, python-pyasn, python-pycrypto,
+	python-pygame, python-pysnmp, python-pysnmp-apps,
+	python-pysnmp-mibs, python-serial, python-setuptools,
+	qextserialport, qt, qt5, qt5base, qt5connectivity,
+	qt5declarative, qt5graphicaleffects, qt5imageformats,
+	qt5multimedia, qt5quick1, qt5quickcontrols, qt5script,
+	qt5sensors, qt5serialport, qt5svg, qt5webkit, qt5x11extras,
+	qt5xmlpatterns, qtuio, qwt, radvd, readline, rings,
+	rpi-firmware, rpi-userland, rsh-redone, rsync, rsyslog, rtai,
+	rtmpdump, rt-tests, ruby, samba, sconeserver, scons, sdl,
+	sdl_image, sdl_mixer, sg3_utils, slang, smstools3, snmppp,
+	socat, speex, sqlcipher, sqlite, squashfs, squid, strongswan,
+	stunnel, sunxi-boards, sunxi-mali, sunxi-tools, sylpheed,
+	syslinux, systemd, taglib, tcl, tcllib, tcpreplay,
+	tidsp-binaries, ti-gfx, tmux, tvheadend, tzdata, uboot,
+	uboot-tools, uclibc, udev, udisks, ulogd, usb_modeswitch,
+	usb_modeswitch_data, usbmount, util-linux, valgrind, vlc,
+	webkit, weston, wget, wireshark, wpa_supplicant, wsapi,
+	w_scan, xapp_appres, xapp_bdftopcf, xapp_beforelight,
+	xapp_bitmap, xapp_editres, xapp_fslsfonts, xapp_fstobdf,
+	xapp_iceauth, xapp_ico, xapp_mkfontscale, xapp_rgb,
+	xapp_rstart, xapp_sessreg, xapp_showfont, xapp_twm,
+	xapp_viewres, xapp_xauth, xapp_xbacklight, xapp_xcalc,
+	xapp_xclock, xapp_xditview, xapp_xdpyinfo, xapp_xdriinfo,
+	xapp_xev, xapp_xfd, xapp_xfontsel, xapp_xfs, xapp_xfsinfo,
+	xapp_xgc, xapp_xhost, xapp_xinit, xapp_xkbutils, xapp_xkill,
+	xapp_xload, xapp_xlsclients, xapp_xlsfonts, xapp_xmag,
+	xapp_xman, xapp_xmessage, xapp_xmodmap, xapp_xprop,
+	xapp_xrandr, xapp_xrdb, xapp_xrefresh, xapp_xset,
+	xapp_xsetroot, xapp_xsm, xapp_xstdcmap, xapp_xvidtune,
+	xapp_xvinfo, xapp_xwd, xapp_xwininfo, xbmc, xbmc-addon-xvdr,
+	xbmc-pvr-addons, xcb-util-wm, xdriver_xf86-input-evdev,
+	xdriver_xf86-input-joystick, xdriver_xf86-input-keyboard,
+	xdriver_xf86-input-mouse, xdriver_xf86-input-synaptics,
+	xdriver_xf86-input-vmmouse, xdriver_xf86-video-ark,
+	xdriver_xf86-video-ast, xdriver_xf86-video-ati,
+	xdriver_xf86-video-cirrus, xdriver_xf86-video-dummy,
+	xdriver_xf86-video-fbdev, xdriver_xf86-video-geode,
+	xdriver_xf86-video-glide, xdriver_xf86-video-glint,
+	xdriver_xf86-video-i128, xdriver_xf86-video-intel,
+	xdriver_xf86-video-mach64, xdriver_xf86-video-mga,
+	xdriver_xf86-video-neomagic, xdriver_xf86-video-newport,
+	xdriver_xf86-video-nv, xdriver_xf86-video-openchrome,
+	xdriver_xf86-video-r128, xdriver_xf86-video-savage,
+	xdriver_xf86-video-siliconmotion, xdriver_xf86-video-sis,
+	xdriver_xf86-video-tdfx, xdriver_xf86-video-tga,
+	xdriver_xf86-video-trident, xdriver_xf86-video-vesa,
+	xdriver_xf86-video-vmware, xdriver_xf86-video-voodoo, xenomai,
+	xerces, xl2tp, xlib_libFS, xlib_xtrans, xproto_xproto,
+	xserver_xorg-server, xutil_util-macros, zeromq, zic, zmqpp,
+	zyre
+
+	New packages: armadillo, btrfs-progs, clapack, cosmo, dado,
+	dbus-triggerd, dtv-scan-tables, e2tools, eudev, exim, expect,
+	fetchmail, flann, flite, gnu-efi, grub2, gummiboot, heimdal,
+	iprutils, iptraf-ng, jack2, jquery-mobile, libee, libestr,
+	libgc, libgl, liblogging, libndp, libsoxr, libstrophe,
+	libubox, libuci, libxmlrpc, ljlinenoise, lpeg, lpty, lrandom,
+	lsqlite3, lua-coat, lua-coatpersistent, lua-csnappy, luajson,
+	lualogging, lua-messagepack, lua-testmore, lunit, lzip, lzlib,
+	musl, nftables, opentyrian, opentyrian-data,
+	perl-module-build, php-gnupg, php-imagick, php-ssh2, php-yaml,
+	php-zmq, postgresql, python-libconfig, python-pypcap,
+	python-pyrex, qdecoder, qhull, samba4, smack, tz, tzdump, ucl,
+	upx, vo-aacenc, yaffs2utils, zlog, znc
+
+	Removed packages: crosstool-ng, python-distutilscross, vala
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#6842: Checking external toolchain for eabihf
+	#6956: Packaging libsoxr
+	#6986: Make legal-info fails on uboot versions before 2014.01
+	#6992: Incorrect installation rights on external kernel module..
 
 2014.02, Released February 27th, 2014
 
