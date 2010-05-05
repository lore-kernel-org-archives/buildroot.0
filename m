From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  5 May 2010 08:18:25 +0000 (UTC)
Subject: [Buildroot] [Bug 1687] New: libcurl fails to compile
Message-ID: <bug-1687-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1687

              Host: Kubuntu 9.10
            Target: armv4
           Summary: libcurl fails to compile
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


While building libcurl with uClibc-0.9.31 and buildroot toolchain:
binutils-2.20.1 gcc-4.4.4, build fails with error:

 /opt/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -Os
-pipe -Os -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -DHAVE_CONFIG_H -I../include -I../include
-I../lib -I../lib -I/opt/buildroot/output/staging/usr/include/openssl
-I/opt/buildroot/output/staging/usr/include -Os -pipe -Os -mtune=arm920t
-march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -isystem
/opt/buildroot/output/staging/usr/include -isystem
/opt/buildroot/output/staging/include --sysroot=/opt/buildroot/output/staging/
-isysroot /opt/buildroot/output/staging -g0 -Wno-system-headers -MT file.lo -MD
-MP -MF .deps/file.Tpo -c file.c  -fPIC -DPIC -o .libs/file.o
In file included from setup.h:478,
                 from file.c:24:
setup_once.h:265: error: two or more data types in declaration specifiers
setup_once.h:265: warning: useless type name in empty declaration
 /opt/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -Os
-pipe -Os -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -DHAVE_CONFIG_H -I../include -I../include
-I../lib -I../lib -I/opt/buildroot/output/staging/usr/include/openssl
-I/opt/buildroot/output/staging/usr/include -Os -pipe -Os -mtune=arm920t
-march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -isystem
/opt/buildroot/output/staging/usr/include -isystem
/opt/buildroot/output/staging/include --sysroot=/opt/buildroot/output/staging/
-isysroot /opt/buildroot/output/staging -g0 -Wno-system-headers -MT timeval.lo
-MD -MP -MF .deps/timeval.Tpo -c timeval.c  -fPIC -DPIC -o .libs/timeval.o
In file included from setup.h:478,
                 from timeval.h:31,
                 from timeval.c:24:
setup_once.h:265: error: two or more data types in declaration specifiers
setup_once.h:265: warning: useless type name in empty declaration
make[3]: *** [timeval.lo] ?? 1
make[3]: *** ??????????....
make[3]: *** [file.lo] ?? 1
make[3]:?????? `/opt/buildroot/output/build/libcurl-7.19.2/lib'
make[2]: *** [all] ?? 2
make[2]:?????? `/opt/buildroot/output/build/libcurl-7.19.2/lib'
make[1]: *** [all-recursive] ?? 1
make[1]:?????? `/opt/buildroot/output/build/libcurl-7.19.2'
make: *** [/opt/buildroot/output/build/libcurl-7.19.2/.stamp_built] ?? 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
