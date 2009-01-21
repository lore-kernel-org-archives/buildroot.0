From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 21 Jan 2009 18:52:53 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <87wscosv1f.fsf@macbook.be.48ers.dk>
References: <1232523725.11888.11.camel@elrond.atmel.com>
	<87vds9t51h.fsf@macbook.be.48ers.dk>
	<1232538049.11888.16.camel@elrond.atmel.com>
	<87wscosv1f.fsf@macbook.be.48ers.dk>
Message-ID: <1232560373.11888.36.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-21 klockan 13:28 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  >> Thanks, but why? Please use the default versions as that's what we're
>  >> releasing with and what new users will use.
>  >> 
>  >> E.G. binutils 2.29, uclibc 0.9.30, gcc 4.3.2
> 
>  Ulf> I have seen compiler errors with this combination,
>  Ulf> so I want to build with several toolchain versions,
>  Ulf> but it is in the plan.
> 
>  Ulf> I have seen some compiler problems with my combination
>  Ulf> as well...
> 
> Ok, but if we're releasing with that combination (and we should), then
> that's the one we should be spending our time on getting stable, not
> some other combination with other problems.
> 

Most of the packages I have been working on has had
inherent problems which are not compiler related.

My priority is solving these problems.
Anything else I am prepared to wait with
until I have all the important packages 
building with the toolchain mentioned above
or at least understand why they break.

If I have this working, then doing the same with
the release toolchain is just letting the PC
chew for a day.

Changing to Makefile.autotools.in is not hard,
just takes a lot of time.

I am running tests in parallel with the release toolchain
but results have been poor so far.
Boards that build without problems with 4.2.4
break on 4.3.2.

Here is the same with the 4.3.2/bu-2.19/uclib-0.9.30



mk	flex                           OK	
mk	make                           OK	
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
mk	mpatrol                        DISABLED	Needs gdb to build, and
GDB_VERSION is not defined  
mk	oprofile                       FAIL	""
mk	pkgconfig                      OK	
mk	readline                       OK	
mk	valgrind                       DISABLED	x86 specific  
mk	pcre                           OK	
# Other stuff
mk	at                             OK	
mk	beecrypt                       OK	
mk	berkeleydb                     OK	
mk	bsdiff                         OK	
mk	cups                           OK	
mk	customize                      OK	
mk	file                           OK	
mk	gamin                          FAIL	""
mk	icu                            OK	
mk	kexec                          OK	
mk	libconfig                      OK	
mk	libconfuse                     FAIL	""
mk	libdaemon                      OK	
mk	libelf                         OK	
mk	libevent                       OK	
mk	libfloat                       DISABLED	  
mk	libgcrypt                      OK	
mk	libgpg-error                   OK	
mk	libiconv                       DISABLED	  
mk	liblockfile                    OK	
mk	liboil                         OK	
mk	libsysfs                       OK	
mk	lockfile-progs                 OK	
mk	logrotate                      FAIL	""
mk	lsof                           OK	
mk	ltp-testsuite                  DISABLED	  
mk	ltrace                         OK	
mk	ltt                            DISABLED	Obsolete, replaced by ltt-ng 
mk	memstat                        OK	
mk	ng-spice-rework                DISABLED	Depends on X-Windows 
mk	popt                           OK	
mk	screen                         OK	
mk	strace                         OK	
mk	sudo                           OK	
mk	database                       DISABLED	Need to enter subdirectory 
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
mk	hostap                         DISABLED	Depends on PCMCIA support in
kernel 
mk	ifplugd                        OK	
mk	irda-utils                     DISABLED	Makefile is invalid 
mk	iperf                          OK	
mk	iproute2                       OK	
mk	ipsec-tools                    OK	
mk	iptables                       OK	
mk	kismet                         OK	
mk	l2tp                           OK	
mk	libcgi                         OK	
mk	libcgicc                       OK	
mk	libosip2                       OK	
mk	libeXosip2                     FAIL	""
mk	libpcap                        OK	
mk	libupnp                        OK	
mk	links                          OK	
mk	lrzsz                          OK	
mk	mdnsresponder                  OK	
mk	mii-diag                       OK	
mk	mrouted                        OK	
mk	mutt                           FAIL	""
mk	nbd                            OK	
mk	ncftp                          OK	
mk	neon                           OK	
mk	netkitbase                     OK	
mk	netkittelnet                   OK	
mk	netplug                        OK	
mk	netsnmp                        OK	
mk	nfs-utils                      OK	
mk	ntp                            FAIL	""
mk	olsr                           OK	
mk	ntpd                           OK	
mk	openssh                        FAIL	""
mk	openssl                        OK	
mk	libcurl                        FAIL	""
mk	openvpn                        OK	
mk	openswan                       FAIL	""
mk	portmap                        OK	
mk	pppd                           OK	
mk	rp-pppoe                       OK	
mk	pptp-linux                     OK	
mk	proftpd                        OK	
mk	quagga                         DISABLED	  
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
mk	hal                            FAIL	""
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
mk	pcmcia                         DISABLED	  
mk	raidtools2                     DISABLED	  
mk	setserial                      OK	
mk	smartmontools                  OK	
mk	usbmount                       OK	
mk	usbutils                       OK	
mk	wipe                           OK	
mk	xfsprogs                       DISABLED	  
# Interpreter languages / Scripting
mk	lua                            OK	
mk	microperl                      FAIL	""
mk	python                         OK	
mk	ruby                           FAIL	""
mk	tcl                            FAIL	""
mk	php                            FAIL	""
# 	text rendering applications
mk	dialog                         OK	
# Audio and video libraries and applications
mk	alsa-lib                       OK	
mk	alsa-utils                     FAIL	""
mk	asterisk                       FAIL	""
mk	aumix                          OK	
mk	gstreamer                      OK	
mk	gst-plugins-base               OK	
mk	gst-plugins-good               FAIL	""
mk	gst-plugins-ugly               OK	
mk	libid3tag                      OK	
mk	libmad                         OK	
mk	libmpd                         OK	
mk	libogg                         OK	
mk	libsndfile                     OK	
mk	libtheora                      FAIL	""
mk	libvorbis                      OK	
mk	madplay                        OK	
mk	mpg123                         FAIL	""
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
mk	directfb                       FAIL	""
mk	directfb-examples              FAIL	""
mk	fbdump                         OK	
mk	linux-fusion                   FAIL	""
mk	imagemagick                    FAIL	""
mk	jpeg                           OK	
mk	libart                         OK	
mk	libpng                         OK	
mk	libungif                       OK	
mk	lite                           FAIL	""
mk	pixman                         OK	
mk	sawman                         FAIL	""
mk	sdl                            FAIL	""
mk	sdl_image                      FAIL	""
mk	sdl_mixer                      FAIL	""
mk	SDL_net                        FAIL	""
mk	sdl_ttf                        FAIL	""
mk	tiff                           OK	
# busybox graphic applications
# --> May be broken in busybox
mk	fbv                            OK	
mk	fbset                          OK	
# other GUIs
mk	qte                            DISABLED	  
mk	qtopia4                        DISABLED	  
# Compressors / decompressors
mk	lzo                            OK	
mk	lzma-host                      OK	
mk	lzma-target                    OK	
mk	zlib                           OK	
# Package managers
mk	ipkg                           OK	
mk	portage                        DISABLED	  
# XML handling
mk	expat                          OK	
mk	ezxml                          OK	
mk	libxml2                        OK	
mk	libxslt                        OK	
mk	xerces                         OK	
mk	java                           DISABLED	  
mk	games                          DISABLED	  
mk	u-boot                         FAIL	""




BR
Ulf Samuelsson
