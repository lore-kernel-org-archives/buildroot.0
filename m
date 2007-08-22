From: Emil =?ISO-8859-1?Q?Kr=FCper?= <e.krueper@solcon-systemtechnik.de>
Date: Wed, 22 Aug 2007 10:18:48 +0200
Subject: [Buildroot] Error with libusb-0.1.12
In-Reply-To: <20070821181730.GB19089@aon.at>
References: <1187712505.10375.19.camel@PC-EK.Solcon>
	<20070821181730.GB19089@aon.at>
Message-ID: <1187770728.10375.29.camel@PC-EK.Solcon>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2007-08-21 at 20:17 +0200, Bernhard Fischer wrote:
> On Tue, Aug 21, 2007 at 06:08:25PM +0200, Emil Kr?per wrote:
> >Hej!
> >Builtroot stops building with an error, I tried several different
> >snapshots from July to August and all break with complaining about
> >libtool and unrecognized option `-DHAVE_CONFIG_H'.
> >It happens even when I build an almost clean config with the only change
> >to libusb enabled. Then I tried the same with 386. No difference, same
> >fault.
> 
> Builds fine for me (>= r19625). Please confirm

At first, my apologies for starting a new thread, I am not that familiar
with the use of mailingslist and hope this one goes where it belongs.
So now I am back at work again and tried building r19625 at my debian
etch x86 box and the only change to the default config was activating
libusb. 

Best regards

Emil Kr?per

And here comes the error:

config.status: creating config.h
config.status: config.h is unchanged
/usr/bin/make  all-recursive
make[2]: Entering directory
`/home/buildroot/buildroot_r19625/build_i386/libusb-0.1.12'
Making all in .
make[3]: Entering directory
`/home/buildroot/buildroot_r19625/build_i386/libusb-0.1.12'
if /bin/sh ./libtool
--mode=compile /home/buildroot/buildroot_r19625/build_i386/libusb-0.1.12/compile /home/buildroot/buildroot_r19625/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -Os -pipe  -I/home/buildroot/buildroot_r19625/build_i386/staging_dir/usr/include -I/home/buildroot/buildroot_r19625/build_i386/staging_dir/include --sysroot=/home/buildroot/buildroot_r19625/build_i386/staging_dir/ -isysroot /home/buildroot/buildroot_r19625/build_i386/staging_dir -mtune=i386 -march=i386 -DHAVE_CONFIG_H   -I.  -Werror  -g -O2 -Wall -MT usb.lo -MD -MP -MF ".deps/usb.Tpo" -c -o usb.lo usb.c; \
        then mv -f ".deps/usb.Tpo" ".deps/usb.Plo"; else rm -f
".deps/usb.Tpo"; exit 1; fi
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
make[3]: *** [usb.lo] Error 1
make[3]: Leaving directory
`/home/buildroot/buildroot_r19625/build_i386/libusb-0.1.12'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/buildroot/buildroot_r19625/build_i386/libusb-0.1.12'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/buildroot/buildroot_r19625/build_i386/libusb-0.1.12'
make: ***
[/home/buildroot/buildroot_r19625/build_i386/staging_dir/lib/libusb.so]
Error 2

real    31m19.975s
user    19m16.216s
sys     3m24.281s
PC-EK:/home/buildroot/buildroot_r19625#
