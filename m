From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Nov 2009 00:27:05 +0100
Subject: [Buildroot] New package infrastructure : status
Message-ID: <20091113002705.1e615d6a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'd like to keep the community updated about my work on the new package
infrastructure. For reference, this work is available at :

 http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=package-infrastructure

I'd like to get this ready for the beginning of the next development
cycle, which should open right after the release of 2009.11. So don't
hesitate to raise your questions and comments now.

What's done :

 * A generic package infrastructure is in place, it allows to convert
   non-autotools packages to an infrastructure that greatly simplifies
   the makefiles ;

 * The autotools package infrastructure has been rewritten on top of
   the new generic package infrastructure ;

 * For both infrastructures, target and host packages are handled. When
   the package is named 'foo', the target package is 'foo' (as in the
   past) and the host package is 'host-foo'. The make variables are
   FOO_xxx for the target package and HOST_FOO_xxx for the host
   package. For some variables (version, source, etc.), if HOST_FOO_xxx
   doesn't exist, the infrastructure automatically falls back to
   FOO_xxx ;

 * The icu, udev, zlib, i2c-tools and olsr packages have been rewritten
   on top of the generic package infrastructure ;

 * The autoconf, automake, cairo, libglib2, libtool, pango, atk, dbus,
   directfb, fontconfig, freetype, libxml2, shared-mime-info,
   dbus-glib, expat, gob2, libgtk2, libusb, lzo, m4, pixman,
   xproto_xproto and xutil_makedepend which were manually compiling
   their software for the host are now based on the host capability of
   the autotools package infrastructure.  Basically, all autotools
   packages that were manually building the host package have been
   converted.

 * Something like Gtk + DirectFB for ARM builds correctly.

TODO list :

 * Find a good name instead of PKGTARGETS for the generic
   infrastructure main macro. I'd like to switch to something like
   'genericpkg' and 'autotoolspkg' to make it nicer. Must that involves
   sed'ing all existing autotools packages. Your opinion ?

 * Find a good name for the generic package infrastructure. For the
   moment it's in package/Makefile.package.in. It could be in
   package/Makefile.generic.in (non-disruptive solution). Or, probably
   better, introduce an include/ directory, in which we create
   pkg-generic.mk and pkg-autotools.mk. This include/ directory could
   later include more .mk files that are relevant to Buildroot as a
   whole.

 * Finish the documentation. I've already started documenting the
   generic and autotools infrastructure, though this work is not yet
   available as a commit in my branch.

If you see other issues to solve, don't hesitate.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
