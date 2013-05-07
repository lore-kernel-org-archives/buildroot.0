From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 23:00:39 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20130507210347.EA3EB99CCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aec71d643784db991eb74086fc0352f788c86120
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |  118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 118 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4e327a8..ba91242 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,121 @@
+2013.05, Not released yet:
+
+        Architectures: ARC support, Blackfin support, FLAT binary
+        format, ARM: Drop old CPU variants, add fa526/626, Marvell PJ4
+
+	Toolchains: Add new Microblaze external toolchains, Linaro
+	ARM/Aarch64 updates, GCC 4.6.4 / 4.7.3 / 4.8.0 added to
+	internal toolchain, default to GCC 4.7.x.
+
+	Defconfigs: Add Atmel at91sam9g45m10ek, freescale mpc8315erdb
+	& p1010rdb, Armadeus apf27 / apf28, Raspberry pi, gnublin
+	board.
+
+	FS: LZO and XZ compression methods, extra ubifs options,
+	ext2 rev 0/1 and ext3/4 support.
+
+	Patch handling: apply-patches now has .patch.xz support,
+	Patch logic reworked as discussed during Febrary dev days:
+	http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013
+
+	<pkg>-rsync now excludes version control files.
+
+	linux: uImage load address for ARM multiplatform kernels
+
+	Infrastructure for multiple OpenGL / ES / EGL / OpenVG
+	providers, similar to how libjpeg / libjpeg-turbo is handled.
+
+	Infrastructure for packages to add system users.
+
+	kconfig: updated to 3.9-rc2, support make olddefconfig
+
+	Updated/fixed packages: alsa-lib, alsa-utils, apr, apr-util,
+	argp-standalone, at, at91bootstrap, audiofile, aumix, avahi,
+	bash, blackbox, bind, binutils, bison, boost, bridge-utils,
+	busybox, ccache, cifs-utils, cmake, collectd, connman,
+	conntrack-tools, cpanminus, crosstool-ng, diffutils, directfb,
+	directfb-examples, divine, dmalloc, dnsmasq, dosfstools,
+	dropbear, e2fsprogs, ebtables, eeprog, erlang, ethtool, fbset,
+	feh, ffmpeg, file, flex, flot, foomatic, gd, gdb, gdisk,
+	genimage, gettext, gmp, gnuchess, gnutls, gob2, gpsd,
+	gstreamer, haserl, hiawatha, htop, httping, icu,
+	inotify-tools, intltool, iproute2, ipset, iptables, iw, jpeg,
+	jquery, jquery-{sparkline,validation}, json-c, kbd, kexec,
+	kismet, kmod, lcdproc, libarchive, libcap, libconfig,
+	libconfuse, libcurl, libdrm, libeet, libev, libevas,
+	libeXosip2, libffi, libfribi, libfuse, libgcrypt, libglib2,
+	libgtk2, libid3tag, libmicrohttpd, libnetfilter_acct,
+	libnetfilter_conntrack, libnl, libpcap, libplayer, libsigc,
+	libv4l, libxcb, linenoise, linux-pam, lm_sensors,
+	ltp-testsuite, luajit, lzop, madplay, make, mdadm,
+	mediastreamer, memtester, mesa3d,
+	mobile-broadband-provider-info, monit, mpd, mpfr, mpg123,
+	mrouted, nbd, ncurses, ndisc6, neard, neardal, neon, netperf,
+	netsnmp, nettle, nfacct, ntfs-3g, ofono, olsr,
+	omap-u-boot-utils, openssh, openssl, openswan, openvpn,
+	oprofile, orc, pciutils, pcre, perl, php, poco, polarssl,
+	proftpd, psmisc, pulseaudio, python,
+	python-{bottle,netifaces,serial,setuptools}, qt, quagga,
+	quota, radvd, rpi-userland, rt-tests, sam-ba, samba, sawman,
+	sdl, ser2net, smartmontools, socat, socketcand, speex, squid,
+	stress, stunnel, sudo, syslinux, sysstat, sysvinit, tcl,
+	tcprelay, tinyhttpd, tslib, tvheadend, uboot-tools, ulogd,
+	util-linux, vala, vtun, webkit,
+	xapp_{iceauth,luit,makefontscale,sessreg,setxkbmap,smproxy},
+	xapp_{xauth,xcmsdb,xdpyinfo,xev,xgamma,xhost,xinput,xkbcomp},
+	xapp_{xkbevd,xlsatoms,xlsclients,xmodmap,xpr,xprop,xrandr,xrdb},
+	xapp_{xset,xwd,xwininfo}, xcb-{proto,util},
+	xdriver_xf86-input-{evdev,joystick,keyboard,mouse,synptics},
+	xdriver_xf86-input-{tslib,vmmouse,void},
+	xdriver_xf86-video-{ark,ast,ati,cirrus,dummy,geode,glide,glint},
+	xdriver_xf86-video-{i128,intel,mach64,mga,neomagic,newport},
+	xdriver_xf86-video-{openchrome,r128,savage,siliconmotion,sis},
+	xdriver_xf86-video-{tdfx,trident,vesa,vmware,wsfb}, xenomai,
+	xfont, xinetd, xkeyboard-config, xlib_lib{FS,ICE,SM,X11},
+	xlib_libX{scrnSaver,au,aw,cursor,dmcp,ext,fixes,font,ft,i},
+	xlib_libX{inerama,mu,pm,randr,res,tst,v,vMC,xf86dga,xf86vm},
+	xlib_lib{dmx,fontenc,pciaccess,xkbfile}, xlib_xtrans,
+	xproto_{applevm,bigreqs,dri2,fonts,gl,input,kbd,record}proto,
+	xproto_{resource,scrnsaver,xcmisc,xext,x}proto,
+	xserver_xorg-server, xutil_makedepend, xz, zeromq
+
+	New packages: aircrack-ng, bcusdk, crda, cryptodev-linux,
+	cppzmq, czmq, dtach, enscript, exfat, exfat-utils, f2fs-tools,
+	fan-ctrl, filemq, foomatic-filters, genimage, genpart, glibmm,
+	gnuplot, gtest, gutenprint, hplip, iozone, jansson, jhead,
+	jquery-keyboard, jquery-ui, jquery-ui-themes, json-glib,
+	json-javascript, lcms2, libpfm4, libpthsem, libserial,
+	libsigsegv, libtasn1, libwebsockets, libxkbcommon, libxml++,
+	linknx, log4cxx, mongoose, mongrel2, mtools, ne10, nmap,
+	nodejs, openobex, openpgm, poppler, protobuf-c,
+	python-m2crypto, python-thrift, qjson, qt5base,
+	qt5declarative, qt5graphicaleffects, qt5imageformats,
+	qt5jsbackend, qt5multimedia, qt5quick1, qt5script, qt5svg,
+	qt5webkit qt5xmlpatterns, rapidjson, redis, swig, texinfo,
+	tzdata, urg, ussp-push, wayland, webp, weston, wireless-regdb,
+	wireshark, wvdial, wvstreams, xcb-util-image, xcb-util-wm,
+	xcursor-transparent-theme, zic, zmqpp, zyre
+
+	Removed packages: microperl, ocf-linux, xapp_xinit,
+	xapp_xplsprinters, xapp_xprehashprinterlist,
+	xfont_font-bitstream-speedo,
+	xlib_lib{Xfontcache,XprintAppUtil,XprintUtil,Xp,oldX,xkbui},
+	xproto_{print,xf86rush}proto
+
+	Deprecated packages: vala
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#1291: Add support for Faraday 526 arm processor (fa526)
+	#2683: cups does not install correctly to target
+	#3313: mesa3d fails to build
+	#5186: initramfs/cpio should support lzo compression
+	#5636: agetty - cannot get controlling tty error - need updated...
+	#5906: collectd client headers not exported
+	#5966: bison unnecessarily required as build dependency
+	#6140: --enable-fileinfo not applied for php package
+	#6164: openvpn usage of ip tool from Busybox
+
 2013.02, Released February 28th, 2013:
 
 	Misc manual updates.
