From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 25 Jul 2007 20:56:50 +0200
Subject: [Buildroot] x86 packages
Message-ID: <1185389810.8043.86.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Mon, Jul 23, 2007 at 06:41:06PM +0200, Ulf Samuelsson wrote:
Result so far of full build of x86.

make allyesconfig
make menuconfig
- make generic x86 device
- do not make any generic System Support
- do not make Soekris or EPIA MII


Packets not buildable, but not due to VERSION patch

gcc:		for target not functional
	- Trying to include "gthr-.h" which does not exist.
	sounds like wrong thread libs. Try linuxthreads.old
ccache:		for target not functional
	- Relies on non functional gcc for target.
elf2float:	not functional
alsa-libs:	not functional
mpg123:		not functional	
	OBJECTS contain "\</n>"
	asterisk depends on mpg123
gettext:	not functional
	- Does not build *shared* libaries (libgettext*.so)
	BR2_PREFER_STATIC_LIB?
	libglib2 selects gettext
	dbus-glib selects libglib2
	atk selects libglib2
	pango selects libglib2
	libgtk2 selects pango
	gtk2-engines depends on LIBGTK2
	metacity selects libgtk2
	hal selects DBUS_GLIB
	pango depends on gettext
	===> Looks like fixing gettext should have high priority...
libdaemon	- not functional
	LIBTOOL not defined
	avahi depends on libdaemon
libintl:	not functional
	does not build shared libraries
curl:		not functional
	no longer available on internet
cvs		- not functional
	needs wchar
libxml2-headers:- not functional
	bug in makefile.
	dbus depends on libxml2-headers
libxml2:	- not functional
	need wchar
DirectFB:	- not functional
	Does not build staging_dir/usr/lib/libdirect*
dmalloc:	- not functional
	Requires C++ compiler, not built...
dmraid:		- not functional
	needs GLIBC_2.0
dnsmasq-2.39	- not functional
	undef ref to in6addr_any
fontconfig	- not functional
	Cannot find /lib/libc.so.0
	xorg depends on fontconfig
	cairo depends on xorg
	dillo depends on xorg
	libgtk12 depends on xorg
	metacity depends on xorg
	rdesktop depends on xorg
pcmcia:		- not functional
	Using old Buildroot symbols
	Needs to be configured in the kernel tree
	hostap depends on pcmcia
iperf-2.0.2:		- not functional
	Requires C++ compiler
kexec			- not functional
	Builds bin-to-hex with cross compiler
l2tpd:		- not functional
	Patch l2tpd_0.70-pre20031121-2.1.diff.gz no longer available
cgicc:		- not functional
	Requires C++ compiler
libgcrypt:	- not functional
	Undefined reference to `_gcry_mpih_*`in libgcypt.so
	vpnc depends on libgcrypt
libglib-1.2:	- not functional
	staging_dir/lib/libglib.so does not exist
	dillo selects libglib-1.2
	libgtk12 selects libglib-1.2
libid3tag:	- not functional
	libtool: compile: unable to infer tagged configuration
	libtool: compile: specify a tag with `--tag'
	madplay depends on libid3tag
libmad:	- not functional
	libtool: compile: unable to infer tagged configuration
	libtool: compile: specify a tag with `--tag'
	mplayer depends on libmad
libraw1394:	- not functional
	staging_dir/lib/libraw1394.so does not exist
libungif:	- not functional
	staging_dir/lib/libungif.la does not exist
libusb:		- not functional
	Requires C++ compiler
ltp-testsuite:	- not functional
	pmaptst.c:(.text+0x5c): undefined reference to `pmap_set'
	pmaptst.c:(.text+0xca): undefined reference to `pmap_set'
	pmaptst.c:(.text+0x128): undefined reference to `pmap_unset'
ltrace:		- not functional
	error: ***** gelf.h not found ***** during configure
LVM2:		- not functional
	activate/activate.c: In function '_lv_info':
	activate/activate.c:341: error: storage size of 'dminfo' isn't known
lzma:		- not functional
	Requires C++ compiler
mpatrol:	- not functional
	../../src/memory.c: In function '__mp_memquery':
	../../src/memory.c:769: error: lvalue required as left operand of
assignment
mrouted:	- not functional
	In file included from netinet/ip_mroute.h:7,
                 from defs.h:49,
                 from igmp.c:15:
	/home/ulf/projects/Buildroot/20070720/buildroot/build_i386/staging_dir/usr/include/linux/mroute.h:116:
	error: expected specifier-qualifier-list before '__u32'
netkit:		- not functional
	inetd.o: In function `unregister_rpc':
	inetd.c:(.text+0x6c): undefined reference to `pmap_unset'
	inetd.o: In function `register_rpc':
	inetd.c:(.text+0x120): undefined reference to `pmap_unset'
	inetd.c:(.text+0x138): undefined reference to `pmap_set'
	servtab.o: In function `loadconfigent':
netplug:	- not functional
	netlink.c: In function 'netlink_open':
	netlink.c:289: warning: pointer targets in passing argument 3 of
	'getsockname' differ in signedness
nfs-utils:	- not functional
	/libnfs.a ../../support/misc/libmisc.a -lnsl
	mountd-mountd.o: In function `unregister_services':	
	mountd.c:(.text+0xcb): undefined reference to `pmap_unset'
	mountd.c:(.text+0xe5): undefined reference to `pmap_unset'
	mountd.c:(.text+0xff): undefined reference to `pmap_unset'
ntp:		- not functional
	Applying ntp-cross-compile.patch using plaintext: 
	patching file ntpdc/Makefile.in
	Hunk #1 FAILED at 157.
	1 out of 1 hunk FAILED -- saving rejects to file 
	Patch failed!  Please fix ntp-cross-compile.patch!
openssh:	- not functional
	In file included from bsd-arc4random.c:17:
	../includes.h:64:47: error: maillock.h: No such file or directory
bsdiff:	- not functional
	bsdiff.c:(.text+0x8d1): undefined reference to `BZ2_bzWriteOpen'
	bsdiff.c:(.text+0xd7e): undefined reference to `BZ2_bzWrite'
	...
pcmcia:	- not functional
	2.5.0 and later kernels require that PCMCIA be configured in the
	    kernel source tree.  To fix, reconfigure and rebuild your
	    kernel with PCMCIA enabled.
portage:	sandbox source not available
qte:	Needs commerical license
qtopia:	Not tested
quagga:		- not functional
	configure: error: --enable-snmp given, 
		but cannot find support for SNMP
	BR2_ENABLE_SNMP must not be given
	In file included from /[snip]/sys-include/linux/rtnetlink.h:8,
                 from ./zebra.h:166,
                 from network.c:24:
	/[snip]/sys-include/linux/neighbour.h:92: error: 
		expected specifier-qualifier-list before '__u64'
ruby:
	can't find header files for ruby.
	error detected by by lib/mkmf.rb
	Need to have ruby-devel installed in "/lib".
	On OpenSuse this installs in "/usr/lib" instead of expected /lib
	srcdir = $(RUBY_DIR)/'.' which is an illegal syntax.

rxvt:
	X11 headers not available
	In file included from rxvt.c:2:
	rxvt.h:95:68: error: X11/Intrinsic.h: Does not exist
	rxvt.h:96:28: error: X11/cursorfont.h: Does not exist
SDL		- not functional
	Depends on directFB
tn5250:		- not functional - fixed
	No definition of TRUE/FALSE
	tn5250 built in $(TN5250_DIR)/src/
ttcp:		- not functional
	ttcp.c:(.text+0x10ad): undefined reference to `bcopy'
syslinux:	- not functional	
	- no NASM, gas does not accept -O99
pxelinux:	- not functional
valgrind:
	valgrind-3.2.3/none/vgskin_none.so does not exist


Best Regards
Ulf Samuelsson
