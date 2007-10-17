From: Leonid <Leonid@a-k-a.net>
Date: Tue, 16 Oct 2007 20:04:52 -0700
Subject: [Buildroot] Matchbox compilation failure for Atmel ARM CPU.
In-Reply-To: <20071017012240.GA27413@cloud.net.au>
References: <20071015020450.GA1526@cloud.net.au>
	<20071017012240.GA27413@cloud.net.au>
Message-ID: <406A31B117F2734987636D6CCC93EE3C02579F1D@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Ulf:

I have managed to create working filesystem for at91rm9200 based board,
compiled by reasonably new buildroot of 9/24/2007. Minimal ramdisk is
very small (~600K zipped, ~4M unzipped). There is some discrepancy in
thttpd configuration, but this is peanuts.

Now I started to compile matchbox (X windows manager). It got
successfully through all X11 stuff, but fails on libmatchbox itself:

make[4]: Entering directory
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9/tests'
if /opt/brootX/arm-gcc-uclibc/bin/arm-linux-gcc -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include -DHAVE_CONFIG_H -I. -I.
-I..  -I../libmb -g -Wall -fno-strict-aliasing
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include/li
bpng12     -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-MT dump-image.o -MD -MP -MF ".deps/dump-image.Tpo" -c -o dump-image.o
dump-image.c; \
        then mv -f ".deps/dump-image.Tpo" ".deps/dump-image.Po"; else rm
-f ".deps/dump-image.Tpo"; exit 1; fi
/bin/sh ../libtool --tag=CC --mode=link
/opt/brootX/arm-gcc-uclibc/bin/arm-linux-gcc -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include  -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-L../libmb -lmb
-L/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/lib -o
dump-image  dump-image.o
mkdir .libs
/opt/brootX/arm-gcc-uclibc/bin/arm-linux-gcc -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include -o
.libs/dump-image dump-image.o
-L/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libma
tchbox-1.9/libmb
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so
-L/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/lib
-Wl,--rpath
-Wl,/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/lib
dump-image.o: In function `main':
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/tests/dump-image.c:30: undefined reference to `XOpenDisplay'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/tests/dump-image.c:41: undefined reference to `XCloseDisplay'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFreePixmap'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XShmDetach'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XDrawString'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGrabKeyboard'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSync'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XDrawLines'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XMapWindow'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XPending'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to
`XCreateSimpleWindow'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCreateImage'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetForeground'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to
`XGetWindowAttributes'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XResizeWindow'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFreeGC'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCopyArea'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XUngrabServer'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGrabPointer'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGetImage'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XTextWidth'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSendEvent'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFree'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to
`XGetWindowProperty'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetErrorHandler'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XChangeProperty'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XDestroyWindow'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to
`XGetSelectionOwner'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XKeycodeToKeysym'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XParseColor'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to
`XRefreshKeyboardMapping'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XQueryColor'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFreeFont'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XShmCreateImage'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetCommand'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XShmPutImage'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `index'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to
`XSetWindowBackgroundPixmap'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSynchronize'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XShmAttach'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XMaskEvent'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGrabServer'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XLoadQueryFont'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XPeekEvent'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to
`XTranslateCoordinates'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCheckTypedEvent'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XQueryColors'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XInternAtom'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XAllocColor'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetFont'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to
`XShmQueryExtension'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFlush'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCreateWindow'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XNextEvent'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XDrawRectangle'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSelectInput'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGetGeometry'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to
`XSetLineAttributes'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to
`XSetStandardProperties'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XEventsQueued'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XClearWindow'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFillRectangle'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XUngrabKeyboard'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XUngrabPointer'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XPutImage'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCreatePixmap'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCreateGC'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: undefined reference to `XMapRaised'
collect2: ld returned 1 exit status
make[4]: *** [dump-image] Error 1
make[4]: Leaving directory
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9/tests'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9/tests'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9'
make: ***
[/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9/.compiled] Error 2

Looks like some library is not there...

Please advice.

Leonid.
