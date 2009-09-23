From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 23 Sep 2009 12:18:38 +0100
Subject: [Buildroot] OpenSSL fails to build with AVR32
Message-ID: <4ABA040E.1000907@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the latest git, openssl fails to build (see below).

Any ideas ?

$ make openssl
(cd /home/mpfj/avr32/buildroot/output/build/openssl-0.9.8k; \
		ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes ac_cv_c_bigendian=yes \
		PATH="/home/mpfj/avr32/buildroot/output/toolchain/bin:/home/mpfj/avr32/buildroot/output/host/bin:/home/mpfj/avr32/buildroot/output/host/usr/bin:/home/mpfj/avr32/buildroot/output/build/staging_dir/bin:/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/mpfj/avr32/buildroot/build_avr32/staging_dir/usr/bin/" AR="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-ar" AS="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-as" LD="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-ld" NM="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-nm" CC="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-gcc -Os -pipe -Os  -I/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/include -I/home/mpfj/avr32/buildroot/output/build/staging_dir/include --sysroot=/home/m
pfj/avr32/buildroot/output/build/staging_dir/ -isysroot /home/mpfj/avr32/buildroot/output/build/staging_dir -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" GCC="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-gcc -Os -pipe -Os  -I/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/include -I/home/mpfj/avr32/buildroot/output/build/staging_dir/include --sysroot=/home/mpfj/avr32/buildroot/output/build/staging_dir/ -isysroot /home/mpfj/avr32/buildroot/output/build/staging_dir -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CPP="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-cpp -Os -pipe -Os  -I/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/include -I/home/mpfj/avr32/buildroot/output/build/staging_dir/include --sysroot=/home/mpfj/avr32/buildroot/output/build/staging_dir/ -isysroot /home/mpfj/avr32/buildroot/output/build/staging_dir -msoft-float
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CXX="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-g++ -Os -pipe -Os  -I/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/include -I/home/mpfj/avr32/buildroot/output/build/staging_dir/include --sysroot=/home/mpfj/avr32/buildroot/output/build/staging_dir/ -isysroot /home/mpfj/avr32/buildroot/output/build/staging_dir -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" FC="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-gfortran " RANLIB="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-ranlib" STRIP="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-strip" OBJCOPY="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-objcopy" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc
" CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="-I/home/mpfj/avr32/buildroot/output/host/include -I/home/mpfj/avr32/buildroot/output/host/usr/include" CXXFLAGS_FOR_BUILD="-I/home/mpfj/avr32/buildroot/output/host/include -I/home/mpfj/avr32/buildroot/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/mpfj/avr32/buildroot/output/host/lib -L/home/mpfj/avr32/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD="" AR_FOR_TARGET="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-ar" AS_FOR_TARGET="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-as" CC_FOR_TARGET="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-gcc" LD_FOR_TARGET="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-ld" NM_FOR_TARGET="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-nm" DEFAULT_ASSEMBLER="/home/mpfj/avr32
/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-as" DEFAULT_LINKER="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/bin/avr32-linux-uclibc-ld" PKG_CONFIG_SYSROOT_DIR="/home/mpfj/avr32/buildroot/output/build/staging_dir" PKG_CONFIG="/home/mpfj/avr32/buildroot/output/host/usr/bin/pkg-config" PKG_CONFIG_PATH="/home/mpfj/avr32/buildroot/output/build/staging_dir/usr/lib/pkgconfig:" STAGING_DIR="/home/mpfj/avr32/buildroot/output/build/staging_dir" \
		./Configure \
			linux-avr32 \
			--prefix=/usr \
			--openssldir=/etc/ssl \
			threads \
			shared \
			no-idea \
			no-mdc2 \
			no-rc5 \
			zlib-dynamic \
	)
Configuring for linux-avr32
Usage: Configure [no-<cipher> ...] [enable-<cipher> ...] [experimental-<cipher> ...] [-Dxxx] [-lxxx] [-Lxxx] [-fxxx] [-Kxxx] [no-hw-xxx|no-hw] [[no-]threads] [[no-]shared] [[no-]zlib|zlib-dynamic] [enable-montasm] [no-asm] [no-dso] [no-krb5] [386] [--prefix=DIR] [--openssldir=OPENSSLDIR] [--with-xxx[=vvv]] [--test-sanity] os/compiler[:flags]

pick os/compiler from:
BC-32 BS2000-OSD BSD-generic32 BSD-generic64 BSD-ia64 BSD-sparc64 BSD-sparcv8 
BSD-x86 BSD-x86-elf BSD-x86_64 Cygwin Cygwin-pre1.3 DJGPP MPE/iX-gcc OS2-EMX 
OS390-Unix ReliantUNIX SINIX SINIX-N UWIN VC-CE VC-NT VC-WIN32 VC-WIN64A 
VC-WIN64I aix-cc aix-gcc aix3-cc aix64-cc aix64-gcc aux3-gcc bsdi-elf-gcc cc 
cray-j90 cray-t3e darwin-i386-cc darwin-ppc-cc darwin64-ppc-cc 
darwin64-x86_64-cc dgux-R3-gcc dgux-R4-gcc dgux-R4-x86-gcc dist gcc hpux-cc 
hpux-gcc hpux-ia64-cc hpux-ia64-gcc hpux-parisc-cc hpux-parisc-cc-o4 
hpux-parisc-gcc hpux-parisc1_0-cc hpux-parisc2-cc hpux-parisc2-gcc 
hpux64-ia64-cc hpux64-ia64-gcc hpux64-parisc2-cc hpux64-parisc2-gcc hurd-x86 
irix-cc irix-gcc irix-mips3-cc irix-mips3-gcc irix64-mips4-cc irix64-mips4-gcc 
linux-alpha+bwx-ccc linux-alpha+bwx-gcc linux-alpha-ccc linux-alpha-gcc 
linux-aout linux-elf linux-generic32 linux-generic64 linux-ia32-icc linux-ia64 
linux-ia64-ecc linux-ia64-icc linux-ppc linux-ppc64 linux-sparcv8 
linux-sparcv9 linux-x86_64 linux64-sparcv9 mingw ncr-scde netware-clib 
netware-clib-bsdsock netware-clib-bsdsock-gcc netware-clib-gcc netware-libc 
netware-libc-bsdsock netware-libc-bsdsock-gcc netware-libc-gcc newsos4-gcc 
nextstep nextstep3.3 osf1-alpha-cc osf1-alpha-gcc purify qnx4 qnx6 
rhapsody-ppc-cc sco5-cc sco5-gcc solaris-sparcv7-cc solaris-sparcv7-gcc 
solaris-sparcv8-cc solaris-sparcv8-gcc solaris-sparcv9-cc solaris-sparcv9-gcc 
solaris-x86-cc solaris-x86-gcc solaris64-sparcv9-cc solaris64-sparcv9-gcc 
solaris64-x86_64-cc solaris64-x86_64-gcc sunos-gcc tandem-c89 tru64-alpha-cc 
ultrix-cc ultrix-gcc unixware-2.0 unixware-2.1 unixware-7 unixware-7-gcc 
vos-gcc vxworks-mipsle vxworks-ppc405 vxworks-ppc750 vxworks-ppc750-debug 
vxworks-ppc860 debug debug-BSD-x86-elf debug-Cygwin debug-ben debug-ben-debug 
debug-ben-openbsd debug-ben-openbsd-debug debug-ben-strict debug-bodo 
debug-darwin-i386-cc debug-darwin-ppc-cc debug-geoff debug-levitte-linux-elf 
debug-levitte-linux-elf-extreme debug-levitte-linux-noasm 
debug-levitte-linux-noasm-extreme debug-linux-elf debug-linux-elf-noefence 
debug-linux-pentium debug-linux-ppro debug-rse debug-solaris-sparcv8-cc 
debug-solaris-sparcv8-gcc debug-solaris-sparcv9-cc debug-solaris-sparcv9-gcc 
debug-steve debug-steve-linux-pseudo64 debug-steve-opt debug-steve32 
debug-steve64 debug-ulf debug-vos-gcc 

NOTE: If in doubt, on Unix-ish systems use './config'.
make: *** [/home/mpfj/avr32/buildroot/output/build/openssl-0.9.8k/.stamp_configured] Error 1
mpfj at mpfj-x64:~/avr32/buildroot$ 
