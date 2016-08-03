From: Atilla Filiz <atilla.filiz@gmail.com>
Date: Wed, 3 Aug 2016 14:26:21 +0200
Subject: [Buildroot] host-autoconf fails to build, no m4
Message-ID: <CACTZKX4SyndFg8SpZRPz9kJ8guNrVnJL_fjkQt5r9r+5Lqm4Og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was trying to build some host packages, which depend on automake and
autoconf, which in turn fail to build.

>>> host-autoconf 2.69 Building
PATH="/home/atilla/hek/buildroot/output/host/bin:/home/atilla/hek/buildroot/output/host/sbin:/home/atilla/hek/buildroot/output/host/usr/bin:/home/atilla/hek/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
PKG_CONFIG="/home/atilla/hek/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/home/atilla/hek/buildroot/output/host/usr/lib/pkgconfig"
/usr/bin/make -j9  -C
/home/atilla/hek/buildroot/output/build/host-autoconf-2.69/
make[1]: Entering directory
'/home/atilla/hek/buildroot/output/build/host-autoconf-2.69'
/usr/bin/make  all-recursive
make[2]: Entering directory
'/home/atilla/hek/buildroot/output/build/host-autoconf-2.69'
Making all in bin
make[3]: Entering directory
'/home/atilla/hek/buildroot/output/build/host-autoconf-2.69/bin'
autom4te_perllibdir='..'/lib AUTOM4TE_CFG='../lib/autom4te.cfg'
../bin/autom4te -B '..'/lib -B '..'/lib         --language M4sh --cache ''
--melt ./autoconf.as -o autoconf.in
autom4te: need GNU m4 1.4 or later:
/home/atilla/hek/buildroot/output/host/usr/bin/m4
Makefile:641: recipe for target 'autoconf.in' failed
make[3]: *** [autoconf.in] Error 1
make[3]: Leaving directory
'/home/atilla/hek/buildroot/output/build/host-autoconf-2.69/bin'
Makefile:357: recipe for target 'all-recursive' failed
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
'/home/atilla/hek/buildroot/output/build/host-autoconf-2.69'
Makefile:292: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory
'/home/atilla/hek/buildroot/output/build/host-autoconf-2.69'
package/pkg-generic.mk:195: recipe for target
'/home/atilla/hek/buildroot/output/build/host-autoconf-2.69/.stamp_built'
failed
make: ***
[/home/atilla/hek/buildroot/output/build/host-autoconf-2.69/.stamp_built]
Error 2


/home/atilla/hek/buildroot/output/host/usr/bin/m4 simply doesn't exist and
apparently the package m4 has been deprecated.

-- 
Atilla Filiz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160803/b6ea87a5/attachment.html>
