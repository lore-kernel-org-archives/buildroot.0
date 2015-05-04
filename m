From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 May 2015 10:25:30 +0200
Subject: [Buildroot] [git commit] CHANGES: Update with recent changes
Message-ID: <20150504082612.0FE1C7FA94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=329f687026cb92ac4912b2a0dea07b9bf192db39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And list major additions in 2015.05.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |  173 ++++++++++++++++++++++++++++++++++++++++-----------------------
 1 files changed, 110 insertions(+), 63 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9945fc6..3dd7a9f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,42 +2,84 @@
 
 	Fixes all over the tree and new features.
 
+	Architectures: Removed AVR32 support, deprecate SH64, added
+	support for steamroller, corei7-avx and core-avx2 x86
+	variants.
+
+	Toolchains: IPv6 and Largefile support now enforced for
+	uClibc. Corresponding Kconfig symbols removed.
+
+	External CodeSourcery AMD64 2014.05, MUSL-cross 1.1.6 added,
+	CS sh2, Xilinx microblaze v2/14.3 removed. Distro-class
+	external toolchains are now detected and blacklisted.
+
+	Internal toolchain support for Nios2 added, Blackfin
+	removed. Aarch64 and sh musl support. uClibc-ng support added.
+
+	Libatomic is now handled for internal and external
+	toolchains. Link time optimization (LTO) support.
+
+	New Defconfigs: Freescale i.MX28 EVK, i.MX31 PDK and SABRE
+	Auto, Raspberry Pi 2, RIoTboard,
+
+	Infrastructure: Hashes for a large number of packages have
+	been added. Missing hashes now stop the build unless
+	explicitly disabled.
+
+	Spaces and colons (:) are now supported in
+	package versions. Dependencies can now be listed for the patch
+	step (<PKG>_PATCH_DEPENDENCIES). Kconfig and Linux kernel
+	extensions infrastructure has been added.
+
+	Makedevs now has a recursive (r) option.
+
+	The variable containing the list of packages to build has been
+	renamed from TARGETS to PACKAGES.
+
+	The old insecure DES password encoding is no longer supported.
+
+	U-Boot patch option now support direct references to patch
+	files and URLs in addition to directories of patches. The
+	i.MX28 SD format (u-boot.sd) is now supported.
+
 	Updated/fixed packages: agentpp, aircrack-ng, alsa-lib,
 	alsa-utils, apr-util, apr, atk, autossh, avahi, avrdude,
-	bdwgc, bind, binutils, bmon, boost, botan, btrfs-progs,
-	busybox, ca-certificates, cairo, can-utils, canfestival,
-	ccache, chrony, civetweb, cmake, collectd, connman, copas,
-	crda, cryptodev-linux, cryptsetup, cups, czmq, dbus-cpp,
-	dbus-glib, dbus-python, dbus, dfu-util, dhcp, dhcpcd, dialog,
-	dillo, dmraid, dnsmasq, dos2unix, dosfstools,
-	dovecot-pigeonhole, dovecot, dropbear, dropwatch,
+	bcusdk, bdwgc, bind, binutils, bmon, boost, botan,
+	btrfs-progs, busybox, ca-certificates, cairo, can-utils,
+	canfestival, ccache, chrony, civetweb, clamav, cmake,
+	collectd, connman, copas, crda, cryptodev-linux, cryptsetup,
+	cups, czmq, dbus-cpp, dbus-glib, dbus-python, dbus, dfu-util,
+	dhcp, dhcpcd, dialog, dillo, dmraid, dnsmasq, dos2unix,
+	dosfstools, dovecot-pigeonhole, dovecot, dropbear, dropwatch,
 	dtv-scan-tables, dvdauthor, e2fsprogs, ecryptfs-utils,
 	libevas, elfutils, enscript, erlang, espeak, eudev, evemu,
 	exfat-utils, exim, f2fs-tools, feh, ffmpeg, fftw, flickcurl,
 	fltk, fluxbox, fmlib, fmtools, freeradius-client, freerdp,
 	gamin, gawk, gcc-final, gcc, gd, gdb, gengetopt, geoip, git,
 	glib-networking, gnu-efi, gnuchess, gnutls, gpsd, gptfdisk,
-	gstreamer, gstreamer1, gtest, gvfs, harfbuzz, haserl, haveged,
-	hiawatha, hicolor-icon-theme, hostapd, hplip, httping,
-	i2c-tools, icu, ifplugd, imagemagick, imlib2, iozone,
-	iproute2, iptables, iputils, irqbalance, iw, jack2, jhead,
-	jimtcl, json-c, kexec, kismet, kmod, kodi-audioencoder-flac,
+	gpu-viv-bin-mx6q, gst-plugin-bad, gstreamer, gstreamer1,
+	gtest, gvfs, harfbuzz, haserl, haveged, hiawatha,
+	hicolor-icon-theme, hostapd, hplip, httping, i2c-tools, icu,
+	ifplugd, imagemagick, imlib2, iozone, iproute2, iptables,
+	iputils, irqbalance, iw, jack2, jhead, jimtcl, json-c, kexec,
+	kismet, kmod, kodi-audioencoder-flac,
 	kodi-audioencoder-vorbis, kodi-pvr-addons, kodi, ktap, lcms2,
-	libass, libbluray, libcap, libcgroup, libcurl, libdrm,
-	libdvbsi, libebml, libedit, liberation, libev, libevdev,
-	libftdi, libgcrypt, libglib2, libgpgme, libgtk2, libgtk3,
-	libiconv, libidn, libiio, libinput, libiscsi, libksba,
-	liblinear, libmatroska, libmicrohttpd, libmodbus,
-	libmpdclient, libnice, libnl, libnspr, libnss, libpcap,
-	libpciaccess, libphidget, libplayer, libqmi, librsvg,
-	libseccomp, libsigrok, libsoup, libsrtp, libssh2, libtasn1,
-	libtool, libunistring, liburcu, libusb, libuv,
-	libva-intel-driver, libva, libvncserver, libvorbis, libvpx,
-	libwebsockets, libxml2, libzip, lightning, lighttpd, linphone,
-	linux-firmware, linux-headers, linux-pam, live555, ljsyscall,
-	lmbench, lockdev, logrotate, lpc3250loader, lpeg, lsof,
-	lttng-libust, lttng-modules, lttng-tools, lua, luacrypto,
-	luafilesystem, luajit, luaposix, luarocks, lvm2, lxc, make,
+	libass, libatomic_ops, libbluray, libcap, libcgroup, libcurl,
+	libdrm, libdvbsi, libebml, libecore, libedit, liberation,
+	libev, libevas, libevdev, libftdi, libgcrypt, libglib2,
+	libgpgme, libgtk2, libgtk3, libiconv, libidn, libiio,
+	libinput, libiscsi, libksba, liblinear, libmatroska,
+	libmicrohttpd, libmodbus, libmpdclient, libnice, libnl,
+	libnspr, libnss, libpcap, libpciaccess, libphidget, libplayer,
+	libpthsem, libqmi, librsvg, libseccomp, libsigrok, libsoup,
+	libsrtp, libssh2, libtasn1, libtool, libunistring, liburcu,
+	libusb, libuv, libva-intel-driver, libva, libvncserver,
+	libvorbis, libvpx, libwebsockets, libxml2, libzip, lightning,
+	lighttpd, linknx, linphone, linux-firmware, linux-headers,
+	linux-pam, live555, ljsyscall, lmbench, lockdev, logrotate,
+	lpc3250loader, lpeg, lsof, lttng-libust, lttng-modules,
+	lttng-tools, lua, luacrypto, luafilesystem, luajit, luaposix,
+	luarocks, lvm2, lxc, make,
 	matchbox-{common,desktop,fakekey,keyboard,lib,startup-monitor,vm},
 	matchbox, mcelog, memcached, memstat, memtest86, mesa3d,
 	minidlna, mjpegtools, mjpg-streamer, modem-manager, mongoose,
@@ -47,28 +89,29 @@
 	nodejs, ntfs-3g, ntp, numactl, odhcp6c, ofono, open2300,
 	opencv, openldap, openntpd, openocd, openssh, openssl,
 	openswan, opentyrian, openvmtools, openvpn, oprofile, p11-kit,
-	pango, patch, patchelf, pciutils, perf, perl-gdgraph,
+	pango, patch, patchelf, pciutils, pcre, perf, perl-gdgraph,
 	perl-io-socket-ssl, perl-json-tiny, perl-module-build,
 	perl-mojolicious, perl-net-ssleay, perl-path-tiny,
 	perl-xml-libxml, perl, phidgetwebservice, php-gnupg, php,
 	pkgconf, polarssl, poppler, popt, postgresql, powerpc-utils,
 	pppd, prboom, procps-ng, proftpd, psplash, ptpd2,
 	python-{cheetah,coherence,django,markdown,netifaces,pam,six},
-	python-tornado, python-twisted, python-zope-interface, qemu,
-	qt, qt5, qt5base, qt5multimedia, qt5xmlpatterns, qt5cinex,
-	quagga, qwt, radvd, readline, rng-tools, rpcbind,
-	rpi-firmware, rpi-userland, rsync, rsyslog, rtai, rtmpdump,
-	ruby, sam-ba, samba, samba4, sconeserver, shairport-sync,
-	sigrok-cli, slang, smcroute, snmppp, socat, socketcand,
-	sofia-sip, sox, spawn-fcgi, speex, sqlcipher, sqlite, squid,
-	strace, strongswan, stunnel, sudo, sunxi-boards, swig,
-	sysstat, systemd, tcpdump, tftpd, thrift, thttpd, ti-gfx,
-	ti-utils, tiff, tinyalsa, tn5250, transmission, trinity,
-	tslib, tvheadend, tzdata, uboot-tools, uclibc, ulogd,
-	usb_modeswitch, usbutils, ustr, util-linux, vala, valgrind,
-	vlc, wayland, webp, weston, wget, which, whois,
-	wireless-regdb, wireless_tools, wireshark, wpa_supplicant,
-	wvstreams, xapp_{bdftopcf,bitmap,fonttosfnt,fslsfonts},
+	python-tornado, python-twisted, python-zope-interface, python,
+	python3, qemu, qt, qt5, qt5base, qt5multimedia,
+	qt5xmlpatterns, qt5cinex, quagga, qwt, radvd, readline,
+	rng-tools, rpcbind, rpi-firmware, rpi-userland, rsync,
+	rsyslog, rtai, rtmpdump, ruby, sam-ba, samba, samba4,
+	sane-backends, sconeserver, shairport-sync, sigrok-cli, slang,
+	smcroute, snmppp, socat, socketcand, sofia-sip, sox,
+	spawn-fcgi, speex, sqlcipher, sqlite, squid, strace,
+	strongswan, stunnel, sudo, sunxi-boards, swig, sysstat,
+	systemd, tcpdump, tftpd, thrift, thttpd, ti-gfx, ti-utils,
+	tiff, tinyalsa, tn5250, transmission, trinity, tslib,
+	tvheadend, tzdata, uboot-tools, uclibc, ulogd, usb_modeswitch,
+	usbutils, ustr, util-linux, vala, valgrind, vlc, wayland,
+	webp, weston, wget, which, whois, wireless-regdb,
+	wireless_tools, wireshark, wpa_supplicant, wvstreams,
+	xapp_{bdftopcf,bitmap,fonttosfnt,fslsfonts},
 	xapp_{fstobdf,iceauth,mkfontscale,oclock,rgb,sessreg,setxkbmap},
 	xapp_{showfont,smproxy,twm,x11perf,xcalc,xclipboard,xcmsdb},
 	xapp_{xdbedizzy,xditview,xdpyinfo,xdriinfo,xedit,xev,xeyes},
@@ -79,36 +122,40 @@
 	xdriver_xf86-input-{evdev,keyboard,synaptics,void},
 	xdriver_xf86-video-{ati,cirrus,geode,mach64,mga,neomagic},
 	xdriver_xf86-video-{r128,savage,siliconmotion,sis,tdfx},
-	xdriver_xf86-video-{trident,vmware,voodoo}, xfont_font-util,
-	xkeyboard-config, xlib_lib{ICE,X11,Xdmcp,Xfont,Xpm,XvMC},
+	xdriver_xf86-video-{trident,vmware,voodoo}, xenomai,
+	xfont_font-util, xkeyboard-config,
+	xlib_lib{ICE,X11,Xdmcp,Xfont,Xpm,XvMC},
 	xlib_lib{Xxf86vm,xshmfence,xtrans}, xproto_randrproto,
 	xproto_xproto, xserver_xorg-server, x11vnc, x264, xerces,
 	xorriso, xterm, xz, yaml-cpp, zeromq, zic, zmqpp
 
 	New packages: apache, autoconf-archive, batctl,
-	bitstream-vera, bullet, doxygen, drbd-utils, dvdrw-tools,
-	gnuradio, gst1-imx, hans, hwloc, ijs, inconsolata, iodine,
-	iotop, ipmiutil, jsoncpp, leveldb, libdcadec, libdri2,
-	libfreeimage, libftdi1, libsidplay2, lirc-tools,
-	lua-periphery, mc, mesa3d-headers, mosquitto, nvidia-driver,
-	nvidia-tegra23{,-binaries,-codecs}, openjpeg, opusfile,
-	perl-crypt-openssl-{random,rsa}, perl-db-file,
-	perl-digest-{hmac,sha1}, perl-encode-{detect,locale},
-	perl-file-{listing,util}, perl-html-{parser,tagset},
-	perl-http-cookies, perl-http-{daemon,date,message,negotiate},
-	perl-io-html, perl-libwww-perl, perl-lwp-mediatypes,
-	perl-mail-dkim, perl-mailtools, perl-mime-base64,
-	perl-net-{dns,http}, perl-netaddr-ip, perl-time-hires,
-	perl-timedate, perl-uri, perl-www-robotrules, powertop,
-	pulseview, python-{cherrypy,lxml,mako,pyqt,sip,spidev,ws4py},
-	qpdf, qt-webkit-kiosk, sl, softether, sysdig, tinyxml2, tor,
-	tovid, unixodbc, wf111, wine, libepoxy, xapp_xcompmgr,
+	bitstream-vera, bullet, cc-tool, doxygen, drbd-utils,
+	dvdrw-tools, gnuradio, gst1-imx, hans, hwloc, ijs,
+	imx-usb-loader, inconsolata, iodine, iotop, ipmiutil, jsoncpp,
+	leveldb, libdcadec, libdri2, libfreeimage, libftdi1,
+	libsidplay2, lirc-tools, lua-periphery, mc, mesa3d-headers,
+	mosquitto, nvidia-driver, nvidia-tegra23{,-binaries,-codecs},
+	openjpeg, opusfile, perl-crypt-openssl-{random,rsa},
+	perl-db-file, perl-digest-{hmac,sha1},
+	perl-encode-{detect,locale}, perl-file-{listing,util},
+	perl-html-{parser,tagset}, perl-http-cookies,
+	perl-http-{daemon,date,message,negotiate}, perl-io-html,
+	perl-libwww-perl, perl-lwp-mediatypes, perl-mail-dkim,
+	perl-mailtools, perl-mime-base64, perl-net-{dns,http},
+	perl-netaddr-ip, perl-time-hires, perl-timedate, perl-uri,
+	perl-www-robotrules, powertop, pulseview,
+	python-{cherrypy,lxml,mako,pyqt,pyxml,sip,spidev,ws4py}, qpdf,
+	qt-webkit-kiosk, sl, softether, sysdig, tinyxml2, tor, tovid,
+	unixodbc, wf111, wine, libepoxy, xapp_xcompmgr,
 	xapp_xfindproxy, xcb-util-cursor, xcb-util-renderutil,
-	xdriver_xf86-input-libinput, xdriver_xf86-video-imx,
+	xdriver_xf86-input-libinput, xdriver_xf86-video-imx{,-viv},
 	xproto_xproxymanagementprotocol
 
 	Removed packages: gtk2-theme-hicolor
 
+	Deprecated packages: samba
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#7478: Multiple chosen python modules are not built due to...
