From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Feb 2011 22:58:39 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with recent
	changes
Message-ID: <20110213215849.CAC3E8F4D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4120e051f6c1721dbe9419e5942df833ba53159e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   55 +++++++++++++++++++++++++++++++------------------------
 1 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/CHANGES b/CHANGES
index ac5d45b..2db2158 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,8 @@
 	well-known toolchains. Buildroot is now capable of
 	automatically downloading and extracting well-known toolchains
 	(for the moment, CodeSourcery ARM, PowerPC, MIPS and SuperH
-	toolchains are supported).
+	toolchains are supported). Crosstool-NG backend updated and
+	improved.
 
 	Complete rework of how hardware boards are supported.
 	Each board now only has a single defconfig file, and all
@@ -17,6 +18,8 @@
 	r2d and Qemu x86. The Qemu boards support allows to easily
 	build systems that are known to work under Qemu.
 
+	Initial support for Blackfin processors.
+
 	Staging directory moved into $(O)/host/usr/<tuple>/sysroot, in
 	preparation for support of SDK. For the same reason, the
 	toolchain binaries (cross-compiler and other related tools)
@@ -43,30 +46,34 @@
 	configuration options cleanup, U-Boot/Barebox version bumps.
 
 	Updated/fixed packages: alsa-utils, at, autoconf, automake,
-	bash, binutils, bison, busybox, bzip2, cdrkit, cloop,
+	bash, binutils, bison, busybox, bzip2, cdrkit, cloop, cmake,
 	coreutils, cups, dbus, dbus-python, dhcp, directfb,
-	direcfb-examples, dmalloc, dnsmasq, dosfstools, ed, fbset,
-	ffmpeg, findutils, flac, freetype, gdk-pixbuf, gmp, grep,
-	gperf, gst-plugins-good, gstreamer, gvfs, hdparm, hostapd,
-	i2c-tools, icu, imagemagick, input-tools, iproute2, iptables,
-	jpeg, kexec, libaio, libart, libcap, libconfig, libfuse,
-	libglib2, libidn, libmad, libogg, libpcap, libsndfile,
-	libtheora, libtool, libusb-compat, libvorbis, libxcb, libxml2,
-	libxslt, linux-fusion, lm-sensors, lsof, ltp-testsuite,
-	ltrace, lvm2, lzo, m4, makedevs, memtester, mesa3d, mii-diag,
-	mpc, mpfr, mpg123, mplayer, mrouted, mtd-utils, nano, netperf,
-	netplug, ntfs-3g, ntp, openssh, openssl, openvpn, oprofile,
-	pango, patch, pciutils, php, pkgconfig, portmap, psmisc,
-	python, qt, rsync, ruby, screen, sdl_gfx, sdl_sound,
-	smartmontools, sqlite, squid, sshfs, sstrip, sysklogd,
-	sysstat, sysvinit, tar, tcpdump, tslib, udev, usbutils, vim,
-	vtun, webkit, wipe, x11vnc, xapp_xlogo, xcb-proto,
-	xfont_font-util, xkeyboard-config, xlib_libX11, xz, zlib
-
-	New packages: dhrystone, faad2, fbgrab, irda-utils, libao,
-	libcuefile, libffi, libhid, libreplaygain, libsamplerate,
-	libsigc++, lsuio, mpd, musepack, python-mad, python-serial,
-	rsh-redone, sdparm, vorbis-tools, wavpack, whetstone, xl2tp
+	direcfb-examples, dmalloc, dnsmasq, dosfstools, e2fsprogs, ed,
+	fbset, ffmpeg, findutils, flac, freetype, gdk-pixbuf, gmp,
+	grep, gperf, gst-ffmpeg, gst-plugins-bad, gst-plugins-base,
+	gst-plugins-good, gst-plugins-ugly, gstreamer, gvfs, hdparm,
+	hostapd, i2c-tools, icu, imagemagick, input-tools, iproute2,
+	iptables, iw, jpeg, kexec, libaio, libart, libcap, libconfig,
+	libfuse, libglib2, libidn, libmad, libogg, libpcap, libpng,
+	libsndfile, libtheora, libtool, libusb-compat, libvorbis,
+	libxcb, libxml2, libxslt, links, linux-fusion, lm-sensors,
+	lsof, ltp-testsuite, ltrace, lvm2, lzo, m4, makedevs,
+	memtester, mesa3d, mii-diag, mpc, mpfr, mpg123, mplayer,
+	mrouted, mtd-utils, nano, netperf, netplug, ntfs-3g, ntp,
+	openssh, openssl, openvpn, oprofile, pango, patch, pciutils,
+	php, pkgconfig, portmap, psmisc, python, qt, rsync, ruby,
+	sawman, screen, sdl_gfx, sdl_sound, smartmontools, socat,
+	sqlite, squid, sshfs, sstrip, sysklogd, sysstat, sysvinit,
+	tar, tcpdump, tslib, udev, usbutils, vim, vtun, webkit, wipe,
+	x11vnc, xapp_xlogo, xcb-proto, xfont_font-util,
+	xkeyboard-config, xlib_libX11, xz, zlib
+
+	New packages: dhrystone, dsp-tools, faad2, fbgrab, gst-dsp,
+	gst-omapfb, irda-utils, lame, libao, libcue, libcuefile,
+	libffi, libhid, libreplaygain, libsamplerate, libsigc++,
+	lsuio, mpd, musepack, python-mad, python-serial, rsh-redone,
+	sdparm, tidsp-binaries, vorbis-tools, wavpack, whetstone,
+	xl2tp, xmlstarlet
 
 	Removed packages: hotplug, l2tp, libfloat, microcom,
 	ng-spice-rework
-- 
1.7.3.4
