From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Nov 2015 22:43:57 +0100
Subject: [Buildroot] [git commit] CHANGES: update for 2015.11-rc1
Message-ID: <20151107215131.4A1DE81A1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=235423870be6d9a97431eedac39ccd60eca17e25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |  227 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 227 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 89df9a4..904dcf7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,230 @@
+2015.11-rc1, not yet released
+
+	Fixes all over the tree and new features.
+
+	Architectures:
+
+	- Support for sparc64 added (internal toolchain with glibc
+	  only).
+
+	- Support for mips32r6 and mips64r6 added.
+
+	- Support for Intel Quark X1000 CPU.
+
+	- Switch to EABIhf by default on ARM when a VFP is available.
+
+	Toolchains:
+
+	- glibc 2.22, gdb 7.10, use gdb 7.9 by default, musl 1.1.12,
+	  uclibc-ng 1.0.8, host-gdb enabled on AArch64.
+
+	- The toolchain wrapper which was used only for external
+	  toolchains is now also used for Buildroot internal
+	  toolchains. This allowed to fix the ccache support, prepare
+	  the way for top-level parallel build support and remove gcc
+	  patches used to detect header/library path poisoning.
+
+	- Remove Analog Devices Blackfin toolchain 2012R2.
+
+	- Fix several Xtensa build failures by switching from
+	  text-section-literals to auto-litpools.
+
+	- Enable MIPS64 support in uClibc-ng, use uClibc on ARC
+	  rather than a specific fork.
+
+	- Linaro toolchains for ARM, ARMeb and AArch64 updated to
+	  2015.08. 2014.09 version is kept since 2015.08 only runs on
+	  x86_64 hosts.
+
+	Bootloaders:
+
+	- Fix ARM64 support in U-Boot.
+
+	Defconfigs:
+
+	- Added: ARC HS38 VDK virtual boards, Avnet Microzed, Boundary
+	  Devices Nitrogen SoloX, Freescale i.MX6 SoloX Sabre SD,
+	  OLinuxino A20 Lime2, Qemu Sparc64, Qemu SuperH 4 big endian,
+	  Synopsys AArch64 VDK virtual platform.
+
+	- Updated: calao_qil_a9260, calao_usb_a9g20_lpw, ci20,
+	  cubieboad, freescale_imx6_*, imx53loco, imx6_vab820,
+	  mpc8315erdb, qmx6, p1010rdb, qemu, raspberrypi,
+	  raspberrypi2, riotboard, snps_axs10*, wandboard.
+
+	- Removed: at91rm9200df, at91sam9260dfc, at91sam9263ek,
+	  calao_snowball_defconfig, gnublin, integrator926_defconfig.
+
+	Infrastructure:
+
+	- Support for fetching from Mercurial tags fixed.
+
+	- Introduce LINUX_NEEDS_MODULES, which allows to enforce
+	  module support to be enabled in the kernel when a package
+	  builds out-of-tree kernel modules (through the
+	  pkg-kernel-module infrastructure or on its own).
+
+	- Improve the perl package infrastructure to automatically add
+	  the dependency to the perl interpreter to target perl module
+	  packages.
+
+	- Remove trailing slashes in <pkg>_SITE and addition of a
+	  check to ensure such trailing slashes are no longer added.
+
+	- Extend the legal infrastructure to allow packages to declare
+	  their actual source code. This is useful for packages for
+	  which <pkg>_SOURCE points to pre-built binaries (as is the
+	  case for external toolchains). The new <pkg>_ACTUAL_SOURCE
+	  variable allows to point to the source code in such cases.
+
+	- Improved ccache support, thanks to the usage of a toolchain
+	  wrapper for internal toolchain. Now a single cache directory
+	  can be shared between different Buildroot builds.
+
+	- Addition of a 'graph-size' make targets, which generates a
+	  PDF graph of per-package size of the root filesystem.
+
+	- Addition of <pkg>_EXCLUDES so that packages can request
+	  certain parts of the source code tarball to not be
+	  extracted. This feature is currently used by gcc and
+	  toolchain-external.
+
+	- Packages can now use the <pkg>_PKGDIR variable, provided by
+	  the package infrastructure, to reference their package
+	  directory, instead of explicitly using package/<pkg>/.
+
+	Filesystems:
+
+	- Add high lz4 compression to squashfs.
+
+	- Simplification of shell profile files in the default
+	  skeleton.
+
+	- Remove ftp user and /home/ftp from the skeleton, and let ftp
+	  server packages create these when needed.
+
+	- Add support for /bin, /sbin and /lib to be symlinks to their
+	  corresponding directories in /usr. This is enforced for
+	  systemd configurations, and optional for other
+	  configurations.
+
+	- Support for AXFS filesystem image generation added.
+
+	- New options to add extra space/inodes to ext2/3/4 images.
+
+	Updated/fixed packages:
+
+	adwaita-icon-theme, apache, apitrace, atk, audit, avahi,
+	barebox, bash, batctl, bind, binutils, bluez_utils, boost,
+	bridge-utils, cairo, ccache, chrony, clapack, cloog, cmake,
+	collectd, connman, conntrack-tools, coreutils, cpio,
+	cryptsetup, dbus, dbus-cpp, devmem2, dhcp, dhcpcd, dhcpdump,
+	dhrystone, dillo, directfb, directfb-examples, dmraid,
+	dos2unix, dovecot, dovecot-pigeonhole, drbd-utils, dropbear,
+	dropwatch, dtc, e2fsprogs, ebtables, efl, eigen, ejabberd,
+	elf2flt, elfutils, erlang, ethtool, eudev, evemu, exfat,
+	exfat-utils, expat, faifa, fbterm, fdk-aac, feh, ffmpeg, file,
+	flashrom, fping, freerdp, freescale-imx, freetype, gdk-pixbuf,
+	genimage, gettext, git, glib-networking, glmark2, gnupg2,
+	gnuradio, gnutls, gpsd, grep, grub2, gst1-imx, gst1-libav,
+	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
+	gst1-plugins-ugly, gst1-validate, gst-fsl-plugins,
+	gst-plugins-bad, gstreamer1, guile, gvfs, harfbuzz, haveged,
+	hostapd, icu, imagemagick, impiutil, imx-gpu-viv, imx-vpu,
+	inadyn, intltool, iostat, iperf3, ipmiutil, iproute2,
+	iptables, iw, jpeg-turbo, jq, jsoncpp, kexec-lite, kmod, kodi,
+	kodi-audioencoder-flac, kodi-pvr-argustv, kodi-pvr-filmon,
+	kodi-pvr-hts, kodi-pvr-mythtv, kodi-pvr-pctv,
+	kodi-pvr-stalker, kodi-pvr-vbox,
+	kodi-visualisation-waveforhue, less, lftp, libbluray,
+	libcgroup, libconfuse, libcurl, libdcadec, libdrm, libevdev,
+	libffi, libfribidi, libfslcodec, libfslparser, libfslvpuwrap,
+	libgcrypt, libglew, libglib2, libgtk3, libidn, liblinear,
+	liblockfile, libmicrohttpd, libnetfilter_conntrack, libnfs,
+	libnftnl, libnl, libnspr, libnss, libpcap, libpfm4, libpng,
+	libselinux, libserial, libsoup, libsoxr, libstrophe, libtasn1,
+	libtirpc, libtorrent, libupnpp, liburcu, libusb-compat, libuv,
+	libv4l, libva, libva-intel-driver, libxcb, lighttpd, links,
+	linux, linux-firmware, linux-fusion, linux-headers,
+	lirc-tools, localedef, lpeg, lsof, ltp-testsuite,
+	lttng-libust, lttng-tools, lua-periphery, luaposix, lvm2, lxc,
+	lz4, mdadm, mesa3d, mesa3d-headers, minicom, minidlna, moarvm,
+	modem-manager, mosquitto, mpd, mpdecimal, mpg123, mplayer,
+	mrouted, msmtp, mtd, mutt, nettle, network-manager, nfs-utils,
+	nftables, nginx, nodejs, noip, ntp, ofono, opencv3, openpgm,
+	openssl, openswan, openvpn, pango, parted, perl, perl-cross,
+	perl-crypt-openssl-random, perl-http-message,
+	perl-io-socket-ssl, perl-module-build, perl-mojolicious,
+	perl-netaddr-ip, perl-net-dns, perl-net-http, perl-net-ssleay,
+	perl-uri, perl-xml-libxml, php, picocom, pixman, pkgconf,
+	poco, polarssl, portaudio, portmap, postgresql, proftpd,
+	protobuf, protobuf-c, pulseaudio, python-configshell-fb,
+	python-networkmanager, python-numpy, python-pyparsing,
+	python-pypcap, python-rtslib-fb, python-spidev, python-urwid,
+	python-web2py, qemu, qt5base, redis, rngtools, rng-tools,
+	rpi-firmware, rpi-userland, rtmpdump, rtorrent, ruby, samba,
+	samba4, sane-backends, sconeserver, sdl, sed, setools,
+	shairport-sync, shared-mime-info, sland, smartmontools,
+	softether, spice-protocol, sqlcipher, sqlite, squid,
+	strongswan, stunnel, subversion, sudo, sunxi-tools,
+	supervisor, systemd, tar, targetcli-fb, tcpdump, tiff, tor,
+	tvheadend, tzdata, uboot-tools, udisks, unionfs, upmpdcli,
+	util-linux, vala, valgrind, vim, vlc, vorbis-tools, vsftpd,
+	vtun, wavpack, webkitgtk24, weston, whois, wireless-regdb,
+	wireshark, wpa_supplicant, xdriver_xf86-input-vmmouse,
+	xdriver_xf86-video-imx-viv, xdriver_xf86-video-intel,
+	xdriver_xf86-video-sis, xlib_libXi, xorg-server,
+	xtables-addons, xterm, xz, zic, znc, zsh
+
+	New packages:
+
+	axfsutils, bitstream, check, dvblast, eventlog, fastd, gauche,
+	gmock, graphite2, gssdp, gupnp, gupnp-av, ibrcommon, ibrdtn,
+	ibrdtnd, ibrdtn-tools, imx-kobs, iqvlinux, irssi,
+	kompexsqlite, libbroadvoice, libcddb, libcodec2, libcrossguid,
+	libg7221, libhttpparser, libilbc, libldns, libmng,
+	libopenh264, libpam-radius-auth, libpam-tacplus, libsilk,
+	libsoundtouch, libssh, libuecc, libyuv, liquid-dsp, luv,
+	micropython, micropython-libs, python-pyratemp,
+	python-pyroute2, python-ranger, rapidxml, scrypt, sdl2,
+	sp-oops-extract, squeezelite, stress-ng, swupdate, syslog-ng,
+	x265, xdriver_xf86-video-fbturbo, xxhash, yad, zxing-cpp
+
+	Removed packages:
+
+	blackbox (was deprecated), divine (merged in directfb),
+	kobs-ng (replaced by imx-kobs), mediactl (merged in libv4l),
+	sawman (merged in directfb), schifra (marked broken since a
+	long time), texinfo (host variant only, no longer used), zxing
+	(replaced by zxing-cpp),
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#4099: cut utility from GNU coreutils works incorrect
+	#7772: libxml-parser-perl build failure: missing dependency
+	       ExtUtils/MakeMaker
+	#7931: Default configuration for Cubieboard v1 is outdated
+	#8116: 2015.05-rc2 raspberrypi2_defconfig network interface
+	       not coming up
+	#8246: X.org DRI2 build issue
+	#8256: pointing to /usr/bin/objcopy old version (x86) instead
+	       of the generated one
+	#8266: mplayer build issue
+	#8281: pyrexc fails to run when path is too long
+	#8316: lttng-tools and lttng-babeltrace executables contain
+	       bad RPATH pointing to host machine
+	#8331: kexec wants shutdown in /sbin, but systemd installs it
+	       in /usr/sbin
+	#8361: Buildroot 2015.08.1 skeleton inittab overwritten by
+	       busybox's version
+	#8366: libevent does not build
+	#8386: build failed with external toolchain
+	#8391: Node.js 0.12.7 fails to build on raspberry_pi defconfig
+	#8396: CCACHE initialization
+	#8401: gpsd 3.15 NMEA support
+	#8416: cups depends on BR2_DEPRECATED_SINCE_2015_05
+	#8421: util-linux installs systemd files in output/target/home/
+
 2015.08, Released August 31st, 2015
 
 	Minor fixes.
