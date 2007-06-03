From: Ormund Williams <ormundw@panix.com>
Date: Sat, 02 Jun 2007 22:07:25 -0400
Subject: [Buildroot] Unable to build busybox
Message-ID: <1180836445.4532.16.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All

I run into the following error, I'm lost as to where to look to solve
this.

========================================>
  LINK    busybox_unstripped
miscutils/lib.a(taskset.o): In function `taskset_main':
taskset.c:(.text.taskset_main+0x11f): undefined reference to
`sched_getaffinity'
taskset.c:(.text.taskset_main+0x1e6): undefined reference to
`sched_setaffinity'
collect2: ld returned 1 exit status
/home/ormund/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-strip: 'busybox_unstripped': No such file
make[1]: Leaving directory `/home/ormund/buildroot/build_i686/busybox'
make -j1
CC=/home/ormund/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc CROSS_COMPILE="/home/ormund/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-" \

CROSS="/home/ormund/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-" PREFIX="/home/ormund/buildroot/build_i686/root" \
                ARCH=i386 \
                EXTRA_CFLAGS="-Os -pipe "
-C /home/ormund/buildroot/build_i686/busybox install
make[1]: Entering directory `/home/ormund/buildroot/build_i686/busybox'
  LINK    busybox_unstripped
miscutils/lib.a(taskset.o): In function `taskset_main':
taskset.c:(.text.taskset_main+0x11f): undefined reference to
`sched_getaffinity'
taskset.c:(.text.taskset_main+0x1e6): undefined reference to
`sched_setaffinity'
collect2: ld returned 1 exit status
/home/ormund/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-strip: 'busybox_unstripped': No such file
install: cannot stat `busybox': No such file or directory
make[1]: *** [install] Error 1
make[1]: Leaving directory `/home/ormund/buildroot/build_i686/busybox'
make: *** [/home/ormund/buildroot/build_i686/root/bin/busybox] Error 2

-- 
Ormund Williams <ormundw@panix.com>
OrmLab LLC
