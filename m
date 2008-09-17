From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 17 Sep 2008 06:30:21 -0700
Subject: [Buildroot] [buildroot 0001554]: make menuconfig failed
Message-ID: <d23b06a5ee54357da33d9e0c0a366ab7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1554 
====================================================================== 
Reported By:                AndyI
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1554
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-24-2007 08:28 PDT
Last Modified:              09-17-2008 06:30 PDT
====================================================================== 
Summary:                    make menuconfig failed
Description: 
$ uname -a
CYGWIN_NT-5.2 server00 1.5.24(0.156/4/2) 2007-01-31 10:57 i686 Cygwin

$ make menuconfig HOST_LOADLIBES="-lcurses -lintl"
make CC="/usr/bin/gcc" -C package/config conf mconf
make[1]: Entering directory `/buildroot/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c conf.c -o conf.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c kxgettext.c -o kxgettext.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c mconf.c -o mconf.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2 -
I. -c zconf.tab.c -o zconf.tab.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-lcurses -lintl conf.o  zconf.tab.o -o conf
conf.o: In function `check_stdin':
/buildroot/package/config/conf.c:60: undefined reference to
`_libintl_gettext'
/buildroot/package/config/conf.c:61: undefined reference to
`_libintl_gettext'
/buildroot/package/config/conf.c:62: undefined reference to
`_libintl_gettext'
conf.o: In function `check_conf':
/buildroot/package/config/conf.c:486: undefined reference to
`_libintl_gettext'
conf.o: In function `main':
/buildroot/package/config/conf.c:626: undefined reference to
`_libintl_gettext'
conf.o:/buildroot/package/config/conf.c:544: more undefined references to
`_libi
ntl_gettext' follow
collect2: ld returned 1 exit status
make[1]: *** [conf] Error 1
make[1]: Leaving directory `/buildroot/package/config'
make: *** [package/config/mconf] Error 2

====================================================================== 

---------------------------------------------------------------------- 
 AndyI - 09-17-08 05:42  
---------------------------------------------------------------------- 
Please close this issue. And issue 1512.
Problem fixed in SVN 22449
>>>>>>>
package/config: cygwin fix
- pass HOST_LOADLIBES down to make mconf for cygwin
- fix link-order WRT HOST_LOADLIBES
