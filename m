From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 11 Apr 2012 15:49:47 +0300
Subject: [Buildroot] Selecting X11R7/xorg-server fails to compile
Message-ID: <CALR4fEKzdOYyqTz7BdH=oDWCPbUn5LBnc6BFX1E19uwYRX80yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Choosing  "make qemu_x86_defconfig" and the default external toolchain
(Sourcery CodeBench x86/x86_64 2011.09) , the selecting X11R7/xorg-server
fails to compile here (Ubuntu 12.04, 64bit):


libtool: link:
/home/diego/src/buildroot/output/host/usr/bin/i686-pc-linux-gnu-gcc -pipe
-Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o
drmstat drmstat.o  ../.libs/libdrm.so -Wl,-rpath
-Wl,/home/diego/src/buildroot/output/build/libdrm-2.4.19/.libs
mv -f .deps/dristat.Tpo .deps/dristat.Po
/bin/bash ../libtool --tag=CC   --mode=link
/home/diego/src/buildroot/output/host/usr/bin/i686-pc-linux-gnu-gcc  -pipe
-Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -o
dristat dristat.o ../libdrm.la
libtool: link:
/home/diego/src/buildroot/output/host/usr/bin/i686-pc-linux-gnu-gcc -pipe
-Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o
dristat dristat.o  ../.libs/libdrm.so -Wl,-rpath
-Wl,/home/diego/src/buildroot/output/build/libdrm-2.4.19/.libs
/home/diego/src/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.6.1/../../../../i686-pc-linux-gnu/bin/ld:
dristat.o: undefined reference to symbol 'clock_gettime@@GLIBC_2.2'
/home/diego/src/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.6.1/../../../../i686-pc-linux-gnu/bin/ld:
note: 'clock_gettime@@GLIBC_2.2' is defined in DSO
/home/diego/src/buildroot/output/host/usr/i686-unknown-linux-gnu/sysroot/lib/librt.so.1
so try adding it to the linker command line
/home/diego/src/buildroot/output/host/usr/i686-unknown-linux-gnu/sysroot/lib/librt.so.1:
could not read symbols: Invalid operation
collect2: ld returned 1 exit status
make[4]: *** [dristat] Error 1
make[4]: Leaving directory
`/home/diego/src/buildroot/output/build/libdrm-2.4.19/tests'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/diego/src/buildroot/output/build/libdrm-2.4.19/tests'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/diego/src/buildroot/output/build/libdrm-2.4.19'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/diego/src/buildroot/output/build/libdrm-2.4.19'
make: ***
[/home/diego/src/buildroot/output/build/libdrm-2.4.19/.stamp_built] Error 2
diego at diego-Latitude-E6420:buildroot$ make menuconfig


I see no options to disable those tests. Cany anyone help me?

- diego
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120411/a6320f3e/attachment.html>
