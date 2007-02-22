From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 22 Feb 2007 20:50:11 +0100
Subject: [Buildroot] make menuconfig in a buildroot env.
Message-ID: <20070222195010.GA30949@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I've made a buildroot development environment and have a buildroot
checkout in it.

I've done this many times before but since the last time I did it, this
have started to happen:

It is not the ncurses library since another (earlier) br2 I have works in 
the same built rootfs.

root at hamp buildroot.rolls]# make menuconfig
make -C package/config ncurses conf mconf
make[1]: Entering directory `/buildroot.rolls/package/config'
make[1]: `conf' is up to date.
gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
-DCURSES_LOC="<ncurses.h>" -I. -c mconf.c -o mconf.o
In file included from lxdialog/dialog.h:33,
                 from mconf.c:26:
/usr/include/ncurses.h:66:25: error: ncurses_dll.h: No such file or
directory
In file included from /usr/include/ncurses.h:123,
                 from lxdialog/dialog.h:33,
                 from mconf.c:26:
/usr/include/unctrl.h: In function 'NCURSES_EXPORT':
/usr/include/unctrl.h:57: error: expected declaration specifiers before
'unctrl'
In file included from lxdialog/dialog.h:33,
                 from mconf.c:26:
/usr/include/ncurses.h:147: error: storage class specified for parameter
'NCURSES_BOOL'
In file included from lxdialog/dialog.h:33,
                 from mconf.c:26:
/usr/include/ncurses.h:198: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'COLORS'
/usr/include/ncurses.h:199: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'COLOR_PAIRS'
/usr/include/ncurses.h:213: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '_nc_acs_map'
/usr/include/ncurses.h:306: error: storage class specified for parameter
'SCREEN'
/usr/include/ncurses.h:307: error: storage class specified for parameter
'WINDOW'
/usr/include/ncurses.h:309: error: storage class specified for parameter
'attr_t'
/usr/include/ncurses.h:358: error: expected specifier-qualifier-list
before 'attr_t'
/usr/include/ncurses.h:402: error: expected ')' before '*' token
/usr/include/ncurses.h:403: error: expected ')' before '*' token
/usr/include/ncurses.h:404: error: expected ')' before '*' token
/usr/include/ncurses.h:406: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'LINES'
/usr/include/ncurses.h:407: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'COLS'
/usr/include/ncurses.h:408: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'TABSIZE'


Thomas.
