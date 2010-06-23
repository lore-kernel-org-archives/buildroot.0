From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 24 Jun 2010 00:53:12 +0200
Subject: [Buildroot] nbd fails to compile with /usr/bin/klcc: unknown
	option: --sysroot=
Message-ID: <201006240053.12651.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the atngw100_defconfig has nbd client and server enabled, and unfortunately it fails to compile, with the message

/usr/bin/klcc: unknown option: --sysroot=/avr/buildroot/output/staging/

$klcc --version
x86_64-pc-linux-gnu-gcc (GCC) 4.1.2 (Gentoo 4.1.2 p1.3)

How can I fix this ? - Unfortunately I'm not that into the whole buildroot system (yet, but I'd like to learn and contribute to it).

Thanks,
Peter

Here are the last few lines:


/usr/bin/klcc -DHAVE_CONFIG_H -I.     -Os -pipe -Os  -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -
I/avr/buildroot/output/staging/usr/include -I/avr/buildroot/output/staging/include --sysroot=/avr/buildroot/output/staging/ -isysroot /avr/buildroot/output/staging -c -o 
knbd_client-nbd-client.o nbd-client.c
/avr/buildroot/output/staging/usr/bin/avr32-unknown-linux-uclibc-gcc -Os -pipe -Os  -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
D_FILE_OFFSET_BITS=64 -I/avr/buildroot/output/staging/usr/include -I/avr/buildroot/output/staging/include --sysroot=/avr/buildroot/output/staging/ -isysroot 
/avr/buildroot/output/staging -DHAVE_CONFIG_H -I.     -Os -pipe -Os  -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
D_FILE_OFFSET_BITS=64 -I/avr/buildroot/output/staging/usr/include -I/avr/buildroot/output/staging/include --sysroot=/avr/buildroot/output/staging/ -isysroot 
/avr/buildroot/output/staging -MT nbd-client.o -MD -MP -MF .deps/nbd-client.Tpo -c -o nbd-client.o nbd-client.c
/usr/bin/klcc: unknown option: --sysroot=/avr/buildroot/output/staging/
make[2]: *** [knbd_client-nbd-client.o] Fehler 25
make[2]: *** Warte auf noch nicht beendete Prozesse...
In file included from nbd-client.c:17:
lfs.h:7:1: warning: "_LARGEFILE_SOURCE" redefined
<command-line>: warning: this is the location of the previous definition
In file included from nbd-server.c:56:
lfs.h:7:1: warning: "_LARGEFILE_SOURCE" redefined
<command-line>: warning: this is the location of the previous definition
mv -f .deps/nbd-client.Tpo .deps/nbd-client.Po
mv -f .deps/nbd_server-nbd-server.Tpo .deps/nbd_server-nbd-server.Po
make[2]: Leaving directory `/avr/buildroot/output/build/nbd-2.9.11'
make[1]: *** [all] Fehler 2
make[1]: Leaving directory `/avr/buildroot/output/build/nbd-2.9.11'
make: *** [/avr/buildroot/output/build/nbd-2.9.11/.stamp_built] Fehler 2
