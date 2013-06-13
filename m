From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 13 Jun 2013 14:25:08 +0200
Subject: [Buildroot] [PATCH] freetype: fix includedir
In-Reply-To: <51B99EB9.8010401@zacarias.com.ar>
References: <1371094112-7523-1-git-send-email-gustavo@zacarias.com.ar>
 <51B961CA.6080405@mind.be> <51B99EB9.8010401@zacarias.com.ar>
Message-ID: <85DF08ABE4C642EE983F90E95CB2D93A@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi 

Just saw that it will be fixed.

I bumped into the error while building mplayer

>>> mplayer 1.1 Building
/usr/bin/make -j5 -C /home/buildroot12git/output/build/mplayer-1.1
make[1]: Entering directory `/home/buildroot12git/output/build/mplayer-1.1'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -MD -MP -Wundef  -Wstrict-prototypes
-Wmissing-prototypes -Wdisabled-optimization -Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fno-tree-vectorize -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE64_SOURCE -I. -Iffmpeg -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mfpu=neon -mfloat-abi=softfp -marm    -I/usr/include/freetype2 -c -o command.o
command.c
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -MD -MP -Wundef  -Wstrict-prototypes
-Wmissing-prototypes -Wdisabled-optimization -Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fno-tree-vectorize -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE64_SOURCE -I. -Iffmpeg -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mfpu=neon -mfloat-abi=softfp -marm    -I/usr/include/freetype2 -c -o mplayer.o
mplayer.c
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -MD -MP -Wundef  -Wstrict-prototypes
-Wmissing-prototypes -Wdisabled-optimization -Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fno-tree-vectorize -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE64_SOURCE -I. -Iffmpeg -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mfpu=neon -mfloat-abi=softfp -marm    -I/usr/include/freetype2 -c -o pnm_loader.o
pnm_loader.c
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -MD -MP -Wundef  -Wstrict-prototypes
-Wmissing-prototypes -Wdisabled-optimization -Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fno-tree-vectorize -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE64_SOURCE -I. -Iffmpeg -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mfpu=neon -mfloat-abi=softfp -marm    -I/usr/include/freetype2 -c -o input/input.o
input/input.c
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -MD -MP -Wundef  -Wstrict-prototypes
-Wmissing-prototypes -Wdisabled-optimization -Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fno-tree-vectorize -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE64_SOURCE -I. -Iffmpeg -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mfpu=neon -mfloat-abi=softfp -marm    -I/usr/include/freetype2 -c -o
libao2/ao_mpegpes.o libao2/ao_mpegpes.c
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -MD -MP -Wundef  -Wstrict-prototypes
-Wmissing-prototypes -Wdisabled-optimization -Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fno-tree-vectorize -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE64_SOURCE -I. -Iffmpeg -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mfpu=neon -mfloat-abi=softfp -marm    -I/usr/include/freetype2 -c -o libao2/ao_null.o
libao2/ao_null.c
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -MD -MP -Wundef  -Wstrict-prototypes
-Wmissing-prototypes -Wdisabled-optimization -Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fno-tree-vectorize -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE64_SOURCE -I. -Iffmpeg -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mfpu=neon -mfloat-abi=softfp -marm    -I/usr/include/freetype2 -c -o libao2/ao_pcm.o
libao2/ao_pcm.c
In file included from ./libmpdemux/aviheader.h:26:0,
                 from ./libmpdemux/stheader.h:23,
                 from gui/interface.h:24,
                 from mplayer.c:74:
./mpbswap.h:26:0: warning: "bswap_16" redefined [enabled by default]In file included from libmpdemux/aviheader.h:26:0,
                 from libmpdemux/stheader.h:23,
                 from command.c:29:
./mpbswap.h:26:0: warning: "bswap_16" redefined [enabled by default]

/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/byteswap.h:30:0: note: this is the
location of the previous
definition/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/byteswap.h:30:0: note: this is
the location of the previous definition

./mpbswap.h:27:0: warning: "bswap_32" redefined [enabled by default]./mpbswap.h:27:0: warning: "bswap_32" redefined [enabled by
default]

/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/byteswap.h:33:0: note: this is the
location of the previous
definition/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/byteswap.h:33:0: note: this is
the location of the previous definition

In file included from sub/font_load.h:25:0,
                 from mplayer.c:87:
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/ft2build.h:56:38: fatal error:
freetype/config/ftheader.h: No such file or directory
compilation terminated.
make[1]: *** [mplayer.o] Error 1
make[1]: *** Waiting for unfinished jobs....
In file included from libao2/ao_pcm.c:28:0:
./mpbswap.h:26:0: warning: "bswap_16" redefined [enabled by default]
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/byteswap.h:30:0: note: this is the
location of the previous definition
./mpbswap.h:27:0: warning: "bswap_32" redefined [enabled by default]
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/byteswap.h:33:0: note: this is the
location of the previous definition
In file included from sub/font_load.h:25:0,
                 from command.c:41:
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/ft2build.h:56:38: fatal error:
freetype/config/ftheader.h: No such file or directory
compilation terminated.
make[1]: *** [command.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1'
make: *** [/home/buildroot12git/output/build/mplayer-1.1/.stamp_built] Error 2

Regards , Johan


-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Gustavo Zacarias
Verzonden: donderdag 13 juni 2013 12:28
Aan: Arnout Vandecappelle
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH] freetype: fix includedir

On 06/13/2013 03:08 AM, Arnout Vandecappelle wrote:
>  I think this is the wrong fix.
> 
>  The FREETYPE_CONFIG_SCRIPTS approach doesn't work in this case 
> because this script doesn't use ${prefix} in front of it's includedir. 
> I think the better fix is to use a custom POST_INSTALL_STAGING_HOOK 
> that sets
> SYSROOT=$(STAGING_DIR) at the beginning of the script.
> 
>  The .pc file should be handled by our modified pkg-config.
> 
>  Regards,
>  Arnout

I've actually mentioned the pkgconfig file because of late fixing / killing time, so as you said it really doesn't matter, it's
handled elsewhere.
Setting SYSROOT at the beginning of the script is wrong too IMHO, it's very unconventional, we should just revert it back to the
tried and tested way that every other -config script works fine with:

includedir="${prefix}/include"
libdir="${exec_prefix}/lib"

I'll spin a V2.
Regards.

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
