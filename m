From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Feb 2016 18:10:26 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20160209171039.7AF21803E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ea4443eaaa8d7715d510e133a684186f9e8148b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 182 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/CHANGES b/CHANGES
index 336b195..5a63add 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,185 @@
+2016.02, Not yet released
+
+	Fixes all over the tree and new features.
+
+	Toolchain: Support for GCC 5.3.x. ARC toolchain updated to
+	arc-2015.12. Support for legacy uClibc dropped, default to
+	uClibc-ng instead. Added sys/queue.h implementation for MUSL
+	for compatibility. Updated versions of Code sourcery and
+	Linaro toolchains. MIPS Codescape toolchains added. Version
+	selection for preconfigured external toolchains removed.
+
+	New Defconfigs: ARM Juno r0/r1 development boards, Freescale
+	i.MX6UL Evaluation Kit, Intel Galileo Gen 2, Orange Pi PC.
+	A number of defconfigs have been extended to generate complete
+	system images using genimage.
+
+	Makedevs utility now accepts textual (non-numerical) user and
+	group names.
+
+	Vagrant file to easily setup a working development environment
+	in a VM has been added.
+
+	Size-stats-compare script to compare rootfs sizes between
+	builds has been added.
+
+	Infozip package renamed to zip. EFL packages restructured.
+
+	Updated/fixed packages: aespipe, aiccu, alsa-lib, alsa-utils,
+	angularjs, apache, apr, argp-standalone, armadillo, arptables,
+	at, atk, audiofile, aumix, autoconf-archive, avahi, bash, bc,
+	bcache-tools, bdwgc, beecrypt, bind, binutils, bluez5_utils,
+	bluez_utils, bonnie, boost, busybox, cairo, cdrkit, chrony,
+	clamav, cmake, collectd, connman, coreutils, cppcms, crda,
+	cryptodev-linux, cryptsetup, cups, cwiid, cxxtest, dbus,
+	dbus-cpp, dbus-glib, debianutils, dhcp, dhcpcd, dhrystone,
+	dillo, directfb, directfb-examples, dmraid, dnsmasq, doom-wad,
+	dovecot, dovecot-pigeonhole, dropbear, dtv-scan-tables,
+	dvb-apps, dvbsnoop, ecryptfs-utils, eigen, ejabberd,
+	elementary, elfutils, enlightenment, erlang, espeak, eudev,
+	eventlog, exfat, exfat-utils, exiv2, expedite, faifa,
+	fakeroot, fastd, fbgrab, fetchmail, ffmpeg, findutils, fio,
+	firmware-imx, flann, flashrom, flite, flot, fmlib, freerdp,
+	freescale-imx, freetype, gauche, gawk, gcc, gcc-final, gcr,
+	gdb, gdk-pixbuf, geoip, gesftpserver, gettext, giflib, git,
+	glibc, glibmm, glog, gmp, gnupg, gnupg2, gnutls, gob2, gpsd,
+	gptfdisk, grep, gst1-libav, gst1-plugins-{bad,base,good,ugly},
+	gst-ffmpeg, gst-plugins-{bad,base,good,ugly}, gstreamer,
+	gstreamer1, guile, gvfs, gzip, harfbuzz, haserl, hiawatha,
+	hostapd, hplip, icu, ifupdown, imagemagick, imx-gpu-viv,
+	imx-kobs, imx-lib, input-tools, intel-microcode, iperf3,
+	ipmitool, iproute2, iprutils, ipsec-tools, ipset, iptables,
+	iputils, irda-utils, irssi, iucode-tool, jack2, janus-gateway,
+	jpeg-turbo, jquery-datetimepicker, jquery-keyboard,
+	jquery-sparkline, jquery-ui, jquery-ui-themes,
+	jquery-validation, json-c, kbd, kernel-module-imx-gpu-viv,
+	keyutils, kmod, knock, kodi, lcdproc, lcms2, leafnode2,
+	leafpad, libass, libatomic_ops, libbroadvoice, libbsd,
+	libcap-ng, libcdaudio, libcue, libcurl, libdrm, libecore,
+	libedbus, libedit, libedje, libeet, libefreet, libeina,
+	libeio, libelementary, libembryo, libepoxy, libethumb, libev,
+	libevas, libevas-generic-loaders, libevdev, libevent, libffi,
+	libfm, libfribidi, libfslcodec, libfslparser, libfslvpuwrap,
+	libftdi, libfuse, libgail, libglew, libglib2, libgtk2,
+	libgtk3, libgudev, libhttpparser, libidn, libinput, libiscsi,
+	libjpeg, liblinear, libmbim, libmicrohttpd, libndp, libnspr,
+	libnss, liboauth, liboping, libpciaccess, libplist, libpng,
+	libraw, libraw1394, librsvg, libseccomp, libsecret,
+	libserialport, libsigc, libsigrok, libsigrokdecode,
+	libsndfile, libsoc, libsodium, libsoup, libssh2, libsvg,
+	libsvg-cairo, libtasn1, libtirpc, libtorrent, libungif,
+	libunwind, libupnpp, liburcu, libuv, libv4l, libva,
+	libva-intel-driver, libvips, libvncserver, libxml2, libxmlpp,
+	lightning, lighttpd, linknx, linux-firmware, linux-fusion,
+	linux-headers, liquid-dsp, lirc-tools, live555, lm-sensors,
+	lockdev, lshw, ltp-testsuite, ltrace, lttng-babeltrace,
+	lttng-libust, lttng-modules, lttng-tools, lua, luabitop,
+	luarocks, luv, lvm2, lxc, makedevs, mc, memcached, memtest86,
+	mesa3d, mesa3d-demos, mesa3d-headers, micropython,
+	micropython-lib, minicom, minidlna, mjpg-streamer, mke2img,
+	moarvm, modem-manager, mongoose, mongrel2, monkey, mono,
+	monolite, mosh, mosquitto, mpd, mplayer, msgpack, mtdev2tuio,
+	musepack, musl, mysql, nano, nasm, nbd, neard, netatalk,
+	netsnmp, nettle, net-tools, network-manager, nfs-utils, nginx,
+	nmap, nodejs, ntfs-3g, ntp, numactl, nut, nvidia-driver,
+	odhcp6c, ofono, ola, olsr, omniorb, opencv, opencv3, openipmi,
+	openldap, openntpd, openobex, openocd, openpgm,
+	open-plc-utils, openpowerlink, openssh, openssl, openswan,
+	openvpn, opkg, oprofile, opus, opusfile, p11-kit, package,
+	pango, pax-utils, pciutils, pcmanfm, perl, perl-db-file,
+	perl-io-socket-ssl, perl-libwww-perl, perl-net-dns, perl-uri,
+	perl-xml-libxml, php, php-ssh2, picocom, pinentry, pixman,
+	polarssl, popt, portaudio, pppd, procps-ng, proftpd, protobuf,
+	psmisc, ptpd2, pulseaudio, pulseview, pv, python, python3,
+	python-alsaaudio, python-can, python-cffi, python-cherrypy,
+	python-httplib2, python-jinja2, python-lxml, python-m2crypto,
+	python-mako, python-msgpack, python-psutil, python-pyasn,
+	python-pycparser, python-pydal, python-pyftpdlib,
+	python-pyroute2, python-pyxml, python-pyzmq, python-requests,
+	python-serial, python-setuptools, python-six, python-spidev,
+	python-tornado, python-twisted, python-web2py, python-webpy,
+	python-werkzeug, python-zope-interface, qemu, qhull, qpdf, qt,
+	qt5, qt5base, qt5connectivity, qt5declarative, qt5enginio,
+	qt5graphicaleffects, qt5imageformats, qt5multimedia,
+	qt5quick1, qt5quickcontrols, qt5script, qt5sensors,
+	qt5serialport, qt5svg, qt5webchannel, qt5webkit,
+	qt5webkit-examples, qt5websockets, qt5x11extras,
+	qt5xmlpatterns, qt-webkit-kiosk, racehound, radvd, read-edid,
+	readline, redis, rpcbind, rpi-firmware, rpi-userland, rrdtool,
+	rsync, rsyslog, rtai, rtorrent, rt-tests, rubix, ruby, samba4,
+	sconeserver, setools, shairport-sync, sigrok-cli, skeleton,
+	smack, snowball-init, socat, sp-oops-extract, sqlite,
+	squashfs, squeezelite, squid, sredird, sshfs,
+	start-stop-daemon, strace, strongswan, stunnel, subversion,
+	sunxi-tools, swig, sysdig, syslog-ng, sysstat, systemd,
+	sysvinit, taglib, tcl, tcpreplay, thrift, ti-gfx, tinyalsa,
+	tor, torsmo, trace-cmd, transmission, tremor, triggerhappy,
+	trinity, tvheadend, tzdata, uboot-tools, uclibc, udisks,
+	udpcast, unionfs, upmpdcli, usb_modeswitch,
+	usb_modeswitch_data, ustr, util-linux, vala, valgrind,
+	vboot-utils, vde2, vlc, vnstat, webkit, webkitgtk24, weston,
+	wget, whetstone, whois, wine, wipe, wireless-regdb, wireshark,
+	wpa_supplicant, w_scan, x11r7, xapp_xbacklight, xapp_xcompmgr,
+	xapp_xinput, xapp_xkbcomp, xdriver_xf86-input-evdev,
+	xdriver_xf86-input-libinput, xdriver_xf86-input-synaptics,
+	xdriver_xf86-video-ati, xdriver_xf86-video-fbturbo,
+	xdriver_xf86-video-imx-viv, xdriver_xf86-video-intel,
+	xfont_encodings, xfont_font-adobe-100dpi,
+	xfont_font-adobe-75dpi, xfont_font-adobe-utopia-100dpi,
+	xfont_font-adobe-utopia-75dpi, xfont_font-adobe-utopia-type1,
+	xfont_font-alias, xfont_font-arabic-misc,
+	xfont_font-bh-100dpi, xfont_font-bh-75dpi,
+	xfont_font-bh-lucidatypewriter-100dpi,
+	xfont_font-bh-lucidatypewriter-75dpi, xfont_font-bh-ttf,
+	xfont_font-bh-type1, xfont_font-bitstream-100dpi,
+	xfont_font-bitstream-75dpi, xfont_font-bitstream-type1,
+	xfont_font-cronyx-cyrillic, xfont_font-cursor-misc,
+	xfont_font-daewoo-misc, xfont_font-dec-misc,
+	xfont_font-ibm-type1, xfont_font-isas-misc,
+	xfont_font-jis-misc, xfont_font-micro-misc,
+	xfont_font-misc-cyrillic, xfont_font-misc-ethiopic,
+	xfont_font-misc-meltho, xfont_font-misc-misc,
+	xfont_font-mutt-misc, xfont_font-schumacher-misc,
+	xfont_font-screen-cyrillic, xfont_font-sony-misc,
+	xfont_font-sun-misc, xfont_font-winitzki-cyrillic,
+	xfont_font-xfree86-type1, xfsprogs, xkeyboard-config, xl2tp,
+	xlib_libfontenc, xlib_libXi, xmlstarlet, xscreensaver,
+	xserver_xorg-server, xtables-addons, xvkbd, xz, yad, yasm,
+	ympd, zeromq, zic, znc, zsh,
+
+	New packages: acsccid, assimp, atkmm, autofs, bcm2835,
+	cairomm, cantarell, chocolate-doom, comix-cursors, cxxtest,
+	edid-decode, emlog, gcr, gtkmm3, hidapi, jquery-sidebar,
+	kernel-module-imx-gpu-viv, libasplib, libcroco, libdvbpsi,
+	libfreeglut, libgdiplus, libglfw, libhdhomerun, libnet,
+	libsoil, lldpd, luvi, mbedtls, minizip, miraclecast, mongodb,
+	mraa, netbsd-queue, netsniff-ng, nss-pam-ldapd,
+	obsidian-cursors, openal, openbox, pangomm,
+	python-backports-abc, python-beautifulsoup4, python-cbor,
+	python-click, python-cssselect, python-ecdsa, python-html5lib,
+	python-idna, python-ipaddress, python-mistune, python-netaddr,
+	python-paho-mqtt, python-paramiko, python-pyparted,
+	python-pysmb, python-pyudev, python-singledispatch,
+	python-smbus-cffi, python-urllib3, qt53d, rabbitmq-c, rfkill,
+	sbc, spi-tools, tpm-tools, trousers, ubus, unrar, unscd,
+	unzip, v4l2grab, xdriver_xf86-video-nouveau, xdotool, zbar
+
+	Removed packages: libungif, python-pyxml,
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#7886: gettext: link failure with locally-installed libxml2
+	#7892: systemd-journald is broken
+	#8066: nodejs crashes when built with gcc 4.9
+	#8296: nodejs 0.12.7 - npm crashes (seg core dump)
+	#8501: gunzip fails to uncompress files
+	#8541: fail to build host-fakeroot-1.20.2
+	#8546: build instructions for raspberry pi don't work
+	#8571: strace for ARC compile error
+	#8581: pciutils.mk PCIUTILS_MAKE_OPTS typo
+	#8616: Fail to build for raspberrypi_defconfig with big endian
+	#8621: sqlite package, properly enable readline
+
 2015.11, Released November 30th, 2015
 
 	Minor fixes.
