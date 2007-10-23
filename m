From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 23 Oct 2007 23:17:08 +0300
Subject: [Buildroot] undefined _dl_app_init_array and _dl_app_fini_array
In-Reply-To: <d6cda7730710231154k48e3ef30uac75a10a0b9fa1c8@mail.gmail.com>
References: <d6cda7730710231019j62584447wad7d16559e882275@mail.gmail.com>	
	<471E5180.80009@promwad.com>
	<d6cda7730710231154k48e3ef30uac75a10a0b9fa1c8@mail.gmail.com>
Message-ID: <471E56C4.2090308@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libjpeg is OK for avr32 too:

./libtool --mode=link /opt/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc -Os -pipe  -I/opt/buildroot/build_avr32/staging_dir/usr/include
-I/opt/buildroot/build_avr32/staging_dir/include -msoft-float  -o cjpeg cjpeg.lo rdppm.lo rdgif.lo rdtarga.lo rdrle.lo rdbmp.lo rdswitch.lo cdjpeg.lo libjpeg.la
/opt/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc -Os -pipe -I/opt/buildroot/build_avr32/staging_dir/usr/include -I/opt/buildroot/build_avr32/staging_dir/include -msoft-float -o
.libs/cjpeg cjpeg.o rdppm.o rdgif.o rdtarga.o rdrle.o rdbmp.o rdswitch.o cdjpeg.o -Wl,--rpath -Wl,/lib .libs/libjpeg.so


Thiago A. Corr?a wrote:
> Hmmm well, I noticed that on my custom package at the linking stage it
> was for some reason using the avr32 compiler instaled on my system
> (4.0.99), so I removed that and I'm rebuilding to see what gives....
> hopefully that's the problem :)
> 
> Strangely, I know I'm not the only one who have noticed that issue...
> some others have mentioned that at the avrfreaks.com forums.
> 
> *crosses fingers and waits*
> 
> Regards,
>     Thiago A. Correa
> 

Best regards,
Ivan
-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
