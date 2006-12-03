From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 3 Dec 2006 11:39:45 +0100
Subject: [Buildroot] gcc-4.1.1 and uClibc snapshot, again.
Message-ID: <20061203103945.GA2347@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm starting with a simple question; is buildroot/uClibc supposed to
work without WCHAR? I've basically given up on largefile but I don't see
the big need for compulsary locale and wchar support in an embedded
system.

anyway; it may be a problem now at least. not sure if it's the real
reason the build bombs but at least it gives annoying warnings:

/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1-initial/./gcc/xgcc
-B/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1-initial/./gcc/
-B/local/export/floppyfw/uclibc/buildroot/build_i386/staging_dir/i386-linux-uclibc/bin/
-B/local/export/floppyfw/uclibc/buildroot/build_i386/staging_dir/i386-linux-uclibc/lib/
-isystem
/local/export/floppyfw/uclibc/buildroot/build_i386/staging_dir/i386-linux-uclibc/include
-isystem
/local/export/floppyfw/uclibc/buildroot/build_i386/staging_dir/i386-linux-uclibc/sys-include
-O2 -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -I. -I.
-I/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc
-I/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/.
-I/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/../include
-I/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/../libcpp/include
-g0 -finhibit-size-directive -fno-inline-functions -fno-exceptions
-fno-zero-initialized-in-bss -fno-unit-at-a-time
-fno-omit-frame-pointer \
  -c
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/crtstuff.c
-DCRT_BEGIN -DCRTSTUFFT_O \
  -o crtbeginT.o
In file included from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/stdio.h:72,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/tsystem.h:90,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/crtstuff.c:68:
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:100:19:
error: wchar.h: No such file or directory
In file included from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/stdio.h:72,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/tsystem.h:90,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/crtstuff.c:68:
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:194:
error: expected specifier-qualifier-list before '__mbstate_t'
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:205:
error: expected specifier-qualifier-list before '__mbstate_t'
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:292:
error: expected specifier-qualifier-list before '__mbstate_t'
In file included from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/stdio.h:72,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/tsystem.h:90,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/crtstuff.c:68:
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:100:19:
error: wchar.h: No such file or directory
In file included from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/stdio.h:72,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/tsystem.h:90,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/crtstuff.c:68:
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:194:
error: expected specifier-qualifier-list before '__mbstate_t'
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:205:
error: expected specifier-qualifier-list before '__mbstate_t'
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:292:
error: expected specifier-qualifier-list before '__mbstate_t'
make[2]: *** [crtbeginS.o] Error 1
make[2]: *** Waiting for unfinished jobs....
In file included from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/stdio.h:72,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/tsystem.h:90,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/crtstuff.c:68:
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:100:19:
error: wchar.h: No such file or directory
In file included from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/stdio.h:72,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/tsystem.h:90,
                 from
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1/gcc/crtstuff.c:68:
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:194:
error: expected specifier-qualifier-list before '__mbstate_t'
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:205:
error: expected specifier-qualifier-list before '__mbstate_t'
/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/uClibc_dev//usr/include/bits/uClibc_stdio.h:292:
error: expected specifier-qualifier-list before '__mbstate_t'
make[2]: *** [crtbegin.o] Error 1
make[2]: *** [crtbeginT.o] Error 1
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1-initial'
make: ***
[/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1-initial/.compiled]
Error 2


Thomas.
