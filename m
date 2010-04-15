From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Apr 2010 09:49:01 +0000 (UTC)
Subject: [Buildroot] [Bug 1567] New: openssl0.9.8n fails to compile
Message-ID: <bug-1567-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1567

              Host: Kubuntu 9.10
            Target: armv4
           Summary: openssl0.9.8n fails to compile
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

/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc -I.. -I../..
-I../../include -fPIC -DOPENSSL_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS
-D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DTERMIO -Os -pipe -Os 
-I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-fomit-frame-pointer -Wall   -c -o bss_dgram.o bss_dgram.c
bss_dgram.c: In function 'dgram_ctrl':
bss_dgram.c:433: error: 'IPV6_PMTUDISC_DO' undeclared (first use in this
function)
bss_dgram.c:433: error: (Each undeclared identifier is reported only once
bss_dgram.c:433: error: for each function it appears in.)
bss_dgram.c:434: error: 'IPV6_MTU_DISCOVER' undeclared (first use in this
function)
bss_dgram.c:474: error: 'IPV6_MTU' undeclared (first use in this function)
make[3]: *** [bss_dgram.o] ?? 1
make[2]: *** [subdirs] ?? 1
make[1]: *** [build_crypto] ?? 1
make: *** [/opt/buildroot/output/build/openssl-0.9.8n/.stamp_built] ??
2make[3]:??????
`/opt/buildroot/output/build/openssl-0.9.8n/crypto/bio'
make[2]:?????? `/opt/buildroot/output/build/openssl-0.9.8n/crypto'
make[1]:?????? `/opt/buildroot/output/build/openssl-0.9.8n'


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
