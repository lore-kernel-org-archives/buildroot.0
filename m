From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 04 Sep 2007 17:32:37 +0100
Subject: [Buildroot] libusb compile error
Message-ID: <46DD88A5.5070708@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am trying to get libusb to compile with my i686 buildroot target.

When I run the compile it fails with this error:

/bin/sh ../libtool --mode=link
/home/willw/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-g++
-Os -pipe  -I/home/willw/buildroot/build_i686/staging_dir/usr/include
-I/home/willw/buildroot/build_i686/staging_dir/include
--sysroot=/home/willw/buildroot/build_i686/staging_dir/ -isysroot
/home/willw/buildroot/build_i686/staging_dir -mtune=i686 -march=i686  -g
-O2   -o descriptor_test  descriptor_test.o ../libusbpp.la
libtool: link: warning: library
`/home/willw/buildroot/build_i686/staging_dir/usr/bin/../lib/gcc/i686-linux-uclibc/4.2.1/../../../../i686-linux-uclibc/lib/libstdc++.la' 

was moved.
/home/willw/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-g++
-Os -pipe -I/home/willw/buildroot/build_i686/staging_dir/usr/include
-I/home/willw/buildroot/build_i686/staging_dir/include
--sysroot=/home/willw/buildroot/build_i686/staging_dir/ -isysroot
/home/willw/buildroot/build_i686/staging_dir -mtune=i686 -march=i686 -g
-O2 -o .libs/descriptor_test descriptor_test.o  ../.libs/libusbpp.so
-L/home/willw/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/src 

-L/home/willw/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/src/.libs 

-L/home/willw/buildroot/toolchain_build_i686/gcc-4.2.1-final/./gcc
-L/home/willw/buildroot/build_i686/staging_dir/lib
-L/home/willw/buildroot/build_i686/staging_dir/usr/lib -Wl,--rpath
-Wl,//lib -Wl,--rpath
-Wl,/home/willw/buildroot/build_i686/staging_dir/usr/bin/../lib/gcc/i686-linux-uclibc/4.2.1/../../../../i686-linux-uclibc/lib
/home/willw/buildroot/build_i686/staging_dir/usr/bin/../lib/gcc/i686-linux-uclibc/4.2.1/../../../../i686-linux-uclibc/bin/ld: 

warning: libc.so.6, needed by //lib/libusb-0.1.so.4, may conflict with
libc.so.0
/home/willw/buildroot/build_i686/staging_dir/usr/bin/../lib/gcc/i686-linux-uclibc/4.2.1/../../../../i686-linux-uclibc/bin/ld: 

errno: TLS definition in //lib/libc.so.6 section .tbss mismatches
non-TLS definition in
/home/willw/buildroot/build_i686/staging_dir//lib/libc.so.0 section .bss
//lib/libc.so.6: could not read symbols: Bad value
collect2: ld returned 1 exit status


Can anyone suggest what is wrong?

Thanks,

Will.
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
