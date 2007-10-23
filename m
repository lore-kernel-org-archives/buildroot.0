From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 23 Oct 2007 22:54:40 +0300
Subject: [Buildroot] undefined _dl_app_init_array and _dl_app_fini_array
In-Reply-To: <d6cda7730710231019j62584447wad7d16559e882275@mail.gmail.com>
References: <d6cda7730710231019j62584447wad7d16559e882275@mail.gmail.com>
Message-ID: <471E5180.80009@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thiago A. Corr?a wrote:
> Hi,
> 
>    Does anyone knows how to fix this? I get this from libjpeg with
> avr32. I found some threads on uClibc mailling list, related to arm,
> but I don't know what the solution (if any) was. Does arm build it
> correctly?
> 
> Regards,
>     Thiago A. Correa
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

./libtool --mode=link /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -msoft-float  -o cjpeg cjpeg.lo rdppm.lo rdgif.lo rdtarga.lo rdrle.lo rdbmp.lo rdswitch.lo
cdjpeg.lo libjpeg.la
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -msoft-float -o .libs/cjpeg cjpeg.o rdppm.o rdgif.o rdtarga.o rdrle.o rdbmp.o rdswitch.o
cdjpeg.o -Wl,--rpath -Wl,/lib .libs/libjpeg.so


On ARM everything is fine with jpeg.

BR,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
