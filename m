From: hartleys <hartleys@visionengravers.com>
Date: Thu, 19 Jun 2008 12:44:59 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
In-Reply-To: <20080619081151.B9E73F8008@busybox.net>
References: <20080619081151.B9E73F8008@busybox.net>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19091D654B@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I just did an svn up for the latest revision of buildroot (22451). It
appears something is either broke or I'm missing something.

I also tried a new svn co and have the same problem. With the new svn co
when I try a make menuconfig I get the following:

bigguiness at etch:~/src/build/buildroot$ make menuconfig
make CC="/usr/bin/gcc" -C package/config conf mconf
/bin/sh: ././check.sh: No such file or directory
make[1]: Entering directory
`/home/bigguiness/src/build/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2 -MM *.c >
.depend 2>/dev/null || :
make[1]: Leaving directory
`/home/bigguiness/src/build/buildroot/package/config'/bin/sh:
././check.sh: No such file or directory
make[1]: Entering directory
`/home/bigguiness/src/build/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  -c conf.c -o
conf.o
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  -c kxgettext.c
-o kxgettext.o
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  -c
lxdialog/checklist.c -o lxdialog/checklist.o
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  -c
lxdialog/inputbox.c -o lxdialog/inputbox.o
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  -c
lxdialog/menubox.c -o lxdialog/menubox.o
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  -c
lxdialog/textbox.c -o lxdialog/textbox.o
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  -c
lxdialog/util.c -o lxdialog/util.o
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  -c
lxdialog/yesno.c -o lxdialog/yesno.o
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  -c mconf.c -o
mconf.o
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2 -I. -c
zconf.tab.c -o zconf.tab.o
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  conf.o
zconf.tab.o -lncursesw -o conf
/bin/sh: ././check.sh: No such file or directory
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  mconf.o
zconf.tab.o lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o
lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o -lncursesw -o
mconf
make[1]: Leaving directory
`/home/bigguiness/src/build/buildroot/package/config'
target/Config.in.arch:55: invalid option
target/Config.in.arch:115: invalid option
target/Config.in.arch:128: invalid option
target/Config.in.arch:160: invalid option
target/Config.in.arch:170: invalid option
target/Config.in.arch:173: invalid option
target/Config.in.arch:176: invalid option
...
others 'invalid option' messages follow then the make ends

How can I either fix this or is it possible to revert the svn back to an
older revision?

Thanks,
Hartley

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of jacmet at uclibc.org
Sent: Thursday, June 19, 2008 1:12 AM
To: buildroot at uclibc.org
Subject: [Buildroot] svn commit: trunk/buildroot/package/config

Author: jacmet
Date: 2008-06-19 01:11:51 -0700 (Thu, 19 Jun 2008) New Revision: 22451

Log:
package/config: rebase from upstream (2.6.24.4)
