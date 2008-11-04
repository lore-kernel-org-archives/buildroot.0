From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 4 Nov 2008 14:31:44 -0800
Subject: [Buildroot] [buildroot 0005524]: Matchbox windows manager requires
	startup notification
Message-ID: <3facbf378f3c4330ca0fe09bd785c9aa@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=5524 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5524
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-18-2008 17:10 PDT
Last Modified:              11-04-2008 14:31 PST
====================================================================== 
Summary:                    Matchbox windows manager requires startup
notification
Description: 
roberto at rafbook:~/gles/buildroot$ make clean

[...]

roberto at rafbook:~/gles/buildroot$ make

[...]

Making all in src
make[3]: Entering directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2/src'
if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -I. -I. -I..
-DDATADIR=\"/usr/share/matchbox\" -DCONFDIR=\"/etc/matchbox\"
-DPKGDATADIR=\"/usr/share/matchbox/matchbox\"
-DPREFIX=\"/home/roberto/gles/buildroot/build_i586/staging_dir/usr\" -g
-Wall -fno-strict-aliasing 
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/libpng12 
  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/startup-notification-1.0
        -Os 
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include -MT
main.o -MD -MP -MF ".deps/main.Tpo" -c -o main.o main.c; \
	then mv -f ".deps/main.Tpo" ".deps/main.Po"; else rm -f ".deps/main.Tpo";
exit 1; fi
In file included from main.c:21:
structs.h:60:22: error: libsn/sn.h: No such file or directory
In file included from main.c:21:
structs.h:615: error: expected specifier-qualifier-list before
?SnDisplay?
make[3]: *** [main.o] Error 1
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2'
make: ***
[/home/roberto/gles/buildroot/build_i586/matchbox-window-manager-1.2/.compiled]
Error 2

the missing file belong to startup-notification-0.9

roberto at rafbook:~/gles/buildroot$ find build_i586 -name sn.h
build_i586/startup-notification-0.9/libsn/sn.h

SOLUTION: matchbox-window-manager-1.2 should require
startup-notification-0.9 too, or at least its headers installed.
====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-04-08 13:23  
---------------------------------------------------------------------- 
roberto at rafbook:~/gles/buildroot$ svn info | grep Last
Last Changed Author: jacmet
Last Changed Rev: 23821
Last Changed Date: 2008-10-27 16:15:52 +0100 (Mon, 27 Oct 2008) 

---------------------------------------------------------------------- 
 jacmet - 11-04-08 14:31  
---------------------------------------------------------------------- 
Fixed in r23927 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-18-08 17:10  robang74       New Issue                                    
10-18-08 17:10  robang74       Status                   new => assigned     
10-18-08 17:10  robang74       Assigned To               => buildroot       
10-18-08 17:10  robang74       Issue Monitored: robang74                    
11-04-08 13:23  robang74       Note Added: 0015094                          
11-04-08 14:31  jacmet         Status                   assigned => closed  
11-04-08 14:31  jacmet         Note Added: 0015134                          
======================================================================
