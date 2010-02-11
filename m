From: Tony Mozi <spooflinux@hotmail.fr>
Date: Thu, 11 Feb 2010 18:09:21 +0100
Subject: [Buildroot] install mplayer and libman
Message-ID: <SNT129-W5540E0733692DCE9EA1609B94E0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net







Hi all,

Concerning the context, I do the cross compilation of linux-2.6.22.2 for an ARM9.

I want to install mplayer and libman.
Well, I tick them in the buildroot in :
      Package Selection for the target  --->
      Audio and video libraries and applications  --->
      -*- libmad 
      [*] mplayer

Then, I save it and I run make.

I have these errors.

rm -rf /home/user/Documents/buildroot-2009.11/output/build/buildroot-config
mkdir -p /home/user/Documents/buildroot-2009.11/output/build
cp -dpRf package/config/buildroot-config /home/user/Documents/buildroot-2009.11/output/build/buildroot-config
/usr/bin/make -j1 -C /home/user/Documents/buildroot-2009.11/output/build/MPlayer-1.0rc2
make[1]: entrant dans le r?pertoire ? /home/user/Documents/buildroot-2009.11/output/build/MPlayer-1.0rc2 ?
/home/user/Documents/buildroot-2009.11/output/staging/usr/bin/arm-linux-uclibc-gcc -I./libavcodec -I./libavformat -Wdisabled-optimization -Wno-pointer-sign -Wdeclaration-after-statement -I. -I. -I./libavutil -Os -pipe -Os  -I/home/user/Documents/buildroot-2009.11/output/staging/usr/include -I/home/user/Documents/buildroot-2009.11/output/staging/include --sysroot=/home/user/Documents/buildroot-2009.11/output/staging/ -isysroot /home/user/Documents/buildroot-2009.11/output/staging -mtune=arm922t -march=armv4t -mabi=apcs-gnu -msoft-float  -D_REENTRANT -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DHAVE_CONFIG_H -I/home/user/Documents/buildroot-2009.11/output/staging/usr/include    -c -o mplayer.o mplayer.c
In file included from /home/user/Documents/buildroot-2009.11/output/staging/usr/include/stdio.h:28,
                 from mplayer.c:5:
/home/user/Documents/buildroot-2009.11/output/staging/usr/include/features.h:383:4: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.
In file included from /home/user/Documents/buildroot-2009.11/output/staging/usr/include/stdio.h:72,
                 from mplayer.c:5:
/home/user/Documents/buildroot-2009.11/output/staging/usr/include/bits/uClibc_stdio.h:72:2: error: #error Sorry... uClibc was built without large file support!
In file included from mplayer.c:5:
/home/user/Documents/buildroot-2009.11/output/staging/usr/include/stdio.h:83: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'fpos_t'
In file included from mplayer.c:5:
/home/user/Documents/buildroot-2009.11/output/staging/usr/include/stdio.h:709: error: expected declaration specifiers or '...' before 'fpos_t'
/home/user/Documents/buildroot-2009.11/output/staging/usr/include/stdio.h:711: error: expected ';', ',' or ')' before '*' token
make[1]: *** [mplayer.o] Erreur 1
make[1]: quittant le r?pertoire ? /home/user/Documents/buildroot-2009.11/output/build/MPlayer-1.0rc2 ?
make: *** [/home/user/Documents/buildroot-2009.11/output/build/MPlayer-1.0rc2/mplayer] Erreur 2


So, I tick in 
     Toolchain  --->
     [*] Enable large file (files > 2 GB) support?

And I run 'make'.

There is no difference!

Have you got an idea?

BR
 		 	   		  
_________________________________________________________________
Nouveau?! Tout Windows Live d?barque dans votre t?l?phone. Voir les Windows phone
http://clk.atdmt.com/FRM/go/175819071/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100211/1366ea22/attachment.htm>
