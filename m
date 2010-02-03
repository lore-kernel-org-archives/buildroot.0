From: M.A. Hockings <veeshooter@hockings.net>
Date: Wed, 03 Feb 2010 17:02:40 -0500
Subject: [Buildroot] building buildroot is not successful
Message-ID: <4B69F280.9070301@hockings.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please be gentle with me, I am yet learning Linux and all.  For this I 
have looked back through the archives but don't see anything that I 
recognize as being the same problem.

I am trying to build buildroot on a Centos 5.4 box.  The build fails 
with a permission denied error when accessing package/config/mconf but 
it is not clear to me why.  I extracted the source with my id into a 
directory for which I have full access so I would not expect simple 
authority to be the problem.

Thanks for any suggestions

m


[xxxxxxxx at eMash buildroot-2009.11]$ make menuconfig
make CC="/usr/bin/gcc" -C package/config mconf
make[1]: Entering directory `/media/disk/buildroot-2009.11/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2  -c conf.c -o conf.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2  -c kxgettext.c -o kxgettext.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2  -c lxdialog/checklist.c -o lxdialog/checklist.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2  -c lxdialog/inputbox.c -o lxdialog/inputbox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2  -c lxdialog/menubox.c -o lxdialog/menubox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2  -c lxdialog/textbox.c -o lxdialog/textbox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2  -c lxdialog/util.c -o lxdialog/util.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2  -c lxdialog/yesno.c -o lxdialog/yesno.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2  -c mconf.c -o mconf.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2 -I. -c zconf.tab.c -o zconf.tab.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  
-g -O2  mconf.o zconf.tab.o lxdialog/checklist.o lxdialog/util.o 
lxdialog/inputbox.o lxdialog/textbox.o lxdialog/yesno.o 
lxdialog/menubox.o -lncursesw -o mconf
make[1]: Leaving directory `/media/disk/buildroot-2009.11/package/config'
/bin/sh: package/config/mconf: Permission denied
