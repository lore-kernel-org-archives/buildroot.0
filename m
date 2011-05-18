From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 May 2011 21:02:30 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110518190349.368FD83530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7234c23967fa70b760c64700e56bb1778019fbeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   53 ++++++++++++++++++++++++++++++++++++++++++++---------
 1 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index a60a898..9155e00 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,15 +1,50 @@
 2011.05, Not released yet:
 
+	Fixes all over the tree and new features.
+
+	External toolchain improvements: We now build a binary
+	toolchain wrapper and install it into HOST_DIR/usr/bin, which
+	enforces the correct compiler arguments, making an external
+	toolchain as easy to use outside of Buildroot as the internal
+	ones are. This also brought a cleanup of CFLAGS, making the
+	Buildroot build output easier to read.
+
+	Rootfs device handling improvements: Choice between static
+	/dev, devtmpfs and devtmpfs with either mdev or udev.
+
+	Toolchain: More preconfigured codesourcery external
+	toolchains, improved Crosstool-NG support, fix for GCC
+	snapshot versions, GCC 4.4.6 / 4.5.3, experimental GCC 4.6.0
+	support, target-GCC fixes, uClibc fixes, 0.9.32-rc3 support.
+
+	Bootloaders: U-boot 2011.03, Barebox 2011.05.0
+
+	Linux: support for custom kernel image targets, E.G. for
+	powerpc builds with embedded device trees.
+
+	Misc fixes for qemu defconfigs, ensuring correct serial
+	terminal setup out of the box.
+
+	Misc gentarget / autotools handling fixes.
+
 	Updated/fixed packages: alsa-lib, alsa-utils, alsamixergui,
-	avahi, busybox, copas, dnsmasq, dropbear, ethtool, fakeroot,
-	ffmpeg, file, gnuconfig, gst-ffmpeg, gst-plugins-good, icu,
-	imagemagick, iproute2, less, libdnet, libpng, libxml2,
-	libxslt, lighttpd, makedevs, midori, mpg123, mpd, mtd-utils,
-	ncurses, netsnmp, openssl, pkg-config, popt, procps, qt,
-	quagga, readline, rsync, samba, squid, socat, squashfs, tslib,
-	webkit, xerces, xlib_xtrans, xorg-server, xterm, xz
-
-	New packages: bonnie++, can-utils, htop, libv4l
+	atk, avahi, bind, bison, busybox, copas, dbus-glib, dhcp,
+	dhcpdump, dnsmasq, dropbear, ethtool, fakeroot, ffmpeg, file,
+	gamin, gnuconfig, gst-ffmpeg, gst-plugins-good, gtk2-engines,
+	haserl, hostapd, icu, imagemagick, iproute2, iw, kismet, less,
+	libcap, libdnet, libglade, libglib2, libgtk2, libnl, libpng,
+	libxml2, libxml2, libxslt, lighttpd, lockfile-progs, makedevs,
+	midori, mpg123, mpc, mpd, mpfr, mtd-utils, ncurses, netsnmp,
+	openssh, openssl, openvpn, pango, pkg-config, popt, procps,
+	proftpd, qt, quagga, readline, rsync, samba, sdl, socat,
+	squashfs, squid, sudo, tslib, udev, usbutils, webkit,
+	wpa_supplicant, xerces, xfont_font-misc-misc, xlib_libX11,
+	xlib_libXfont, xlib_xtrans, xorg-server, xterm, xz
+
+	New packages: bonnie++, can-utils, gdisk, htop,
+	input-event-daemon, libexif, libraw, libv4l, ngircd
+
+	Removed packages: festival
 
 	Issues resolved (http://bugs.uclibc.org):
 
-- 
1.7.3.4
