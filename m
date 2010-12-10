From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 10 Dec 2010 13:29:18 -0500
Subject: [Buildroot] host-ncurses: cannot find -lstdc++
In-Reply-To: <1292003086.27164.12.camel@dubciaranr0.verifone.com>
References: <1292003086.27164.12.camel@dubciaranr0.verifone.com>
Message-ID: <AANLkTinbFX4PnSW5KsJ+Nog2y9jenymiUU7X-t7gQmcB@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 10, 2010 at 12:44 PM, Quotient Remainder wrote:
> ? ? ? ?make[2]: Entering directory `/home/qvr/obair/community/buildroot/output/build/host-ncurses-5.7/c++'
> ? ? ? ?/usr/lib64/ccache/g++ ?-o demo ../objects/demo.o -L../lib -lncurses++ -static -L../lib -lform -lmenu -lpanel -lncurses ?-dynamic ?-L/home/qvr/obair/community/buildroot/output/host/lib -L/home/qvr/obair/community/buildroot/output/host/usr/lib -Wl,-rpath,/home/qvr/obair/community/buildroot/output/host/usr/lib ?-I../c++ -I../include -I. -DHAVE_CONFIG_H -I. -I../include ?-D_GNU_SOURCE -DNDEBUG -I/home/qvr/obair/community/buildroot/output/host/usr/include/ncurses -I/home/qvr/obair/community/buildroot/output/host/include -I/home/qvr/obair/community/buildroot/output/host/usr/include
> ? ? ? ?/usr/bin/ld: cannot find -lstdc++
> ? ? ? ?collect2: ld returned 1 exit status
> ? ? ? ?make[2]: *** [demo] Error 1

i see no value in building the demos for the host.  if you're after
the helper binaries (like `tic`), then build only the few tools you
actually need.

along those lines, last time i looked, the ncurses build system does
not automatically build up a local `tic` to generate terminfo files.
which means BR' ncurses.mk should be doing this already.  otherwise
you can hit random problems with using the host `tic` which can be a
different version from the one you're cross-compiling.
-mike
