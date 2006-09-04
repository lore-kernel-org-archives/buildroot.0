From: don <don_reid@comcast.net>
Date: Sun, 3 Sep 2006 17:18:41 -0700
Subject: [Buildroot] Kernel Module compiled outside kernel
Message-ID: <20060904001841.GB16191@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Of course as soon as I say I can't get verbose to work ,it starts
working...)  Here is the long gory output (again with the path
shortened).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
make -j2 PATH=.../build_i486/staging_dir/bin:.../toolchain_build_i486/bin:/bin:/sbin:/usr/bin:/usr/sbin AR=.../build_i486/staging_dir/bin/i486-linux-uclibc-ar AS=.../build_i486/staging_dir/bin/i486-linux-uclibc-as LD=.../build_i486/staging_dir/bin/i486-linux-uclibc-ld NM=.../build_i486/staging_dir/bin/i486-linux-uclibc-nm CC=.../build_i486/staging_dir/bin/i486-linux-uclibc-gcc GCC=.../build_i486/staging_dir/bin/i486-linux-uclibc-gcc CXX=.../build_i486/staging_dir/bin/i486-linux-uclibc-g++ CPP=.../build_i486/staging_dir/bin/i486-linux-uclibc-cpp RANLIB=.../build_i486/staging_dir/bin/i486-linux-uclibc-ranlib STRIP=.../build_i486/staging_dir/bin/i486-linux-uclibc-strip OBJCOPY=.../build_i486/staging_dir/bin/i486-linux-uclibc-objcopy LD=.../build_i486/staging_dir/bin/i486-linux-uclibc-gcc \
	-C .../build_i486/madwifi-0.9.2 \
	KERNELPATH=.../build_i486/linux-2.6.11.5 \
	DEST_DIR=.../build_i486/root
make[1]: Entering directory `.../build_i486/madwifi-0.9.2'
Checking requirements... ok.
make -C ./tools  all || exit 1
make[2]: Entering directory `.../build_i486/madwifi-0.9.2/tools'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `.../build_i486/madwifi-0.9.2/tools'
Checking kernel configuration... ok.
make CFLAGS=-v V=1 -C .../build_i486/linux-2.6.11.5 SUBDIRS=.../build_i486/madwifi-0.9.2 modules
make[2]: Entering directory `.../build_i486/linux-2.6.11.5'
mkdir -p .../build_i486/madwifi-0.9.2/.tmp_versions
make -f scripts/Makefile.build obj=.../build_i486/madwifi-0.9.2
make -f scripts/Makefile.build obj=.../build_i486/madwifi-0.9.2/ath
  .../build_i486/staging_dir/bin/i486-linux-uclibc-gcc -Wp,-MD,.../build_i486/madwifi-0.9.2/ath/.ah_osdep.o.d -nostdinc -isystem .../build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/include -D__KERNEL__ -Iinclude  -v -include .../build_i486/madwifi-0.9.2/ath/../include/compat.h -I.../build_i486/madwifi-0.9.2/ath/../include -I.../build_i486/madwifi-0.9.2/ath/../hal -I.../build_i486/madwifi-0.9.2/ath -I.../build_i486/madwifi-0.9.2/ath/../hal/linux -I.../build_i486/madwifi-0.9.2/ath/../net80211 -I.../build_i486/madwifi-0.9.2/ath/.. -DATH_PCI -Werror -DAH_BYTE_ORDER=AH_LITTLE_ENDIAN -fomit-frame-pointer -DATH_SUPERG_FF=1 -DATH_SUPERG_DYNTURBO=1 -DATH_TURBO_SCAN=1 -DATH_SUPERG_XR=1 -DOPT_AH_H=\".../build_i486/madwifi-0.9.2/ath/../hal/public/i386-elf.opt_ah.h\"  -DMODULE -DKBUILD_BASENAME=ah_osdep -DKBUILD_MODNAME=ath_hal -c -o .../build_i486/madwifi-0.9.2/ath/.tmp_ah_osdep.o .../build_i486/madwifi-0.9.2/ath/ah_osdep.c
Reading specs from .../build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/specs
Configured with: .../toolchain_build_i486/gcc-3.4.5/configure --prefix=.../build_i486/staging_dir --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=i486-linux-uclibc --enable-languages=c --enable-shared --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-nls --enable-threads --enable-multilib
Thread model: posix
gcc version 3.4.5
 .../build_i486/staging_dir/libexec/gcc/i486-linux-uclibc/3.4.5/cc1 -quiet -nostdinc -v -Iinclude -I.../build_i486/madwifi-0.9.2/ath/../include -I.../build_i486/madwifi-0.9.2/ath/../hal -I.../build_i486/madwifi-0.9.2/ath -I.../build_i486/madwifi-0.9.2/ath/../hal/linux -I.../build_i486/madwifi-0.9.2/ath/../net80211 -I.../build_i486/madwifi-0.9.2/ath/.. -D__KERNEL__ -DATH_PCI -DAH_BYTE_ORDER=AH_LITTLE_ENDIAN -DATH_SUPERG_FF=1 -DATH_SUPERG_DYNTURBO=1 -DATH_TURBO_SCAN=1 -DATH_SUPERG_XR=1 -DOPT_AH_H=".../build_i486/madwifi-0.9.2/ath/../hal/public/i386-elf.opt_ah.h" -DMODULE -DKBUILD_BASENAME=ah_osdep -DKBUILD_MODNAME=ath_hal -isystem .../build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/include -include .../build_i486/madwifi-0.9.2/ath/../include/compat.h -MD .../build_i486/madwifi-0.9.2/ath/.ah_osdep.o.d .../build_i486/madwifi-0.9.2/ath/ah_osdep.c -quiet -dumpbase ah_osdep.c -mtune=i486 -auxbase-strip .../build_i486/madwifi-0.9.2/ath/.tmp_ah_osdep.o -Werror -version -fomit-frame-pointer -o /tmp/cccPp2Iz.s
#include "..." search starts here:
#include <...> search starts here:
 include
 .../build_i486/madwifi-0.9.2/ath/../include
 .../build_i486/madwifi-0.9.2/ath/../hal
 .../build_i486/madwifi-0.9.2/ath
 .../build_i486/madwifi-0.9.2/ath/../hal/linux
 .../build_i486/madwifi-0.9.2/ath/../net80211
 .../build_i486/madwifi-0.9.2/ath/..
 .../build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/include
End of search list.
GNU C version 3.4.5 (i486-linux-uclibc)
	compiled by GNU C version 3.4.6 (Gentoo 3.4.6-r1, ssp-3.4.5-1.0, pie-8.7.9).
GGC heuristics: --param ggc-min-expand=99 --param ggc-min-heapsize=129278
 .../build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/../../../../i486-linux-uclibc/bin/as -V -Qy -o .../build_i486/madwifi-0.9.2/ath/.tmp_ah_osdep.o /tmp/cccPp2Iz.s
GNU assembler version 2.16.1 (i486-linux-uclibc) using BFD version 2.16.1
Reading specs from .../build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/specs
Configured with: .../toolchain_build_i486/gcc-3.4.5/configure --prefix=.../build_i486/staging_dir --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=i486-linux-uclibc --enable-languages=c --enable-shared --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-nls --enable-threads --enable-multilib
Thread model: posix
gcc version 3.4.5
 .../build_i486/staging_dir/libexec/gcc/i486-linux-uclibc/3.4.5/cc1 -E -quiet -nostdinc -v -Iinclude -I.../build_i486/madwifi-0.9.2/ath/../include -I.../build_i486/madwifi-0.9.2/ath/../hal -I.../build_i486/madwifi-0.9.2/ath -I.../build_i486/madwifi-0.9.2/ath/../hal/linux -I.../build_i486/madwifi-0.9.2/ath/../net80211 -I.../build_i486/madwifi-0.9.2/ath/.. -D__GENKSYMS__ -D__KERNEL__ -DATH_PCI -DAH_BYTE_ORDER=AH_LITTLE_ENDIAN -DATH_SUPERG_FF=1 -DATH_SUPERG_DYNTURBO=1 -DATH_TURBO_SCAN=1 -DATH_SUPERG_XR=1 -DOPT_AH_H=".../build_i486/madwifi-0.9.2/ath/../hal/public/i386-elf.opt_ah.h" -DMODULE -DKBUILD_BASENAME=ah_osdep -DKBUILD_MODNAME=ath_hal -isystem .../build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/include -include .../build_i486/madwifi-0.9.2/ath/../include/compat.h -MD .../build_i486/madwifi-0.9.2/ath/.ah_osdep.o.d .../build_i486/madwifi-0.9.2/ath/ah_osdep.c -mtune=i486 -Werror -fomit-frame-pointer
#include "..." search starts here:
#include <...> search starts here:
 include
 .../build_i486/madwifi-0.9.2/ath/../include
 .../build_i486/madwifi-0.9.2/ath/../hal
 .../build_i486/madwifi-0.9.2/ath
 .../build_i486/madwifi-0.9.2/ath/../hal/linux
 .../build_i486/madwifi-0.9.2/ath/../net80211
 .../build_i486/madwifi-0.9.2/ath/..
 .../build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/include
End of search list.
.../build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/../../../../i486-linux-uclibc/bin/ld: cannot find -lgcc_s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

This isn't what I expected, I wanted to see how ld was called, (by gcc,
or by make).  I can see cc1 being called, then an error from ld.  How did
that happen?  

How is the path to the libraries supposed to be set inteh compiler?

Don Reid
