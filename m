From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 18 Oct 2008 17:10:07 -0700
Subject: [Buildroot] [buildroot 0005524]: Matchbox windows manager requires
	startup notification
Message-ID: <ee4dc044bbd76280a8e9cc16a05e7a76@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             10-18-2008 17:10 PDT
Last Modified:              10-18-2008 17:10 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-18-08 17:10  robang74       New Issue                                    
10-18-08 17:10  robang74       Status                   new => assigned     
10-18-08 17:10  robang74       Assigned To               => buildroot       
======================================================================
