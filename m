From: Claas Hilbrecht <claas+maillinglists.buildroot@jucs-kramkiste.de>
Date: Fri, 27 Jul 2007 09:58:25 +0200
Subject: [Buildroot] SVN Rev 19269 won't build
Message-ID: <5041A110D5D200EDF64E7756@[192.168.83.121]>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

just a note. The svn version 19269 won't build (on Debian etch). And not 
somewhere deep inside but at a very early stage.

svn co svn://uclibc.org/trunk/buildroot
cd buildroot
make
make CC="/usr/bin/gcc" MAKECMDGOALS="" \
                -C package/config conf mconf
make[1]: Entering directory 
`/home/babel/buildroot/0.9.29/buildroot_org/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -Dinline="" 
-include foo.h -MM *.c > .depend 2>/dev/null || :
make[1]: Leaving directory 
`/home/babel/buildroot/0.9.29/buildroot_org/buildroot/package/config'
make[1]: Entering directory 
`/home/babel/buildroot/0.9.29/buildroot_org/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -Dinline="" 
-include foo.h  -c conf.c -o conf.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -Dinline="" 
-include foo.h  -c kxgettext.c -o kxgettext.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -Dinline="" 
-include foo.h -I. -c zconf.tab.c -o zconf.tab.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -Dinline="" 
-include foo.h  -lncurses conf.o  zconf.tab.o -o conf
/usr/bin/gcc    -c -o mconf.o mconf.c
In file included from mconf.c:27:
lxdialog/dialog.h:32:10: error: #include expects "FILENAME" or <FILENAME>
In file included from mconf.c:27:
lxdialog/dialog.h:97: error: expected specifier-qualifier-list before 
'chtype'
lxdialog/dialog.h:187: error: expected ')' before '*' token
lxdialog/dialog.h:193: error: expected ')' before '*' token
lxdialog/dialog.h:195: error: expected ')' before '*' token
lxdialog/dialog.h:196: error: expected ')' before '*' token
lxdialog/dialog.h:197: error: expected ')' before '*' token
lxdialog/dialog.h:198: error: expected ')' before '*' token
lxdialog/dialog.h:200: error: expected ')' before '*' token
mconf.c: In function 'conf':
mconf.c:608: error: 'KEY_MAX' undeclared (first use in this function)
mconf.c:608: error: (Each undeclared identifier is reported only once
mconf.c:608: error: for each function it appears in.)
mconf.c: In function 'conf_choice':
mconf.c:759: error: 'KEY_MAX' undeclared (first use in this function)
make[1]: *** [mconf.o] Error 1
make[1]: Leaving directory 
`/home/babel/buildroot/0.9.29/buildroot_org/buildroot/package/config'
make: *** [package/config/mconf] Error 2


-- 
 Claas Hilbrecht
 http://www.jucs-kramkiste.de
