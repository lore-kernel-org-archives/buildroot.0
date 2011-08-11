From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Thu, 11 Aug 2011 20:35:41 +0200
Subject: [Buildroot] Trying to package imlib2
Message-ID: <20110811203541.3b238665@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to package the imlib2, which I need as a dependency for wbar
(a small dock app launcher for X)

here's my imlib2.mk :


#############################################################
#
# IMLIB2
#
#############################################################
IMLIB2_VERSION = 1.4.4
IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
IMLIB2_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
IMLIB2_INSTALL_STAGING = YES IMLIB2_INSTALL_TARGET = YES
IMLIB2_DEPENDENCIES = host-pkg-config xlib_libX11 libpng jpeg freetype

$(eval $(call AUTOTARGETS,package,imlib2))



but building fails (at the linking stage apparently) :

...

>>> imlib2 1.4.4 Building
PATH="/home/fred/buildroot/output/host/bin:/home/fred/buildroot/output/host/usr/bin:/home/fred/buildroot/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
PERLLIB="/home/fred/buildroot/output/host/usr/lib/perl"  /usr/bin/make
-j2  -C /home/fred/buildroot/output/build/imlib2-1.4.4/ make[1]:
entrant dans le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4 ? /usr/bin/make
all-recursive make[2]: entrant dans le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4 ? Making all in src
make[3]: entrant dans le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4/src ? Making all in
lib make[4]: entrant dans le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4/src/lib ? make[4]:
Rien ? faire pour ? all ?. make[4]: quittant le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4/src/lib ? Making all
in bin make[4]: entrant dans le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4/src/bin ? CCLD
imlib2_conv CCLD
imlib2_show /home/fred/buildroot/output/host/usr/lib/gcc/i686-unknown-linux-uclibc/4.3.6/../../../../i686-unknown-linux-uclibc/bin/ld:
warning: libc.so.6, needed
by /home/fred/buildroot/output/host/usr/lib/libfreetype.so, not found
(try using -rpath or
-rpath-link) /home/fred/buildroot/output/host/usr/lib/gcc/i686-unknown-linux-uclibc/4.3.6/../../../../i686-unknown-linux-uclibc/bin/ld:
warning: libdl.so.2, needed
by /home/fred/buildroot/output/host/usr/lib/libX11.so, not found (try
using -rpath or
-rpath-link) /home/fred/buildroot/output/host/usr/lib/libfreetype.so:
undefined reference to
`realloc at GLIBC_2.0' /home/fred/buildroot/output/host/usr/lib/libX11.so:
undefined reference to
`pthread_cond_wait at GLIBC_2.3.2' /home/fred/buildroot/output/host/usr/lib/libX11.so:
undefined reference to
`fgets at GLIBC_2.0' /home/fred/buildroot/output/host/usr/lib/libX11.so:
undefined reference to
`inet_pton at GLIBC_2.0' /home/fred/buildroot/output/host/usr/lib/libX11.so:
undefined reference to
`getresuid at GLIBC_2.0' /home/fred/buildroot/output/host/usr/lib/libX11.so:
undefined reference to `pthread_mutex_init at GLIBC_2.0'

...


If a seasoned packager could help :)
Thanks!
