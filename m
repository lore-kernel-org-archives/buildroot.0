From: Christopher Reder <creder@digitalcpt.com>
Date: Thu, 24 May 2007 11:49:18 -0500
Subject: [Buildroot] x11r7-matchbox-tslib patch
In-Reply-To: <002801c7986d$10df37f0$6614a8c0@lap>
References: <002801c7986d$10df37f0$6614a8c0@lap>
Message-ID: <1180025358.23904.55.camel@rederlinux.mo.charter.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have applied this patch and enabled the Matchbox Window Manager and am
compiling for ARM.  After doing so, I get the following errors and am
not sure how to resolve them.  There may be a dependency on another
package that is not installed but it is looking for a mb library that
isn't there.  Any guidance on what I could check or if someone else has
done this successfully and could send their config, I could give that a
shot as well.

Thanks
Christopher

                    LibMatchbox 1.9
                  ======================


prefix:                 /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr
        source code location:   .

        Building with Debug:                no
        Building with gcov:                 no
        Building with gprof:                no
        Building unit tests:                no

        Building with Xft:                  no
        Building with Pango:                no
        Building with PNG:                  yes
        Building with JPG:                  yes
        Building with XSettings:            no
        Building with API Documentation:    no


touch /home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/.configured
make -j1
-C /home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9
make[1]: Entering directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9'
make  all-recursive
make[2]: Entering directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9'
Making all in libmb
make[3]: Entering directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb'
if /bin/sh ../libtool --tag=CC
--mode=compile /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I..    -g -Wall -fno-strict-aliasing    -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12    -DDATADIR=\"/usr/share/matchbox\" -Os -pipe  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbmenu.lo -MD -MP -MF ".deps/mbmenu.Tpo" -c -o mbmenu.lo mbmenu.c; \
        then mv -f ".deps/mbmenu.Tpo" ".deps/mbmenu.Plo"; else rm -f
".deps/mbmenu.Tpo"; exit 1; fi
mkdir .libs
 /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I.. -g -Wall -fno-strict-aliasing -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12 -DDATADIR=\"/usr/share/matchbox\" -Os -pipe -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbmenu.lo -MD -MP -MF .deps/mbmenu.Tpo -c mbmenu.c  -fPIC -DPIC -o .libs/mbmenu.o
if /bin/sh ../libtool --tag=CC
--mode=compile /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I..    -g -Wall -fno-strict-aliasing    -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12    -DDATADIR=\"/usr/share/matchbox\" -Os -pipe  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbtray.lo -MD -MP -MF ".deps/mbtray.Tpo" -c -o mbtray.lo mbtray.c; \
        then mv -f ".deps/mbtray.Tpo" ".deps/mbtray.Plo"; else rm -f
".deps/mbtray.Tpo"; exit 1; fi
 /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I.. -g -Wall -fno-strict-aliasing -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12 -DDATADIR=\"/usr/share/matchbox\" -Os -pipe -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbtray.lo -MD -MP -MF .deps/mbtray.Tpo -c mbtray.c  -fPIC -DPIC -o .libs/mbtray.o
if /bin/sh ../libtool --tag=CC
--mode=compile /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I..    -g -Wall -fno-strict-aliasing    -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12    -DDATADIR=\"/usr/share/matchbox\" -Os -pipe  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbdotdesktop.lo -MD -MP -MF ".deps/mbdotdesktop.Tpo" -c -o mbdotdesktop.lo mbdotdesktop.c; \
        then mv -f ".deps/mbdotdesktop.Tpo" ".deps/mbdotdesktop.Plo";
else rm -f ".deps/mbdotdesktop.Tpo"; exit 1; fi
 /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I.. -g -Wall -fno-strict-aliasing -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12 -DDATADIR=\"/usr/share/matchbox\" -Os -pipe -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbdotdesktop.lo -MD -MP -MF .deps/mbdotdesktop.Tpo -c mbdotdesktop.c  -fPIC -DPIC -o .libs/mbdotdesktop.o
if /bin/sh ../libtool --tag=CC
--mode=compile /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I..    -g -Wall -fno-strict-aliasing    -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12    -DDATADIR=\"/usr/share/matchbox\" -Os -pipe  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbpixbuf.lo -MD -MP -MF ".deps/mbpixbuf.Tpo" -c -o mbpixbuf.lo mbpixbuf.c; \
        then mv -f ".deps/mbpixbuf.Tpo" ".deps/mbpixbuf.Plo"; else rm -f
".deps/mbpixbuf.Tpo"; exit 1; fi
 /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I.. -g -Wall -fno-strict-aliasing -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12 -DDATADIR=\"/usr/share/matchbox\" -Os -pipe -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbpixbuf.lo -MD -MP -MF .deps/mbpixbuf.Tpo -c mbpixbuf.c  -fPIC -DPIC -o .libs/mbpixbuf.o
mbpixbuf.c: In function '_load_jpg_file':
mbpixbuf.c:153: warning: implicit declaration of function
'mb_want_warnings'
mbpixbuf.c: In function 'mb_pixbuf_img_fill':
mbpixbuf.c:1400: warning: value computed is not used
if /bin/sh ../libtool --tag=CC
--mode=compile /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I..    -g -Wall -fno-strict-aliasing    -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12    -DDATADIR=\"/usr/share/matchbox\" -Os -pipe  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbutil.lo -MD -MP -MF ".deps/mbutil.Tpo" -c -o mbutil.lo mbutil.c; \
        then mv -f ".deps/mbutil.Tpo" ".deps/mbutil.Plo"; else rm -f
".deps/mbutil.Tpo"; exit 1; fi
 /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I.. -g -Wall -fno-strict-aliasing -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12 -DDATADIR=\"/usr/share/matchbox\" -Os -pipe -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbutil.lo -MD -MP -MF .deps/mbutil.Tpo -c mbutil.c  -fPIC -DPIC -o .libs/mbutil.o
mbutil.c: In function 'mb_want_warnings':
mbutil.c:381: warning: control reaches end of non-void function
if /bin/sh ../libtool --tag=CC
--mode=compile /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I..    -g -Wall -fno-strict-aliasing    -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12    -DDATADIR=\"/usr/share/matchbox\" -Os -pipe  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbexp.lo -MD -MP -MF ".deps/mbexp.Tpo" -c -o mbexp.lo mbexp.c; \
        then mv -f ".deps/mbexp.Tpo" ".deps/mbexp.Plo"; else rm -f
".deps/mbexp.Tpo"; exit 1; fi
 /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I.. -g -Wall -fno-strict-aliasing -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12 -DDATADIR=\"/usr/share/matchbox\" -Os -pipe -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT mbexp.lo -MD -MP -MF .deps/mbexp.Tpo -c mbexp.c  -fPIC -DPIC -o .libs/mbexp.o
mbexp.c: In function 'mb_font_get_txt_width':
mbexp.c:858: warning: pointer targets in passing argument 2 of
'XTextWidth' differ in signedness
mbexp.c: In function '_render_some_text':
mbexp.c:1051: warning: pointer targets in passing argument 6 of
'XDrawString' differ in signedness
mbexp.c: In function 'mb_layout_get_geometry':
mbexp.c:1252: warning: value computed is not used
mbexp.c: In function 'mb_util_next_utf8_char':
mbexp.c:1586: warning: value computed is not used
mbexp.c:1592: warning: value computed is not used
if /bin/sh ../libtool --tag=CC
--mode=compile /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I..    -g -Wall -fno-strict-aliasing    -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12    -DDATADIR=\"/usr/share/matchbox\" -Os -pipe  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT hash.lo -MD -MP -MF ".deps/hash.Tpo" -c -o hash.lo hash.c; \
        then mv -f ".deps/hash.Tpo" ".deps/hash.Plo"; else rm -f
".deps/hash.Tpo"; exit 1; fi
 /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I.. -g -Wall -fno-strict-aliasing -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12 -DDATADIR=\"/usr/share/matchbox\" -Os -pipe -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT hash.lo -MD -MP -MF .deps/hash.Tpo -c hash.c  -fPIC -DPIC -o .libs/hash.o
/bin/sh ../libtool --tag=CC
--mode=link /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -g -Wall -fno-strict-aliasing  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12    -DDATADIR=\"/usr/share/matchbox\" -Os -pipe  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include  -L/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/lib -o libmb.la -rpath /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/lib -version-info 1:9:0 mbmenu.lo mbtray.lo mbdotdesktop.lo mbpixbuf.lo mbutil.lo mbexp.lo hash.lo  -ljpeg -L/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/lib -lpng12
/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -shared  .libs/mbmenu.o .libs/mbtray.o .libs/mbdotdesktop.o .libs/mbpixbuf.o .libs/mbutil.o .libs/mbexp.o .libs/hash.o  -Wl,--rpath -Wl,/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/lib -Wl,--rpath -Wl,/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/lib -L/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/lib -ljpeg -L/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/lib /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/lib/libpng12.so  -Wl,-soname -Wl,libmb.so.1 -o .libs/libmb.so.1.0.9
(cd .libs && rm -f libmb.so.1 && ln -s libmb.so.1.0.9 libmb.so.1)
(cd .libs && rm -f libmb.so && ln -s libmb.so.1.0.9 libmb.so)
creating libmb.la
(cd .libs && rm -f libmb.la && ln -s ../libmb.la libmb.la)
make[3]: Leaving directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb'
Making all in doc
make[3]: Entering directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/doc'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/doc'
Making all in tests
make[3]: Entering directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/tests'
Making all in menu
make[4]: Entering directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/tests/menu'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/tests/menu'
make[4]: Entering directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/tests'
if /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I. -I..  -I../libmb -g -Wall -fno-strict-aliasing    -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/include/libpng12     -Os -pipe  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -MT dump-image.o -MD -MP -MF ".deps/dump-image.Tpo" -c -o dump-image.o dump-image.c; \
        then mv -f ".deps/dump-image.Tpo" ".deps/dump-image.Po"; else rm
-f ".deps/dump-image.Tpo"; exit 1; fi
/bin/sh ../libtool --tag=CC
--mode=link /home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc  -Os -pipe  -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -L../libmb -lmb -L/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/lib -o dump-image  dump-image.o
mkdir .libs
/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc -Os -pipe -I/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/include -o .libs/dump-image dump-image.o  -L/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb /home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so -L/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/lib -Wl,--rpath -Wl,/home/christopher/newbuildroot/buildroot/build_arm/staging_dir/usr/lib
dump-image.o: In function `main':
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/tests/dump-image.c:30: undefined reference to `XOpenDisplay'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/tests/dump-image.c:41: undefined reference to `XCloseDisplay'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFreePixmap'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XShmDetach'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XDrawString'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGrabKeyboard'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSync'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XDrawLines'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XMapWindow'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XPending'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCreateSimpleWindow'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCreateImage'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetForeground'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGetWindowAttributes'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XResizeWindow'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFreeGC'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCopyArea'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XUngrabServer'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGrabPointer'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGetImage'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XTextWidth'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSendEvent'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFree'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGetWindowProperty'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetErrorHandler'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XChangeProperty'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XDestroyWindow'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGetSelectionOwner'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XKeycodeToKeysym'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XParseColor'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XRefreshKeyboardMapping'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XQueryColor'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFreeFont'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XShmCreateImage'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetCommand'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XShmPutImage'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetWindowBackgroundPixmap'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSynchronize'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XShmAttach'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XMaskEvent'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGrabServer'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XLoadQueryFont'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XPeekEvent'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XTranslateCoordinates'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCheckTypedEvent'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XQueryColors'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XInternAtom'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XAllocColor'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetFont'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XShmQueryExtension'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFlush'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCreateWindow'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XNextEvent'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XDrawRectangle'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSelectInput'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XGetGeometry'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetLineAttributes'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XSetStandardProperties'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XEventsQueued'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XClearWindow'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XFillRectangle'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XUngrabKeyboard'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XUngrabPointer'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XPutImage'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCreatePixmap'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XCreateGC'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb/.libs/libmb.so: undefined reference to `XMapRaised'
collect2: ld returned 1 exit status
make[4]: *** [dump-image] Error 1
make[4]: Leaving directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/tests'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/tests'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9'
make: ***
[/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/.compiled] Error 2
rederlinux:/home/christopher/newbuildroot/buildroot# m


On Thu, 2007-05-17 at 13:21 +0300, Assen Stoyanov wrote:
> Hello All,
>  
> Please find attached patch that adds to current buildroot:
> - x11r7 libs and kdrive (TinyX) servers
> - tslib (Touchscreen support & utils)
> - matchbox (window manager, panel, desktop, etc...)
>  
> Any remarks and bug-reports are welcome!
>  
> Best Regards,
> Assen Stoyanov
> No virus found in this outgoing message.
> Checked by AVG Free Edition. 
> Version: 7.5.467 / Virus Database: 269.7.1/807 - Release Date: 5/16/2007 6:05 PM
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
