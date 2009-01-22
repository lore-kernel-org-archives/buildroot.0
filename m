From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Jan 2009 23:10:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090122231013.49B9376724@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-22 23:10:12 +0000 (Thu, 22 Jan 2009)
New Revision: 24976

Log:
Update tester script

Modified:
   trunk/buildroot/scripts/buildall.sh


Changeset:
Modified: trunk/buildroot/scripts/buildall.sh
===================================================================
--- trunk/buildroot/scripts/buildall.sh	2009-01-22 23:09:41 UTC (rev 24975)
+++ trunk/buildroot/scripts/buildall.sh	2009-01-22 23:10:12 UTC (rev 24976)
@@ -1,516 +1,325 @@
 #!/bin/sh
-alias mk="scripts/mkpkg"
+source	"scripts/testheader.inc"
 
-function nmk()
-{
-	printf "mk	%-31s" "$1"
-	if [ "$2X" == "OKX" ] ; then
-		echo "DISABLED	$3 $4"
-	elif [ "$2X" == "FAILX" ] ; then
-		echo "DISABLED	$3 $4"
-	elif [ "$2X" == "BROKENX" ] ; then
-		echo "DISABLED	$3 $4"
-	elif [ "$2X" == "DISABLEDX" ] ; then
-		echo "DISABLED	$3 $4"
-	else
-		echo "DISABLED	$2 $3 $4"
-	fi
-}
+skip	mk	busybox
+bb	mk	bash
+bb	mk	bzip2
+bb	mk	coreutils
+bb	mk	diffutils
+bb	mk	findutils
+EXE	mk	flex                           OK
+bb	mk	gawk
+bb	mk	grep			
+EXE	mk	make                           OK
+comment "# Other development stuff"
+EXE	mk	autoconf                       OK	
+EXE	mk	automake                       OK	
+EXE	mk	bison                          OK	
+EXE	mk	cvs                            OK	
+EXE	mk	distcc                         OK	
+EXE	mk	dmalloc                        OK	
+EXE	mk	fakeroot                       OK	
+EXE	mk	gettext                        OK	
+EXE	mk	libgmp                         OK	
+EXE	mk	gperf                          OK	
+EXE	mk	libmpfr                        OK	
+EXE	mk	libtool                        OK	
+EXE	mk	libiconv                       OK  
+EXE	mk	popt                           FAIL	"undefined reference to libiconv"
+EXE	mk	m4                             OK	
+skip	mk	mpatrol                        DISABLED	"Needs gdb to build, and GDB_VERSION is not defined"
+EXE	mk	oprofile                       FAIL	"popt: undefined reference to libiconv"
+EXE	mk	pkgconfig                      OK	
+EXE	mk	readline                       OK	
+skip	mk	valgrind                       DISABLED	"x86 specific" 
+EXE	mk	pcre                           OK	
+comment "Other stuff"
+EXE	mk	at                             OK	
+EXE	mk	beecrypt                       OK	
+AVR	mk	berkeleydb                     FAIL	"Machine avr32 not recognized"
+EXE	mk	bsdiff                         OK	
+bb	mk	bootutils			?
+EXE	mk	cups                           OK	
+EXE	mk	customize                      OK	
+bb	mk	dash				?
+EXE	mk	file                           OK	
+EXE	mk	gamin                          OK	
+EXE	mk	icu                            FAIL	"No rule to create out"
+AVR	mk	kexec                          FAIL	"Machine avr32 not recognized"
+bb	mk	less
+EXE	mk	libconfig                      OK	
+EXE	mk	libconfuse                     OK	
+EXE	mk	libdaemon                      OK	
+EXE	mk	libelf                         OK	
+AVR	mk	libevent                       FAIL	"Machine avr32 not recognized"
+skip	mk	libfloat                       DISABLED	  
+EXE	mk	libgcrypt                      OK	
+EXE	mk	libgpg-error                   OK	
+EXE	mk	liblockfile                    OK	
+EXE	mk	liboil                         OK	
+EXE	mk	libsysfs                       OK	
+EXE	mk	lockfile-progs                 OK	
+EXE	mk	logrotate                      FAIL	"undefined reference to libiconv"
+EXE	mk	lsof                           OK	
+skip	mk	ltp-testsuite                  DISABLED	  
+AVR	mk	ltrace                         FAIL	"Machine avr32 not recognized"
+skip	mk	ltt                            DISABLED	"Obsolete package ltt-ng"
+EXE	mk	memstat                        OK
+mk	mk	module-init-tools
+mk	mk	modutils
+EXE	mk	ng-spice-rework                FAIL	"Environment change"
+bb	mk	procps
+bb	mk	psmisc
+EXE	mk	screen                         OK	
+EXE	mk	strace                         OK	
+EXE	mk	sudo                           OK	
+bb	mk	sysklogd
+eomment "busybox has init and the runit stuff"
+bb	mk	sysvinit
+bb	mk	tinylogin
+bb	mk	util-linux
+bb	mk	which
+comment "database"
+comment "editors"
+comment "Networking applications"
+AVR	mk	argus                          FAIL	"Machine avr32 not recognized"
+EXE	mk	avahi                          OK	
+EXE	mk	axel                           OK	
+bb	mk	boa
+AVR	mk	bind                           FAIL	"Machine avr32 not recognized"
+EXE	mk	bridge                         OK	
+bb	mk	dhcp
+EXE	mk	dnsmasq                        OK	
+EXE	mk	dropbear                       OK	
+EXE	mk	ethtool                        OK	
+EXE	mk	haserl                         OK	
+skip	mk	hostap                         FAIL	"Needs PCMCIA in kernel"
+EXE	mk	ifplugd                        OK	
+skip	mk	irda-utils                     FAIL	"Makefile is invalid"
+EXE	mk	iperf                          OK	
+EXE	mk	iproute2                       OK	
+EXE	mk	ipsec-tools                    FAIL	"Compile Error"
+EXE	mk	iptables                       OK	
+AVR	mk	kismet                         FAIL	"Machine avr32 not recognized"
+EXE	mk	l2tp                           OK	
+EXE	mk	libcgi                         OK	
+EXE	mk	libcgicc                       OK	
+EXE	mk	libosip2		       FAIL
+AVR	mk	libeXosip2                     FAIL	"Machine avr32 not recognized"
+EXE	mk	libpcap                        OK	
+EXE	mk	libupnp                        OK	
+bb	mk	lighttpd
+EXE	mk	links                          OK	
+EXE	mk	lrzsz                          OK	
+EXE	mk	mdnsresponder                  FAIL	"Unable to recognise the format of the input file build/prod/mdnsd"
+bb	mk	microcom
+EXE	mk	mii-diag                       OK	
+EXE	mk	mrouted                        OK	
+EXE	mk	mutt                           FAIL	"Compile Error"
+EXE	mk	nbd                            OK	
+EXE	mk	ncftp                          OK	
+EXE	mk	neon                           OK	
+bb	mk	netcat
+EXE	mk	netkitbase                     OK	
+EXE	mk	netkittelnet                   OK	
+EXE	mk	netplug                        OK	
+EXE	mk	netsnmp                        OK	
+EXE	mk	nfs-utils                      OK	
+EXE	mk	ntp                            OK	
+EXE	mk	olsr                           OK	
+AVR	mk	ntpd                           FAIL	"Machine avr32 not recognized"
+EXE	mk	openssh                        OK	
+EXE	mk	openssl                        OK	
+EXE	mk	libcurl                        FAIL	"ELF file data encoding not little-endian"
+AVR	mk	openvpn                        FAIL	"Machine avr32 not recognized"
+EXE	mk	openswan                       FAIL	"Compile Error"
+EXE	mk	portmap                        OK	
+EXE	mk	pppd                           OK	
+EXE	mk	rp-pppoe                       OK	
+EXE	mk	pptp-linux                     OK	
+EXE	mk	proftpd                        OK	
+skip	mk	quagga                         DISABLED	  
+EXE	mk	rsync                          FAIL	"error: conflicting types"
+EXE	mk	samba                          OK	
+EXE	mk	socat                          OK	
+AVR	mk	stunnel                        FAIL	"Machine avr32 not recognized"
+EXE	mk	tcpdump                        OK	
+EXE	mk	tftpd                          OK	
+bb	mk	thttpd
+bb	mk	tinyhttpd
+skip	mk	tn5250                         FAIL	""
+EXE	mk	ttcp                           OK	
+bb	mk	udhcp
+EXE	mk	udpcast                        OK	
+EXE	mk	vpnc                           OK	
+EXE	mk	vsftpd                         OK	
+AVR	mk	vtun                           FAIL	"Machine avr32 not recognized"
+EXE	mk	webif                          OK	
+bb	mk	wget
+EXE	mk	wireless-tools                 OK	
+comment "Hardware handling / blockdevices and filesystem maintenance"
+EXE	mk	acpid                          OK	
+EXE	mk	dbus                           OK	
+AVR	mk	dbus-glib                      FAIL	"Machine avr32 not recognized"
+EXE	mk	devmem2                        OK	
+EXE	mk	dm                             OK	
+AVR	mk	dmraid                         FAIL	"Machine avr32 not recognized"
+EXE	mk	e2fsprogs                      OK	
+EXE	mk	eeprog                         OK	
+EXE	mk	fconfig                        OK	
+EXE	mk	fis                            OK	
+EXE	mk	libfuse                        OK	
+EXE	mk	gadgetfs-test                  OK	
+AVR	mk	hal                            FAIL	"Machine avr32 not recognized"
+bb	mk	hdparm
+bb	mk	hotplug
+EXE	mk	hwdata                         OK	
+EXE	mk	i2c-tools                      OK	
+EXE	mk	input-tools                    OK	
+EXE	mk	iostat                         OK	
+EXE	mk	libaio                         OK	
+skip	mk	libraw1394                     
+EXE	mk	libusb                         OK	
+EXE	mk	lm-sensors                     OK	
+EXE	mk	lvm2                           OK	
+EXE	mk	mdadm                          OK	
+EXE	mk	memtester                      OK	
+EXE	mk	mkdosfs                        OK	
+EXE	mk	mtd                            OK	
+AVR	mk	ntfs-3g                        FAIL	"Machine avr32 not recognized"
+EXE	mk	pciutils                       FAIL	"Compile Error"
+skip	mk	pcmcia                         DISABLED	""
+skip	mk	raidtools2                     DISABLED	""
+EXE	mk	setserial                      OK	
+bb	mk	sfdisk
+AVR	mk	smartmontools                  FAIL	"Machine avr32 not recognized"
+EXE	mk	usbmount                       OK	
+EXE	mk	usbutils                       OK	
+EXE	mk	wipe                           OK	
+skip	mk	xfsprogs                       DISABLED	  
+comment "Interpreter languages / Scripting"
+EXE	mk	lua                            OK	
+EXE	mk	microperl                      FAIL	"No rule to create target"
+EXE	mk	python                         OK	
+AVR	mk	ruby                           FAIL	"Machine avr32 not recognized"
+EXE	mk	tcl                            FAIL	"Compile Error"
+EXE	mk	php                            FAIL	"undefined references to acs_map"
+comment "text rendering applications"
+EXE	mk	dialog                         OK	
+comment "Audio and video libraries and applications"
+EXE	mk	alsa-lib                       OK	
+EXE	mk	alsa-utils                     FAIL	"undefined references to acs_map"
+EXE	mk	asterisk                       FAIL	"Patch fails"
+EXE	mk	aumix                          OK	
+EXE	mk	gstreamer                      OK	
+EXE	mk	gst-plugins-base               OK	
+EXE	mk	gst-plugins-good               FAIL	"/usr/lib/libaa.so: could not read symbols: File in wrong format"
+EXE	mk	gst-plugins-ugly               OK	
+EXE	mk	libid3tag                      OK	
+EXE	mk	libmad                         OK	
+EXE	mk	libmpd                         OK	
+EXE	mk	libogg                         OK	
+EXE	mk	libsndfile                     FAIL	"Error: operand out of range (AVR32 specific compile error)"
+EXE	mk	libtheora                      FAIL	"./vp3huff: cannot execute binary file"
+EXE	mk	libvorbis                      OK	
+EXE	mk	madplay                        OK	
+EXE	mk	mpg123                         OK	
+EXE	mk	mplayer                        OK	
+EXE	mk	speex                          OK	
+EXE	mk	festival                       FAIL	"undefined reference to EST_TokenStream"
+EXE	mk	vlc                            FAIL	"configure:Cannot find libmad library."
+comment "Graphic libraries and applications (graphic/text)"
+comment "text rendering libraries"
+EXE	mk	ncurses                        OK	
+EXE	mk	newt                           OK	
+EXE	mk	slang                          OK	
+comment "graphic libraries"
+EXE	mk	directfb                       OK	
+EXE	mk	directfb-examples              OK	
+EXE	mk	fbdump                         OK	
+EXE	mk	linux-fusion                   OK	
+EXE	mk	imagemagick                    FAIL	"cannot run test program while cross compiling"
+EXE	mk	jpeg                           OK	
+EXE	mk	libart                         OK	
+EXE	mk	libpng                         OK	
+EXE	mk	libungif                       OK	
+EXE	mk	lite                           OK	
+EXE	mk	pixman                         OK	
+EXE	mk	sawman                         FAIL	"LDFLAGS has changed since the previous run"
+EXE	mk	sdl                            OK	
+EXE	mk	sdl_image                      OK	
+EXE	mk	sdl_mixer                      OK	
+EXE	mk	SDL_net                        OK	
+EXE	mk	sdl_ttf                        OK	
+EXE	mk	tiff                           OK	
+comment	"busybox graphic applications"
+comment " --> May be broken in busybox"
+EXE	mk	fbv                            OK	
+EXE	mk	fbset                          OK	
+comment "other GUIs"
+SKIP
+EXE	mk	qte                            DISABLED	  
+EXE	mk	qtopia4                        DISABLED	 
+EXE	mk	x11r7 			       DISABLED
+EXE	mk	atk
+EXE	mk	cairo
+EXE	mk	pango
+EXE	mk	libdrm
+EXE	mk	liberation
+EXE	mk	libglade
+EXE	mk	libglib12
+EXE	mk	libglib2
+EXE	mk	libgtk12
+EXE	mk	libgtk2
+EXE	mk	gtk2-engines
+EXE	mk	gtk2-themes
+EXE	mk	libsexy
+EXE	mk	fltk
+EXE	mk	openmotif
+EXE	mk	fontconfig
+EXE	mk	freetype
+EXE	mk	tslib
+EXE	mk	webkit
+skip	startup-notification		"Depends on X11"
+comment	"X Window managers"
+EXE	mk	matchbox
+EXE	mk	metacity
+EXE	mk	blackbox
+comment	"X applications"
+EXE	mk	alsamixergui
+EXE	mk	dillo
+EXE	mk	docker
+EXE	mk	gqview
+EXE	mk	gmpc
+EXE	mk	gtkperf
+EXE	mk	leafpad
+EXE	mk	midori
+EXE	mk	pcmanfm
+EXE	mk	rdesktop
+EXE	mk	rxvt
+EXE	mk	sylpheed
+EXE	mk	synergy
+EXE	mk	torsmo
+EXE	mk	x11vnc
+EXE	mk	xpdf
+EXE	mk	xstroke
+EXE	mk	xvkbd
+RESTART
 
-if	[ ${already-done} == 1 ] ; then
-nmk	busybox
+comment "Compressors / decompressors"
+EXE	mk	lzo                            OK	
+EXE	mk	lzma-host                      OK	
+EXE	mk	lzma-target                    OK	
+EXE	mk	zlib                           OK	
+comment "Package managers"
+EXE	mk	ipkg                           OK	
+EXE	mk	portage                        DISABLED	  
+comment "XML handling"
+EXE	mk	expat                          OK	
+EXE	mk	ezxml                          OK	
+EXE	mk	libxml2                        OK	
+EXE	mk	libxslt                        OK	
+AVR	mk	xerces                         FAIL	"Machine avr32 not recognized"
+skip	mk	java                           DISABLED	  
+skip	mk	games                          DISABLED	  
 
-fi	# ********* already-done
-#**********************************************************************************
-
-# Enable HASERL
-sed -i s/.*BR2_PACKAGE_HASERL.*// .config
-echo "# BR2_PACKAGE_HASERL_VERSION_0_8_X is not set" >> .config
-echo "BR2_PACKAGE_HASERL_VERSION_0_9_X=y" >> .config
-echo "BR2_PACKAGE_HASERL_VERSION=\"0.9.25\"" >> .config
-echo "BR2_PACKAGE_HASERL=y" >> .config
-# Enable SSL
-sed -i s/.*BR2_PACKAGE_OPENSSL.*// .config
-echo "BR2_PACKAGE_OPENSSL=y" >> .config
-# Enable socat
-sed -i s/.*BR2_PACKAGE_SOCAT.*// .config
-echo "BR2_PACKAGE_SOCAT=y" >> .config
-echo "BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT=\"9\"" >> .config
-echo "BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT=\"11\"" >> .config
-echo "BR2_PACKAGE_SOCAT_PREDEF_CSIZE_SHIFT=\"4\"" >> .config
-# Enable Freetype
-sed -i s/.*BR2_PACKAGE_FREETYPE.*// .config
-echo "BR2_PACKAGE_FREETYPE=y" >> .config
-sed -i s/.*BR2_FREETYPE_VERSION.*// .config
-echo "# BR2_FREETYPE_VERSION_2_2_1 is not set" >> .config
-echo "BR2_FREETYPE_VERSION_2_3_7=y" >> .config
-echo "BR2_FREETYPE_VERSION=\"2.3.7\"" >> .config
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	bash
-	mk	bzip2
-	mk	coreutils
-	mk	diffutils
-	mk	findutils
-fi
-
-mk	flex
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	gawk
-fi
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	grep
-fi
-
-mk	make
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	patch
-	mk	sed
-	mk	tar
-fi
-
-echo "# Other development stuff"
-mk	autoconf
-mk	automake
-mk	bison
-
-mk	cvs
-mk	distcc
-mk	dmalloc
-mk	fakeroot
-mk	gettext
-
-
-mk	libgmp
-mk	gperf
-mk	libmpfr
-mk	libtool
-mk	m4
-nmk	mpatrol		"Needs gdb to build, and GDB_VERSION is not defined"
-mk	oprofile
-mk	pkgconfig
-mk	readline
-nmk	valgrind	"x86 specific"
-mk	pcre
-
-echo "# Other stuff"
-mk	at
-mk	beecrypt
-mk	berkeleydb
-mk	bsdiff
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	bootutils
-fi
-
-mk	cups
-mk	customize
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	dash
-fi
-
-mk	file
-mk	gamin
-mk	icu
-mk	kexec
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	less
-fi
-
-mk	libconfig
-mk	libconfuse
-mk	libdaemon
-mk	libelf
-mk	libevent
-nmk	libfloat	# obsolete
-mk	libgcrypt
-mk	libgpg-error
-nmk	libiconv
-mk	liblockfile
-mk	liboil
-mk	libsysfs
-mk	lockfile-progs
-mk	logrotate
-mk	lsof
-nmk	ltp-testsuite
-mk	ltrace
-mk	ltt
-mk	memstat
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	module-init-tools
-	mk	modutils
-fi
-
-mk	ng-spice-rework
-mk	popt
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	procps
-fi
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	psmisc
-fi
-
-mk	screen
-mk	strace
-mk	sudo
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	sysklogd
-# busybox has init and the runit stuff
-	mk	sysvinit
-	mk	tinylogin
-	mk	util-linux
-	mk	which
-fi
-
-nmk	database			BROKEN "Need to enter subdirectory"
-
-if	[ ${busybox-tools} == 1 ] ; then
-	# busybox has an editor
-
-	# text editors
-	mk	editors
-
-fi
-
-
-echo "# Networking applications"
-mk	argus
-mk	avahi
-mk	axel
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	boa
-fi
-
-mk	bind
-mk	bridge
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	dhcp
-fi
-
-mk	dnsmasq
-mk	dropbear
-mk	ethtool
-
-mk	haserl
-mk	hostap
-mk	ifplugd
-mk	irda-utils	"Makefile is invalid"
-mk	iperf
-mk	iproute2
-mk	ipsec-tools
-mk	iptables
-mk	kismet
-mk	l2tp
-mk	libcgi
-mk	libcgicc
-mk	libeXosip2
-mk	libpcap
-mk	libupnp
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	lighttpd
-fi
-
-mk	links
-mk	lrzsz
-mk	mdnsresponder
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	microcom
-fi
-mk	mii-diag
-mk	mrouted
-mk	mutt
-mk	nbd
-mk	ncftp
-mk	neon
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	netcat
-fi
-mk	netkitbase
-mk	netkittelnet
-mk	netplug
-mk	netsnmp
-mk	nfs-utils
-mk	ntp
-mk	olsr
-
-
-
-mk	ntpd
-mk	openssh
-
-mk	openssl
-mk	libcurl
-
-mk	openvpn
-mk	openswan
-mk	portmap
-mk	pppd
-mk	rp-pppoe
-mk	pptp-linux
-
-mk	proftpd
-nmk	quagga
-mk	rsync
-mk	samba
-mk	socat
-mk	stunnel
-mk	tcpdump
-mk	tftpd
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	thttpd
-	mk	tinyhttpd
-fi
-mk	tn5250
-mk	ttcp
-if	[ ${busybox-tools} == 1 ] ; then
-	# ATTENTION! This was merged into busybox!
-	nmk	udhcp
-fi
-mk	udpcast
-mk	vpnc
-mk	vsftpd
-mk	vtun
-mk	webif
-
-mk	libsoup.mk
-mk	gssdp
-mk	gupnp
-mk	gupnp-av
-mk	gupnp-igd
-
-
-
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	wget
-fi
-
-mk	wireless-tools
-
-
-echo "# Hardware handling / blockdevices and filesystem maintenance"
-mk	acpid
-mk	dbus
-mk	dbus-glib
-mk	devmem2
-mk	dm
-mk	dmraid
-mk	e2fsprogs
-mk	eeprog
-mk	fconfig
-mk	fis
-
-mk	libfuse
-mk	gadgetfs-test
-
-
-mk	hal
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	hdparm
-	mk	hotplug
-fi
-mk	hwdata
-mk	i2c-tools
-mk	input-tools
-mk	iostat
-mk	libaio
-mk	libraw1394
-mk	libusb
-mk	lm-sensors
-mk	lvm2
-mk	mdadm
-mk	memtester
-mk	mkdosfs
-mk	mtd
-mk	ntfs-3g
-mk	pciutils
-mk	pcmcia
-mk	raidtools2
-mk	setserial
-if	[ ${busybox-tools} == 1 ] ; then
-	# busybox has fdisk
-	mk	sfdisk
-fi
-mk	smartmontools
-if	[ ${busybox-tools} == 1 ] ; then
-	# mdev
-	mk	udev
-fi
-mk	usbmount
-mk	usbutils
-mk	wipe
-nmk	xfsprogs
-
-echo "# Interpreter languages / Scripting"
-
-mk	lua
-mk	microperl
-mk	python
-mk	ruby
-mk	tcl
-mk	php
-
-echo "# 	text rendering applications"
-mk	dialog
-
-# Audio/Video support
-echo "# Audio and video libraries and applications"
-mk	alsa-lib
-mk	alsa-utils
-mk	asterisk
-mk	aumix
-mk	gstreamer
-mk	gst-plugins-base
-mk	gst-plugins-good
-mk	gst-plugins-ugly
-mk	libid3tag
-mk	libmad
-mk	libmpd
-mk	libogg
-mk	libsndfile
-mk	libtheora
-mk	libvorbis
-mk	madplay
-mk	mpg123
-mk	mplayer
-mk	speex
-mk	festival
-mk	vlc
-
-
-echo "# Graphic libraries and applications (graphic/text)"
-echo "# 	text rendering libraries"
-mk	ncurses
-mk	newt
-mk	slang
-
-
-echo "# 	graphic libraries"
-mk	directfb
-mk	directfb-examples
-mk	fbdump
-mk	linux-fusion
-mk	imagemagick
-mk	jpeg
-mk	libart
-mk	libpng
-mk	libungif
-mk	lite
-mk	pixman
-mk	sawman
-mk	sdl
-mk	sdl_image
-mk	sdl_mixer
-mk	SDL_net
-mk	sdl_ttf
-mk	tiff
-
-echo "# busybox graphic applications"
-echo "# --> May be broken in busybox"
-mk	fbv
-mk	fbset
-
-echo "# other GUIs"
-nmk	qte
-nmk	qtopia4
-
-
-if	[ ${X-WIN} == 1 ] ; then
-
-
-	mk	x11r7
-
-echo "# X libraries and helper libraries"
-echo "# maybe some of these should depend on !BR2_PACKAGE_XSERVER_none"
-mk	atk
-mk	cairo
-mk	pango
-mk	libdrm
-mk	liberation
-mk	libglade
-mk	libglib12
-mk	libglib2
-mk	libgtk12
-mk	libgtk2
-mk	gtk2-engines
-mk	gtk2-themes
-mk	libsexy
-mk	fltk
-mk	openmotif
-mk	fontconfig
-mk	freetype
-mk	tslib
-mk	webkit
-
-nmk	startup-notification		# Depends on X11
-
-echo "# X Window managers"
-mk	matchbox
-mk	metacity
-mk	blackbox
-
-echo "# X applications"
-mk	alsamixergui
-mk	dillo
-mk	docker
-mk	gqview
-mk	gmpc
-mk	gtkperf
-mk	leafpad
-mk	midori
-mk	pcmanfm
-mk	rdesktop
-mk	rxvt
-mk	sylpheed
-mk	synergy
-mk	torsmo
-mk	x11vnc
-mk	xpdf
-mk	xstroke
-mk	xvkbd
-fi
-
-echo "# Compressors / decompressors"
-
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	gzip
-fi
-mk	lzo
-mk	lzma-host
-mk	lzma-target
-mk	zlib
-
-echo "# Package managers"
-
-mk	ipkg
-nmk	portage
-if	[ ${busybox-tools} == 1 ] ; then
-	mk	rpm
-fi
-
-echo "# XML handling"
-
-mk	expat
-mk	ezxml
-mk	libxml2
-mk	libxslt
-mk	xerces
-
-
-
-# java support
-nmk	java
-
-# various games packages
-nmk	games
-
