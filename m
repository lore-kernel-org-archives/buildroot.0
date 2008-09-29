From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 29 Sep 2008 14:06:22 +0200
Subject: [Buildroot] xkb.c:2169: relocation truncated to fit
In-Reply-To: <49ED01FC03EE524BB7BB258E8F93BFF32B26FF@bfl-exchange-1.BFL.local>
References: <49ED01FC03EE524BB7BB258E8F93BFF32B26FF@bfl-exchange-1.BFL.local>
Message-ID: <20080929140622.4823d684@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Sep 2008 10:08:59 +0200
"Matuschka, Sebastian" <Sebastian.Matuschka@gcd-solutions.de> wrote:

> 
> I always get this error and don't know what the reason is:
> 

It says so a bit further down.

> Making all in fbdev
> make[4]: Entering directory
> `/atmel/buildrootBT/build_avr32/xserver_xorg-server-1.4.1/hw/kdrive/fbde
> v'
> /bin/sh ../../../libtool --tag=CC   --mode=link
> /atmel/buildrootBT/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gc
> c -Os  -I/atmel/buildrootBT/build_avr32/staging_dir/usr/include
> -I/atmel/buildrootBT/build_avr32/staging_dir/include
> --sysroot=/atmel/buildrootBT/build_avr32/staging_dir/ -isysroot
> /atmel/buildrootBT/build_avr32/staging_dir -msoft-float
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -g
> -O2 -o Xfbdev fbinit.o libfbdev.a -lXfont -lXau -lfontenc -lpixman-1
> -lXdmcp ../../../dix/libdix.la ../../../config/libconfig.a
> ../../../hw/kdrive/src/libkdrive.a ../../../hw/kdrive/linux/liblinux.a
> ../../../fb/libfb.la ../../../mi/libmi.la ../../../xfixes/libxfixes.la
> ../../../Xext/libXext.la ../../../dbe/libdbe.la
> ../../../XTrap/libxtrap.la ../../../record/librecord.la
> ../../../render/librender.la ../../../randr/librandr.la
> ../../../damageext/libdamageext.la ../../../miext/damage/libdamage.la
> ../../../miext/shadow/libshadow.la ../../../Xi/libXi.la
> ../../../xkb/libxkb.la ../../../xkb/libxkbstubs.la
> ../../../composite/libcomposite.la ../../../dix/libxpstubs.la
> ../../../os/libos.la ../../../hw/kdrive/src/libkdrivestubs.a -lXfont
> -lXau -lfontenc -lpixman-1 -lXdmcp    -lm  -lm
> /atmel/buildrootBT/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gc
> c -Os -I/atmel/buildrootBT/build_avr32/staging_dir/usr/include
> -I/atmel/buildrootBT/build_avr32/staging_dir/include
> --sysroot=/atmel/buildrootBT/build_avr32/staging_dir/ -isysroot
> /atmel/buildrootBT/build_avr32/staging_dir -msoft-float
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g
> -O2 -o Xfbdev fbinit.o  libfbdev.a ../../../dix/.libs/libdix.a
> ../../../config/libconfig.a ../../../hw/kdrive/src/libkdrive.a
> ../../../hw/kdrive/linux/liblinux.a ../../../fb/.libs/libfb.a
> ../../../mi/.libs/libmi.a ../../../xfixes/.libs/libxfixes.a
> ../../../Xext/.libs/libXext.a ../../../dbe/.libs/libdbe.a
> ../../../XTrap/.libs/libxtrap.a ../../../record/.libs/librecord.a
> ../../../render/.libs/librender.a ../../../randr/.libs/librandr.a
> ../../../damageext/.libs/libdamageext.a
> ../../../miext/damage/.libs/libdamage.a
> ../../../miext/shadow/.libs/libshadow.a ../../../Xi/.libs/libXi.a
> ../../../xkb/.libs/libxkb.a ../../../xkb/.libs/libxkbstubs.a
> ../../../composite/.libs/libcomposite.a ../../../dix/.libs/libxpstubs.a
> ../../../os/.libs/libos.a ../../../hw/kdrive/src/libkdrivestubs.a
> /atmel/buildrootBT/build_avr32/staging_dir/usr/lib/libXfont.so
> /atmel/buildrootBT/build_avr32/staging_dir/usr/lib/libXau.so
> /atmel/buildrootBT/build_avr32/staging_dir/usr/lib/libfontenc.so
> /atmel/buildrootBT/build_avr32/staging_dir/usr/lib/libpixman-1.so
> /atmel/buildrootBT/build_avr32/staging_dir/usr/lib/libXdmcp.so -lm
> -Wl,--rpath -Wl,/atmel/buildrootBT/build_avr32/staging_dir/usr/lib
> -Wl,--rpath -Wl,/atmel/buildrootBT/build_avr32/staging_dir/usr/lib
> ../../../xkb/.libs/libxkb.a(xkb.o): In function `ProcXkbSetMap':
> /atmel/buildrootBT/build_avr32/xserver_xorg-server-1.4.1/xkb/xkb.c:2169:
> relocation truncated to fit: R_AVR32_9UW_PCREL against `.text'+865c

Here, relocation truncated to fit.

> collect2: ld returned 1 exit status
> make[4]: *** [Xfbdev] Fehler 1
> make[4]: Leaving directory
> `/atmel/buildrootBT/build_avr32/xserver_xorg-server-1.4.1/hw/kdrive/fbde
> v'
> make[3]: *** [all-recursive] Fehler 1
> make[3]: Leaving directory
> `/atmel/buildrootBT/build_avr32/xserver_xorg-server-1.4.1/hw/kdrive'
> make[2]: *** [all-recursive] Fehler 1
> make[2]: Leaving directory
> `/atmel/buildrootBT/build_avr32/xserver_xorg-server-1.4.1/hw'
> make[1]: *** [all-recursive] Fehler 1
> make[1]: Leaving directory
> `/atmel/buildrootBT/build_avr32/xserver_xorg-server-1.4.1'
> 
> Searching the web was not helpful. What can I try to get rid of this
> error?
> I'm using the latest Buildroot. AVR32 ATSTK1002
>

Which snapshot version are you using? And which toolchain does that
snapshot version use?

AFAIK the toolchain built by uclibc.org Buildroot is not that optimal,
I would recommend for now to use the toolchain from Buildroot for
AVR32. Hopefully some bright day in the future the toolchain patches
will be very small so it is easy to use uclibc.org Buildroot.

-- 
Best regards,
Hans-Christian Egtvedt
