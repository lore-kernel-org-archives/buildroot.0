From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 28 Jul 2013 12:25:28 +0200
Subject: [Buildroot] buildroot internal arm toolchain: gcc-final fails with
 supposedly large-file support
Message-ID: <CAAXf6LWPA6C9EUpyqjZnjz2mtECRzoKLtwsGJrde7PHdUCUW8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried building a simple arm toolchain with buildroot, and bumped on
a build error on gcc-final:

/home/tdescham/repo/contrib/buildroot-outgoing/output/build/host-gcc-final-4.7.3/build/./gcc/xgcc
-B/home/tdescham/repo/contrib/buildroot-outgoing/output/build/host-gcc-final-4.7.3/build/./gcc/
-B/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/bin/
-B/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/lib/
-isystem /home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/include
-isystem /home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sys-include
   -g -Os -O2 -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include  -I.
-I. -I../.././gcc -I../../../libgcc -I../../../libgcc/.
-I../../../libgcc/../gcc -I../../../libgcc/../include   -g0
-finhibit-size-directive -fno-inline -fno-exceptions
-fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize
-fno-stack-protector  -I. -I. -I../.././gcc -I../../../libgcc
-I../../../libgcc/. -I../../../libgcc/../gcc
-I../../../libgcc/../include  -o crtbeginS.o -MT crtbeginS.o -MD -MP
-MF crtbeginS.dep  -fPIC -c ../../../libgcc/crtstuff.c -DCRT_BEGIN
-DCRTSTUFFS_O
In file included from
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:28:0,
                 from ../../../libgcc/../gcc/tsystem.h:88,
                 from ../../../libgcc/crtstuff.c:62:
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/features.h:219:5:
error: #error It appears you have defined _FILE_OFFSET_BITS=64.
Unfortunately, uClibc was built without large file support enabled.
In file included from
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:72:0,
                 from ../../../libgcc/../gcc/tsystem.h:88,
                 from ../../../libgcc/crtstuff.c:62:
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:61:2:
error: #error Sorry... uClibc was built without large file support!
In file included from
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:28:0,
                 from ../../../libgcc/../gcc/tsystem.h:88,
                 from ../../../libgcc/crtstuff.c:62:
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/features.h:219:5:
error: #error It appears you have defined _FILE_OFFSET_BITS=64.
Unfortunately, uClibc was built without large file support enabled.
In file included from
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:72:0,
                 from ../../../libgcc/../gcc/tsystem.h:88,
                 from ../../../libgcc/crtstuff.c:62:
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:61:2:
error: #error Sorry... uClibc was built without large file support!
In file included from ../../../libgcc/../gcc/tsystem.h:88:0,
                 from ../../../libgcc/crtstuff.c:62:
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:83:1:
error: unknown type name ?__STDIO_fpos64_t?
In file included from ../../../libgcc/../gcc/tsystem.h:88:0,
                 from ../../../libgcc/crtstuff.c:62:
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:83:1:
error: unknown type name ?__STDIO_fpos64_t?
/home/tdescham/repo/contrib/buildroot-outgoing/output/build/host-gcc-final-4.7.3/build/./gcc/xgcc
-B/home/tdescham/repo/contrib/buildroot-outgoing/output/build/host-gcc-final-4.7.3/build/./gcc/
-B/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/bin/
-B/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/lib/
-isystem /home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/include
-isystem /home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sys-include
   -g -Os -O2 -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include  -I.
-I. -I../.././gcc -I../../../libgcc -I../../../libgcc/.
-I../../../libgcc/../gcc -I../../../libgcc/../include   -g0
-finhibit-size-directive -fno-inline -fno-exceptions
-fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize
-fno-stack-protector  -I. -I. -I../.././gcc -I../../../libgcc
-I../../../libgcc/. -I../../../libgcc/../gcc
-I../../../libgcc/../include  -o crtbeginT.o -MT crtbeginT.o -MD -MP
-MF crtbeginT.dep  -c ../../../libgcc/crtstuff.c -DCRT_BEGIN
-DCRTSTUFFT_O
In file included from
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:28:0,
                 from ../../../libgcc/../gcc/tsystem.h:88,
                 from ../../../libgcc/crtstuff.c:62:
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/features.h:219:5:
error: #error It appears you have defined _FILE_OFFSET_BITS=64.
Unfortunately, uClibc was built without large file support enabled.
In file included from
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:72:0,
                 from ../../../libgcc/../gcc/tsystem.h:88,
                 from ../../../libgcc/crtstuff.c:62:
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:61:2:
error: #error Sorry... uClibc was built without large file support!
In file included from ../../../libgcc/../gcc/tsystem.h:88:0,
                 from ../../../libgcc/crtstuff.c:62:
/home/tdescham/repo/contrib/buildroot-outgoing/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:83:1:
error: unknown type name ?__STDIO_fpos64_t?
make[3]: *** [crtbegin.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [crtbeginS.o] Error 1
make[3]: *** [crtbeginT.o] Error 1
make[3]: Leaving directory
`/home/tdescham/repo/contrib/buildroot-outgoing/output/build/host-gcc-final-4.7.3/build/arm-buildroot-linux-uclibcgnueabi/libgcc'
make[2]: *** [all-target-libgcc] Error 2
make[2]: Leaving directory
`/home/tdescham/repo/contrib/buildroot-outgoing/output/build/host-gcc-final-4.7.3/build'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/tdescham/repo/contrib/buildroot-outgoing/output/build/host-gcc-final-4.7.3/build'
make: *** [/home/tdescham/repo/contrib/buildroot-outgoing/output/build/host-gcc-final-4.7.3/.stamp_built]
Error 2


The .config file is in attachment.
Largefile support is not enabled, yet for some reason gcc thinks it
is. I haven't been able to look into detail why this is so.

Best regards,
Thomas
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 37725 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130728/08542920/attachment-0001.obj>
