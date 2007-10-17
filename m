From: Leonid <Leonid@a-k-a.net>
Date: Wed, 17 Oct 2007 07:41:31 -0700
Subject: [Buildroot] x11r7-matchbox-tslib patch
In-Reply-To: <406A31B117F2734987636D6CCC93EE3C02528F8C@ehost011-3.exch011.intermedia.net>
References: <2825817.260931192589489912.JavaMail.nabble@isper.nabble.com>
	<003101c810a2$4c0e96b0$7a01000a@softalap>
	<406A31B117F2734987636D6CCC93EE3C02528F8C@ehost011-3.exch011.intermedia.net>
Message-ID: <406A31B117F2734987636D6CCC93EE3C02528F8F@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually I have all libraries installed in STAGING directory and all
these references are present. However it looks like certain -lX...
options are missed. I tried to play adding them here and there but to no
avail. What is correct place to add new libraries in matchbox
compilation?

Thanks,

Leonid.

-----Original Message-----
From: Leonid 
Sent: Wednesday, October 17, 2007 5:23 AM
To: 'softa at ttechgroup.com'
Cc: buildroot at uclibc.org
Subject: RE: x11r7-matchbox-tslib patch

Hi, Softa:

Thank you for the suggestion, compilation went further indeed. Now it
fails in different place, some references are undefined again:

opt/brootX/arm-gcc-uclibc/bin/arm-linux-gcc -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include  -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-L/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/lib -o
matchbox-remote  matchbox-remote.o
matchbox-remote.o: In function `send_input_manager_request':
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:182: undefined reference to
`XInternAtom'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:197: undefined reference to
`XSendEvent'
matchbox-remote.o: In function `mbcommand':
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:130: undefined reference to
`XInternAtom'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:136: undefined reference to
`XInternAtom'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:137: undefined reference to
`XChangeProperty'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:144: undefined reference to
`XGetSelectionOwner'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:160: undefined reference to
`XInternAtom'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:170: undefined reference to
`XSendEvent'
matchbox-remote.o: In function `main':
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:235: undefined reference to
`XOpenDisplay'
matchbox-remote.o: In function `getRootProperty':
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:63: undefined reference to
`XInternAtom'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:69: undefined reference to
`XGetWindowProperty'
matchbox-remote.o: In function `mbpanelcommand':
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:95: undefined reference to
`XInternAtom'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:96: undefined reference to
`XInternAtom'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:100: undefined reference to
`XGetSelectionOwner'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:111: undefined reference to
`XSendEvent'
matchbox-remote.o: In function `main':
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:303: undefined reference to
`XSync'
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchbo
x-window-manager-1.2/src/matchbox-remote.c:304: undefined reference to
`XCloseDisplay'
collect2: ld returned 1 exit status
make[3]: *** [matchbox-remote] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchb
ox-window-manager-1.2/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchb
ox-window-manager-1.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchb
ox-window-manager-1.2'
make: ***
[/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/matchb
ox-window-manager-1.2/.compiled] Error 2

Looks like some library is not there...

Thanks,

Leonid.

-----Original Message-----
From: softa@ttechgroup.com [mailto:softa at ttechgroup.com] 
Sent: Wednesday, October 17, 2007 2:44 AM
To: Leonid
Cc: buildroot at uclibc.org
Subject: Re: x11r7-matchbox-tslib patch

Hi Leonid, try to disable building of test and docs subdir!

the easiest way is to edit /libmatchbox-1.9/Makefile.am, remove the test
and 
docs subdir. generate automake files, reconfigure ....

or add this line:
$(SED) 's:^SUBDIRS = libmb doc tests.*:SUBDIRS = libmb:g' 
$(MATCHBOX_LIB_DIR)/Makefile

at the end of configure target in /package/matchbox.mk file:

here it is (part of my matchbox.mk):
...
$(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked
        (cd $(MATCHBOX_LIB_DIR); \
        $(TARGET_CONFIGURE_OPTS) \
        CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include
-I$(STAGING_DIR)/usr/include/freetype2" 
\
        LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
        PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
        ./configure \
        --target=$(GNU_TARGET_NAME) \
        --host=$(GNU_TARGET_NAME) \
        --build=$(GNU_HOST_NAME) \
        --disable-static \
        --prefix=$(STAGING_DIR)/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --datadir=/usr/share/matchbox \
        --libdir=$(STAGING_DIR)/usr/lib \
        --includedir=$(STAGING_DIR)/usr/include \
        --enable-expat \
        --disable-doxygen-docs \
        --with-expat-includes=$(STAGING_DIR)/usr/include \
        --with-expat-lib=$(STAGING_DIR)/usr/lib \
        --with-x \
        --x-includes=$(STAGING_DIR)/usr/include \
        --x-libraries=$(STAGING_DIR)/usr/lib \
        $(MATCHBOX_LIB_OPTS) \
        );
        $(SED) 's:^SUBDIRS = libmb doc tests.*:SUBDIRS = libmb:g' 
$(MATCHBOX_LIB_DIR)/Makefile
        touch $(MATCHBOX_LIB_DIR)/.configured
...

clean, reconfigure, .... and everything will be ok!
(dont forget to delete .configured marker file)

Best Regards,
Assen


----- Original Message ----- 
From: <Leonid@a-k-a.net>
To: <softa@ttechgroup.com>
Sent: Wednesday, October 17, 2007 5:51 AM
Subject: x11r7-matchbox-tslib patch


> Hi, Softa:
>
> I am using buildroot snapshot of 9/24/07 with (I hope) your patch in.
I 
> have the following failure during libmatchbox compilation:
>
> /home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-MT 
> dump-image.o -MD -MP -MF ".deps/dump-image.Tpo" -c -o dump-image.o 
> dump-image.c; \
>        then mv -f ".deps/dump-image.Tpo" ".deps/dump-image.Po"; else
rm -f 
> ".deps/dump-image.Tpo"; exit 1; fi
> /bin/sh ../libtool --tag=CC --mode=link 
> /opt/brootX/arm-gcc-uclibc/bin/arm-linux-gcc -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include 
>  -I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include 
>   -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include 
>  -I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include 
>  -I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-L../libmb 
>  -lmb
-L/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/lib -o 
> dump-image  dump-image.o
> mkdir .libs
> /opt/brootX/arm-gcc-uclibc/bin/arm-linux-gcc -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include 
>  -I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include 
>  -Os -pipe
-I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/include 
>  -I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-I/opt/brootX/arm-gcc-uclibc/arm-linux/include 
>  -I/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/include
-o 
> .libs/dump-image 
> ump-image.o
-L/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libma
tchbox-1.9/libmb 
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so 
>  -L/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/lib
-Wl,--rpath 
>  -Wl,/home/leonid/xwin/software/linux/rootfs/buildroot/stage/usr/lib
> dump-image.o: In function `main':
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/tests/dump-image.c:30: 
> undefined reference to `XOpenDisplay'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/tests/dump-image.c:41: 
> undefined reference to `XCloseDisplay'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XFreePixmap'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XShmDetach'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XDrawString'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XGrabKeyboard'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSync'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XDrawLines'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XMapWindow'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XPending'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XCreateSimpleWindow'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XCreateImage'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSetForeground'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XGetWindowAttributes'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XResizeWindow'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XFreeGC'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XCopyArea'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XUngrabServer'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XGrabPointer'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XGetImage'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XTextWidth'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSendEvent'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XFree'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XGetWindowProperty'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSetErrorHandler'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XChangeProperty'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XDestroyWindow'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XGetSelectionOwner'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XKeycodeToKeysym'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XParseColor'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XRefreshKeyboardMapping'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XQueryColor'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XFreeFont'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XShmCreateImage'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSetCommand'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XShmPutImage'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `index'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSetWindowBackgroundPixmap'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSynchronize'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XShmAttach'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XMaskEvent'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XGrabServer'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XLoadQueryFont'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XPeekEvent'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XTranslateCoordinates'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XCheckTypedEvent'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XQueryColors'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XInternAtom'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XAllocColor'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSetFont'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XShmQueryExtension'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XFlush'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XCreateWindow'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XNextEvent'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XDrawRectangle'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSelectInput'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XGetGeometry'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSetLineAttributes'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XSetStandardProperties'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XEventsQueued'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XClearWindow'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XFillRectangle'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XUngrabKeyboard'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XUngrabPointer'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XPutImage'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XCreatePixmap'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XCreateGC'
>
/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmatc
hbox-1.9/libmb/.libs/libmb.so: 
> undefined reference to `XMapRaised'
> collect2: ld returned 1 exit status
> make[4]: *** [dump-image] Error 1
> make[4]: Leaving directory 
>
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9/tests'
> make[3]: *** [all-recursive] Error 1
> make[3]: Leaving directory 
>
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9/tests'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory 
>
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory 
>
`/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9'
> make: *** 
>
[/home/leonid/xwin/software/linux/rootfs/buildroot/build_arm_xwin/libmat
chbox-1.9/.compiled] 
> Error 2
>
> Can you advise something?
>
> Thanks,
>
> Leonid.
> softa wrote:
>>
>> Hello All,
>>
>> Please find attached patch that adds to current buildroot:
>> - x11r7 libs and kdrive (TinyX) servers
>> - tslib (Touchscreen support & utils)
>> - matchbox (window manager, panel, desktop, etc...)
>>
>> Any remarks and bug-reports are welcome!
>>
>> Best Regards,
>> Assen Stoyanov
>>
>> No virus found in this outgoing message.
>> Checked by AVG Free Edition.
>> Version: 7.5.467 / Virus Database: 269.7.1/807 - Release Date:
5/16/2007
>> 6:05 PM
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
> Quoted from:
>
http://www.nabble.com/x11r7-matchbox-tslib-patch-tf3770960.html#a1066146
3
> 
