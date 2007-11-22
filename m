From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 22 Nov 2007 12:26:58 -0800
Subject: [Buildroot] [buildroot 0001603]: Unable to run make menuconfig
Message-ID: <fdcd3efc2505fc31e814ae71fdeb78c5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1603 
====================================================================== 
Reported By:                Webworm
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1603
Category:                   Documentation
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-22-2007 12:26 PST
Last Modified:              11-22-2007 12:26 PST
====================================================================== 
Summary:                    Unable to run make menuconfig
Description: 
Following

http://buildroot.uclibc.org/buildroot.html


svn co svn://uclibc.org/trunk/buildroot

<snipped>

 U   buildroot
Checked out revision 20481.

cd buildroot
make menuconfig

make CC="/usr/bin/gcc" -C package/config conf mconf
make[1]: Entering directory `/domu-0/wrap/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -MM *.c > .depend
2>/dev/null || :
make[1]: Leaving directory `/domu-0/wrap/buildroot/package/config'
make[1]: Entering directory `/domu-0/wrap/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -c conf.c -o
conf.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -c kxgettext.c -o
kxgettext.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -c
lxdialog/checklist.c -o lxdialog/checklist.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -c
lxdialog/inputbox.c -o lxdialog/inputbox.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -c
lxdialog/menubox.c -o lxdialog/menubox.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -c
lxdialog/textbox.c -o lxdialog/textbox.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -c
lxdialog/util.c -o lxdialog/util.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -c
lxdialog/yesno.c -o lxdialog/yesno.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -c mconf.c -o
mconf.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -I. -c zconf.tab.c
-o zconf.tab.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -lncursesw conf.o
 zconf.tab.o -o conf
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2  -lncursesw
mconf.o zconf.tab.o lxdialog/checklist.o lxdialog/util.o
lxdialog/inputbox.o lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o
-o mconf
make[1]: Leaving directory `/domu-0/wrap/buildroot/package/config'
package/dbus/Config.in:9:error: found recursive dependency: (null) ->
BR2_DBUS_LIBXML2 -> BR2_PACKAGE_LIBXML2 -> (null)
 -> BR2_DBUS_EXPATwrap at gatekeeper:~/buildroot> 


Sorry, first time using buildroot, any more info that is needed please let
me know.

Cheers


Stuart


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-22-07 12:26  Webworm        New Issue                                    
11-22-07 12:26  Webworm        Status                   new => assigned     
11-22-07 12:26  Webworm        Assigned To               => buildroot       
======================================================================
