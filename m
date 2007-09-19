From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Sep 2007 07:16:58 -0700
Subject: [Buildroot] [buildroot 0001449]: Buildroot doesn't "make
	menuconfig" in CyGWIN
Message-ID: <f77a0d9d5595ee9b0053016bfd611899@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1449 
====================================================================== 
Reported By:                dtech
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1449
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-29-2007 11:49 PDT
Last Modified:              09-19-2007 07:16 PDT
====================================================================== 
Summary:                    Buildroot doesn't "make menuconfig" in CyGWIN
Description: 
While using a fresh install of CyGWIN and the latest buildroot build, I
cannot "make menuconfig" builroot. I get the following output:
make CC="/usr/bin/gcc" -C package/config conf mconf
make[1]: Entering directory `/home/David/buildroot/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2 -MM *.c > .depend 2>/dev/null || :
make[1]: Leaving directory `/home/David/buildroot/package/config'
make[1]: Entering directory `/home/David/buildroot/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2  -c conf.c -o conf.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2  -c kxgettext.c -o kxgettext.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2  -c lxdialog/checklist.c -o lxdialog/checklist.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2  -c lxdialog/inputbox.c -o lxdialog/inputbox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2  -c lxdialog/menubox.c -o lxdialog/menubox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2  -c lxdialog/textbox.c -o lxdialog/textbox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2  -c lxdialog/util.c -o lxdialog/util.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2  -c lxdialog/yesno.c -o lxdialog/yesno.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2  -c mconf.c -o mconf.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2 -I. -c zconf.tab.c -o zconf.tab.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2   conf.o  zconf.tab.o -o conf
make[1]: Leaving directory `/home/David/buildroot/package/config'
conf.o: In function `check_stdin':
/home/David/buildroot/package/config/conf.c:60: undefined reference to
`_libintl_gettext'
/home/David/buildroot/package/config/conf.c:61: undefined reference to
`_libintl_gettext'
/home/David/buildroot/package/config/conf.c:62: undefined reference to
`_libintl_gettext'
conf.o: In function `check_conf':
/home/David/buildroot/package/config/conf.c:483: undefined reference to
`_libintl_gettext'
conf.o: In function `main':
/home/David/buildroot/package/config/conf.c:622: undefined reference to
`_libintl_gettext'
conf.o:/home/David/buildroot/package/config/conf.c:541: more undefined
references to `_libintl_gettext' follow
collect2: ld returned 1 exit status
make[1]: *** [conf] Error 1
make: *** [package/config/mconf] Error 2
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-19-07 07:16  
---------------------------------------------------------------------- 
This is supposed to work fine with revision 19893.
Please confirm 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-29-07 11:49  dtech          New Issue                                    
07-29-07 11:49  dtech          Status                   new => assigned     
07-29-07 11:49  dtech          Assigned To               => buildroot       
07-29-07 11:49  dtech          Issue Monitored: dtech                       
08-08-07 01:32  nl515291       Issue Monitored: nl515291                    
09-19-07 07:16  bernhardf      Note Added: 0002760                          
======================================================================
