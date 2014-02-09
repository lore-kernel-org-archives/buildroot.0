From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Feb 2014 22:46:26 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20140209214651.603B09C93A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a89c588238294d45b6bbc892e9564525d4013ef3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |  124 +++++++++++++++++++++++++++++++++++++++++----------------------
 1 files changed, 81 insertions(+), 43 deletions(-)

diff --git a/CHANGES b/CHANGES
index 67f9917..cece303 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,40 +2,68 @@
 
 	Fixes all over the tree and new features.
 
+	Support for external packages/defconfigs (BR2_EXTERNAL). See
+	user manual for details.
+
+	Cleanup of environment variable names for consistency. The
+	download directory location override (BUILDROOT_DL_DIR) is now
+	called BR2_DL_DIR. Likewise the name of the current .config is
+	renamed from BUILDROOT_CONFIG to BR2_CONFIG. Please update
+	your post build scripts if you use this! BUILD_DIR is now also
+	exported to the post build/image scripts.
+
+	Toolchain: GCC 4.8 fix for ARM stack corruption, reverted
+	uClibc pread/pwrite backport as they cause issues on certain
+	architectures, new Linaro and Sourcery Codebench toolchains.
+	x86: Support for AMD Jaguar cores, SSE4.x, SH: SH2/SH3/SH3EB
+	variants removed, Microblaze: Internal toolchain support
+
+	Legal infrastructure: Info is now split between host and
+	target packages, large number of license annotations.
+
+	Lua: selection between lua 5.1 / 5.2, luarocks support
+
+	Python: package infrastructure, many new packages.
+
+	Defconfigs: Armadeus APF51 + Zedboard added, apf27, apf28,
+	microblaze, pandaboard, qemu, raspberry pi updated.
+
 	Updated/fixed packages: aiccu, alsa-lib, alsa-utils, aumix,
 	autoconf, automake, barebox, bellagio, berkeleydb, binutils,
 	bison, blackbox, bluez_utils, boost, bustle, busybox, cairo,
 	can-utils, ccache, ccid, cgilua, cifs-utils, civetweb, cmake,
 	collectd, connman, copas, coreutils, coxpcall, cppzmq, cramfs,
 	crda, cryptodev-linux, cryptsetup, cups, czmq, dhcpcd,
-	dhcpdump, dialog, dnsmasq, dosfstools, dropbear, dropwatch,
-	dtc, duma, dvb-apps, e2fsprogs, eglibc, eigen, erlang,
-	ethtool, f2fs-tools, ffmpeg, file, filemq, fio, flashrom,
-	flex, fluxbox, fontconfig freerdp, freetype, gadgetfs-test,
-	gawk, gcc, gdb, gdbm, gettext, git, glibc, gnupg, gnutls,
-	gob2, gpsd, grep, grub, gst-ffmpeg, gst-plugins-good,
-	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
-	gst1-plugins-ugly, gstreamer, gstreamer1, gtest, iftop,
-	imagemagick, inadyn, infozip, iozone, iproute2, iptables, iw,
-	jpeg, jq, kmod, knock, lbase64, lcdapi, lftp, libcdaudio,
-	libcgi, libcgicc, libcuefile, libcurl, libdmtx, libdrm,
-	libdvdnav, libdvdread, libegl, libevent, libexif, libfcgi,
-	libfreefare, libgles, libglib2, libllcp, libmicrohttpd,
-	libmpd, libnfc, libnl, libnss, libopenmax, libopenvg, libpcap,
-	libpfm4, libplayer, libpng, libqmi, libreplaygain, libroxml,
-	libsamplerate, libsexy, libsigsegv, libsndfile, libsoc,
-	libtasn1, libtpl, libusb, libusb-compat, libvorbis, libxcb,
-	libxml2, lighttpd, linknx, linux-firmware, linux-pam, live555,
+	dhcpdump, dhrystone, dialog, dmraid, dnsmasq, dosfstools,
+	dropbear, dropwatch, dtc, duma, dvb-apps, e2fsprogs, eglibc,
+	eigen, elf2flt, erlang, ethtool, f2fs-tools, ffmpeg, file,
+	filemq, fio, flashrom, flex, fluxbox, fontconfig freerdp,
+	freetype, gadgetfs-test, gawk, gcc, gdb, gdbm, gettext, git,
+	glibc, gnupg, gnutls, gob2, gpsd, grep, grub, gst-ffmpeg,
+	gst-plugins-good, gst1-plugins-bad, gst1-plugins-base,
+	gst1-plugins-good, gst1-plugins-ugly, gstreamer, gstreamer1,
+	gtest, icu, iftop, imagemagick, inadyn, infozip, iozone,
+	iproute2, iptables, iw, jpeg, jq, kexec, kmod, knock, lbase64,
+	lcdapi, lftp, libcdaudio, libcgi, libcgicc, libcuefile,
+	libcurl, libdmtx, libdrm, libdvdnav, libdvdread, libegl,
+	libevent, libexif, libfcgi, libfreefare, libgles, libglib2,
+	libllcp, libmicrohttpd, libmpd, libnfc, libnl, libnss,
+	libopenmax, libopenvg, libpcap, libpfm4, libplayer, libpng,
+	libqmi, libreplaygain, libroxml, libsamplerate, libsexy,
+	libsigsegv, libsndfile, libsoc, libtasn1, libtpl, libupnp,
+	libusb, libusb-compat, libvorbis, libxcb, libxml2, libxmlpp,
+	libyaml, lighttpd, linknx, linux-firmware, linux-pam, live555,
 	lm_sensors, lmbench, lockdev, logrotate, lrzsz, ltrace, lua,
 	lua-ev, lua-msgpack-native, luabitop, luaexpat, luaexpatutils,
-	luafilesystem, luajit, luaposix, luarocks, luasec, luasocket,
+	luafilesystem, luajit, luaposix, luasec, luasocket,
 	luasql-sqlite3, m4, matchbox, mdadm, minicom, mongrel2, mpc,
 	mpd, mpg123, mplayer, mtd, mysql, lvm2, mxml, ncurses, ne10,
 	neard, neardal, netsnmp, netstat-nat, network-manager, nodejs,
-	numactl, ofone, ola, olsr, omniorb, opencv, openpowerlink,
-	openssh, openssl, openvpn, oprofile, opus, opus-tools, orbit,
-	p11-kit, parted, pcre, pcsc-lite, perl, php, poco, poppler,
-	powervr, protobuf-c, psplash, python, python-bottle,
+	numactl, ofone, ola, olsr, omniorb, open2300, opencv,
+	openpowerlink, openssh, openssl, openvpn, oprofile, opus,
+	opus-tools, orbit, p11-kit, parted, pcre, pcsc-lite, perl,
+	php, poco, poppler, powervr, protobuf-c, psplash, python,
+	python-bottle,
 	python-{crc16,distutilscross,dpkt,id3,ipy,m2crypto,mad,meld},
 	python-{netifaces,nfc,protobuf,pygame,pyparsing,pyro,pyzmq},
 	python-{serial,setuptools}, qt, qt5base, qt5connectivity,
@@ -49,11 +77,12 @@
 	sysstat, systemd, sysvinit, taglib, tar, tcpdump, ti-gfx,
 	ti-utils, tinymembench, tn5250, trace-cmd, transmission,
 	tvheadend, tzdata, zxing, uboot, uboot-tools, uclibc, udev,
-	ulogd, urg, usb_modeswitch_data, util-linux, vala, valgrind,
-	vorbis-tools, wavpack, wayland, weston, wget, wireless-regdb,
-	wireshark, wpa_supplicant, wsapi, xavante, xapp_xdpyinfo,
-	xapp_xrandr, xcb-proto, xdriver_xf86-video-intel, xenomai,
-	xkeyboard-config, xl2tp, xlib_lib{FS,SM,X11},
+	udpcast, ulogd, urg, usb_modeswitch_data, util-linux, vala,
+	valgrind, vorbis-tools, wavpack, wayland, weston, wget,
+	wireless-regdb, wireshark, wpa_supplicant, wsapi, xavante,
+	xapp_xdpyinfo, xapp_xrandr, xcb-proto,
+	xdriver_xf86-video-intel, xenomai, xkeyboard-config, xl2tp,
+	xlib_lib{FS,SM,X11},
 	xlib_libX{au,aw,composite,cursor,damage,ext,fixes,font,i},
 	xlib_libX{inerama,mu,pm,randr,render,res,t,tst,v,xf86dga},
 	xlib_libXxf86vm, xlib_libdmx, xlib_libfontenc,
@@ -64,27 +93,28 @@
 
 	New packages: apitrace, avrdude, c-ares, ca-certificates,
 	cwiid, dbus-cpp, evemu, fping, fswebcam, gpm, gst1-libav,
-	haveged, jasper, joe, ktap, lbreakout2, libass, libbluray,
-	libcdio, libenca, libevdev, libmbim, libmodplug, libnfs,
-	libnftnl, libplist, libshairplay, libsocketcan, ljsyscall,
-	log4cplus, ltris, luainterpreter, minidlna, mmc-utils,
-	modemmanager, mtr, net-tools, python-configobj, python-dialog,
-	python-json-schema-validator, python-keyring, python-msgpack,
-	python-posix-ipc, python-pyasn, python-pycrypto,
-	python-pysnmp, python-pysnmp-apps, python-pysnmp-mibs,
-	python-pyusb, python-simplejson, python-tornado,
-	python-versiontools, rtmpdump, rtptools, smcroute, smstools3,
-	tcpreplay, thrift, ti-uim, tinyxml, tmux, vlc, wmctrl,
-	xconsole
-
-	Removed packages: lzma, netkitbase, netkittelnet, pkg-config,
-	squashfs3, ttcp
+	haveged, intel-microcode, iucode-tools, jasper, joe, ktap,
+	lbreakout2, libass, libbluray, libcdio, libenca, libevdev,
+	libmbim, libmodplug, libnfs, libnftnl, libplist, libshairplay,
+	libsocketcan, ljsyscall, log4cplus, ltris, luainterpreter,
+	luarocks, minidlna, mmc-utils, modemmanager, mtr, net-tools,
+	python-configobj, python-dialog, python-json-schema-validator,
+	python-keyring, python-msgpack, python-posix-ipc,
+	python-pyasn, python-pycrypto, python-pysnmp,
+	python-pysnmp-apps, python-pysnmp-mibs, python-pyusb,
+	python-simplejson, python-tornado, python-versiontools,
+	rtmpdump, rtptools, smcroute, smstools3, tcpreplay, thrift,
+	ti-uim, tinyxml, tmux, vlc, wmctrl, xconsole
+
+	Removed packages: autoconf, automake, ccache, lzma,
+	netkitbase, netkittelnet, pkg-config, squashfs3, ttcp, xstroke
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#65:   new package: dbus c++ language bindings
 	#769:  Update configuration menu for MIPS target
 	#2629: Segmentation faults and division by zero in Grub on ext2
+	#4363: Make sure that copied linux and busybox defconfig are...
 	#5024: grub fails to build for x86_64 target architecture
 	#5066: New-Package: net-tools
 	#5072: ncurses: add ncurses-progs to target
@@ -92,15 +122,23 @@
 	#5366: Login doesn't work with util-linux versions of login/agetty
 	#5378: dropbear Makefile broken
 	#5390: System banner - change to empty doesn't remove /etc/issue
+	#5780: spurious build failure because it cannot remove ubinize.cfg
 	#5798: ncurses-5.9 fails to compile statically
 	#5810: Buildroot 2012.11: Additional GCC option "-msoft-float" ...
 	#6080: Git fetch caching
 	#6092: Bootable ISO image creation seems to have stopped working..
 	#6272: coreutils build fails
+	#6434: apply-patches.sh does not work recursively
+	#6446: eglibc doesn't install ldconfig to target
+	#6484: Add c-ares
 	#6656: Build Qt5 with ccache
 	#6662: internal compiler error: Segmentation fault during making..
+	#6722: Usage of $($(PKG)_DIR_PREFIX) is an issue with linux package
 	#6752: genext2fs: e2fsck must run before tunefs -U random
+	#6770: openssl 1.0.1f fails with ccache
 	#6830: Qt5: no fonts are installed
+	#6848: Qt5: no text shown in simple QWidget / frame-buffer setup
+	#6854: Update to Qt 5.2.1
 
 2013.11, Released November 30th, 2013:
 
