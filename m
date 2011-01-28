From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jan 2011 10:43:13 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with recent
	changes
Message-ID: <20110128094347.4CCEE8DCAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2645004bb5e2f067532e8356694bbe66c4296d9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Thomas for input.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   58 +++++++++++++++++++++++++++++++++++++++++++---------------
 1 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/CHANGES b/CHANGES
index 27e9bf7..79197de 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,36 +1,64 @@
 2011.02, Not yet released:
 
+	External toolchain improvements: clarification of the options,
+	and introduction of the toolchain profile concept, for
+	well-known toolchains. Buildroot is now capable of
+	automatically downloading and extracting well-known toolchains
+	(for the moment, CodeSourcery ARM, PowerPC, MIPS and SuperH
+	toolchains are supported).
+
+	Complete rework of how hardware boards are supported.
+	Each board now only has a single defconfig file, and all
+	board-specific options have been removed. See
+	docs/buildroot.html#board_support for details.
+
+	Added support for the following boards: Mini2440, Qemu ARM
+	Versatile, Qemu MIPSel Malta, Qemu PowerPC G3beige, Qemu SH4
+	r2d and Qemu x86. The Qemu boards support allows to easily
+	build systems that are known to work under Qemu.
+
+	Staging directory moved into $(O)/host/usr/<tuple>/sysroot, in
+	preparation for support of SDK. For the same reason, the
+	toolchain binaries (cross-compiler and other related tools)
+	are now installed in $(O)/host/usr/bin/.
+
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
-	Toolchain: uClibc 0.9.32-rc1, several components moved to
+	Toolchain: uClibc 0.9.32-rc2, several components moved to
 	normal AUTOTARGET packages.
 
+	Generic cmake infrastructure, similar to the existing
+	GENTARGETS/AUTOTARGETS.
+
 	Support for bzr downloads, next to the existing git/svn support.
 
 	EXT2 file system size handling improved, UBI image support, fs
 	configuration options cleanup, U-Boot/Barebox version bumps.
 
 	Updated/fixed packages: alsa-utils, at, autoconf, automake,
-	bash, binutils, bison, busybox, bzip2, cloop, coreutils, cups,
-	dbus, direcfb-examples, dmalloc, dosfstools, ed, ffmpeg,
-	findutils, flac, freetype, gdk-pixbuf, gmp, grep, gperf,
-	gst-plugins-good, gvfs, hdparm, hostapd, i2c-tools, icu,
-	input-tools, iproute2, iptables, jpeg, kexec, libaio, libcap,
-	libconfig, libfuse, libglib2, libmad, libogg, libsndfile,
-	libtheora, libtool, libvorbis, libxml2, libxslt, linux-fusion,
-	lm-sensors, lsof, ltp-testsuite, ltrace, lvm2, m4, makedevs,
+	bash, binutils, bison, busybox, bzip2, cdrkit, cloop,
+	coreutils, cups, dbus, dbus-python, direcfb-examples, dmalloc,
+	dosfstools, ed, ffmpeg, findutils, flac, freetype, gdk-pixbuf,
+	gmp, grep, gperf, gst-plugins-good, gstreamer, gvfs, hdparm,
+	hostapd, i2c-tools, icu, input-tools, iproute2, iptables,
+	jpeg, kexec, libaio, libcap, libconfig, libfuse, libglib2,
+	libmad, libogg, libpcap, libsndfile, libtheora, libtool,
+	libvorbis, libxcb, libxml2, libxslt, linux-fusion, lm-sensors,
+	lsof, ltp-testsuite, ltrace, lvm2, lzo, m4, makedevs,
 	memtester, mesa3d, mii-diag, mpc, mpfr, mpg123, mplayer,
 	mrouted, nano, netperf, netplug, ntfs-3g, openssh, openssl,
 	openvpn, oprofile, pango, patch, pciutils, php, portmap,
-	psmisc, qt, rsync, screen, sdl_gfx, sdl_sound, smartmontools,
-	sqlite, squid, sshfs, sstrip, sysklogd, sysstat, sysvinit,
-	tar, tcpdump, tslib, udev, usbutils, vim, vtun, webkit, wipe,
-	xapp_xlogo, xkeyboard-config, xlib_libX11, xz, zlib
+	psmisc, python, qt, rsync, screen, sdl_gfx, sdl_sound,
+	smartmontools, sqlite, squid, sshfs, sstrip, sysklogd,
+	sysstat, sysvinit, tar, tcpdump, tslib, udev, usbutils, vim,
+	vtun, webkit, wipe, xapp_xlogo, xcb-proto, xkeyboard-config,
+	xlib_libX11, xz, zlib
 
 	New packages: dhrystone, faad2, fbgrab, irda-utils, libao,
-	libreplaygain, libsamplerate, libsigc++, lsuio, rsh-redone,
-	sdparm, vorbis-tools, wavpack, whetstone, xl2tp
+	libcuefile, libffi, libreplaygain, libsamplerate, libsigc++,
+	lsuio, mpd, musepack, python-mad, python-serial, rsh-redone, sdparm,
+	vorbis-tools, wavpack, whetstone, xl2tp
 
 	Removed packages: hotplug, l2tp, libfloat, microcom,
 	ng-spice-rework
-- 
1.7.3.4
