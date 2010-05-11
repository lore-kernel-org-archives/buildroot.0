From: Chris Kerios <ckerios@gmail.com>
Date: Tue, 11 May 2010 18:29:49 -0400
Subject: [Buildroot] Buildroot 2010 rc2 fails to build
Message-ID: <AANLkTim8u-blOgAiVpxjWfe1VuQ06EUIsgJ0zz_jWYxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am building for a Geode LX using the latest release candidate - rc2.  I am
getting a failure when buildroot is building the gdb 6.8 packages.  It is
trying to resolve an undefined reference to "usleep".  The output is
attached below.  I redid my .config to not build the gdb packages and it
then goes on a ways and fails when building busybox with the same unresolved
reference to usleep.  I get successful builds with the 2010.02 release with
no changes in my config file.  Any ideas???

Also, I noticed with the rc2 release the uClibc is prompting me for answers
to questions.  Is this expected to be expected as I don't have to do this
for the 2010.02 release?

Chris

/home/chris/buildroot-2010.05-rc2/output/staging/usr/bin/i586-unknown-linux-uclibc-gcc
-Os -pipe -Os  -mtune=geode -march=geode -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/chris/buildroot-2010.05-rc2/output/staging/usr/include
-I/home/chris/buildroot-2010.05-rc2/output/staging/include
--sysroot=/home/chris/buildroot-2010.05-rc2/output/staging/ -isysroot
/home/chris/buildroot-2010.05-rc2/output/staging -Os -pipe -Os  -mtune=geode
-march=geode -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/chris/buildroot-2010.05-rc2/output/staging/usr/include
-I/home/chris/buildroot-2010.05-rc2/output/staging/include
--sysroot=/home/chris/buildroot-2010.05-rc2/output/staging/ -isysroot
/home/chris/buildroot-2010.05-rc2/output/staging
-L/home/chris/buildroot-2010.05-rc2/output/staging/lib
-L/home/chris/buildroot-2010.05-rc2/output/staging/usr/lib
--sysroot=/home/chris/buildroot-2010.05-rc2/output/staging/ -Wno-error
\
        -o gdb gdb.o libgdb.a \
           ../readline/libreadline.a ../opcodes/libopcodes.a
../bfd/libbfd.a  ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a
-lncurses -lm   ../libiberty/libiberty.a  -ldl -rdynamic
libgdb.a(ser-tcp.o): In function `net_open':
ser-tcp.c:(.text+0x1ee): warning: gethostbyname is obsolescent, use
getnameinfo() instead.
libgdb.a(linux-nat.o): In function `linux_child_follow_fork':
linux-nat.c:(.text+0x4da3): undefined reference to `usleep'
collect2: ld returned 1 exit status
make[3]: *** [gdb] Error 1
make[3]: Leaving directory
`/home/chris/buildroot-2010.05-rc2/output/build/gdb-6.8-target/gdb'
make[2]: *** [all-gdb] Error 2
make[2]: Leaving directory
`/home/chris/buildroot-2010.05-rc2/output/build/gdb-6.8-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/chris/buildroot-2010.05-rc2/output/build/gdb-6.8-target'
make: ***
[/home/chris/buildroot-2010.05-rc2/output/build/gdb-6.8-target/gdb/gdb]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100511/8893ff9a/attachment.htm>
