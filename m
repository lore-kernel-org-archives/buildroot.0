From: John Voltz <john.voltz@gmail.com>
Date: Fri, 16 May 2008 11:29:45 -0400
Subject: [Buildroot] xorg driver building failed
In-Reply-To: <a53deff80805160756j27ff7336w31d90dcbe658024e@mail.gmail.com>
References: <a53deff80805160756j27ff7336w31d90dcbe658024e@mail.gmail.com>
Message-ID: <46a136670805160829r7c0b4b7ch7d4f8b547b5fef48@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You will need to build the xorg modular server, rather than the tinyx/kdrive
server that is configured in buildroot if you want to use the drivers, like
evdev. That would mean that you need to edit package/x11r7/
xserver_xorg-server.mk and change --disable-xorg to --enable-xorg. This of
course will only work for x86 because xorg requires the PCI bus that
embedded devices don't have.

Be aware that building the modular xorg in buildroot is untested, so you are
pretty much on your own with that.

John


On Fri, May 16, 2008 at 10:56 AM, Papa Malick SARR <malicksarr@gmail.com>
wrote:

> When I try to build Buildroot with x11r7.3 support It fails. I get the
> following message. I seem that some headers files
>  are missing to the staging_dir.
>
> Please help
>
>
>
>
> make[3]: entrant dans le r?pertoire ?
> /media/sda7/bme-buildroo/packages/buildroot/build_i686/xdriver_xf86-input-evdev-1.1.2/src
> ?
> if /bin/bash ../libtool --tag=CC --mode=compile
> /media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
> -Os
> -I/media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/include
> -I/media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/include
> --sysroot=/media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/
> -isysroot /media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir
> -mtune=i686 -march=i686 -DHAVE_CONFIG_H -I. -I. -I..    -Wall -g -O2 -I
> -I/media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/include/pixman-1
> -I/media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/include
> -I../src -MT evdev_drv_la-evdev.lo -MD -MP -MF
> ".deps/evdev_drv_la-evdev.Tpo" -c -o evdev_drv_la-evdev.lo `test -f
> 'evdev.c' || echo './'`evdev.c; \
>         then mv -f ".deps/evdev_drv_la-evdev.Tpo"
> ".deps/evdev_drv_la-evdev.Plo"; else rm -f ".deps/evdev_drv_la-evdev.Tpo";
> exit 1; fi
>  /media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
> -Os
> -I/media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/include
> -I/media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/include
> --sysroot=/media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/
> -isysroot /media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir
> -mtune=i686 -march=i686 -DHAVE_CONFIG_H -I. -I. -I.. -Wall -g -O2 -I
> -I/media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/include/pixman-1
> -I/media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/include
> -I../src -MT evdev_drv_la-evdev.lo -MD -MP -MF .deps/evdev_drv_la-evdev.Tpo
> -c evdev.c  -fPIC -DPIC -o .libs/evdev_drv_la-evdev.o
> In file included from evdev.c:57:
> ../config.h:4:25: error: xorg-server.h: No such file or directory
> In file included from evdev.c:66:
> evdev.h:73:24: error: xf86Xinput.h: No such file or directory
> In file included from evdev.h:109,
>                  from evdev.c:66:
> /media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/include/X11/extensions/XKBstr.h:77:
> error: expected specifier-qualifier-list before 'Bool'
> /media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/include/X11/extensions/XKBstr.h:490:
> error: expected specifier-qualifier-list before 'Bool'
> /media/sda7/bme-buildroo/packages/buildroot/build_i686/staging_dir/usr/include/X11/extensions/XKBstr.h:582:
> error: expected specifier-qualifier-list before 'Bool'
> In file included from evdev.c:66:
> evdev.h:183: error: expected specifier-qualifier-list before 'Bool'
> evdev.h:200: error: expected specifier-qualifier-list before 'InputInfoPtr'
> evdev.h:224: error: expected specifier-qualifier-list before
> 'InputDriverPtr'
> evdev.h:234: error: expected '=', ',', ';', 'asm' or '__attribute__' before
> 'evdevStart'
> evdev.h:235: error: expected '=', ',', ';', 'asm' or '__attribute__' before
> 'evdevNewDriver'
> evdev.h:236: error: expected '=', ',', ';', 'asm' or '__attribute__' before
> 'evdevGetBits'
> evdev.h:238: error: expected ')' before 'device'
> evdev.h:239: error: expected ')' before 'device'
> evdev.h:240: error: expected ')' before 'device'
> evdev.h:241: error: expected ')' before 'pInfo'
> evdev.h:242: error: expected ')' before 'pInfo'
> evdev.h:243: error: expected ')' before 'pInfo'
> evdev.h:245: error: expected ')' before 'device'
> evdev.h:246: error: expected ')' before 'device'
> evdev.h:247: error: expected ')' before 'device'
> evdev.h:248: error: expected ')' before 'pInfo'
> evdev.h:249: error: expected ')' before 'pInfo'
> evdev.h:250: error: expected ')' before 'pInfo'
> evdev.h:251: error: expected ')' before 'pInfo'
> evdev.h:253: error: expected ')' before 'device'
> evdev.h:254: error: expected ')' before 'pInfo'
> evdev.h:255: error: expected ')' before 'device'
> evdev.h:256: error: expected ')' before 'device'
> evdev.h:257: error: expected ')' before 'pInfo'
> evdev.c:68:18: error: xf86.h: No such file or directory
> evdev.c:70:24: error: xf86Module.h: No such file or directory
> evdev.c:71:23: error: mipointer.h: No such file or directory
> evdev.c:74:25: error: xf86_OSproc.h: No such file or directory
> evdev.c:81: error: expected ')' before 'pInfo'
> evdev.c:84: error: expected ')' before 'pInfo'
> evdev.c: In function 'EvdevSigioReadInput':
> evdev.c:134: warning: implicit declaration of function 'EvdevReadInput'
> evdev.c:134: error: 'InputInfoPtr' undeclared (first use in this function)
> evdev.c:134: error: (Each undeclared identifier is reported only once
> evdev.c:134: error: for each function it appears in.)
> evdev.c:134: error: expected ')' before 'data'
> evdev.c: At top level:
> evdev.c:138: error: expected ')' before 'device'
> evdev.c:222: error: expected ')' before 'client'
> evdev.c:249: error: expected '=', ',', ';', 'asm' or '__attribute__' before
> 'EvdevNew'
> evdev.c: In function 'EvdevParseBits':
> evdev.c:348: warning: implicit declaration of function 'set_bit'
> evdev.c: At top level:
> evdev.c:379: error: expected '=', ',', ';', 'asm' or '__attribute__' before
> 'EvdevCorePreInit'
> evdev.c:444: error: expected '=', ',', ';', 'asm' or '__attribute__' before
> 'InputDriverRec'
> make[3]: *** [evdev_drv_la-evdev.lo] Erreur 1
> make[3]: quittant le r?pertoire ?
> /media/sda7/bme-buildroo/packages/buildroot/build_i686/xdriver_xf86-input-evdev-1.1.2/src
> ?
> make[2]: *** [all-recursive] Erreur 1
> make[2]: quittant le r?pertoire ?
> /media/sda7/bme-buildroo/packages/buildroot/build_i686/xdriver_xf86-input-evdev-1.1.2
> ?
> make[1]: *** [all] Erreur 2
> make[1]: quittant le r?pertoire ?
> /media/sda7/bme-buildroo/packages/buildroot/build_i686/xdriver_xf86-input-evdev-1.1.2
> ?
> make: ***
> [/media/sda7/bme-buildroo/packages/buildroot/build_i686/xdriver_xf86-input-evdev-1.1.2/.stamp_built]
> Erreur 2
> root at kocc:/media/sda7/bme-buildroo/packages/buildroot#
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080516/3a583a72/attachment.htm 
