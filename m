From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Feb 2011 22:44:21 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with recent
	changes and resolved issues
Message-ID: <20110202214454.3EE858F34A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d1a93022868df4cab0498d08299f39fe5a03cdb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   53 +++++++++++++++++++++++++++++++++++------------------
 1 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/CHANGES b/CHANGES
index 724ef77..f3293dc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,7 +20,10 @@
 	Staging directory moved into $(O)/host/usr/<tuple>/sysroot, in
 	preparation for support of SDK. For the same reason, the
 	toolchain binaries (cross-compiler and other related tools)
-	are now installed in $(O)/host/usr/bin/.
+	are now installed in $(O)/host/usr/bin/. The cross pkg-config
+	now also automatically returns correct values for cross
+	compilation, without needing any environment variables to be
+	set.
 
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
@@ -33,53 +36,67 @@
 
 	Support for bzr downloads, next to the existing git/svn support.
 
+	Kconfig infrastructure rebased against 2.6.38-rc3, bringing
+	misc fixes. 'xconfig' now uses Qt4 rather than Qt3.
+
 	EXT2 file system size handling improved, UBI image support, fs
 	configuration options cleanup, U-Boot/Barebox version bumps.
 
 	Updated/fixed packages: alsa-utils, at, autoconf, automake,
 	bash, binutils, bison, busybox, bzip2, cdrkit, cloop,
-	coreutils, cups, dbus, dbus-python, direcfb-examples, dmalloc,
-	dosfstools, ed, ffmpeg, findutils, flac, freetype, gdk-pixbuf,
-	gmp, grep, gperf, gst-plugins-good, gstreamer, gvfs, hdparm,
-	hostapd, i2c-tools, icu, input-tools, iproute2, iptables,
-	jpeg, kexec, libaio, libcap, libconfig, libfuse, libglib2,
-	libmad, libogg, libpcap, libsndfile, libtheora, libtool,
-	libvorbis, libxcb, libxml2, libxslt, linux-fusion, lm-sensors,
-	lsof, ltp-testsuite, ltrace, lvm2, lzo, m4, makedevs,
-	memtester, mesa3d, mii-diag, mpc, mpfr, mpg123, mplayer,
-	mrouted, nano, netperf, netplug, ntfs-3g, openssh, openssl,
-	openvpn, oprofile, pango, patch, pciutils, php, portmap,
-	psmisc, python, qt, rsync, screen, sdl_gfx, sdl_sound,
+	coreutils, cups, dbus, dbus-python, dhcp, directfb,
+	direcfb-examples, dmalloc, dnsmasq, dosfstools, ed, fbset,
+	ffmpeg, findutils, flac, freetype, gdk-pixbuf, gmp, grep,
+	gperf, gst-plugins-good, gstreamer, gvfs, hdparm, hostapd,
+	i2c-tools, icu, imagemagick, input-tools, iproute2, iptables,
+	jpeg, kexec, libaio, libart, libcap, libconfig, libfuse,
+	libglib2, libidn, libmad, libogg, libpcap, libsndfile,
+	libtheora, libtool, libusb-compat, libvorbis, libxcb, libxml2,
+	libxslt, linux-fusion, lm-sensors, lsof, ltp-testsuite,
+	ltrace, lvm2, lzo, m4, makedevs, memtester, mesa3d, mii-diag,
+	mpc, mpfr, mpg123, mplayer, mrouted, mtd-utils, nano, netperf,
+	netplug, ntfs-3g, ntp, openssh, openssl, openvpn, oprofile,
+	pango, patch, pciutils, php, pkgconfig, portmap, psmisc,
+	python, qt, rsync, ruby, screen, sdl_gfx, sdl_sound,
 	smartmontools, sqlite, squid, sshfs, sstrip, sysklogd,
 	sysstat, sysvinit, tar, tcpdump, tslib, udev, usbutils, vim,
-	vtun, webkit, wipe, xapp_xlogo, xcb-proto, xkeyboard-config,
-	xlib_libX11, xz, zlib
+	vtun, webkit, wipe, x11vnc, xapp_xlogo, xcb-proto,
+	xfont_font-util, xkeyboard-config, xlib_libX11, xz, zlib
 
 	New packages: dhrystone, faad2, fbgrab, irda-utils, libao,
-	libcuefile, libffi, libreplaygain, libsamplerate, libsigc++,
-	lsuio, mpd, musepack, python-mad, python-serial, rsh-redone, sdparm,
-	vorbis-tools, wavpack, whetstone, xl2tp
+	libcuefile, libffi, libhid, libreplaygain, libsamplerate,
+	libsigc++, lsuio, mpd, musepack, python-mad, python-serial,
+	rsh-redone, sdparm, vorbis-tools, wavpack, whetstone, xl2tp
 
 	Removed packages: hotplug, l2tp, libfloat, microcom,
 	ng-spice-rework
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#267:  The make target: cross fails because toolchain_build_...
+	#415:  Berkeley DB: mut_pthread.o: relocation R_X86_64_32 against...
 	#561:  ltp-testsuite failed to install
+	#1447: Installing gfortran on PowerPC
 	#1651: Build fail caused by ccache in module-init-tools
 	#1681: Cross-compiled binaries shouldn't be installed into staging
+	#1723: [PATCH] axel: convert to generic package infrastructure and...
 	#1735: [PATCH] mplayer: convert to autotools infrastructure
+	#2551: [PATCH] native toolchain in the target filesystem fails
+	#2623: buildroot-snapshot-20100922 fails when compiling development...
 	#2647: makedevs package lacks support for 16-bit major/minor numbers
 	#2371: QT MYSQL Module does not build when MySQL installed on the host
 	#2839: compile fails in various packages with a odd message "error:...
+	#2887: tar "buffer overflow detected" error
 	#2893: Broken "make source" with external toolchain
 	#2905: Qt: Speed up compilation, if gui-module isn't selected
 	#2929: genext2fs: couldn't allocate a block (no free space)
 	#2965: Broken linkage to xkbcomp (blocking X server startup)
 	#2983: xlib_libX11 build failed
 	#3007: kexec doesn't build: Missing regdef.h file
+	#3085: Init scripts are not compatible with sysVinit (when busybox...
 	#3103: make external-deps wants to download gcc-.tar.bz2 when...
 	#3109: abnormal `make busybox-menuconfig`
+	#3115: How about board specific makefiles?
 	#3181: dhcp.mk copies S80dhcp-server to etc/init.d, not etc/init.d/
 
 2010.11, Released November 30th, 2010:
-- 
1.7.3.4
