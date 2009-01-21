From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 21 Jan 2009 08:42:05 +0100
Subject: [Buildroot] List of working packages for ARM
Message-ID: <1232523725.11888.11.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using gcc-4.2.4, bu-2.18, uclibc-0.9.30
wchar, largefile,ipv6, NWFPE

Not all packages has been tested.
Some key packages that I do not get to build are

libconfuse          "error: 'input' defined but not used"
mutt                "undefined reference to _IO_putc"
ntp                 "error: ?INTERFACE_F_MULTICAST? undeclared "
libcurl             "checking for socklen_t equivalent... unknown"
openswan            "?struct connection? has no member named ?kind?"
hal                 "Compile Error"
microperl           
ruby                
tcl                 
php                 
alsa-utils          "Depends on alsa-lib"
asterisk            
gst-plugins-good    
libtheora           "internal compiler error: Segmentation fault
mpg123              "Depends on python"
festival            
vlc                 
imagemagick         "cannot run test program while cross compiling"




---------------------------------------------
#!/bin/sh
alias mk="scripts/mkpkg"

mkbb	bash
mkbb	bzip2
mkbb	coreutils
mkbb	diffutils
mkbb	findutils

mk	flex                           OK
mkbb	gawk
mkbb	grep
mk	make                           OK	
mkbb	patch
mkbb	sed
mkbb	tar	
# Other development stuff
mk	autoconf                       OK	
mk	automake                       OK	
mk	bison                          OK	
mk	cvs                            OK	
mk	distcc                         OK	
mk	dmalloc                        OK	
mk	fakeroot                       OK	
mk	gettext                        OK	
mk	libgmp                         OK	
mk	gperf                          OK	
mk	libmpfr                        OK	
mk	libtool                        OK	
mk	m4                             OK	
nmk	mpatrol                       DISABLED	
	Needs gdb to build, and GDB_VERSION is not defined  
mk	oprofile                       OK
mk	pkgconfig                      OK	
mk	readline                       OK	
nmk	valgrind                       DISABLED	x86 specific  
mk	pcre                           OK	
# Other stuff
mk	at                             OK	
mk	beecrypt                       OK	
mk	berkeleydb                     OK	
mk	bsdiff                         OK
mk	cups                           OK	
mk	customize                      OK	
mk	file                           OK	
mk	gamin                          OK
mk	icu                            OK	
mk	kexec                          OK	
mk	libconfig                      OK	
mk	libconfuse                     FAIL	"error: 'input' defined but not
used"
mk	libdaemon                      OK	
mk	libelf                         OK	
mk	libevent                       OK	
nmk	libfloat                       DISABLED	  
mk	libgcrypt                      OK	
mk	libgpg-error                   OK	
nmk	libiconv                       DISABLED	  
mk	liblockfile                    OK	
mk	liboil                         OK	
mk	libsysfs                       OK	
mk	lockfile-progs                 OK	
mk	logrotate                      OK	
mk	lsof                           OK	
nmk	ltp-testsuite                  DISABLED	  
mk	ltrace                         OK	
nmk	ltt                            FAIL	"Obsolete"
mk	memstat                        OK	
nmk	ng-spice-rework                FAIL	"Dependent on X-Windows"
mk	popt                           OK	
mk	screen                         OK	
mk	strace                         OK	
mk	sudo                           OK	
nmk	database                       DISABLED	Need to enter subdirectory 
# Networking applications
mk	argus                          OK	
mk	avahi                          OK	
mk	axel                           OK	
mk	bind                           OK	
mk	bridge                         OK	
mk	dnsmasq                        OK	
mk	dropbear                       OK	
mk	ethtool                        OK	
mk	haserl                         OK	
nmk	hostap                         FAIL	"Depends on PCMCIA support in
kernel"
mk	ifplugd                        OK	
nmk	irda-utils                     FAIL	"irda-utils.mk is BROKEN"
mk	iperf                          OK	
mk	iproute2                       OK	
mk	ipsec-tools                    OK	
mk	iptables                       OK	
mk	kismet                         OK
mk	l2tp                           OK	
mk	libcgi                         OK	
mk	libcgicc                       OK	"?sort? not declared: apply patch
from upstream"
mk	libosip2                       OK
mk	libeXosip2                     OK
mk	libpcap                        OK	
mk	libupnp                        OK	
mk	links                          OK	
mk	lrzsz                          OK	
mk	mdnsresponder                  OK	
mk	mii-diag                       OK	
mk	mrouted                        OK	
mk	mutt                           FAIL	"undefined reference to _IO_putc"
mk	nbd                            OK	
mk	ncftp                          OK	
mk	neon                           OK	
mk	netkitbase                     OK	
mk	netkittelnet                   OK	
mk	netplug                        OK	
mk	netsnmp                        OK	
mk	nfs-utils                      OK	
mk	ntp                            FAIL	"error: ?INTERFACE_F_MULTICAST?
undeclared "
mk	olsr                           OK	
mk	ntpd                           OK	
mk	openssh                        OK	
mk	openssl                        OK	
mk	libcurl                        FAIL	"checking for socklen_t
equivalent... unknown"
mk	openvpn                        OK	
mk	openswan                       FAIL	"?struct connection? has no
member named ?kind?"
mk	portmap                        OK	
mk	pppd                           OK	
mk	rp-pppoe                       OK	
mk	pptp-linux                     OK	
mk	proftpd                        OK	
nmk	quagga                         DISABLED	  
mk	rsync                          OK	
mk	samba                          OK	
mk	socat                          OK	
mk	stunnel                        OK	
mk	tcpdump                        OK	
mk	tftpd                          OK	
mk	tn5250                         OK	
mk	ttcp                           OK	
mk	udpcast                        OK	
mk	vpnc                           OK	
mk	vsftpd                         OK	
mk	vtun                           OK	
mk	webif                          OK	
mk	wireless-tools                 OK	
# Hardware handling / blockdevices and filesystem maintenance
mk	acpid                          OK	
mk	dbus                           OK	
mk	dbus-glib                      OK
mk	devmem2                        OK	
mk	dm                             OK	
mk	dmraid                         OK	
mk	e2fsprogs                      OK	
mk	eeprog                         OK	
mk	fconfig                        OK	
mk	fis                            OK	
mk	libfuse                        OK	
mk	gadgetfs-test                  OK	
mk	hal                            FAIL	"Compile Error"
mk	hwdata                         OK	
mk	i2c-tools                      OK	
mk	input-tools                    OK	
mk	iostat                         OK	
mk	libaio                         OK	
mk	libraw1394                     OK	
mk	libusb                         OK	
mk	lm-sensors                     OK	
mk	lvm2                           OK	
mk	mdadm                          OK	
mk	memtester                      OK	
mk	mkdosfs                        OK	
mk	mtd                            OK	
mk	ntfs-3g                        OK	
mk	pciutils                       OK	
nmk	pcmcia                         DISABLED		""
nmk	raidtools2                     DISABLED		""
mk	setserial                      OK	
mk	smartmontools                  OK	
mk	usbmount                       OK	
mk	usbutils                       OK	
mk	wipe                           OK	
nmk	xfsprogs                       DISABLED	  
# Interpreter languages / Scripting
mk	lua                            OK	
mk	microperl                      FAIL	""
mk	python                         OK	"gdbm does not build - need to
disable this module"
mk	ruby                           FAIL	""
mk	tcl                            FAIL	""
mk	php                            FAIL	""
# 	text rendering applications
mk	dialog                         OK	
# Audio and video libraries and applications
mk	alsa-lib                       OK	"Depends on python"
mk	alsa-utils                     FAIL	"Depends on alsa-lib"
mk	asterisk                       FAIL	""
mk	aumix                          OK	
mk	gstreamer                      OK	
mk	gst-plugins-base               OK	
mk	gst-plugins-good               FAIL	""
mk	gst-plugins-ugly               OK	
mk	libid3tag                      OK	
mk	libmad                         OK	""
mk	libmpd                         OK	
mk	libogg                         OK	
mk	libsndfile                     OK	
mk	libtheora                      FAIL	"internal compiler error:
Segmentation fault
"
mk	libvorbis                      OK	
mk	madplay                        OK	"Depends on python"
mk	mpg123                         FAIL	"Depends on python"
						"internal compiler error: Segmentation fault"
mk	mplayer                        OK	
mk	speex                          OK	
mk	festival                       FAIL	""
mk	vlc                            FAIL	""
# Graphic libraries and applications (graphic/text)
# 	text rendering libraries
mk	ncurses                        OK	
mk	newt                           OK	
mk	slang                          OK	
# 	graphic libraries
mk	directfb                       OK	""
mk	directfb-examples              OK	""
mk	fbdump                         OK	
mk	linux-fusion                   OK	""
mk	imagemagick                    FAIL	"cannot run test program while
cross compiling"
mk	jpeg                           OK	
mk	libart                         OK	
mk	libpng                         OK	
mk	libungif                       OK	
mk	lite                           OK	""
mk	pixman                         OK	
mk	sawman                         OK	""
mk	sdl                            OK	""
mk	sdl_image                      OK	""
mk	sdl_mixer                      OK	""
mk	SDL_net                        OK	""
mk	sdl_ttf                        OK	""
mk	tiff                           OK	
# busybox graphic applications
# --> May be broken in busybox
mk	fbv                            OK	
mk	fbset                          OK	
# other GUIs
nmk	qte                            DISABLED	  
nmk	qtopia4                        DISABLED	  
# Compressors / decompressors
mk	lzo                            OK	
mk	lzma-host                      OK	""
mk	lzma-target                    OK	""
mk	zlib                           OK	
# Package managers
mk	ipkg                           OK	
nmk	portage                        DISABLED	  
# XML handling
mk	expat                          OK	
mk	ezxml                          OK	
mk	libxml2                        OK	
mk	libxslt                        OK	
mk	xerces                         OK
nmk	java                           DISABLED	  
nmk	games                          DISABLED	  


mk	u-boot                         OK	
