From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Fri, 4 Mar 2011 12:11:39 +0100
Subject: [Buildroot]  xterm fails to compile
Message-ID: <20110304121139.54ce01d0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

I'm currently trying to compile xterm (Buildroot 2011.02) but it fails :

make[1]: quittant le r?pertoire ? /home/fred/buildroot ?
>>> xterm 262 Building
PATH="/home/fred/buildroot/output/host/bin:/home/fred/buildroot/output/host/usr/bin:/home/fred/buildroot/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
PERLLIB="/home/fred/buildroot/output/host/usr/lib/perl"  /usr/bin/make
-j2  -C /home/fred/buildroot/output/build/xterm-262/ make[1]: entrant
dans le r?pertoire ? /home/fred/buildroot/output/build/xterm-262
? /home/fred/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-gcc
--sysroot=/home/fred/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot
-I. -I. -DHAVE_CONFIG_H  -D_GNU_SOURCE  -DNARROWPROTO=1 -DFUNCPROTO=15
-DOSMAJORVERSION=2 -DOSMINORVERSION=6
-I/home/fred/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/usr/include/freetype2
-pipe -Os  -mtune=i686 -march=i686 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/fred/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/usr/include
-I/home/fred/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/include
-c ./input.c /home/fred/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-gcc
--sysroot=/home/fred/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot
-I. -I. -DHAVE_CONFIG_H  -D_GNU_SOURCE  -DNARROWPROTO=1 -DFUNCPROTO=15
-DOSMAJORVERSION=2 -DOSMINORVERSION=6
-I/home/fred/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/usr/include/freetype2
-pipe -Os  -mtune=i686 -march=i686 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/fred/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/usr/include
-I/home/fred/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/include
-c ./main.c In file included from ./input.c:86: ./xtermcap.h:62:20:
error: curses.h: No such file or directory In file included
from ./main.c:121: ./xtermcap.h:62:20: error: curses.h: No such file or
directory make[1]: *** [input.o] Erreur 1 make[1]: *** Attente des
t?ches non termin?es.... make[1]: *** [main.o] Erreur 1 make[1]:
quittant le r?pertoire ? /home/fred/buildroot/output/build/xterm-262 ?
make: *** [/home/fred/buildroot/output/build/xterm-262/.stamp_built]
Erreur 2



On another note :

I was able to generate a working embedded i386 X.org + Blackbox wm
system, but it seems that it must be done in several steps :
- first build a bare Xorg
- then add the Xorg Drivers and needed utilities

otherwise, some packages may fail to compile because of dependencies
not working (eg. xf86-input-driver would require xorg-server, but
xorg-server wasn't compiled before)
