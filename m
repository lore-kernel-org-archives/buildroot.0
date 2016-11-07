From: Siva Prakash Reddy Nareddy <subbu3881@gmail.com>
Date: Mon, 7 Nov 2016 14:34:35 +0530
Subject: [Buildroot] busybox error
Message-ID: <CANO2Q29C45jEphAw5nzo_x7j4WjumkfNyE0qf+_B-G1pw_VqbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
      I am getting the below errors while executing buildroot for
MPC8323E-RDB development board.


 LINK    busybox_unstripped
Trying libraries: crypt m
Failed: -Wl,--start-group  -lcrypt -lm  -Wl,--end-group
Output of:
/home/buildroot-labs/buildroot/output/host/usr/bin/powerpc-linux-musl-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g2
-Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused
-Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes
-Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement
-Wold-style-definition -fno-builtin-strlen -finline-limit=0
-fomit-frame-pointer -ffunction-sections -fdata-sections
-fno-guess-branch-probability -funsigned-char -static-libgcc
-falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1
-fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os
-o busybox_unstripped -Wl,--sort-common -Wl,--sort-section,alignment
-Wl,--gc-sections -Wl,--start-group applets/built-in.o archival/lib.a
archival/libarchive/lib.a console-tools/lib.a coreutils/lib.a
coreutils/libcoreutils/lib.a debianutils/lib.a e2fsprogs/lib.a
editors/lib.a findutils/lib.a init/lib.a libbb/lib.a libpwdgrp/lib.a
loginutils/lib.a mailutils/lib.a miscutils/lib.a modutils/lib.a
networking/lib.a networking/libiproute/lib.a networking/udhcp/lib.a
printutils/lib.a procps/lib.a runit/lib.a selinux/lib.a shell/lib.a
sysklogd/lib.a util-linux/lib.a util-linux/volume_id/lib.a
archival/built-in.o archival/libarchive/built-in.o console-tools/built-in.o
coreutils/built-in.o coreutils/libcoreutils/built-in.o
debianutils/built-in.o e2fsprogs/built-in.o editors/built-in.o
findutils/built-in.o init/built-in.o libbb/built-in.o libpwdgrp/built-in.o
loginutils/built-in.o mailutils/built-in.o miscutils/built-in.o
modutils/built-in.o networking/built-in.o networking/libiproute/built-in.o
networking/udhcp/built-in.o printutils/built-in.o procps/built-in.o
runit/built-in.o selinux/built-in.o shell/built-in.o sysklogd/built-in.o
util-linux/built-in.o util-linux/volume_id/built-in.o -Wl,--end-group
-Wl,--start-group -lcrypt -lm -Wl,--end-group
==========
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(mulsf3.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(floatunsisf.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(adddf3.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(subdf3.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(muldf3.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(divdf3.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(eqdf2.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(nedf2.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(gedf2.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(gtdf2.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(ledf2.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(ltdf2.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(fixdfsi.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(floatsidf.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(floatunsidf.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(extendsfdf2.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(_fixunsdfsi.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(_fixdfdi.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(_fixunsdfdi.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(_floatdidf.o)
uses hard float, busybox_unstripped uses soft float
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/../../../../powerpc-linux-musl/bin/ld:
Warning:
/home/buildroot-labs/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-linux-musl/5.3.0/libgcc.a(_floatundidf.o)
uses hard float, busybox_unstripped uses soft float
miscutils/lib.a(runlevel.o): In function `runlevel_main':
/home/buildroot-labs/buildroot/output/build/busybox-1.25.1/miscutils/runlevel.c:35:
undefined reference to `utmpxname'
collect2: error: ld returned 1 exit status
Note: if build needs additional libraries, put them in CONFIG_EXTRA_LDLIBS.
Example: CONFIG_EXTRA_LDLIBS="pthread dl tirpc audit pam"
Makefile:717: recipe for target 'busybox_unstripped' failed
make[1]: *** [busybox_unstripped] Error 1
make[1]: Leaving directory
'/home/buildroot-labs/buildroot/output/build/busybox-1.25.1'
package/pkg-generic.mk:216: recipe for target
'/home/buildroot-labs/buildroot/output/build/busybox-1.25.1/.stamp_built'
failed
make: ***
[/home/buildroot-labs/buildroot/output/build/busybox-1.25.1/.stamp_built]
Error 2




Please explain to make us understanding over the above error.

Thanks&regards,
Siva Prakash.
-- 
*SIVA*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161107/fad142ec/attachment.html>
