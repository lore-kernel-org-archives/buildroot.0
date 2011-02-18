From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 17:36:41 +0000 (UTC)
Subject: [Buildroot] [Bug 3313] New: mesa3d fails to build
Message-ID: <bug-3313-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3313

           Summary: mesa3d fails to build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rotwang at crux.org.pl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


In snapshot from 16th of february, mesa3d fails to build:

/home/bartek/crax/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-gcc
--sysroot=/home/bartek/crax/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot
-c -I../../include -I../../src/mesa -I../../src/gallium/include
-I../../src/gallium/auxiliary -pipe -fomit-frame-pointer -Os  -mtune=i686
-march=i686 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/bartek/crax/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/usr/include
-I/home/bartek/crax/buildroot/output/host/usr/i686-unknown-linux-uclibc/sysroot/include
-Wall -Wmissing-prototypes -std=c99 -ffast-math -fno-strict-aliasing  -fPIC  
-D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1
-DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS
main/imports.c -o main/imports.o
main/imports.c: In function '_mesa_strtod':
main/imports.c:919:20: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'loc'
main/imports.c:919:20: error: 'loc' undeclared (first use in this function)
main/imports.c:919:20: note: each undeclared identifier is reported only once
for each function it appears in
main/imports.c:921:7: warning: implicit declaration of function 'newlocale'
main/imports.c:921:23: error: 'LC_CTYPE_MASK' undeclared (first use in this
function)
main/imports.c:923:4: warning: implicit declaration of function 'strtod_l'
main/imports.c:927:1: warning: control reaches end of non-void function
make[3]: *** [main/imports.o] Error 1
make[3]: Leaving directory
`/home/bartek/crax/buildroot/output/build/mesa3d-7.6.1/src/mesa'
make[2]: *** [subdirs] Error 1
make[2]: Leaving directory
`/home/bartek/crax/buildroot/output/build/mesa3d-7.6.1/src'
make[1]: *** [default] Error 1
make[1]: Leaving directory
`/home/bartek/crax/buildroot/output/build/mesa3d-7.6.1'
make: *** [/home/bartek/crax/buildroot/output/build/mesa3d-7.6.1/.stamp_built]
Error 2

I've found it sufficent to apply attached patch to fix the issue

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
