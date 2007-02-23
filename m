From: Thomas Lundquist <lists@zelow.no>
Date: Fri, 23 Feb 2007 07:56:20 +0100
Subject: [Buildroot] make menuconfig in a buildroot env.
In-Reply-To: <20070222195010.GA30949@zelow.no>
References: <20070222195010.GA30949@zelow.no>
Message-ID: <20070223065620.GB30949@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 22, 2007 at 08:50:11PM +0100, Thomas Lundquist wrote:
> 
> I've made a buildroot development environment and have a buildroot
> checkout in it.
> 
> I've done this many times before but since the last time I did it, this
> have started to happen:
> 
> It is not the ncurses library since another (earlier) br2 I have works in 
> the same built rootfs.

BTW; just typing make (and not use menuconfig, doesen't work either, it
bombs in uClibc:

set -x && make MAKE="make -j1" -C
/buildroot.rolls/toolchain_build_i686/uClibc \
                PREFIX=/buildroot.rolls/toolchain_build_i686/uClibc_dev/
\
                DEVEL_PREFIX=/usr/ \
                RUNTIME_PREFIX=/buildroot.rolls/toolchain_build_i686/uClibc_dev/
\
                HOSTCC="gcc" \
                pregen install_dev
+ make 'MAKE=make -j1' -C /buildroot.rolls/toolchain_build_i686/uClibc
PREFIX=/buildroot.rolls/toolchain_build_i686/uClibc_dev/
DEVEL_PREFIX=/usr/
RUNTIME_PREFIX=/buildroot.rolls/toolchain_build_i686/uClibc_dev/
HOSTCC=gcc pregen install_dev
/bin/sh:
/buildroot.rolls/build_i686/staging_dir/bin/i686-linux-uclibc-gcc: No
such file or directory
make[1]:
/buildroot.rolls/build_i686/staging_dir/bin/i686-linux-uclibc-gcc:
Command not found
make[1]: Entering directory
`/buildroot.rolls/toolchain_build_i686/uClibc'
make[1]:
/buildroot.rolls/build_i686/staging_dir/bin/i686-linux-uclibc-gcc:
Command not found
/bin/sh:
/buildroot.rolls/build_i686/staging_dir/bin/i686-linux-uclibc-gcc: No
such file or directory
make[2]:
/buildroot.rolls/build_i686/staging_dir/bin/i686-linux-uclibc-gcc:
Command not found
make[2]:
/buildroot.rolls/build_i686/staging_dir/bin/i686-linux-uclibc-gcc:
Command not found
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -DKBUILD_NO_NLS  -c
lxdialog/checklist.c -o lxdialog/checklist.o
In file included from lxdialog/dialog.h:32,
                 from lxdialog/checklist.c:24:
/usr/include/ncurses.h:66:25: error: ncurses_dll.h: No such file or
directory
In file included from /usr/include/ncurses.h:123,
                 from lxdialog/dialog.h:32,
                 from lxdialog/checklist.c:24:
