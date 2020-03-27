From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Mar 2020 13:56:46 +0000
Subject: [Buildroot] [Bug 12711] New: host-localedef 2.30-20 fails to
 compile on fedora 32 (gcc 10.0.1)
Message-ID: <bug-12711-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12711

            Bug ID: 12711
           Summary: host-localedef 2.30-20 fails to compile on fedora 32
                    (gcc 10.0.1)
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

host-localedef 2.30-20 fails to compile on fedora 32 (gcc 10.0.1)

/home/ian/build/hiwire-linux-c38cdaa1-x86_64/buildroot/host/bin/ccache
/usr/lib64/ccache/gcc programs/ld-ctype.c -c -std=gnu11 -fgnu89-inline  -O2
-Wall -Wwrite-strings -Wundef -Werror -fmerge-all-constants -frounding-math
-fno-stack-protector -Wstrict-prototypes -Wold-style-definition -fmath-errno   
      -I/home/ian/build/hiwire-linux-c38cdaa1-x86_64/buildroot/host/include
-DCOMPLOCALEDIR='"/usr/lib/locale"' -DLOCALE_ALIAS_PATH='"/usr/share/locale"'
-Iprograms -I../include
-I/home/ian/build/hiwire-linux-c38cdaa1-x86_64/buildroot/build/host-localedef-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/locale

-I/home/ian/build/hiwire-linux-c38cdaa1-x86_64/buildroot/build/host-localedef-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build
 -I../sysdeps/unix/sysv/linux/x86_64/64  -I../sysdeps/unix/sysv/linux/x86_64 
-I../sysdeps/unix/sysv/linux/x86/include -I../sysdeps/unix/sysv/linux/x86 
-I../sysdeps/x86/nptl  -I../sysdeps/unix/sysv/linux/wordsize-64 
-I../sysdeps/x86_64/nptl  -I../sysdeps/unix/sysv/linux/include
-I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl  -I../sysdeps/pthread 
-I../sysdeps/gnu  -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv 
-I../sysdeps/unix/x86_64  -I../sysdeps/unix  -I../sysdeps/posix 
-I../sysdeps/x86_64/64  -I../sysdeps/x86_64/fpu/multiarch 
-I../sysdeps/x86_64/fpu  -I../sysdeps/x86/fpu/include -I../sysdeps/x86/fpu 
-I../sysdeps/x86_64/multiarch  -I../sysdeps/x86_64  -I../sysdeps/x86 
-I../sysdeps/ieee754/float128  -I../sysdeps/ieee754/ldbl-96/include
-I../sysdeps/ieee754/ldbl-96  -I../sysdeps/ieee754/dbl-64/wordsize-64 
-I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32 
-I../sysdeps/wordsize-64  -I../sysdeps/ieee754  -I../sysdeps/generic  -I..
-I../libio -I.   -D_LIBC_REENTRANT -include
/home/ian/build/hiwire-linux-c38cdaa1-x86_64/buildroot/build/host-localedef-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/libc-modules.h
-DMODULE_NAME=locale_programs -include ../include/libc-symbols.h  
-DLOCALE_PATH='"/usr/lib/locale:/usr/share/i18n"'
-DCHARMAP_PATH='"/usr/share/i18n/charmaps"'
-DREPERTOIREMAP_PATH='"/usr/share/i18n/repertoiremaps"'
-DLOCSRCDIR='"/usr/share/i18n/locales"'    -DTOP_NAMESPACE=glibc -o
/home/ian/build/hiwire-linux-c38cdaa1-x86_64/buildroot/build/host-localedef-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/locale/ld-ctype.o
-MD -MP -MF
/home/ian/build/hiwire-linux-c38cdaa1-x86_64/buildroot/build/host-localedef-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/locale/ld-ctype.o.dt
-MT
/home/ian/build/hiwire-linux-c38cdaa1-x86_64/buildroot/build/host-localedef-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/locale/ld-ctype.o
programs/ld-ctype.c: In function ?ctype_finish?:
programs/ld-ctype.c:855:18: error: array subscript 0 is outside the bounds of
an interior zero-length array ?unsigned char[0]? [-Werror=zero-length-bounds]
  855 |  replace[0].bytes[0] = '?';
      |  ~~~~~~~~~~~~~~~~^~~
In file included from programs/repertoire.h:24,
                 from programs/localedef.h:32,
                 from programs/ld-ctype.c:35:
programs/charmap.h:63:17: note: while referencing ?bytes?
   63 |   unsigned char bytes[0];
      |                 ^~~~~
programs/ld-ctype.c:856:18: error: array subscript 1 is outside the bounds of
an interior zero-length array ?unsigned char[0]? [-Werror=zero-length-bounds]
  856 |  replace[0].bytes[1] = '\0';
      |  ~~~~~~~~~~~~~~~~^~~
In file included from programs/repertoire.h:24,
                 from programs/localedef.h:32,
                 from programs/ld-ctype.c:35:
programs/charmap.h:63:17: note: while referencing ?bytes?
   63 |   unsigned char bytes[0];
      |                 ^~~~~
cc1: all warnings being treated as errors

-- 
You are receiving this mail because:
You are on the CC list for the bug.
