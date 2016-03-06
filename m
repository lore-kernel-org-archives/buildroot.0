From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 06 Mar 2016 11:08:51 +0000
Subject: [Buildroot] [Bug 8766] New: Compiling host-gcc-final-4.9.3 broken
	on i386
Message-ID: <bug-8766-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8766

            Bug ID: 8766
           Summary: Compiling host-gcc-final-4.9.3 broken on i386
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: bernd.kuhls at t-online.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

When compiling buildroot git master (c6e3511) with this defconfig

BR2_x86_i386=y

this error occurs:

/home/bernd/buildroot/br4_i386/output/build/host-gcc-final-4.9.3/build/./gcc/xgcc
-B/home/bernd/buildroot/br4_i386/output/build/host-gcc-final-4.9.3/build/./gcc/
-B/home/bernd/buildroot/br4_i386/output/host/usr/i386-buildroot-linux-uclibc/bin/
-B/home/bernd/buildroot/br4_i386/output/host/usr/i386-buildroot-linux-uclibc/lib/
-isystem
/home/bernd/buildroot/br4_i386/output/host/usr/i386-buildroot-linux-uclibc/include
-isystem
/home/bernd/buildroot/br4_i386/output/host/usr/i386-buildroot-linux-uclibc/sys-include
   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -O2 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -DIN_GCC
 -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-strings
-Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition 
-isystem ./include   -fpic -mlong-double-80 -g -DIN_LIBGCC2 -fbuilding-libgcc
-fno-stack-protector   -fpic -mlong-double-80 -I. -I. -I../.././gcc
-I../../../libgcc -I../../../libgcc/. -I../../../libgcc/../gcc
-I../../../libgcc/../include    -DUSE_TLS -o _gcov_ior_profiler.o -MT
_gcov_ior_profiler.o -MD -MP -MF _gcov_ior_profiler.dep -DL_gcov_ior_profiler
-c ../../../libgcc/libgcov-profiler.c
../../../libgcc/generic-morestack-thread.c:41:21: fatal error: pthread.h: No
such file or directory
 #include <pthread.h>
                     ^
compilation terminated.
../../../libgcc/shared-object.mk:14: recipe for target
'generic-morestack-thread.o' failed
make[3]: *** [generic-morestack-thread.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory
'/home/bernd/buildroot/br4_i386/output/build/host-gcc-final-4.9.3/build/i386-buildroot-linux-uclibc/libgcc'
Makefile:10153: recipe for target 'all-target-libgcc' failed
make[2]: *** [all-target-libgcc] Error 2
make[2]: Leaving directory
'/home/bernd/buildroot/br4_i386/output/build/host-gcc-final-4.9.3/build'
Makefile:840: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory
'/home/bernd/buildroot/br4_i386/output/build/host-gcc-final-4.9.3/build'
package/pkg-generic.mk:195: recipe for target
'/home/bernd/buildroot/br4_i386/output/build/host-gcc-final-4.9.3/.stamp_built'
failed
make: ***
[/home/bernd/buildroot/br4_i386/output/build/host-gcc-final-4.9.3/.stamp_built]
Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
