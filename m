From: Marie Maurer <marie.maurer@pixida.de>
Date: Tue, 25 Aug 2020 07:18:22 +0000
Subject: [Buildroot] Building for Raspberry Pi on Pi (in Ubuntu WSL same
 is working)
In-Reply-To: <20200824221903.167aeb55@windsurf.home>
References: <VI1PR03MB4528407221D0FA62FAF6E2AC98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824221903.167aeb55@windsurf.home>
Message-ID: <VI1PR03MB452800581DAF06C2AC4B1B0298570@VI1PR03MB4528.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Aaron,

many thanks for your help!

Unfortunately this is still not working with GMP 6.2.0. See the output:

pi at raspberrypi:~/buildroot/buildroot-2020.08-rc2 $ make
>>> host-gmp 6.2.0 Downloading
--2020-08-25 08:12:52--  http://ftpmirror.gnu.org/gmp/gmp-6.2.0.tar.xz
Resolving ftpmirror.gnu.org (ftpmirror.gnu.org)... 209.51.188.200, 2001:470:142:5::200
Connecting to ftpmirror.gnu.org (ftpmirror.gnu.org)|209.51.188.200|:80... connected.
HTTP request sent, awaiting response... 302 Moved Temporarily
Location: http://ftp.snt.utwente.nl/pub/software/gnu/gmp/gmp-6.2.0.tar.xz [following]
--2020-08-25 08:12:52--  http://ftp.snt.utwente.nl/pub/software/gnu/gmp/gmp-6.2.0.tar.xz
Resolving ftp.snt.utwente.nl (ftp.snt.utwente.nl)... 130.89.149.20, 2001:67c:2564:a120::20
Connecting to ftp.snt.utwente.nl (ftp.snt.utwente.nl)|130.89.149.20|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2012444 (1.9M) [application/x-xz]
Saving to: '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/.gmp-6.2.0.tar.xz.5UrQtz/output'

/home/pi/buildroot/buildroot-2020.08- 100%[=========================================================================>]   1.92M  7.25MB/s    in 0.3s

2020-08-25 08:12:52 (7.25 MB/s) - '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/.gmp-6.2.0.tar.xz.5UrQtz/output' saved [2012444/2012444]

gmp-6.2.0.tar.xz: OK (sha256: 258e6cd51b3fbdfc185c716d55f82c08aff57df0c6fbd143cf6ed561267a1526)
>>> host-gmp 6.2.0 Extracting
xzcat /home/pi/buildroot/buildroot-2020.08-rc2/dl/gmp/gmp-6.2.0.tar.xz | /home/pi/buildroot/buildroot-2020.08-rc2/output/host/bin/tar --strip-components=1 -C /home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0   -xf -
>>> host-gmp 6.2.0 Patching
>>> host-gmp 6.2.0 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find /home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0 -name $file); do cp support/gnuconfig/$file $i; done; done
>>> host-gmp 6.2.0 Patching libtool
patching file /home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/ltmain.sh
Hunk #1 succeeded at 2694 (offset 7 lines).
Hunk #2 succeeded at 4284 (offset 7 lines).
Hunk #3 succeeded at 6579 (offset 25 lines).
Hunk #4 succeeded at 6589 (offset 25 lines).
Hunk #5 succeeded at 6882 (offset 25 lines).
Hunk #6 succeeded at 7174 (offset 25 lines).
Hunk #7 succeeded at 8140 (offset 28 lines).
Hunk #8 succeeded at 10769 (offset 59 lines).
>>> host-gmp 6.2.0 Configuring
(cd /home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/ && rm -rf config.cache; PATH="/home/pi/buildroot/buildroot-2020.08-rc2/output/host/bin:/home/pi/buildroot/buildroot-2020.08-rc2/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games" PKG_CONFIG="/home/pi/buildroot/buildroot-2020.08-rc2/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/pi/buildroot/buildroot-2020.08-rc2/output/host/lib/pkgconfig:/home/pi/buildroot/buildroot-2020.08-rc2/output/host/share/pkgconfig" AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm" CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib" CPPFLAGS="-I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include" CFLAGS="-O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include" CXXFLAGS="-O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include" LDFLAGS="-L/home/pi/buildroot/buildroot-2020.08-rc2/output/host/lib -Wl,-rpath,/home/pi/buildroot/buildroot-2020.08-rc2/output/host/lib" INTLTOOL_PERL=/usr/bin/perl CFLAGS="-O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include" LDFLAGS="-L/home/pi/buildroot/buildroot-2020.08-rc2/output/host/lib -Wl,-rpath,/home/pi/buildroot/buildroot-2020.08-rc2/output/host/lib"  CONFIG_SITE=/dev/null ./configure --prefix="/home/pi/buildroot/buildroot-2020.08-rc2/output/host" --sysconfdir="/home/pi/buildroot/buildroot-2020.08-rc2/output/host/etc" --localstatedir="/home/pi/buildroot/buildroot-2020.08-rc2/output/host/var" --enable-shared --disable-static --disable-gtk-doc --disable-gtk-doc-html --disable-doc --disable-docs --disable-documentation --disable-debug --with-xmlto=no --with-fop=no --disable-nls --disable-dependency-tracking   )
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --disable-debug, --with-xmlto, --with-fop, --disable-nls, --disable-dependency-tracking
checking build system type... armv7l-unknown-linux-gnueabihf
checking host system type... armv7l-unknown-linux-gnueabihf
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking ABI=32
checking compiler /usr/bin/gcc -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include... yes
checking whether ARM gcc unsigned division works... yes
checking for gcc... /usr/bin/gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /usr/bin/gcc accepts -g... yes
checking for /usr/bin/gcc option to accept ISO C89... none needed
checking whether /usr/bin/gcc understands -c and -o together... yes
checking for /usr/bin/gcc option to accept ISO C99... none needed
checking how to run the C preprocessor... /usr/bin/cpp
checking build system compiler /usr/bin/gcc... yes
checking for build system preprocessor... /usr/bin/gcc -E
checking for build system executable suffix...
checking whether build system compiler is ANSI... yes
checking for build system compiler math library... -lm
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
using ABI="32"
      CC="/usr/bin/gcc"
      CFLAGS="-O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include"
      CPPFLAGS="-I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include"
      MPN_PATH=" arm/v7a/cora5 arm/v6t2 arm/v6 arm/v5 arm generic"
checking whether assembler supports --noexecstack option... yes
checking for ar... /usr/bin/ar
checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm
checking the name lister (/usr/bin/nm) interface... BSD nm
checking how to print strings... printf
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... /bin/grep -F
checking for ld used by /usr/bin/gcc... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking how to convert armv7l-unknown-linux-gnueabihf file names to armv7l-unknown-linux-gnueabihf format... func_convert_file_noop
checking how to convert armv7l-unknown-linux-gnueabihf file names to toolchain format... func_convert_file_noop
checking for /usr/bin/ld option to reload object files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for dlltool... dlltool
checking how to associate runtime and link libraries... printf %s\n
checking for archiver @FILE support... @
checking for strip... strip
checking for ranlib... /usr/bin/ranlib
checking command to parse /usr/bin/nm output from /usr/bin/gcc object... ok
checking for sysroot... no
checking for a working dd... /bin/dd
checking how to truncate binary pipes... /bin/dd bs=4096 count=1
checking for mt... mt
checking if mt is a manifest tool... no
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for dlfcn.h... yes
checking for objdir... .libs
checking if /usr/bin/gcc supports -fno-rtti -fno-exceptions... no
checking for /usr/bin/gcc option to produce PIC... -fPIC -DPIC
checking if /usr/bin/gcc PIC flag -fPIC -DPIC works... yes
checking if /usr/bin/gcc static flag -static works... yes
checking if /usr/bin/gcc supports -c -o file.o... yes
checking if /usr/bin/gcc supports -c -o file.o... (cached) yes
checking whether the /usr/bin/gcc linker (/usr/bin/ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking how to run the C++ preprocessor... /usr/bin/g++ -E
checking whether the /usr/bin/g++ linker (/usr/bin/ld) supports shared libraries... yes
checking for /usr/bin/g++ option to produce PIC...  -DPIC
checking if /usr/bin/g++ PIC flag  -DPIC works... yes
checking if /usr/bin/g++ static flag  works... yes
checking if /usr/bin/g++ supports -c -o file.o... yes
checking if /usr/bin/g++ supports -c -o file.o... (cached) yes
checking whether the /usr/bin/g++ linker (/usr/bin/ld) supports shared libraries... yes
checking dynamic linker characteristics... (cached) GNU/Linux ld.so
checking how to hardcode library paths into programs... unsupported
checking for ANSI C header files... (cached) yes
checking whether time.h and sys/time.h may both be included... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking float.h usability... yes
checking float.h presence... yes
checking for float.h... yes
checking invent.h usability... no
checking invent.h presence... no
checking for invent.h... no
checking langinfo.h usability... yes
checking langinfo.h presence... yes
checking for langinfo.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking nl_types.h usability... yes
checking nl_types.h presence... yes
checking for nl_types.h... yes
checking sys/attributes.h usability... no
checking sys/attributes.h presence... no
checking for sys/attributes.h... no
checking sys/iograph.h usability... no
checking sys/iograph.h presence... no
checking for sys/iograph.h... no
checking sys/mman.h usability... yes
checking sys/mman.h presence... yes
checking for sys/mman.h... yes
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking sys/processor.h usability... no
checking sys/processor.h presence... no
checking for sys/processor.h... no
checking sys/pstat.h usability... no
checking sys/pstat.h presence... no
checking for sys/pstat.h... no
checking sys/sysinfo.h usability... yes
checking sys/sysinfo.h presence... yes
checking for sys/sysinfo.h... yes
checking sys/syssgi.h usability... no
checking sys/syssgi.h presence... no
checking for sys/syssgi.h... no
checking sys/systemcfg.h usability... no
checking sys/systemcfg.h presence... no
checking for sys/systemcfg.h... no
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking sys/times.h usability... yes
checking sys/times.h presence... yes
checking for sys/times.h... yes
checking for sys/resource.h... yes
checking for sys/sysctl.h... yes
checking for machine/hal_sysinfo.h... no
checking whether fgetc is declared... yes
checking whether fscanf is declared... yes
checking whether optarg is declared... yes
checking whether ungetc is declared... yes
checking whether vfprintf is declared... yes
checking whether sys_errlist is declared... yes
checking whether sys_nerr is declared... yes
checking return type of signal handlers... void
checking for intmax_t... yes
checking for long double... yes
checking for long long... yes
checking for ptrdiff_t... yes
checking for quad_t... yes
checking for uint_least32_t... yes
checking for intptr_t... yes
checking for working volatile... yes
checking for C/C++ restrict keyword... __restrict
checking whether gcc __attribute__ ((const)) works... yes
checking whether gcc __attribute__ ((malloc)) works... yes
checking whether gcc __attribute__ ((mode (XX))) works... yes
checking whether gcc __attribute__ ((noreturn)) works... yes
checking whether gcc hidden aliases work... yes
checking for inline... inline
checking for cos in -lm... yes
checking for working alloca.h... yes
checking for alloca (via gmp-impl.h)... yes
checking how to allocate temporary memory... alloca
checking whether byte ordering is bigendian... no
checking format of `double' floating point... IEEE little endian
checking for alarm... yes
checking for attr_get... no
checking for clock... yes
checking for cputime... no
checking for getpagesize... yes
checking for getrusage... yes
checking for gettimeofday... yes
checking for getsysinfo... no
checking for localeconv... yes
checking for memset... yes
checking for mmap... yes
checking for mprotect... yes
checking for nl_langinfo... yes
checking for obstack_vprintf... yes
checking for popen... yes
checking for processor_info... no
checking for pstat_getprocessor... no
checking for raise... yes
checking for read_real_time... no
checking for sigaction... yes
checking for sigaltstack... yes
checking for sigstack... yes
checking for syssgi... no
checking for strchr... yes
checking for strerror... yes
checking for strnlen... yes
checking for strtol... yes
checking for strtoul... yes
checking for sysconf... yes
checking for sysctl... yes
checking for sysctlbyname... no
checking for times... yes
checking for library containing clock_gettime... none required
checking for vsnprintf... yes
checking whether vsnprintf works... yes
checking whether sscanf needs writable input... no
checking for struct pst_processor.psp_iticksperclktick... no
checking for suitable m4... m4
checking if m4wrap produces spurious output... no
checking how to switch to text section... .text
checking how to switch to data section... .data
checking for assembler label suffix... :
checking for assembler global directive... .globl
checking for assembler global directive attribute...
checking if globals are prefixed by underscore... no
checking how to switch to read-only data section...     .section        .rodata
checking for assembler .type directive... .type $1,#$2
checking for assembler .size directive... .size $1,$2
checking for assembler local label prefix... .L
checking for assembler byte directive... .byte
checking how to define a 32-bit word... .long
checking if .align assembly directive is logarithmic... yes
checking size of void *... 4
checking size of unsigned short... 2
checking size of unsigned... 4
checking size of unsigned long... 4
checking size of mp_limb_t... 4
checking for stack_t... yes
checking for tputs in -lncurses... yes
checking for readline in -lreadline... no
checking readline detected... no
checking for bison... no
checking for byacc... no
checking for flex... no
checking for lex... no
creating config.m4
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating demos/pexpr-config.h
config.status: creating demos/calc/calc-config.h
config.status: creating Makefile
config.status: creating mpf/Makefile
config.status: creating mpn/Makefile
config.status: creating mpq/Makefile
config.status: creating mpz/Makefile
config.status: creating printf/Makefile
config.status: creating scanf/Makefile
config.status: creating rand/Makefile
config.status: creating cxx/Makefile
config.status: creating tests/Makefile
config.status: creating tests/devel/Makefile
config.status: creating tests/mpf/Makefile
config.status: creating tests/mpn/Makefile
config.status: creating tests/mpq/Makefile
config.status: creating tests/mpz/Makefile
config.status: creating tests/rand/Makefile
config.status: creating tests/misc/Makefile
config.status: creating tests/cxx/Makefile
config.status: creating doc/Makefile
config.status: creating tune/Makefile
config.status: creating demos/Makefile
config.status: creating demos/calc/Makefile
config.status: creating demos/expr/Makefile
config.status: creating gmp.h
config.status: creating gmp.pc
config.status: creating gmpxx.pc
config.status: creating config.h
config.status: linking mpn/generic/add.c to mpn/add.c
config.status: linking mpn/generic/add_1.c to mpn/add_1.c
config.status: linking mpn/arm/aors_n.asm to mpn/add_n.asm
config.status: linking mpn/generic/sub.c to mpn/sub.c
config.status: linking mpn/generic/sub_1.c to mpn/sub_1.c
config.status: linking mpn/arm/aors_n.asm to mpn/sub_n.asm
config.status: linking mpn/arm/cnd_aors_n.asm to mpn/cnd_add_n.asm
config.status: linking mpn/arm/cnd_aors_n.asm to mpn/cnd_sub_n.asm
config.status: linking mpn/generic/cnd_swap.c to mpn/cnd_swap.c
config.status: linking mpn/generic/neg.c to mpn/neg.c
config.status: linking mpn/arm/com.asm to mpn/com.asm
config.status: linking mpn/arm/v6/mul_1.asm to mpn/mul_1.asm
config.status: linking mpn/arm/v6/addmul_1.asm to mpn/addmul_1.asm
config.status: linking mpn/arm/v6/submul_1.asm to mpn/submul_1.asm
config.status: linking mpn/generic/add_err1_n.c to mpn/add_err1_n.c
config.status: linking mpn/generic/add_err2_n.c to mpn/add_err2_n.c
config.status: linking mpn/generic/add_err3_n.c to mpn/add_err3_n.c
config.status: linking mpn/generic/sub_err1_n.c to mpn/sub_err1_n.c
config.status: linking mpn/generic/sub_err2_n.c to mpn/sub_err2_n.c
config.status: linking mpn/generic/sub_err3_n.c to mpn/sub_err3_n.c
config.status: linking mpn/arm/lshift.asm to mpn/lshift.asm
config.status: linking mpn/arm/rshift.asm to mpn/rshift.asm
config.status: linking mpn/arm/v6/dive_1.asm to mpn/dive_1.asm
config.status: linking mpn/generic/diveby3.c to mpn/diveby3.c
config.status: linking mpn/generic/divis.c to mpn/divis.c
config.status: linking mpn/generic/divrem.c to mpn/divrem.c
config.status: linking mpn/arm/v6t2/divrem_1.asm to mpn/divrem_1.asm
config.status: linking mpn/generic/divrem_2.c to mpn/divrem_2.c
config.status: linking mpn/generic/fib2_ui.c to mpn/fib2_ui.c
config.status: linking mpn/generic/fib2m.c to mpn/fib2m.c
config.status: linking mpn/generic/mod_1.c to mpn/mod_1.c
config.status: linking mpn/arm/mod_34lsub1.asm to mpn/mod_34lsub1.asm
config.status: linking mpn/arm/v6/mode1o.asm to mpn/mode1o.asm
config.status: linking mpn/generic/pre_mod_1.c to mpn/pre_mod_1.c
config.status: linking mpn/generic/dump.c to mpn/dump.c
config.status: linking mpn/arm/v5/mod_1_1.asm to mpn/mod_1_1.asm
config.status: linking mpn/arm/v5/mod_1_2.asm to mpn/mod_1_2.asm
config.status: linking mpn/generic/mod_1_3.c to mpn/mod_1_3.c
config.status: linking mpn/generic/mod_1_4.c to mpn/mod_1_4.c
config.status: linking mpn/arm/lshiftc.asm to mpn/lshiftc.asm
config.status: linking mpn/generic/mul.c to mpn/mul.c
config.status: linking mpn/generic/mul_fft.c to mpn/mul_fft.c
config.status: linking mpn/generic/mul_n.c to mpn/mul_n.c
config.status: linking mpn/generic/sqr.c to mpn/sqr.c
config.status: linking mpn/generic/mul_basecase.c to mpn/mul_basecase.c
config.status: linking mpn/arm/v6/sqr_basecase.asm to mpn/sqr_basecase.asm
config.status: linking mpn/generic/nussbaumer_mul.c to mpn/nussbaumer_mul.c
config.status: linking mpn/generic/mulmid_basecase.c to mpn/mulmid_basecase.c
config.status: linking mpn/generic/toom42_mulmid.c to mpn/toom42_mulmid.c
config.status: linking mpn/generic/mulmid_n.c to mpn/mulmid_n.c
config.status: linking mpn/generic/mulmid.c to mpn/mulmid.c
config.status: linking mpn/generic/random.c to mpn/random.c
config.status: linking mpn/generic/random2.c to mpn/random2.c
config.status: linking mpn/generic/pow_1.c to mpn/pow_1.c
config.status: linking mpn/generic/rootrem.c to mpn/rootrem.c
config.status: linking mpn/generic/sqrtrem.c to mpn/sqrtrem.c
config.status: linking mpn/generic/sizeinbase.c to mpn/sizeinbase.c
config.status: linking mpn/generic/get_str.c to mpn/get_str.c
config.status: linking mpn/generic/set_str.c to mpn/set_str.c
config.status: linking mpn/generic/compute_powtab.c to mpn/compute_powtab.c
config.status: linking mpn/generic/scan0.c to mpn/scan0.c
config.status: linking mpn/generic/scan1.c to mpn/scan1.c
config.status: linking mpn/arm/v6/popham.asm to mpn/popcount.asm
config.status: linking mpn/arm/v6/popham.asm to mpn/hamdist.asm
config.status: linking mpn/generic/cmp.c to mpn/cmp.c
config.status: linking mpn/generic/zero_p.c to mpn/zero_p.c
config.status: linking mpn/generic/perfsqr.c to mpn/perfsqr.c
config.status: linking mpn/generic/perfpow.c to mpn/perfpow.c
config.status: linking mpn/generic/strongfibo.c to mpn/strongfibo.c
config.status: linking mpn/arm/v6t2/gcd_11.asm to mpn/gcd_11.asm
config.status: linking mpn/arm/v6t2/gcd_22.asm to mpn/gcd_22.asm
config.status: linking mpn/generic/gcd_1.c to mpn/gcd_1.c
config.status: linking mpn/generic/gcd.c to mpn/gcd.c
config.status: linking mpn/generic/gcdext_1.c to mpn/gcdext_1.c
config.status: linking mpn/generic/gcdext.c to mpn/gcdext.c
config.status: linking mpn/generic/gcd_subdiv_step.c to mpn/gcd_subdiv_step.c
config.status: linking mpn/generic/gcdext_lehmer.c to mpn/gcdext_lehmer.c
config.status: linking mpn/generic/div_q.c to mpn/div_q.c
config.status: linking mpn/generic/tdiv_qr.c to mpn/tdiv_qr.c
config.status: linking mpn/generic/jacbase.c to mpn/jacbase.c
config.status: linking mpn/generic/jacobi_2.c to mpn/jacobi_2.c
config.status: linking mpn/generic/jacobi.c to mpn/jacobi.c
config.status: linking mpn/generic/get_d.c to mpn/get_d.c
config.status: linking mpn/generic/matrix22_mul.c to mpn/matrix22_mul.c
config.status: linking mpn/generic/matrix22_mul1_inverse_vector.c to mpn/matrix22_mul1_inverse_vector.c
config.status: linking mpn/generic/hgcd_matrix.c to mpn/hgcd_matrix.c
config.status: linking mpn/generic/hgcd2.c to mpn/hgcd2.c
config.status: linking mpn/generic/hgcd_step.c to mpn/hgcd_step.c
config.status: linking mpn/generic/hgcd_reduce.c to mpn/hgcd_reduce.c
config.status: linking mpn/generic/hgcd.c to mpn/hgcd.c
config.status: linking mpn/generic/hgcd_appr.c to mpn/hgcd_appr.c
config.status: linking mpn/generic/hgcd2_jacobi.c to mpn/hgcd2_jacobi.c
config.status: linking mpn/generic/hgcd_jacobi.c to mpn/hgcd_jacobi.c
config.status: linking mpn/generic/mullo_n.c to mpn/mullo_n.c
config.status: linking mpn/generic/mullo_basecase.c to mpn/mullo_basecase.c
config.status: linking mpn/generic/sqrlo.c to mpn/sqrlo.c
config.status: linking mpn/generic/sqrlo_basecase.c to mpn/sqrlo_basecase.c
config.status: linking mpn/generic/toom22_mul.c to mpn/toom22_mul.c
config.status: linking mpn/generic/toom32_mul.c to mpn/toom32_mul.c
config.status: linking mpn/generic/toom42_mul.c to mpn/toom42_mul.c
config.status: linking mpn/generic/toom52_mul.c to mpn/toom52_mul.c
config.status: linking mpn/generic/toom62_mul.c to mpn/toom62_mul.c
config.status: linking mpn/generic/toom33_mul.c to mpn/toom33_mul.c
config.status: linking mpn/generic/toom43_mul.c to mpn/toom43_mul.c
config.status: linking mpn/generic/toom53_mul.c to mpn/toom53_mul.c
config.status: linking mpn/generic/toom54_mul.c to mpn/toom54_mul.c
config.status: linking mpn/generic/toom63_mul.c to mpn/toom63_mul.c
config.status: linking mpn/generic/toom44_mul.c to mpn/toom44_mul.c
config.status: linking mpn/generic/toom6h_mul.c to mpn/toom6h_mul.c
config.status: linking mpn/generic/toom6_sqr.c to mpn/toom6_sqr.c
config.status: linking mpn/generic/toom8h_mul.c to mpn/toom8h_mul.c
config.status: linking mpn/generic/toom8_sqr.c to mpn/toom8_sqr.c
config.status: linking mpn/generic/toom_couple_handling.c to mpn/toom_couple_handling.c
config.status: linking mpn/generic/toom2_sqr.c to mpn/toom2_sqr.c
config.status: linking mpn/generic/toom3_sqr.c to mpn/toom3_sqr.c
config.status: linking mpn/generic/toom4_sqr.c to mpn/toom4_sqr.c
config.status: linking mpn/generic/toom_eval_dgr3_pm1.c to mpn/toom_eval_dgr3_pm1.c
config.status: linking mpn/generic/toom_eval_dgr3_pm2.c to mpn/toom_eval_dgr3_pm2.c
config.status: linking mpn/generic/toom_eval_pm1.c to mpn/toom_eval_pm1.c
config.status: linking mpn/generic/toom_eval_pm2.c to mpn/toom_eval_pm2.c
config.status: linking mpn/generic/toom_eval_pm2exp.c to mpn/toom_eval_pm2exp.c
config.status: linking mpn/generic/toom_eval_pm2rexp.c to mpn/toom_eval_pm2rexp.c
config.status: linking mpn/generic/toom_interpolate_5pts.c to mpn/toom_interpolate_5pts.c
config.status: linking mpn/generic/toom_interpolate_6pts.c to mpn/toom_interpolate_6pts.c
config.status: linking mpn/generic/toom_interpolate_7pts.c to mpn/toom_interpolate_7pts.c
config.status: linking mpn/generic/toom_interpolate_8pts.c to mpn/toom_interpolate_8pts.c
config.status: linking mpn/generic/toom_interpolate_12pts.c to mpn/toom_interpolate_12pts.c
config.status: linking mpn/generic/toom_interpolate_16pts.c to mpn/toom_interpolate_16pts.c
config.status: linking mpn/generic/invertappr.c to mpn/invertappr.c
config.status: linking mpn/generic/invert.c to mpn/invert.c
config.status: linking mpn/generic/binvert.c to mpn/binvert.c
config.status: linking mpn/generic/mulmod_bnm1.c to mpn/mulmod_bnm1.c
config.status: linking mpn/generic/sqrmod_bnm1.c to mpn/sqrmod_bnm1.c
config.status: linking mpn/generic/div_qr_1.c to mpn/div_qr_1.c
config.status: linking mpn/generic/div_qr_1n_pi1.c to mpn/div_qr_1n_pi1.c
config.status: linking mpn/generic/div_qr_2.c to mpn/div_qr_2.c
config.status: linking mpn/generic/div_qr_2n_pi1.c to mpn/div_qr_2n_pi1.c
config.status: linking mpn/generic/div_qr_2u_pi1.c to mpn/div_qr_2u_pi1.c
config.status: linking mpn/generic/sbpi1_div_q.c to mpn/sbpi1_div_q.c
config.status: linking mpn/generic/sbpi1_div_qr.c to mpn/sbpi1_div_qr.c
config.status: linking mpn/generic/sbpi1_divappr_q.c to mpn/sbpi1_divappr_q.c
config.status: linking mpn/generic/dcpi1_div_q.c to mpn/dcpi1_div_q.c
config.status: linking mpn/generic/dcpi1_div_qr.c to mpn/dcpi1_div_qr.c
config.status: linking mpn/generic/dcpi1_divappr_q.c to mpn/dcpi1_divappr_q.c
config.status: linking mpn/generic/mu_div_qr.c to mpn/mu_div_qr.c
config.status: linking mpn/generic/mu_divappr_q.c to mpn/mu_divappr_q.c
config.status: linking mpn/generic/mu_div_q.c to mpn/mu_div_q.c
config.status: linking mpn/arm/bdiv_q_1.asm to mpn/bdiv_q_1.asm
config.status: linking mpn/generic/sbpi1_bdiv_q.c to mpn/sbpi1_bdiv_q.c
config.status: linking mpn/generic/sbpi1_bdiv_qr.c to mpn/sbpi1_bdiv_qr.c
config.status: linking mpn/generic/sbpi1_bdiv_r.c to mpn/sbpi1_bdiv_r.c
config.status: linking mpn/generic/dcpi1_bdiv_q.c to mpn/dcpi1_bdiv_q.c
config.status: linking mpn/generic/dcpi1_bdiv_qr.c to mpn/dcpi1_bdiv_qr.c
config.status: linking mpn/generic/mu_bdiv_q.c to mpn/mu_bdiv_q.c
config.status: linking mpn/generic/mu_bdiv_qr.c to mpn/mu_bdiv_qr.c
config.status: linking mpn/generic/bdiv_q.c to mpn/bdiv_q.c
config.status: linking mpn/generic/bdiv_qr.c to mpn/bdiv_qr.c
config.status: linking mpn/generic/broot.c to mpn/broot.c
config.status: linking mpn/generic/brootinv.c to mpn/brootinv.c
config.status: linking mpn/generic/bsqrt.c to mpn/bsqrt.c
config.status: linking mpn/generic/bsqrtinv.c to mpn/bsqrtinv.c
config.status: linking mpn/generic/divexact.c to mpn/divexact.c
config.status: linking mpn/arm/bdiv_dbm1c.asm to mpn/bdiv_dbm1c.asm
config.status: linking mpn/generic/redc_1.c to mpn/redc_1.c
config.status: linking mpn/generic/redc_2.c to mpn/redc_2.c
config.status: linking mpn/generic/redc_n.c to mpn/redc_n.c
config.status: linking mpn/generic/powm.c to mpn/powm.c
config.status: linking mpn/generic/powlo.c to mpn/powlo.c
config.status: linking mpn/generic/sec_powm.c to mpn/sec_powm.c
config.status: linking mpn/generic/sec_mul.c to mpn/sec_mul.c
config.status: linking mpn/generic/sec_sqr.c to mpn/sec_sqr.c
config.status: linking mpn/generic/sec_div.c to mpn/sec_div_qr.c
config.status: linking mpn/generic/sec_div.c to mpn/sec_div_r.c
config.status: linking mpn/generic/sec_pi1_div.c to mpn/sec_pi1_div_qr.c
config.status: linking mpn/generic/sec_pi1_div.c to mpn/sec_pi1_div_r.c
config.status: linking mpn/generic/sec_aors_1.c to mpn/sec_add_1.c
config.status: linking mpn/generic/sec_aors_1.c to mpn/sec_sub_1.c
config.status: linking mpn/generic/sec_invert.c to mpn/sec_invert.c
config.status: linking mpn/generic/trialdiv.c to mpn/trialdiv.c
config.status: linking mpn/generic/remove.c to mpn/remove.c
config.status: linking mpn/arm/logops_n.asm to mpn/and_n.asm
config.status: linking mpn/arm/logops_n.asm to mpn/andn_n.asm
config.status: linking mpn/arm/logops_n.asm to mpn/nand_n.asm
config.status: linking mpn/arm/logops_n.asm to mpn/ior_n.asm
config.status: linking mpn/arm/logops_n.asm to mpn/iorn_n.asm
config.status: linking mpn/arm/logops_n.asm to mpn/nior_n.asm
config.status: linking mpn/arm/logops_n.asm to mpn/xor_n.asm
config.status: linking mpn/arm/logops_n.asm to mpn/xnor_n.asm
config.status: linking mpn/arm/copyi.asm to mpn/copyi.asm
config.status: linking mpn/arm/copyd.asm to mpn/copyd.asm
config.status: linking mpn/generic/zero.c to mpn/zero.c
config.status: linking mpn/arm/sec_tabselect.asm to mpn/sec_tabselect.asm
config.status: linking mpn/generic/comb_tables.c to mpn/comb_tables.c
config.status: linking mpn/arm/udiv.asm to mpn/udiv.asm
config.status: linking mpn/arm/invert_limb.asm to mpn/invert_limb.asm
config.status: linking mpn/arm/v6/mul_2.asm to mpn/mul_2.asm
config.status: linking mpn/arm/v6/addmul_2.asm to mpn/addmul_2.asm
config.status: linking mpn/arm/v6/addmul_3.asm to mpn/addmul_3.asm
config.status: linking mpn/arm/aorslsh1_n.asm to mpn/addlsh1_n.asm
config.status: linking mpn/arm/aorslsh1_n.asm to mpn/sublsh1_n.asm
config.status: linking mpn/arm/rsh1aors_n.asm to mpn/rsh1add_n.asm
config.status: linking mpn/arm/rsh1aors_n.asm to mpn/rsh1sub_n.asm
config.status: linking mpn/generic/add_n_sub_n.c to mpn/add_n_sub_n.c
config.status: linking mpn/arm/v7a/cora5/gmp-mparam.h to gmp-mparam.h
config.status: executing libtool commands
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --disable-debug, --with-xmlto, --with-fop, --disable-nls, --disable-dependency-tracking
configure: summary of build options:

  Version:           GNU MP 6.2.0
  Host type:         armv7l-unknown-linux-gnueabihf
  ABI:               32
  Install prefix:    /home/pi/buildroot/buildroot-2020.08-rc2/output/host
  Compiler:          /usr/bin/gcc
  Static libraries:  no
  Shared libraries:  yes

>>> host-gmp 6.2.0 Building
PATH="/home/pi/buildroot/buildroot-2020.08-rc2/output/host/bin:/home/pi/buildroot/buildroot-2020.08-rc2/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games" PKG_CONFIG="/home/pi/buildroot/buildroot-2020.08-rc2/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/pi/buildroot/buildroot-2020.08-rc2/output/host/lib/pkgconfig:/home/pi/buildroot/buildroot-2020.08-rc2/output/host/share/pkgconfig"  /usr/bin/make -j5  -C /home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/
make[1]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0'
/usr/bin/gcc `test -f 'gen-fac.c' || echo './'`gen-fac.c -o gen-fac
/usr/bin/gcc `test -f 'gen-fib.c' || echo './'`gen-fib.c -o gen-fib
/usr/bin/gcc `test -f 'gen-bases.c' || echo './'`gen-bases.c -o gen-bases -lm
/usr/bin/gcc `test -f 'gen-trialdivtab.c' || echo './'`gen-trialdivtab.c -o gen-trialdivtab -lm
/usr/bin/gcc `test -f 'gen-jacobitab.c' || echo './'`gen-jacobitab.c -o gen-jacobitab
/usr/bin/gcc `test -f 'gen-psqr.c' || echo './'`gen-psqr.c -o gen-psqr -lm
./gen-bases header 32 0 >mp_bases.h || (rm -f mp_bases.h; exit 1)
./gen-bases table 32 0 >mpn/mp_bases.c || (rm -f mpn/mp_bases.c; exit 1)
./gen-trialdivtab 32 8000 >trialdivtab.h || (rm -f trialdivtab.h; exit 1)
./gen-jacobitab >mpn/jacobitab.h || (rm -f mpn/jacobitab.h; exit 1)
./gen-fib header 32 0 >fib_table.h || (rm -f fib_table.h; exit 1)
./gen-fib table 32 0 >mpn/fib_table.c || (rm -f mpn/fib_table.c; exit 1)
./gen-fac 32 0 >fac_table.h || (rm -f fac_table.h; exit 1)
./gen-psqr 32 0 >mpn/perfsqr.h || (rm -f mpn/perfsqr.h; exit 1)
/usr/bin/make  all-recursive
make[2]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0'
Making all in tests
make[3]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests'
Making all in .
make[4]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests'
make[4]: Nothing to be done for 'all-am'.
make[4]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests'
Making all in devel
make[4]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/devel'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/devel'
Making all in mpn
make[4]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/mpn'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/mpn'
Making all in mpz
make[4]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/mpz'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/mpz'
Making all in mpq
make[4]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/mpq'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/mpq'
Making all in mpf
make[4]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/mpf'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/mpf'
Making all in rand
make[4]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/rand'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/rand'
Making all in misc
make[4]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/misc'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/misc'
Making all in cxx
make[4]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/cxx'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests/cxx'
make[3]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/tests'
Making all in mpn
make[3]: Entering directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/mpn'
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo fib_table | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o fib_table.lo fib_table.c
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo mp_bases | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o mp_bases.lo mp_bases.c
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo add | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o add.lo add.c
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo add_1 | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o add_1.lo add_1.c
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo add_n | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'add_n.asm' || echo './'`add_n.asm
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_add_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c add_1.c  -fPIC -DPIC -o .libs/add_1.o
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_mp_bases -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c mp_bases.c  -fPIC -DPIC -o .libs/mp_bases.o
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_add -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c add.c  -fPIC -DPIC -o .libs/add.o
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_fib_table -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c fib_table.c  -fPIC -DPIC -o .libs/fib_table.o
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_add_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack add_n.asm  -fPIC -DPIC -o .libs/add_n.o
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_add_n -DPIC add_n.asm >tmp-add_n.s
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo sub | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o sub.lo sub.c
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo sub_1 | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o sub_1.lo sub_1.c
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo sub_n | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'sub_n.asm' || echo './'`sub_n.asm
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo cnd_add_n | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'cnd_add_n.asm' || echo './'`cnd_add_n.asm
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_add_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-add_n.s -fPIC -DPIC -o .libs/add_n.o
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo cnd_sub_n | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'cnd_sub_n.asm' || echo './'`cnd_sub_n.asm
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_sub_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c sub_1.c  -fPIC -DPIC -o .libs/sub_1.o
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_sub_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack sub_n.asm  -fPIC -DPIC -o .libs/sub_n.o
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_cnd_add_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack cnd_add_n.asm  -fPIC -DPIC -o .libs/cnd_add_n.o
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_sub_n -DPIC sub_n.asm >tmp-sub_n.s
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_sub -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c sub.c  -fPIC -DPIC -o .libs/sub.o
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_cnd_add_n -DPIC cnd_add_n.asm >tmp-cnd_add_n.s
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_sub_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-sub_n.s -fPIC -DPIC -o .libs/sub_n.o
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_cnd_add_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-cnd_add_n.s -fPIC -DPIC -o .libs/cnd_add_n.o
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_cnd_sub_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack cnd_sub_n.asm  -fPIC -DPIC -o .libs/cnd_sub_n.o
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo cnd_swap | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o cnd_swap.lo cnd_swap.c
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo neg | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o neg.lo neg.c
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_cnd_sub_n -DPIC cnd_sub_n.asm >tmp-cnd_sub_n.s
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo com | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'com.asm' || echo './'`com.asm
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo mul_1 | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'mul_1.asm' || echo './'`mul_1.asm
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_cnd_sub_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-cnd_sub_n.s -fPIC -DPIC -o .libs/cnd_sub_n.o
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo addmul_1 | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'addmul_1.asm' || echo './'`addmul_1.asm
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_cnd_swap -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c cnd_swap.c  -fPIC -DPIC -o .libs/cnd_swap.o
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_neg -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c neg.c  -fPIC -DPIC -o .libs/neg.o
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_com -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack com.asm  -fPIC -DPIC -o .libs/com.o
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_com -DPIC com.asm >tmp-com.s
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_mul_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack mul_1.asm  -fPIC -DPIC -o .libs/mul_1.o
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_mul_1 -DPIC mul_1.asm >tmp-mul_1.s
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo submul_1 | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'submul_1.asm' || echo './'`submul_1.asm
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_com -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-com.s -fPIC -DPIC -o .libs/com.o
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_addmul_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack addmul_1.asm  -fPIC -DPIC -o .libs/addmul_1.o
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo add_err1_n | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o add_err1_n.lo add_err1_n.c
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_addmul_1 -DPIC addmul_1.asm >tmp-addmul_1.s
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo add_err2_n | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o add_err2_n.lo add_err2_n.c
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_mul_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-mul_1.s -fPIC -DPIC -o .libs/mul_1.o
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo add_err3_n | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o add_err3_n.lo add_err3_n.c
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_addmul_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-addmul_1.s -fPIC -DPIC -o .libs/addmul_1.o
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo sub_err1_n | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o sub_err1_n.lo sub_err1_n.c
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_add_err1_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c add_err1_n.c  -fPIC -DPIC -o .libs/add_err1_n.o
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_submul_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack submul_1.asm  -fPIC -DPIC -o .libs/submul_1.o
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_submul_1 -DPIC submul_1.asm >tmp-submul_1.s
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_add_err2_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c add_err2_n.c  -fPIC -DPIC -o .libs/add_err2_n.o
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_submul_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-submul_1.s -fPIC -DPIC -o .libs/submul_1.o
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_add_err3_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c add_err3_n.c  -fPIC -DPIC -o .libs/add_err3_n.o
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo sub_err2_n | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o sub_err2_n.lo sub_err2_n.c
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo sub_err3_n | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o sub_err3_n.lo sub_err3_n.c
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_sub_err1_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c sub_err1_n.c  -fPIC -DPIC -o .libs/sub_err1_n.o
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo lshift | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'lshift.asm' || echo './'`lshift.asm
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo rshift | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'rshift.asm' || echo './'`rshift.asm
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_sub_err2_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c sub_err2_n.c  -fPIC -DPIC -o .libs/sub_err2_n.o
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo dive_1 | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'dive_1.asm' || echo './'`dive_1.asm
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_sub_err3_n -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c sub_err3_n.c  -fPIC -DPIC -o .libs/sub_err3_n.o
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_lshift -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack lshift.asm  -fPIC -DPIC -o .libs/lshift.o
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_lshift -DPIC lshift.asm >tmp-lshift.s
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_rshift -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack rshift.asm  -fPIC -DPIC -o .libs/rshift.o
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_rshift -DPIC rshift.asm >tmp-rshift.s
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo diveby3 | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o diveby3.lo diveby3.c
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo divis | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o divis.lo divis.c
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_lshift -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-lshift.s -fPIC -DPIC -o .libs/lshift.o
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_rshift -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-rshift.s -fPIC -DPIC -o .libs/rshift.o
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo divrem | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o divrem.lo divrem.c
/bin/bash ../libtool --mode=compile --tag=CC ../mpn/m4-ccas --m4="m4" /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo divrem_1 | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack `test -f 'divrem_1.asm' || echo './'`divrem_1.asm
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_dive_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack dive_1.asm  -fPIC -DPIC -o .libs/dive_1.o
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_dive_1 -DPIC dive_1.asm >tmp-dive_1.s
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_dive_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-dive_1.s -fPIC -DPIC -o .libs/dive_1.o
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_divis -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c divis.c  -fPIC -DPIC -o .libs/divis.o
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_diveby3 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c diveby3.c  -fPIC -DPIC -o .libs/diveby3.o
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo divrem_2 | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o divrem_2.lo divrem_2.c
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_divrem -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c divrem.c  -fPIC -DPIC -o .libs/divrem.o
libtool: compile:  ../mpn/m4-ccas --m4=m4 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_divrem_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack divrem_1.asm  -fPIC -DPIC -o .libs/divrem_1.o
m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_divrem_1 -DPIC divrem_1.asm >tmp-divrem_1.s
/bin/bash ../libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I. -I..  -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo fib2_ui | sed 's/_$//'` -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include  -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c -o fib2_ui.lo fib2_ui.c
 /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_divrem_1 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -Wa,--noexecstack tmp-divrem_1.s -fPIC -DPIC -o .libs/divrem_1.o
tmp-divrem_1.s: Assembler messages:
tmp-divrem_1.s:130: Error: selected processor does not support `mls r1,r4,r8,r11' in ARM mode
tmp-divrem_1.s:146: Error: selected processor does not support `mls r1,r4,r8,r11' in ARM mode
tmp-divrem_1.s:159: Error: selected processor does not support `mls r1,r4,r8,r11' in ARM mode
tmp-divrem_1.s:176: Error: selected processor does not support `mls r1,r4,r3,r8' in ARM mode
tmp-divrem_1.s:210: Error: selected processor does not support `mls r11,r4,r12,r3' in ARM mode
make[3]: *** [Makefile:768: divrem_1.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_divrem_2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c divrem_2.c  -fPIC -DPIC -o .libs/divrem_2.o
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_fib2_ui -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -O2 -I/home/pi/buildroot/buildroot-2020.08-rc2/output/host/include -c fib2_ui.c  -fPIC -DPIC -o .libs/fib2_ui.o
make[3]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/mpn'
make[2]: *** [Makefile:995: all-recursive] Error 1
make[2]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0'
make[1]: *** [Makefile:785: all] Error 2
make[1]: Leaving directory '/home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0'
make: *** [package/pkg-generic.mk:250: /home/pi/buildroot/buildroot-2020.08-rc2/output/build/host-gmp-6.2.0/.stamp_built] Error 2
pi at raspberrypi:~/buildroot/buildroot-2020.08-rc2 $

If I need to deliver more, or try something out, please let me know.

Best regards,

Martin

-----Urspr?ngliche Nachricht-----
Von: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Gesendet: Montag, 24. August 2020 22:19
An: Marie Maurer <marie.maurer@pixida.de>
Cc: buildroot at busybox.net
Betreff: Re: [Buildroot] Building for Raspberry Pi on Pi (in Ubuntu WSL same is working)

Hello Marie,

On Mon, 24 Aug 2020 14:09:01 +0000
Marie Maurer <marie.maurer@pixida.de> wrote:

> /usr/bin/gcc -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I..
> -DOPERATION_divrem_1
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include -O2
> -I/home/pi/buildroot/buildroot-2020.08-rc1/output/host/include
> -Wa,--noexecstack tmp-divrem_1.s -fPIC -DPIC -o .libs/divrem_1.o
> tmp-divrem_1.s: Assembler messages:
> tmp-divrem_1.s:129: Error: selected processor does not support `mls
> r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:145: Error: selected processor does not support `mls
> r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:158: Error: selected processor does not support `mls
> r1,r4,r8,r11' in ARM mode
> tmp-divrem_1.s:175: Error: selected processor does not support `mls
> r1,r4,r3,r8' in ARM mode
> tmp-divrem_1.s:209: Error: selected processor does not support `mls
> r11,r4,r12,r3' in ARM mode

So this means that the GMP build system thinks your CPU supports the MLS instruction (which exists since ARMv6T2), but in fact the gcc on your system says it is not available.

I would suggest to have a look at how GMP detects which optimized ARM code to use in mpn/arm/ as this is probably where the issue is.

Could you try with GMP 6.2.0 as was suggested in the thread, or share the complete build log of host-gmp, as well as the config.log file ?

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Pixida GmbH
Ungererstr. 129
80805 M?nchen

Amtsgericht M?nchen - HRB 173520
Gesch?ftsf?hrer Johann Neubauer, Panagiota Dimou



www.pixida.de<http://www.pixida.de/>

[PIXIDA]



Unsere Datenschutzgrunds?tze<http://www.pixida.com/grundsaetze.html>
