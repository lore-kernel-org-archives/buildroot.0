From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Apr 2010 09:29:01 +0000 (UTC)
Subject: [Buildroot] [Bug 1591] New: portmap fails to compile
Message-ID: <bug-1591-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1591

              Host: Kubuntu 9.10
            Target: armv4
           Summary: portmap fails to compile
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: keguang.zhang at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


While building openssl with uClibc-0.9.31 and buildroot toolchain:
binutils-2.20.1 gcc-4.4.3, build fails with error:

touch /opt/buildroot/output/build/portmap_5beta/.unpacked
/usr/bin/make -j2
CC=/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc O="-Os
-pipe -Os  -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-C /opt/buildroot/output/build/portmap_5beta
make[1]: ?????? `/opt/buildroot/output/build/portmap_5beta'
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc 
-Dperror=xperror -DCHECK_PORT  -DFACILITY=LOG_AUTH  -DIGNORE_SIGCHLD         
-Os -pipe -Os  -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  
 -c -o portmap.o portmap.c
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc 
-Dperror=xperror -DCHECK_PORT  -DFACILITY=LOG_AUTH  -DIGNORE_SIGCHLD         
-Os -pipe -Os  -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  
 -c -o pmap_check.o pmap_check.c
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc 
-Dperror=xperror -DCHECK_PORT  -DFACILITY=LOG_AUTH  -DIGNORE_SIGCHLD         
-Os -pipe -Os  -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  
 -c -o from_local.o from_local.c
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc 
-Dperror=xperror -DCHECK_PORT  -DFACILITY=LOG_AUTH  -DIGNORE_SIGCHLD         
-Os -pipe -Os  -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-o pmap_dump pmap_dump.c -lutil
/opt/buildroot/output/staging/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.4.3/../../../../arm-linux-uclibcgnueabi/bin/ld:
cannot find -lutil
collect2: ld returned 1 exit status
make[1]: *** [pmap_dump] ?? 1
make[1]:?????? `/opt/buildroot/output/build/portmap_5beta'
make: *** [/opt/buildroot/output/build/portmap_5beta/portmap] ?? 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
