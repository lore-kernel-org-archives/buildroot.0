From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Aug 2017 09:56:06 +0000
Subject: [Buildroot] [Bug 10156] New: glibc compilation fails for X86 32bits
	(i386)
Message-ID: <bug-10156-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10156

            Bug ID: 10156
           Summary: glibc compilation fails for X86 32bits (i386)
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: frederic.mathieu at dualis.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7146
  --> https://bugs.busybox.net/attachment.cgi?id=7146&action=edit
buildroot .config

With arch i386 (see config file), The latest buildroot versions fails to
compile glibc (2.24 or 2.25).
tested with : 2017.05.2 and 2017.02.5

The same config works fine with buildroot version 2017.02.3.


...
/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/../../../toolchain/2017.02.5_X86_32/host/usr/bin/i686-buildroot-linux-gnu-gcc
../sysdeps/i386/i686/multiarch/varshift.c -c -std=gnu11 -fgnu89-inline  -O2
-Wall -Werror -Wundef -Wwrite-strings -fmerge-all-constants -frounding-math
-Wstrict-prototypes -Wold-style-definition   -fPIC -Wa,-mtune=i686  -mno-sse
-mno-mmx -mfpmath=387 -msse4  -ftls-model=initial-exec      -I../include
-I/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/string

-I/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build
 -I../sysdeps/unix/sysv/linux/i386/i686  -I../sysdeps/i386/i686/nptl 
-I../sysdeps/unix/sysv/linux/i386  -I../sysdeps/unix/sysv/linux/x86 
-I../sysdeps/i386/nptl  -I../sysdeps/unix/sysv/linux/include
-I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl  -I../sysdeps/pthread 
-I../sysdeps/gnu  -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv 
-I../sysdeps/unix/i386  -I../sysdeps/unix  -I../sysdeps/posix 
-I../sysdeps/i386/i686/fpu/multiarch  -I../sysdeps/i386/i686/fpu 
-I../sysdeps/i386/i686/multiarch  -I../sysdeps/i386/i686  -I../sysdeps/i386/fpu
 -I../sysdeps/x86/fpu/include -I../sysdeps/x86/fpu  -I../sysdeps/i386 
-I../sysdeps/x86  -I../sysdeps/wordsize-32  -I../sysdeps/ieee754/ldbl-96 
-I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32  -I../sysdeps/ieee754 
-I../sysdeps/generic  -I.. -I../libio -I. -nostdinc -isystem
/home/dev01/data/toolchain/2017.02.5_X86_32/host/usr/bin/../lib/gcc/i686-buildroot-linux-gnu/4.9.4/include
-isystem
/home/dev01/data/toolchain/2017.02.5_X86_32/host/usr/bin/../lib/gcc/i686-buildroot-linux-gnu/4.9.4/include-fixed
-isystem
/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/../../../toolchain/2017.02.5_X86_32/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include
 -D_LIBC_REENTRANT -include
/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/libc-modules.h
-DMODULE_NAME=rtld -include ../include/libc-symbols.h  -DPIC -DSHARED     -o
/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/string/rtld-varshift.os
-MD -MP -MF
/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/string/rtld-varshift.os.dt
-MT
/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/string/rtld-varshift.os
 -mno-sse -mno-mmx -mfpmath=387
In file included from ../sysdeps/x86_64/multiarch/strcspn-c.c:22:0,
                 from ../sysdeps/i386/i686/multiarch/strcspn-c.c:2:
../sysdeps/x86_64/multiarch/varshift.h: In function '__m128i_shift_right':
../sysdeps/x86_64/multiarch/varshift.h:26:1: error: SSE vector return without
SSE enabled changes the ABI [-Werror=psabi]
 {
 ^
In file included from
/home/dev01/data/toolchain/2017.02.5_X86_32/host/usr/lib/gcc/i686-buildroot-linux-gnu/4.9.4/include/pmmintrin.h:31:0,
                 from
/home/dev01/data/toolchain/2017.02.5_X86_32/host/usr/lib/gcc/i686-buildroot-linux-gnu/4.9.4/include/tmmintrin.h:31,
                 from
/home/dev01/data/toolchain/2017.02.5_X86_32/host/usr/lib/gcc/i686-buildroot-linux-gnu/4.9.4/include/smmintrin.h:32,
                 from
/home/dev01/data/toolchain/2017.02.5_X86_32/host/usr/lib/gcc/i686-buildroot-linux-gnu/4.9.4/include/nmmintrin.h:31,
                 from ../sysdeps/x86_64/multiarch/strcspn-c.c:20,
                 from ../sysdeps/i386/i686/multiarch/strcspn-c.c:2:
/home/dev01/data/toolchain/2017.02.5_X86_32/host/usr/lib/gcc/i686-buildroot-linux-gnu/4.9.4/include/emmintrin.h:692:1:
error: inlining failed in call to always_inline '_mm_loadu_si128': target
specific option mismatch
 _mm_loadu_si128 (__m128i const *__P)
 ^
In file included from ../sysdeps/x86_64/multiarch/strcspn-c.c:22:0,
                 from ../sysdeps/i386/i686/multiarch/strcspn-c.c:2:
../sysdeps/x86_64/multiarch/varshift.h:27:10: error: called from here
   return _mm_shuffle_epi8 (value,
          ^
In file included from
/home/dev01/data/toolchain/2017.02.5_X86_32/host/usr/lib/gcc/i686-buildroot-linux-gnu/4.9.4/include/smmintrin.h:32:0,
                 from
/home/dev01/data/toolchain/2017.02.5_X86_32/host/usr/lib/gcc/i686-buildroot-linux-gnu/4.9.4/include/nmmintrin.h:31,
                 from ../sysdeps/x86_64/multiarch/strcspn-c.c:20,
                 from ../sysdeps/i386/i686/multiarch/strcspn-c.c:2:
/home/dev01/data/toolchain/2017.02.5_X86_32/host/usr/lib/gcc/i686-buildroot-linux-gnu/4.9.4/include/tmmintrin.h:136:1:
error: inlining failed in call to always_inline '_mm_shuffle_epi8': target
specific option mismatch
 _mm_shuffle_epi8 (__m128i __X, __m128i __Y)
 ^
In file included from ../sysdeps/x86_64/multiarch/strcspn-c.c:22:0,
                 from ../sysdeps/i386/i686/multiarch/strcspn-c.c:2:
../sysdeps/x86_64/multiarch/varshift.h:27:10: error: called from here
   return _mm_shuffle_epi8 (value,
          ^
cc1: all warnings being treated as errors
/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/sysd-rules:1661:
recipe for target
'/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/string/rtld-strcspn-c.os'
failed
make[6]: ***
[/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/string/rtld-strcspn-c.os]
Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from ../sysdeps/x86_64/multiarch/varshift.c:19:0,
                 from ../sysdeps/i386/i686/multiarch/varshift.c:1:
../sysdeps/x86_64/multiarch/varshift.h: In function '__m128i_shift_right':
../sysdeps/x86_64/multiarch/varshift.h:26:1: error: SSE vector return without
SSE enabled changes the ABI [-Werror=psabi]
 {
 ^
cc1: all warnings being treated as errors
/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/sysd-rules:1661:
recipe for target
'/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/string/rtld-varshift.os'
failed
make[6]: ***
[/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/string/rtld-varshift.os]
Error 1
../o-iterator.mk:9: recipe for target
'/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/string/rtld-strchr.os'
failed
make[5]: ***
[/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/string/rtld-strchr.os]
Error 2
Makefile:376: recipe for target
'/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/elf/rtld-libc.a'
failed
make[4]: ***
[/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/build/elf/rtld-libc.a]
Error 2
Makefile:214: recipe for target 'elf/subdir_lib' failed
make[3]: *** [elf/subdir_lib] Error 2
Makefile:9: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:216: recipe for target
'/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/.stamp_built'
failed
make[1]: ***
[/home/dev01/data/projects/buildroot-2017.02.5_X86_32/output/build/glibc-2.24/.stamp_built]
Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
