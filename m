From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 18:41:06 +0200
Subject: [Buildroot] x86 build
Message-ID: <1185208866.21840.54.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Result so far of full build of x86.

make allyesconfig
make menuconfig
- make generic x86 device
- do not make any generic System Support
- do not make Soekris or EPIA MII


Packets not buildable, but not due to VERSION patch

gcc:		for target not functional
	- Trying to include "gthr-.h" which does not exist.
ccache:		for target not functional
	- Relies on non functional gcc for target.
elf2float:	not functional
alsa-libs:	not functional
mpg123:		not functional	
	OBJECTS contain "\</n>"
	asterisk depends on mpg123
gettext:	not functional
	- Does not build *shared* libaries (libgettext*.so)
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

So far no problem depends on VERSION patch

Best Regards
Ulf Samuelsson
