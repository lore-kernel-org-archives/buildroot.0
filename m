From: Emil =?ISO-8859-1?Q?Kr=FCper?= <e.krueper@solcon-systemtechnik.de>
Date: Tue, 21 Aug 2007 18:08:25 +0200
Subject: [Buildroot] Error with libusb-0.1.12
Message-ID: <1187712505.10375.19.camel@PC-EK.Solcon>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hej!
Builtroot stops building with an error, I tried several different
snapshots from July to August and all break with complaining about
libtool and unrecognized option `-DHAVE_CONFIG_H'.
It happens even when I build an almost clean config with the only change
to libusb enabled. Then I tried the same with 386. No difference, same
fault.

Best regards,

Emil Kr?per


(cd .libs && rm -f libusb.so && ln -s libusb-0.1.so.4.4.4 libusb.so)
/home/buildroot/buildroot-20070821/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ar cru .libs/libusb.a  usb.o error.o descriptors.o linux.o
/home/buildroot/buildroot-20070821/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ranlib .libs/libusb.a
creating libusb.la
(cd .libs && rm -f libusb.la && ln -s ../libusb.la libusb.la)
if /bin/sh ./libtool --mode=compile  -DHAVE_CONFIG_H   -I.   -g -O2 -MT
usbpp.lo -MD -MP -MF ".deps/usbpp.Tpo" -c -o usbpp.lo usbpp.cpp; \
        then mv -f ".deps/usbpp.Tpo" ".deps/usbpp.Plo"; else rm -f
".deps/usbpp.Tpo"; exit 1; fi
libtool: unrecognized option `-DHAVE_CONFIG_H'
Try `libtool --help' for more information.
make[3]: *** [usbpp.lo] Error 1
make[3]: Leaving directory
`/home/buildroot/buildroot-20070821/build_i586/libusb-0.1.12'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/buildroot/buildroot-20070821/build_i586/libusb-0.1.12'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/buildroot/buildroot-20070821/build_i586/libusb-0.1.12'
make: ***
[/home/buildroot/buildroot-20070821/build_i586/staging_dir/lib/libusb.so] Error 2


PC-EK:/home/buildroot/buildroot-20070821# 
