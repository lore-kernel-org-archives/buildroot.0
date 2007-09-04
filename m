From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 04 Sep 2007 20:08:48 +0100
Subject: [Buildroot] libusb compile error
In-Reply-To: <46DD88A5.5070708@carallon.com>
References: <46DD88A5.5070708@carallon.com>
Message-ID: <46DDAD40.1090602@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So I tried to compile libusb with the default buildroot config.

I checked out the latest from svn and the only change I made was to 
enable libusb. This then fails to compile with this error:

/usr/bin/make -j1 -C /home/willw/buildroot/build_i386/libusb-0.1.12
make[1]: Entering directory
`/home/willw/buildroot/build_i386/libusb-0.1.12'
/usr/bin/make  all-recursive
make[2]: Entering directory
`/home/willw/buildroot/build_i386/libusb-0.1.12'
Making all in .
make[3]: Entering directory
`/home/willw/buildroot/build_i386/libusb-0.1.12'
if /bin/sh ./libtool --mode=compile
/home/willw/buildroot/build_i386/libusb-0.1.12/compile
/home/willw/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
-Os -pipe  -I/home/willw/buildroot/build_i386/staging_dir/usr/include
-I/home/willw/buildroot/build_i386/staging_dir/include
--sysroot=/home/willw/buildroot/build_i386/staging_dir/ -isysroot
/home/willw/buildroot/build_i386/staging_dir -mtune=i386 -march=i386
-DHAVE_CONFIG_H   -I.  -Werror  -g -O2 -Wall -MT usb.lo -MD -MP -MF
".deps/usb.Tpo" -c -o usb.lo usb.c; \
         then mv -f ".deps/usb.Tpo" ".deps/usb.Plo"; else rm -f
".deps/usb.Tpo"; exit 1; fi
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
make[3]: *** [usb.lo] Error 1
make[3]: Leaving directory
`/home/willw/buildroot/build_i386/libusb-0.1.12'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/willw/buildroot/build_i386/libusb-0.1.12'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/willw/buildroot/build_i386/libusb-0.1.12'
make: *** [/home/willw/buildroot/build_i386/staging_dir/lib/libusb.so]
Error 2

I have not used libtool before, can anyone tell me if those arguments 
look wrong?

Can anyone else get libusb to compile?

Guess I'll spend tomorrow trying to work out how to set the tag.

Thanks,

Will.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
