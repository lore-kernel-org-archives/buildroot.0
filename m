From: Claas Hilbrecht <claas+maillinglists.buildroot@jucs-kramkiste.de>
Date: Fri, 27 Jul 2007 15:42:59 +0200
Subject: [Buildroot] SVN Rev 19269 won't build
In-Reply-To: <20070727123058.GA23901@aon.at>
References: <5041A110D5D200EDF64E7756@[192.168.83.121]>
	<20070727103757.GC22789@aon.at>
	<09E61CA94D6C4DE241DF8A46@[192.168.83.121]>
	<20070727123058.GA23901@aon.at>
Message-ID: <2BF4F42AD2EC4CBFF0CF3925@[192.168.83.121]>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--Am Freitag, 27. Juli 2007 14:30 +0200 Bernhard Fischer 
<rep.dot.nop@gmail.com> schrieb:

> Should be fixed in r19275.

Maybe I'm too stupid but the error is still the same (with rev 19277).

babel at eisler:~/buildroot/0.9.29/buildroot_org/buildroot$ make clean
rm -f .config .config.old .config.cmd .tmpconfig.h
make -C package/config clean
make[1]: Entering directory 
`/home/babel/buildroot/0.9.29/buildroot_org/buildroot/package/config'
make[1]: Leaving directory 
`/home/babel/buildroot/0.9.29/buildroot_org/buildroot/package/config'
babel at eisler:~/buildroot/0.9.29/buildroot_org/buildroot$ svn up
At revision 19277.
babel at eisler:~/buildroot/0.9.29/buildroot_org/buildroot$ svn diff
babel at eisler:~/buildroot/0.9.29/buildroot_org/buildroot$ make
make CC="/usr/bin/gcc" MAKECMDGOALS="" \
                -C package/config conf mconf
make[1]: Entering directory 
`/home/babel/buildroot/0.9.29/buildroot_org/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -I. -c zconf.tab.c 
-o zconf.tab.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -lncurses conf.o 
zconf.tab.o -o conf
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
babel at eisler:~/buildroot/0.9.29/buildroot_org/buildroot$


-- 
 Claas Hilbrecht
 http://www.jucs-kramkiste.de
