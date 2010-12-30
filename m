From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 30 Dec 2010 13:43:52 -0600
Subject: [Buildroot] Multiple build errors on the target toolchain for mips:
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBFB0@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

I pulled the latest git from you this morning and attempted to build
(worked for the git from two days ago).  The errors are to great to put
in this message, but some of the first errors are below.

I'm thinking that there is a $CC not being set somewhere -- as this is
building with /usr/bin/gcc:

/usr/bin/gcc -c -DIN_GCC   -O2
-I/root/src/PRODUCTION/newbuildroo/a/output/host/include
-I/root/src/PRODUCTION/newbuildroo/a/output/host/usr/include
-DGENERATOR_FILE -I. -Ibuild
-I/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc
-I/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc/buil
d
-I/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc/../i
nclude
-I/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc/../l
ibcpp/include
-I/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-
uclibc/sysroot/usr/include
-I/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-
uclibc/sysroot/usr/include
-I/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-
uclibc/sysroot/usr/include
-I/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc/../l
ibdecnumber
-I/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc/../l
ibdecnumber/dpd -I../libdecnumber     \
                -o build/genmodes.o
/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc/genmod
es.c
In file included from
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/stdio.h:36,
                 from
/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc/system
.h:42,
                 from
/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc/genche
cksum.c:22:
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:132:3: error: #error your machine
is neither 32 bit or 64 bit ... it must be magical
In file included from
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/stdio.h:36,
                 from
/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc/system
.h:42,
                 from
/root/src/PRODUCTION/newbuildroo/a/output/toolchain/gcc-4.5.2/gcc/genche
cksum.c:22:
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:137: error: expected '=', ',',
';', 'asm' or '__attribute__' before '__UQUAD_TYPE'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:138: error: expected '=', ',',
';', 'asm' or '__attribute__' before 'unsigned'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:139: error: expected '=', ',',
';', 'asm' or '__attribute__' before 'unsigned'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:140: error: expected '=', ',',
';', 'asm' or '__attribute__' before 'unsigned'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:141: error: expected '=', ',',
';', 'asm' or '__attribute__' before '__UQUAD_TYPE'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:142: error: expected '=', ',',
';', 'asm' or '__attribute__' before 'unsigned'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:143: error: expected '=', ',',
';', 'asm' or '__attribute__' before '__UWORD_TYPE'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:144: error: expected '=', ',',
';', 'asm' or '__attribute__' before 'long'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:145: error: expected '=', ',',
';', 'asm' or '__attribute__' before '__SQUAD_TYPE'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:146: error: expected '=', ',',
';', 'asm' or '__attribute__' before 'int'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:147: error: expected '=', ',',
';', 'asm' or '__attribute__' before 'struct'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:148: error: expected '=', ',',
';', 'asm' or '__attribute__' before 'long'
/root/src/PRODUCTION/newbuildroo/a/output/host/usr/mips-unknown-linux-uc
libc/sysroot/usr/include/bits/types.h:149: error: expected '=', ',',
';', 'asm' or '__attribute__' before 'unsigned'



This one compile error goes on for more that 4 screens @ 65 lines /
screen.

I'm looking for the culprit, but you probably know more along the lines
of the oops than me.

Cheers,
Andy
