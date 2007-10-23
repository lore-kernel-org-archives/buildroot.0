From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 23 Oct 2007 17:07:39 -0300
Subject: [Buildroot] undefined _dl_app_init_array and _dl_app_fini_array
In-Reply-To: <00d501c815ad$7f540f40$7b00000a@atmel.com>
References: <d6cda7730710231019j62584447wad7d16559e882275@mail.gmail.com>
	<471E5180.80009@promwad.com>
	<d6cda7730710231154k48e3ef30uac75a10a0b9fa1c8@mail.gmail.com>
	<00d501c815ad$7f540f40$7b00000a@atmel.com>
Message-ID: <d6cda7730710231307g675615f7p1474b668aa88f748@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nope, it wasn't that I had another toochain installed... I'm still
getting that link error after removing the toolchain. Even using the
atngw100-defconfig :(

./libtool --mode=link
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc
-Os -pipe  -I/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/include
-I/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/include
-msoft-float  -o cjpeg cjpeg.lo rdppm.lo rdgif.lo rdtarga.lo rdrle.lo
rdbmp.lo rdswitch.lo cdjpeg.lo libjpeg.la
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc
-Os -pipe -I/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/include
-I/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/include
-msoft-float -o .libs/cjpeg cjpeg.o rdppm.o rdgif.o rdtarga.o rdrle.o
rdbmp.o rdswitch.o cdjpeg.o -Wl,--rpath -Wl,/lib .libs/libjpeg.so
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/lib/libc.so.0:
undefined reference to `_dl_app_init_array'
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/lib/libc.so.0:
undefined reference to `_dl_app_fini_array'
collect2: ld returned 1 exit status
make[1]: *** [cjpeg] Error 1
make[1]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/build_avr32/jpeg-6b'
make: *** [/root/novacomm/buildroot/buildroot-original/build_avr32/jpeg-6b/.libs/libjpeg.a]
Error 2


On 10/23/07, Ulf Samuelsson <ulf@atmel.com> wrote:
> > Hmmm well, I noticed that on my custom package at the linking stage it
> > was for some reason using the avr32 compiler instaled on my system
> > (4.0.99), so I removed that and I'm rebuilding to see what gives....
> > hopefully that's the problem :)
>
> > Strangely, I know I'm not the only one who have noticed that issue...
> > some others have mentioned that at the avrfreaks.com forums.
>
> It is not unlikely that they have the same problem then.
> If you indeed verify this, then pls inform them at the AVRfreaks forum.
>
> Best Regards
> Ulf Samuelsson
>
>
