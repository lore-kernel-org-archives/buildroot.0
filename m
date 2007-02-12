From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:28 -0800
Subject: [Buildroot] [buildroot 0000275]: make menuconfig fails in mconf.c
	compile
Message-ID: <162d4d894c3e8a46f68894165f3f3937@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=275 
====================================================================== 
Reported By:                wmat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   275
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-31-2005 13:43 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    make menuconfig fails in mconf.c compile
Description: 
gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
-I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -I. -c mconf.c -o
mconf.o
mconf.c:104: error: static declaration of ?current_menu? follows
non-static declaration
lkc.h:63: error: previous declaration of ?current_menu? was here
mconf.c: In function ?conf_string?:
mconf.c:589: warning: pointer targets in passing argument 2 of
?sym_set_string_value? differ in signedness
mconf.c: In function ?conf_load?:
mconf.c:610: warning: pointer targets in passing argument 1 of ?conf_read?
differ in signedness
mconf.c: In function ?conf_save?:
mconf.c:631: warning: pointer targets in passing argument 1 of
?conf_write? differ in signedness
make[1]: *** [mconf.o] Error 1
make[1]: Leaving directory `/home/wmat/buildroot/package/config'
make: *** [package/config/mconf] Error 2
[wmat at localhost buildroot]$ uname -a
Linux localhost.localdomain 2.6.11-1.1315_FC4
http://busybox.net/bugs/view.php?id=1 Mon May 16 17:02:23 EDT
2005 i686 i686 i386 GNU/Linux

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-28-05 01:04  
---------------------------------------------------------------------- 
current svn should have this fixed 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-31-05 13:43  wmat           New Issue                                    
08-28-05 01:04  vapier         Note Added: 0000452                          
08-28-05 01:04  vapier         Status                   assigned => closed  
08-28-05 01:04  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
