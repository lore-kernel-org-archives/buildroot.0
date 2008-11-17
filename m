From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 17 Nov 2008 02:29:33 -0800
Subject: [Buildroot] [buildroot 0006364]: lockfile-progs do not find rindex
	in string.h
Message-ID: <dea4bc49c1ec5faa18dd016ef718bdbe@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6364 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6364
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-17-2008 02:26 PST
Last Modified:              11-17-2008 02:29 PST
====================================================================== 
Summary:                    lockfile-progs do not find rindex in string.h
Description: 
make[1]: Entering directory
`/home/roberto/gles/buildroot/build_i586/lockfile-progs-0.1.11'
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -g -Wall -Werror -O2   -c -o lockfile-progs.o
lockfile-progs.c
cc1: warnings being treated as errors
lockfile-progs.c: In function ?parse_arguments?:
lockfile-progs.c:96: warning: implicit declaration of function ?rindex?
lockfile-progs.c:96: warning: incompatible implicit declaration of
built-in function ?rindex?
make[1]: *** [lockfile-progs.o] Error 1
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/lockfile-progs-0.1.11'
make: ***
[/home/roberto/gles/buildroot/project_build_i586/ugles/root/usr/bin/lockfile-create]
Error 2





====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-17-08 02:29  
---------------------------------------------------------------------- 
Probably the best solution is adding this lines to lockfile-progs.c after
includes

#if !defined(rindex)
#define rindex(s,c) strrchr((s), (c))
#endif 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-17-08 02:26  robang74       New Issue                                    
11-17-08 02:26  robang74       Status                   new => assigned     
11-17-08 02:26  robang74       Assigned To               => buildroot       
11-17-08 02:27  robang74       Issue Monitored: robang74                    
11-17-08 02:29  robang74       Note Added: 0015914                          
======================================================================
