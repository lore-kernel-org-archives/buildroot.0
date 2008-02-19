From: Mile Davidovic <md4uclibc@gmail.com>
Date: Tue, 19 Feb 2008 12:50:52 +0100
Subject: [Buildroot] Trouble with building MIPS cross compiler
Message-ID: <f185607a0802190350w7b545cb1sc3ccf4be2182ee41@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I am unable to build MIPS cross compiler, here is log:
cat /scratch/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/config/fp-bit.c
>> dp-bit.c
/scratch/buildroot/toolchain_build_mips/gcc-4.2.1-initial/./gcc/xgcc
-B/scratch/buildroot/toolchain_build_mips/gcc-4.2.1-initial/./gcc/
-B/scratch/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/bin/
-B/scratch/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/lib/
-isystem /scratch/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/include
-isystem /scratch/buildroot/build_mips/staging_dir/usr/mips-linux-uclibc/sys-include
-O2 -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -I. -I.
-I/scratch/buildroot/toolchain_build_mips/gcc-4.2.1/gcc
-I/scratch/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/.
-I/scratch/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/../include
-I/scratch/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/../libcpp/include
-I/scratch/buildroot/toolchain_build_mips/gmp/include
-I/scratch/buildroot/toolchain_build_mips/mpfr/include
-I/scratch/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/../libdecnumber
-I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions
-fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder   \
          -c /scratch/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/crtstuff.c
-DCRT_BEGIN \
          -o crtbegin.o
/scratch/buildroot/toolchain_build_mips/gcc-4.2.1/gcc/crtstuff.c:1:
error: unsupported combination: -mabicalls -mabi=eabi
gmake[2]: *** [crtbegin.o] Error 1
gmake[2]: Leaving directory
`/scratch/buildroot/toolchain_build_mips/gcc-4.2.1-initial/gcc'

Please find attached .config

Do we have any suggestion?

BR
Mile
-------------- next part --------------
A non-text attachment was scrubbed...
Name: a.config
Type: application/octet-stream
Size: 15064 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080219/233d0b82/attachment-0001.obj 
