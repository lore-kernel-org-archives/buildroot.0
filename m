From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Sun, 18 Jan 2009 08:53:18 +0900
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <451083.90600.qm@web56906.mail.re3.yahoo.com>
References: <451083.90600.qm@web56906.mail.re3.yahoo.com>
Message-ID: <49726F6E.1070505@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank Hoeflich wrote:
>     I believe you will find messages similar to the following in your
>     config.log:
> 
> /tmp/br/powerpc/toolchain_build_powerpc/gcc-4.3.2-initial/./gcc/cc1:
> error while loading shared libraries: libmpfr.so.1: cannot open shared
> object file: No such file or directory

It seems.  Here you are:

[toolchain_build_mips/gcc-4.3.2-initial/mips-linux-uclibc/libgcc/config.log]

--- 8< --- 8< --- 8< ---
Reading specs from /home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/./gcc/specs
Target: mips-linux-uclibc
Configured with: /home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2/configure --prefix=/home/skuribay/git/buildroot.git/build_mips/staging_dir/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=mips-linux-uclibc --enable-languages=c --with-sysroot=/home/skuribay/git/buildroot.git/toolchain_build_mips/uClibc_dev/ --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-shared --with-gmp=/home/skuribay/git/buildroot.git/toolchain_build_mips/gmp --with-mpfr=/home/skuribay/git/buildroot.git/toolchain_build_mips/mpfr --disable-nls --enable-threads --disable-multilib --disable-decimal-float --with-abi=32 --with-tune=mips4 -q --silent
Thread model: posix
gcc version 4.3.2 (GCC)
configure:2374: $? = 0
configure:2376:  /home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/./gcc/xgcc -B/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/./gcc/ -B/home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/bin/ -B/home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/lib/ -isystem /home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/include -isystem /home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/sys-include -V </dev/null >&5
xgcc: '-V' must come at the start of the command line
configure:2379: $? = 1
configure:2398:  /home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/./gcc/xgcc -B/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/./gcc/ -B/home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/bin/ -B/home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/lib/ -isystem /home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/include -isystem /home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/sys-include -o conftest -g -Os   conftest.c  >&5
/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/./gcc/cc1: error while loading shared libraries: libmpfr.so.1: cannot open shared object file: No such file or directory
configure:2401: $? = 1
configure:2567: checking for suffix of object files
configure:2588:  /home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/./gcc/xgcc -B/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/./gcc/ -B/home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/bin/ -B/home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/lib/ -isystem /home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/include -isystem /home/skuribay/git/buildroot.git/build_mips/staging_dir/usr/mips-linux-uclibc/sys-include -c -g -Os  conftest.c >&5
/home/skuribay/git/buildroot.git/toolchain_build_mips/gcc-4.3.2-initial/./gcc/cc1: error while loading shared libraries: libmpfr.so.1: cannot open shared object file: No such file or directory
configure:2591: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| 
| #define PACKAGE_NAME "GNU C Runtime Library"
| #define PACKAGE_TARNAME "libgcc"
| #define PACKAGE_VERSION "1.0"
| #define PACKAGE_STRING "GNU C Runtime Library 1.0"
| #define PACKAGE_BUGREPORT ""
| /* end confdefs.h.  */
| 
| int
| main ()
| {
| 
|   ;
|   return 0;
| }
configure:2605: error: cannot compute suffix of object files: cannot compile
See `config.log' for more details.
--- 8< --- 8< --- 8< ---

> away.  If you have a downrev host gcc, try upgrading it - the rc1
> candidate should build.

I'm sticking to ubuntu 8.04.01 for now, so couldn't give it a try,
sorry.

>     If the BR tools aren't going to flag this sort of downrev host
>     tool issue explicitly, there should at least be a note in the docs
>     about it somewhere (e.g. host gcc version 4.1.1-2 is known to be
>     too old to build this BR release, use at least 4.3.0-2).

Fully agreed, this is what I wanted to point out.  Thanks for your
clarification, Frank-san.

  Shinya
