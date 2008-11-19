From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Nov 2008 06:07:29 -0800
Subject: [Buildroot] [buildroot 0006384]: libjpeg does not compile anymore
Message-ID: <c2692375ec71cad81f4e1a10d989e7b3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6384 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6384
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-19-2008 06:07 PST
Last Modified:              11-19-2008 06:07 PST
====================================================================== 
Summary:                    libjpeg does not compile anymore
Description: 
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
-Wl,--rpath-link
-Wl,/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-Wl,--rpath-link
-Wl,/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -o
.libs/cjpeg cjpeg.o rdppm.o rdgif.o rdtarga.o rdrle.o rdbmp.o rdswitch.o
cdjpeg.o -Wl,--rpath -Wl,/usr/lib .libs/libjpeg.so
rdswitch.o: In function `read_scan_script':
rdswitch.c:(.text+0x4b0): undefined reference to `bcopy'
collect2: ld returned 1 exit status
make[1]: *** [cjpeg] Error 1
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/jpeg-6b'
make: ***
[/home/roberto/gles/buildroot/build_i586/jpeg-6b/.libs/libjpeg.a] Error 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-19-08 06:07  robang74       New Issue                                    
11-19-08 06:07  robang74       Status                   new => assigned     
11-19-08 06:07  robang74       Assigned To               => buildroot       
======================================================================
