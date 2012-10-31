From: Eial Czerwacki <eial@scalemp.com>
Date: Wed, 31 Oct 2012 17:11:05 +0200
Subject: [Buildroot] cannot compile a program within a uclibc build chroot
Message-ID: <50913F89.3000802@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I've created a image based on Buildroot 2012.08 with uclibc 0.9.33 and
gcc 4.6.0.
the build passed or and now I'm trying to compile iasl from within the
image (I've chrooted into it) but for some reason it fails, see:
/acpica-unix2-20121018 # make iasl
make[1]: Entering directory `/acpica-unix2-20121018/generate/unix/iasl'
gcc -c -m32 -D_LINUX -D_GNU_SOURCE -D_FORTIFY_SOURCE=2
-I../../../source/include -DSCMP_REMOVE_UNNEEDED -Os -DACPI_ASL_COMPILER
-I../../../source/compiler -Iobj32 -Wall -Werror
-oobj32/aslcompilerlex.o obj32/aslcompilerlex.c
gcc: error trying to exec
'/usr/lib/gcc/i686-unknown-linux-uclibc/4.6.0/../../../../i686-unknown-linux-uclibc/bin/as':
execv: No such file or directory
make[1]: *** [obj32/aslcompilerlex.o] Error 1
make[1]: Leaving directory `/acpica-unix2-20121018/generate/unix/iasl'
32-bit version of iasl:
ls: ../bin32/iasl: No such file or directory
make: *** [iasl] Error 1

the strange thing is that
"/usr/lib/gcc/i686-unknown-linux-uclibc/4.6.0/../../../../i686-unknown-linux-uclibc/bin/as"
exists, see:
/acpica-unix2-20121018 # ls -l
/usr/lib/gcc/i686-unknown-linux-uclibc/4.6.0/../../../../i686-unknown-linux-uclibc/bin/as
-rwxr-xr-x    1 root     root       1039488 Oct 31 09:07
/usr/lib/gcc/i686-unknown-linux-uclibc/4.6.0/../../../../i686-unknown-linux-uclibc/bin/as

here is the output of gcc -v:
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/i686-unknown-linux-uclibc/4.6.0/lto-wrapper
Target: i686-unknown-linux-uclibc
Configured with:
/home/envdev/buildroot-2012.08/output/toolchain/gcc-4.6.0/configure
--prefix=/usr --build=i686-pc-linux-gnu --host=i686-unknown-linux-uclibc
--target=i686-unknown-linux-uclibc --enable-languages=c
--with-gxx-include-dir=/usr/include/c++ --disable-__cxa_atexit
--enable-target-optspace --disable-libgomp --with-gnu-ld
--disable-libssp --disable-multilib --enable-tls --disable-shared
--disable-nls --enable-threads --disable-decimal-float --with-arch=i686
--with-tune=i686 --with-pkgversion='Buildroot 2012.08'
--with-bugurl=http://bugs.buildroot.net/
Thread model: posix
gcc version 4.6.0 (Buildroot 2012.08)

what am I doing wrong and how I can fix it?

Thanks.
