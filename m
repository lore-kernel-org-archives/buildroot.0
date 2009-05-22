From: Paul Archer <ptarcher@gmail.com>
Date: Fri, 22 May 2009 13:32:40 +1000
Subject: [Buildroot] GCC-4.3.3 in toolchain fails to compile
Message-ID: <56ea0bb80905212032x1e01cdfbt4c427fc85c9b72e3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey all,

I am trying to build buildroot-2009.05-rc2 for the AT91SAM9G20,
however I keep getting gcc compiler errors no matter which version I
pick, either gcc-4.2.4, gcc-4.3.2/3 and gcc-4.4.x also fails. Versions
>=gcc4.3.2 all fail with the build error below.

It seems __DTOR_LIST__ is not being defined, but I don't really know
where to configure this to get it to be defined.

/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3-initial/./gcc/xgcc
-B/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3-initial/./gcc/
-B/home/paul/downloads/src/buildroot-2009.05-rc2/build_arm/staging_dir/usr/arm-linux-uclibc/bin/
-B/home/paul/downloads/src/buildroot-2009.05-rc2/build_arm/staging_dir/usr/arm-linux-uclibc/lib/
-isystem /home/paul/downloads/src/buildroot-2009.05-rc2/build_arm/staging_dir/usr/arm-linux-uclibc/include
-isystem /home/paul/downloads/src/buildroot-2009.05-rc2/build_arm/staging_dir/usr/arm-linux-uclibc/sys-include
-g -Os -O2 -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE   -W -Wall
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-Wold-style-definition  -isystem ./include  -I. -I.
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/gcc
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/gcc/.
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/gcc/../include
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/gcc/../libcpp/include
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gmp/include
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/mpfr/include
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/gcc/../libdecnumber
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/gcc/../libdecnumber/dpd
-I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions
-fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder
-fno-tree-vectorize  -I. -I. -I../.././gcc
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/libgcc
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/libgcc/.
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc
-I/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/libgcc/../include
 -o crtbegin.o -MT crtbegin.o -MD -MP -MF crtbegin.dep  \
          -c /home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c
-DCRT_BEGIN
/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:
In function ?__do_global_dtors_aux?:
/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306:
error: ?__DTOR_LIST__? undeclared (first use in this function)
/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306:
error: (Each undeclared identifier is reported only once
/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306:
error: for each function it appears in.)
make[2]: *** [crtbegin.o] Error 1
make[2]: Leaving directory
`/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3-initial/arm-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory
`/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3-initial'
make: *** [/home/paul/downloads/src/buildroot-2009.05-rc2/toolchain_build_arm/gcc-4.3.3-initial/.compiled]
Error 2

I have attached my config file incase anyone wants to test.

I am running ubuntu 9.04,
$ uname --all
Linux indiana 2.6.28-11-server #42-Ubuntu SMP Fri Apr 17 02:48:10 UTC
2009 i686 GNU/Linux
$ gcc --version
gcc (Ubuntu 4.3.3-5ubuntu4) 4.3.3

-- 
----
Regards
Paul Archer
ptarcher at gmail.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 20080 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090522/8853915a/attachment-0001.obj>
