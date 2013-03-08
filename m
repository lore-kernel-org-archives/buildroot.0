From: Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM>
Date: Fri, 8 Mar 2013 12:29:10 +0100
Subject: [Buildroot] Problem with buildroot-2013.02 - ncurses
In-Reply-To: <20130307140818.0d48c197@skate>
References: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
 <20130307093024.30cb7d23@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52A6B0@DSW350.wattens.swarovski.com>
 <20130307140818.0d48c197@skate>
Message-ID: <84EA0F7435E5F64C9B660453645DB90497AD52AA50@DSW350.wattens.swarovski.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

After solving the being-not-emcacs problem of jove with the help of Thomas Petazzoni I ran into the next problem caused by ncurses:

[...]
/usr/bin/gcc -DHAVE_CONFIG_H -I../ncurses -I. -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64  -DNDEBUG -I. -I../include -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include/ncurses -O2 -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include  --param max-inline-insns-single=1200 -c ../ncurses/./base/lib_addstr.c -o ../objects/lib_addstr.o
/usr/bin/gcc -DHAVE_CONFIG_H -I../ncurses -I. -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64  -DNDEBUG -I. -I../include -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include/ncurses -O2 -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include  --param max-inline-insns-single=1200 -c ../ncurses/./base/lib_beep.c -o ../objects/lib_beep.o
In file included from ../include/term_entry.h:48,
                 from ../progs/progs.priv.h:111,
                 from ../progs/tic.c:41:
../include/term.h:702: error: field ?Ottyb? has incomplete type
../include/term.h:703: error: field ?Nttyb? has incomplete type
In file included from ../include/term_entry.h:48,
                 from ../progs/progs.priv.h:111,
                 from ../progs/transform.c:32:
../include/term.h:702: error: field ?Ottyb? has incomplete type
../include/term.h:703: error: field ?Nttyb? has incomplete type
In file included from ../include/term_entry.h:48,
                 from ../progs/progs.priv.h:111,
                 from ../progs/dump_entry.c:36:
../include/term.h:702: error: field ?Ottyb? has incomplete type
../include/term.h:703: error: field ?Nttyb? has incomplete type
make[1]: *** [../objects/transform.o] Error 1
make[1]: *** Waiting for unfinished jobs....
/usr/bin/gcc -DHAVE_CONFIG_H -I../ncurses -I. -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64  -DNDEBUG -I. -I../include -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include/ncurses -O2 -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include  --param max-inline-insns-single=1200 -c ../ncurses/./base/lib_bkgd.c -o ../objects/lib_bkgd.o
In file included from ../ncurses/curses.priv.h:327,	
                 from ../ncurses/./tty/hashmap.c:70:		
../include/term.h:702: error: field ?Ottyb? has incomplete type
../include/term.h:703: error: field ?Nttyb? has incomplete type
In file included from ../ncurses/curses.priv.h:327,
                 from ../ncurses/./base/lib_addch.c:36:
../include/term.h:702: error: field ?Ottyb? has incomplete type
../include/term.h:703: error: field ?Nttyb? has incomplete type
In file included from ../ncurses/./tty/hashmap.c:70:
../ncurses/curses.priv.h:923: error: field ?_saved_tty? has incomplete type
make[1]: *** [../objects/tic.o] Error 1
/usr/bin/gcc -DHAVE_CONFIG_H -I../ncurses -I. -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64  -DNDEBUG -I. -I../include -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include/ncurses -O2 -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include  --param max-inline-insns-single=1200 -c ../ncurses/./base/lib_box.c -o ../objects/lib_box.o
In file included from ../ncurses/curses.priv.h:327,
                 from ../ncurses/./tty/hardscroll.c:148:
../include/term.h:702: error: field ?Ottyb? has incomplete type
../include/term.h:703: error: field ?Nttyb? has incomplete type
In file included from ../ncurses/./base/lib_addch.c:36:
../ncurses/curses.priv.h:923: error: field ?_saved_tty? has incomplete type
In file included from ../ncurses/./tty/hardscroll.c:148:
../ncurses/curses.priv.h:923: error: field ?_saved_tty? has incomplete type
In file included from ../ncurses/curses.priv.h:327,
                 from ../ncurses/./base/lib_beep.c:43:
../include/term.h:702: error: field ?Ottyb? has incomplete type
../include/term.h:703: error: field ?Nttyb? has incomplete type
In file included from ../ncurses/curses.priv.h:327,
                 from ../ncurses/./base/lib_addstr.c:45:
../include/term.h:702: error: field ?Ottyb? has incomplete type
../include/term.h:703: error: field ?Nttyb? has incomplete type
In file included from ../ncurses/./base/lib_beep.c:43:
../ncurses/curses.priv.h:923: error: field ?_saved_tty? has incomplete type
make[2]: *** [../objects/lib_addch.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [../objects/hardscroll.o] Error 1
make[2]: *** [../objects/hashmap.o] Error 1
In file included from ../ncurses/./base/lib_addstr.c:45:
../ncurses/curses.priv.h:923: error: field ?_saved_tty? has incomplete type
make[2]: *** [../objects/lib_beep.o] Error 1
make[2]: *** [../objects/lib_addstr.o] Error 1
In file included from ../ncurses/curses.priv.h:327,
                 from ../ncurses/./base/lib_bkgd.c:37:
../include/term.h:702: error: field ?Ottyb? has incomplete type
../include/term.h:703: error: field ?Nttyb? has incomplete type
make[1]: *** [../objects/dump_entry.o] Error 1
In file included from ../ncurses/./base/lib_bkgd.c:37:
../ncurses/curses.priv.h:923: error: field ?_saved_tty? has incomplete type
In file included from ../ncurses/curses.priv.h:327,
                 from ../ncurses/./base/lib_box.c:43:
../include/term.h:702: error: field ?Ottyb? has incomplete type
../include/term.h:703: error: field ?Nttyb? has incomplete type
In file included from ../ncurses/./base/lib_box.c:43:
../ncurses/curses.priv.h:923: error: field ?_saved_tty? has incomplete type
make[2]: *** [../objects/lib_bkgd.o] Error 1
make[2]: *** [../objects/lib_box.o] Error 1
make[2]: Leaving directory `<MY_WORKSPACE>/buildroot-2013.02/output/build/host-ncurses-5.9/ncurses'
make[1]: *** [../lib/libncurses.a] Error 2
make[1]: Leaving directory `<MY_WORKSPACE>/buildroot-2013.02/output/build/host-ncurses-5.9/progs'
make: *** [..../buildroot-2013.02/output/build/host-ncurses-5.9/.stamp_built] Error 2
$

Any ideas?

Thanks!

Werner Spielmann
