From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Mar 2010 13:52:07 +0000 (UTC)
Subject: [Buildroot] [Bug 1453] New: OpenSSL0.9.8n fails to compile
Message-ID: <bug-1453-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1453

              Host: Archlinux i686
            Target: AT91RM9200 based board
           Summary: OpenSSL0.9.8n fails to compile
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nnazarenko at radiofid.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


While building openssl with uClibc  0.9.30.3 and buildroot toolchain:
binutils-2.20 gcc-4.3.3, build fails with error:

home/savant/devel/irz/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-DMONOLITH -I.. -I../include  -fPIC -DOPENSSL_PIC -DZLIB_SHARED -DZLIB
-DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DTERMIO -Os -pipe
-Os  -I/home/savant/devel/irz/buildroot/output/staging/usr/include
-I/home/savant/devel/irz/buildroot/output/staging/include
--sysroot=/home/savant/devel/irz/buildroot/output/staging/ -isysroot
/home/savant/devel/irz/buildroot/output/staging -mtune=arm920t -march=armv4t
-mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -fomit-frame-pointer -Wall   -c -o speed.o speed.c
speed.c:147:23: error: sys/timeb.h: No such file or directory
speed.c: In function 'Time_F':
speed.c:459: error: storage size of 'tstart' isn't known
speed.c:459: error: storage size of 'tend' isn't known
speed.c:465: warning: implicit declaration of function 'ftime'
speed.c:459: warning: unused variable 'tend'
speed.c:459: warning: unused variable 'tstart'
make[2]: *** [speed.o] ?????? 1
make[2]: Leaving directory
`/home/savant/devel/irz/buildroot/output/build/openssl-0.9.8n/apps'
make[1]: *** [build_apps] ?????? 1
make[1]: Leaving directory
`/home/savant/devel/irz/buildroot/output/build/openssl-0.9.8n'
make: ***
[/home/savant/devel/irz/buildroot/output/build/openssl-0.9.8n/.stamp_built]
?????? 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
