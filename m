From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 12 Nov 2006 14:53:27 +0100
Subject: [Buildroot] gcc-4.1.1 and uClibc snapshot.
Message-ID: <20061112135327.GA19731@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not sure this has anything to do with neither but I'd rather post one
possible glitch too many.

newest snapshot of both uClibc and buildroot, gcc-4.1.1, locale/gettext
turned on in buildroot/.config

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
make[2]: *** [crtbeginT.o] Error 1
make[2]: *** [crtbegin.o] Error 1
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1-initial'
make: ***
[/local/export/floppyfw/uclibc/buildroot/toolchain_build_i386/gcc-4.1.1-initial/.compiled]
Error 2
