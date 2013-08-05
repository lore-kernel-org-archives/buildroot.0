From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Aug 2013 11:35:37 +0200
Subject: [Buildroot] [git commit] CHANGES: update for 2013.08-rc1
Message-ID: <20130805101439.3C4AE9B17E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36c966ef07fc10abab7e133915c7411ae52558cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |   98 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 98 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 910b942..dc1ff14 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,101 @@
+2013.08-rc1, Released August 5th, 2013:
+
+	Architectures:
+	 - improved support for floating point on ARM and Thumb/Thumb2
+	 - support for ARM OABI removed
+
+	Toolchains:
+         - support added for Sourcery CodeBench ARM and MIPS 2013.05
+         - Linaro ARM and Aarch64 toolchains updated
+	 - support added for the Arago ARMv5 and ARMv7 toolchains
+	 - gcc 4.8.x version bumped
+	 - support for installing both FDPIC and FLAT libraries on
+	   Blackfin
+	 - support for uClibc 0.9.31 removed,
+	 - convert the internal toolchain backend to use the package
+	   infrastructure
+	 - support added for eglibc in the internal toolchain backend
+	 - toolchain components for the ARC architecture updated and
+           gdb for ARC added.
+	 - support for Blackfin in the internal toolchain fixed
+
+	Defconfigs: beaglebone_defconfig updated, new defconfig for
+	CubieBoard, for Olimex mx233 Olinuxino, for Calao Systems
+	TNY-A9G20-LPW.
+
+	A number of packages have been fixed to use the
+	<pkg>_CONFIG_SCRIPTS mechanism to get their <pkg>-config shell
+	script installed and modified properly. Licensing informations
+	has been added to a number of packages.
+
+	Use XZ tarballs for a number of packages.
+
+	Noticeable package changes/additions:
+         - The glib2/libgtk2/webkit stack has been updated to recent
+           versions.
+	 - Support for Gstreamer 1.x has been added.
+	 - OpenGL support for TI OMAP platforms has been added.
+	 - OpenGL support for Allwinner platforms has been added.
+	 - OpenMAX support for RasberryPi has been added.
+
+	Updated/fixed packages: acl, attr, autoconf, avahi, barebox,
+	bind, binutils, busybox, bwm-ng, bzip2, cifs-utils, colletctd,
+	cpanminus, cups, curl, dash, dbus, dhcp, directfb,
+	directfb-examples, dnsmasq, dosfstools, dropbear, dtc,
+	e2fsprogs, ed, efl, enlightenment, erlang, ethtool, fbgrab,
+	fftw, firmware-imx, flot, fltk, freetype, gawk, gdk-pixbuf,
+	gettext, gmp, gnutls, gsl, gutenprint, gvfs, gzip, haserl,
+	hiawatha, httping, icu, imagemagick, imlib2, imx-lib,
+	intltool, iozone, ipset, iptables, jquery, jquery-keyboard,
+	jquery-sparkline, kmod, less, libart, libcdaudio, libcgicc,
+	libesmtp, libftdi, libfuse, libglib2, libgtk, libgtk2, libidn,
+	libiqrf, liblog4c-localtime, libnspr, libnss, libpcap,
+	libroxml, libserial, libsigsev, libsoup, libtool, libtpl,
+	libvncserver, libxml2, linphone, lm_sensors, logrotate,
+	ltrace, lttng, luafilesystem, luajit, minicom, monit, mpg123,
+	mtd, mutt, mxml, neard, netatask, netsnmp, nettle,
+	network-manager, nodejs, nss-mdns, openssh, openswan, openvpn,
+	opkg, opus, pcre, perl-cross, php, pixman, poco, polarssl,
+	pulseaudio, pv, python, python3, qt, qt5, qt5declarative,
+	qt5jsbackend, qt5quick1, readline, rpi-firmware, ruby, samba,
+	sane-backends, sconeserver, sdl_image, sdparm, ser2net,
+	socketcand, sqlite, squid, strace, tcl, tcpdump, tinyhttpd,
+	tvheadend, tzdata, uboot, udpcast, usb_modeswitch,
+	usb_modeswitch_data, usbutils, webkit, wireshark, wvstreams,
+	xapp_luit, xapp_xmodmap, xenomai, xfsprogs, xlib_libX11, zic,
+	zlib.
+
+	New packages: a10disp, aespipe, am33x-cm3, cppcms, dhcpcd,
+	dropwatch, dtc, ecryptfs-utils, eglibc, elf2flt, fdk-aac,
+	gcc-final, gcc-initial, gcc-intermediate, git,
+	gpu-viv-bin-mx6q, gst1-plugins-bad, gst1-plugins-base,
+	gst1-plugins-good, gst1-plugins-ugly, gst-omx,
+	gst-plugin-x170, gstreamer1, jimtcl, lbase64, libassuan,
+	libbsd, libcec, libdvbsi, libedit, libgpgme, libqmi,
+	libqrencode, libsvg, libsvg-cairo, libunwind, libvpx,
+	linux-headers, lockdev, luabitop, luacrypto, lua-ev,
+	luaexpatutils, msgpack, ocrad, on2-8170-libs,
+	on2-8170-modules, p11-kit, pax-utils, ptpd, ptpd2,
+	python-pyro, ramspeed/smp, snappy, strongswan, sunxi-boards,
+	sunxi-cedarx, sunxi-mali, sunxi-tools, ti-gfx, tinymembench,
+	tree, tstools, uclibc, w_scan.
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#4718: python (built for powerpc) distutils has paths to host
+               compiler toolchain
+	#5516: appended device tree blobs on uImage fails
+	#6302: Versions of packages retrieved from github.com are wrong
+	#6308: dosfstools download link is wrong
+	#6326: Dropbear: Add options to allow better config for
+               different target devices (e.g. routers)
+	#6338: Wrong download link for minicom package
+	#6344: Wrong handling of license text files with same name and
+               different directory
+	#6374: gnutls package broken if linux cryptodev module
+               selected
+	#6410: omap3_beagle has uimage error load address error
+
 2013.05, Released May 31th, 2013:
 
 	Minor fixes.
