From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 8 May 2016 15:02:24 +0200
Subject: [Buildroot] Pulseaudio does not detect ofono and bluez5
Message-ID: <572F38E0.3040004@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net


Compiling pulseaudio with bluez5 and ofono should lead to their support.
Instead the configure process doesn't detect them as you can see in the 
Makefile:

> HAVE_ALSA = 1
> HAVE_AVAHI = 0
> HAVE_BLUEZ = 0
> HAVE_BLUEZ_4 = 0
> HAVE_BLUEZ_5 = 0
> HAVE_BLUEZ_5_NATIVE_HEADSET = 0
> HAVE_BLUEZ_5_OFONO_HEADSET = 0

I tried to rebuild pulseaudio after the whole image is generated (i.e. 
if it was compiled before ofono and bluez5) but with no chance.

Then, I save the output of the rebuilding (attached to this email):

> Enable D-Bus:                  yes
>       Enable BlueZ 4:              no
>       Enable BlueZ 5:              no
>         Enable ofono headsets:     no
>         Enable native headsets:    no


I also see this warning:

> configure: WARNING: unrecognized options: --disable-gtk-doc, 
> --disable-gtk-doc-html, --disable-doc, --disable-docs, 
> --disable-documentation, --with-xmlto, --with-fop, --enable-libudev

I also attach the .config file. Please be aware about the changes I made 
to compile bluez5. Version: Buildroot 2016.05-git-01212-gabfaf47-dirty.

Marco


-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 93201 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160508/202a0642/attachment-0001.wsdl>
-------------- next part --------------
pulseaudio-8.0.tar.xz: OK (md5: 8678442ba0bb4b4c33ac6f62542962df)
pulseaudio-8.0.tar.xz: OK (sha1: 1399a2f6288ad743184b6c2192129fef033343ac)
[7m>>> pulseaudio 8.0 Extracting[27m
xzcat /home/femtotech/dev/buildroot/dl/pulseaudio-8.0.tar.xz | tar --strip-components=1 -C /home/femtotech/dev/buildroot/output/build/pulseaudio-8.0   -xf -
[7m>>> pulseaudio 8.0 Patching[27m

Applying 0001-padsp-Make-it-compile-on-musl.patch using patch: 
patching file src/utils/padsp.c
Hunk #1 succeeded at 2371 (offset 3 lines).
Hunk #2 succeeded at 2511 (offset 3 lines).
Hunk #3 succeeded at 2550 (offset 3 lines).
Hunk #4 succeeded at 2676 (offset 3 lines).
[7m>>> pulseaudio 8.0 Updating config.sub and config.guess[27m
for file in config.guess config.sub; do for i in $(find /home/femtotech/dev/buildroot/output/build/pulseaudio-8.0 -name $file); do cp support/gnuconfig/$file $i; done; done
[7m>>> pulseaudio 8.0 Patching libtool[27m

Applying buildroot-libtool-v2.4.patch using patch: 
patching file ltmain.sh
[7m>>> pulseaudio 8.0 Configuring[27m
(cd /home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/ && rm -rf config.cache && PATH="/home/femtotech/dev/buildroot/output/host/bin:/home/femtotech/dev/buildroot/output/host/sbin:/home/femtotech/dev/buildroot/output/host/usr/bin:/home/femtotech/dev/buildroot/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" AR="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ar" AS="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-as" LD="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld" NM="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-nm" CC="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc" GCC="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc" CPP="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-cpp" CXX="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++" FC="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gfortran" RANLIB="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ranlib" READELF="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-readelf" STRIP="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-strip" OBJCOPY="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-objcopy" OBJDUMP="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/home/femtotech/dev/buildroot/output/host/usr/include" CFLAGS_FOR_BUILD="-O2 -I/home/femtotech/dev/buildroot/output/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/home/femtotech/dev/buildroot/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/femtotech/dev/buildroot/output/host/lib -L/home/femtotech/dev/buildroot/output/host/usr/lib -Wl,-rpath,/home/femtotech/dev/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-as" DEFAULT_LINKER="/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld" CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os " LDFLAGS="" FCFLAGS="" PKG_CONFIG="/home/femtotech/dev/buildroot/output/host/usr/bin/pkg-config" STAGING_DIR="/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot" INTLTOOL_PERL=/usr/bin/perl ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no   CONFIG_SITE=/dev/null ./configure --target=arm-buildroot-linux-uclibcgnueabihf --host=arm-buildroot-linux-uclibcgnueabihf --build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --localstatedir=/var --program-prefix="" --disable-gtk-doc --disable-gtk-doc-html --disable-doc --disable-docs --disable-documentation --with-xmlto=no --with-fop=no --disable-dependency-tracking --enable-ipv6  --disable-static --enable-shared  --disable-default-build-tests --disable-legacy-database-entry-format --disable-manpages --with-database=simple --disable-jack --disable-orc --without-caps --disable-gtk3 --without-soxr --enable-libudev --enable-neon-opt=yes --disable-x11 )
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-libudev
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-buildroot-linux-uclibcgnueabihf-strip... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether UID '1000' is supported by ustar format... yes
checking whether GID '1000' is supported by ustar format... yes
checking how to create a ustar tar archive... gnutar
checking build system type... x86_64-unknown-linux-gnu
checking host system type... arm-buildroot-linux-uclibcgnueabihf
checking for stow... no
checking whether make supports nested variables... (cached) yes
checking whether ln -s works... yes
checking for arm-buildroot-linux-uclibcgnueabihf-gcc... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc accepts -g... yes
checking for /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc option to accept ISO C89... none needed
checking whether /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc understands -c and -o together... yes
checking for style of include used by make... GNU
checking dependency style of /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc... none
checking for /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc option to accept ISO C99... -std=gnu99
checking whether we are using the GNU C++ compiler... yes
checking whether /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ accepts -g... yes
checking dependency style of /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++... none
checking how to run the C preprocessor... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-cpp
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking whether /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 needs -traditional... no
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
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for gm4... no
checking for m4... m4
checking pkg-config is at least version 0.9.0... yes
checking whether NLS is requested... yes
checking for intltool >= 0.35.0... 0.51.0 found
checking for intltool-update... /home/femtotech/dev/buildroot/output/host/usr/bin/intltool-update
checking for intltool-merge... /home/femtotech/dev/buildroot/output/host/usr/bin/intltool-merge
checking for intltool-extract... /home/femtotech/dev/buildroot/output/host/usr/bin/intltool-extract
checking for xgettext... /home/femtotech/dev/buildroot/output/host/usr/bin/xgettext
checking for msgmerge... /home/femtotech/dev/buildroot/output/host/usr/bin/msgmerge
checking for msgfmt... /home/femtotech/dev/buildroot/output/host/usr/bin/msgfmt
checking for gmsgfmt... /home/femtotech/dev/buildroot/output/host/usr/bin/msgfmt
checking for perl... /usr/bin/perl
checking for perl >= 5.8.1... 5.20.2
checking for XML::Parser... ok
checking for msgfmt... (cached) /home/femtotech/dev/buildroot/output/host/usr/bin/msgfmt
checking for gmsgfmt... (cached) /home/femtotech/dev/buildroot/output/host/usr/bin/msgfmt
checking for xgettext... (cached) /home/femtotech/dev/buildroot/output/host/usr/bin/xgettext
checking for msgmerge... (cached) /home/femtotech/dev/buildroot/output/host/usr/bin/msgmerge
checking for ld used by GCC... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld
checking if the linker (/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld) is GNU ld... yes
checking for shared library run path origin... done
checking for CFPreferencesCopyAppValue... no
checking for CFLocaleCopyCurrent... no
checking for GNU gettext in libc... no
checking for iconv... yes
checking for working iconv... guessing yes
checking for GNU gettext in libintl... no
checking whether to use NLS... no
checking host operating system... linux
checking whether C compiler accepts -Wall... yes
checking whether C compiler accepts -W... yes
checking whether C compiler accepts -Wextra... yes
checking whether C compiler accepts -pipe... yes
checking whether C compiler accepts -Wno-long-long... yes
checking whether C compiler accepts -Wno-overlength-strings... yes
checking whether C compiler accepts -Wunsafe-loop-optimizations... yes
checking whether C compiler accepts -Wundef... yes
checking whether C compiler accepts -Wformat=2... yes
checking whether C compiler accepts -Wlogical-op... yes
checking whether C compiler accepts -Wsign-compare... yes
checking whether C compiler accepts -Wformat-security... yes
checking whether C compiler accepts -Wmissing-include-dirs... yes
checking whether C compiler accepts -Wformat-nonliteral... yes
checking whether C compiler accepts -Wold-style-definition... no
checking whether C compiler accepts -Wpointer-arith... yes
checking whether C compiler accepts -Winit-self... yes
checking whether C compiler accepts -Wdeclaration-after-statement... yes
checking whether C compiler accepts -Wfloat-equal... yes
checking whether C compiler accepts -Wmissing-prototypes... yes
checking whether C compiler accepts -Wstrict-prototypes... no
checking whether C compiler accepts -Wredundant-decls... yes
checking whether C compiler accepts -Wmissing-declarations... yes
checking whether C compiler accepts -Wmissing-noreturn... yes
checking whether C compiler accepts -Wshadow... yes
checking whether C compiler accepts -Wendif-labels... yes
checking whether C compiler accepts -Wcast-align... yes
checking whether C compiler accepts -Wstrict-aliasing... yes
checking whether C compiler accepts -Wwrite-strings... yes
checking whether C compiler accepts -Wno-unused-parameter... yes
checking whether C compiler accepts -ffast-math... yes
checking whether C compiler accepts -fno-common... yes
checking whether C compiler accepts -fdiagnostics-show-option... yes
checking whether C compiler accepts -fdiagnostics-color=auto... yes
checking whether the linker accepts "-Wl,-version-script=./src/map-file"... yes
checking whether the linker accepts -Wl,-z,now... yes
checking whether the linker accepts -Wl,-z,nodelete... yes
checking whether the linker accepts -Wl,--no-undefined... yes
checking whether /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 knows __sync_bool_compare_and_swap()... yes
checking support for required armv6 instructions... yes
checking how to print strings... printf
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... /bin/grep -F
checking for ld used by /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld
checking if the linker (/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-nm
checking the name lister (/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-nm) interface... BSD nm
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking how to convert x86_64-unknown-linux-gnu file names to arm-buildroot-linux-uclibcgnueabihf format... func_convert_file_noop
checking how to convert x86_64-unknown-linux-gnu file names to toolchain format... func_convert_file_noop
checking for /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld option to reload object files... -r
checking for arm-buildroot-linux-uclibcgnueabihf-objdump... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-buildroot-linux-uclibcgnueabihf-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for arm-buildroot-linux-uclibcgnueabihf-ar... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ar
checking for archiver @FILE support... @
checking for arm-buildroot-linux-uclibcgnueabihf-strip... (cached) /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-strip
checking for arm-buildroot-linux-uclibcgnueabihf-ranlib... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ranlib
checking command to parse /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-nm output from /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 object... ok
checking for sysroot... no
checking for arm-buildroot-linux-uclibcgnueabihf-mt... no
checking for mt... mt
configure: WARNING: using cross tools not prefixed with host triplet
checking if mt is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 supports -fno-rtti -fno-exceptions... no
checking for /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 option to produce PIC... -fPIC -DPIC
checking if /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 PIC flag -fPIC -DPIC works... yes
checking if /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 static flag -static works... yes
checking if /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 supports -c -o file.o... yes
checking if /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 supports -c -o file.o... (cached) yes
checking whether the /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 linker (/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for shl_load... no
checking for shl_load in -ldld... no
checking for dlopen... no
checking for dlopen in -ldl... yes
checking whether a program can dlopen itself... cross
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking how to run the C++ preprocessor... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -E
checking for ld used by /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++... /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld
checking if the linker (/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld) is GNU ld... yes
checking whether the /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ linker (/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld) supports shared libraries... yes
checking for /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ option to produce PIC... -fPIC -DPIC
checking if /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ PIC flag -fPIC -DPIC works... yes
checking if /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ static flag -static works... yes
checking if /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ supports -c -o file.o... yes
checking if /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ supports -c -o file.o... (cached) yes
checking whether the /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ linker (/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-ld) supports shared libraries... yes
checking dynamic linker characteristics... (cached) GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking ltdl.h usability... yes
checking ltdl.h presence... yes
checking for ltdl.h... yes
checking for lt_dladvise_init in -lltdl... yes
checking for ANSI C header files... (cached) yes
checking for arpa/inet.h... yes
checking for glob.h... yes
checking for grp.h... yes
checking for netdb.h... yes
checking for netinet/in.h... yes
checking for netinet/in_systm.h... yes
checking for netinet/tcp.h... yes
checking for poll.h... yes
checking for pwd.h... yes
checking for sched.h... yes
checking for sys/mman.h... yes
checking for sys/select.h... yes
checking for sys/socket.h... yes
checking for sys/wait.h... yes
checking for sys/uio.h... yes
checking for syslog.h... yes
checking for sys/dl.h... no
checking for dlfcn.h... (cached) yes
checking for linux/sockios.h... yes
checking for sys/prctl.h... yes
checking for sys/filio.h... no
checking for windows.h... no
checking for winsock2.h... no
checking for ws2tcpip.h... no
checking for sys/atomic.h... no
checking for sys/ioctl.h... yes
checking for byteswap.h... yes
checking for sys/syscall.h... yes
checking for sys/eventfd.h... yes
checking for execinfo.h... no
checking for langinfo.h... yes
checking for regex.h... yes
checking for pcreposix.h... yes
checking for locale.h... yes
checking for xlocale.h... yes
checking for valgrind/memcheck.h... no
checking for netinet/ip.h... yes
checking sys/resource.h usability... yes
checking sys/resource.h presence... yes
checking for sys/resource.h... yes
checking sys/un.h usability... yes
checking sys/un.h presence... yes
checking for sys/un.h... yes
checking linux/input.h usability... yes
checking linux/input.h presence... yes
checking for linux/input.h... yes
checking for an ANSI C-conforming const... yes
checking whether byte ordering is bigendian... (cached) no
checking for pid_t... yes
checking for size_t... yes
checking for ssize_t... yes
checking for off_t... yes
checking for uid_t in sys/types.h... yes
checking whether environ is declared... yes
checking size of void*... 4
checking whether __x86_64__ is declared... no
checking for SIGXCPU defined in signal.h... yes
checking for INADDR_NONE defined in netinet/in.h... yes
checking whether /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99 knows _Bool... yes
checking for thread local storage (TLS) class... __thread
checking for the pthreads library -lpthreads... no
checking whether pthreads work without any flags... no
checking whether pthreads work with -Kthread... no
checking whether pthreads work with -kthread... no
checking for the pthreads library -llthread... no
checking whether pthreads work with -pthread... yes
checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
checking if more special flags are required for pthreads... no
checking for PTHREAD_PRIO_INHERIT... yes
checking for library containing pow... -lm
checking for library containing sched_setscheduler... none required
checking for library containing dlopen... -ldl
checking for library containing shm_open... -lrt
checking for library containing inet_ntop... none required
checking for library containing timer_create... none required
checking for library containing pthread_setaffinity_np... -lpthread
checking for library containing pthread_getname_np... no
checking for library containing pthread_setname_np... no
checking for library containing connect... none required
checking for library containing backtrace... no
checking for library containing regexec... none required
checking for getopt_long... yes
checking for lrintf... yes
checking for strtof... yes
checking for chmod... yes
checking for chown... yes
checking for fstat... yes
checking for fchown... yes
checking for fchmod... yes
checking for clock_gettime... yes
checking for getaddrinfo... yes
checking for getgrgid_r... yes
checking for getgrnam_r... yes
checking for getpwnam_r... yes
checking for getpwuid_r... yes
checking for gettimeofday... yes
checking for getuid... yes
checking for mlock... yes
checking for nanosleep... yes
checking for pipe... yes
checking for posix_fadvise... yes
checking for posix_madvise... yes
checking for posix_memalign... yes
checking for setpgid... yes
checking for setsid... yes
checking for shm_open... yes
checking for sigaction... yes
checking for sleep... yes
checking for symlink... yes
checking for sysconf... yes
checking for uname... yes
checking for pthread_setaffinity_np... yes
checking for pthread_getname_np... no
checking for pthread_setname_np... no
checking for readlink... yes
checking for ctime_r... yes
checking for usleep... yes
checking for strerror_r... yes
checking for lstat... yes
checking for paccept... no
checking for setresuid... yes
checking for setresgid... yes
checking for setreuid... yes
checking for setregid... yes
checking for seteuid... yes
checking for setegid... yes
checking for ppoll... yes
checking for strsignal... yes
checking for sig2str... no
checking for strtod_l... yes
checking for pipe2... yes
checking for accept4... yes
checking for open64... yes
checking vfork.h usability... no
checking vfork.h presence... no
checking for vfork.h... no
checking for fork... yes
checking for vfork... yes
checking for working fork... cross
configure: WARNING: result yes guessed because of cross compilation
checking for working vfork... (cached) yes
checking type of array argument to getgroups... gid_t
checking for getgroups... yes
checking for working getgroups... no
checking for mkfifo... yes
checking for working alloca.h... yes
checking for alloca... yes
checking for regexec... yes
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking for library containing dladdr... none required
checking for iconv... (cached) yes
checking for working iconv... (cached) guessing yes
checking for iconv declaration... 
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
checking for LIBCHECK... no
checking for LIBJSON... yes
checking for LIBSNDFILE... yes
checking whether we need libatomic_ops... no
checking sys/soundcard.h usability... yes
checking sys/soundcard.h presence... yes
checking for sys/soundcard.h... yes
checking CoreAudio/CoreAudio.h usability... no
checking CoreAudio/CoreAudio.h presence... no
checking for CoreAudio/CoreAudio.h... no
checking for ASOUNDLIB... yes
checking use-case.h usability... yes
checking use-case.h presence... yes
checking for use-case.h... yes
checking sys/audio.h usability... no
checking sys/audio.h presence... no
checking for sys/audio.h... no
checking for mmsystem.h... no
checking for GLIB20... yes
checking for GCONF... no
checking for AVAHI... no
checking for LIBASYNCNS... no
checking for tcpwrap library and headers... no
checking lirc/lirc_client.h usability... no
checking lirc/lirc_client.h presence... no
checking for lirc/lirc_client.h... no
checking for lirc_init in -llirc_client... no
checking for DBUS... yes
checking for dbus_watch_get_unix_fd... yes
checking for SBC... no
checking for UDEV... yes
checking for OPENSSL... yes
checking for FFTW... no
checking for LIBSPEEX... yes
checking xenctrl.h usability... no
checking xenctrl.h presence... no
checking for xenctrl.h... no
checking xs.h usability... no
checking xs.h presence... no
checking for xs.h... no
checking for xc_interface_open in -lxenctrl... no
checking for xs_domain_open in -lxenstore... no
checking for SYSTEMD... no
checking for SYSTEMDDAEMON... no
checking for SYSTEMDLOGIN... no
checking for SYSTEMDJOURNAL... no
checking for WEBRTC... no
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/Makefile
config.status: creating man/Makefile
config.status: creating libpulse.pc
config.status: creating libpulse-simple.pc
config.status: creating libpulse-mainloop-glib.pc
config.status: creating doxygen/Makefile
config.status: creating doxygen/doxygen.conf
config.status: creating src/pulse/version.h
config.status: creating po/Makefile.in
config.status: creating man/pulseaudio.1.xml
config.status: creating man/esdcompat.1.xml
config.status: creating man/pax11publish.1.xml
config.status: creating man/pacat.1.xml
config.status: creating man/pacmd.1.xml
config.status: creating man/pactl.1.xml
config.status: creating man/pasuspender.1.xml
config.status: creating man/padsp.1.xml
config.status: creating man/pulse-daemon.conf.5.xml
config.status: creating man/pulse-client.conf.5.xml
config.status: creating man/default.pa.5.xml
config.status: creating man/pulse-cli-syntax.5.xml
config.status: creating man/start-pulseaudio-x11.1.xml
config.status: creating src/esdcompat
config.status: creating src/start-pulseaudio-x11
config.status: creating src/client.conf
config.status: creating src/daemon.conf
config.status: creating src/default.pa
config.status: creating src/system.pa
config.status: creating PulseAudioConfig.cmake
config.status: creating PulseAudioConfigVersion.cmake
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing po-directories commands
config.status: creating po/POTFILES
config.status: creating po/Makefile
config.status: executing libtool commands
config.status: executing po/stamp-it commands
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-libudev

 ---{ pulseaudio 8.0 }---

    prefix:                        /usr
    sysconfdir:                    /etc
    localstatedir:                 /var
    modlibexecdir:                 ${exec_prefix}/lib/pulse-8.0/modules
    System Runtime Path:           /var/run/pulse
    System State Path:             /var/lib/pulse
    System Config Path:            /var/lib/pulse
    Zsh completions directory:     ${datarootdir}/zsh/site-functions
    Bash completions directory:    ${datarootdir}/bash-completion/completions
    Compiler:                      /home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -std=gnu99
    CFLAGS:                        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Wall -W -Wextra -pipe -Wno-long-long -Wno-overlength-strings -Wunsafe-loop-optimizations -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wformat-security -Wmissing-include-dirs -Wformat-nonliteral -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing -Wwrite-strings -Wno-unused-parameter -ffast-math -fno-common -fdiagnostics-show-option -fdiagnostics-color=auto
    CPPFLAGS:                      -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DFASTPATH -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
    LIBS:                          -lpthread -lrt -ldl -lm 

    Enable X11:                    no
    Enable OSS Output:             yes
    Enable OSS Wrapper:            yes
    Enable EsounD:                 yes
    Enable Alsa:                   yes
    Enable CoreAudio:              no
    Enable Solaris:                no
    Enable WaveOut:                no
    Enable GLib 2.0:               yes
    Enable Gtk+ 3.0:               no
    Enable GConf:                  no
    Enable Avahi:                  no
    Enable Jack:                   no
    Enable Async DNS:              no
    Enable LIRC:                   no
    Enable Xen PV driver:          no
    Enable D-Bus:                  yes
      Enable BlueZ 4:              no
      Enable BlueZ 5:              no
        Enable ofono headsets:     no
        Enable native headsets:    no
    Enable udev:                   yes
      Enable HAL->udev compat:     yes
    Enable systemd
      Daemon (Socket Activation):  no
      Login (Session Tracking):    no
      Journal (Logging):           no
    Enable TCP Wrappers:           no
    Enable libsamplerate:          no
    Enable IPv6:                   yes
    Enable OpenSSL (for Airtunes): yes
    Enable fftw:                   no
    Enable orc:                    no
    Enable Adrian echo canceller:  yes
    Enable speex (resampler, AEC): yes
    Enable soxr (resampler):       no
    Enable WebRTC echo canceller:  no
    Enable gcov coverage:          no
    Enable unit tests:             no
    Database
      tdb:                         no
      gdbm:                        no
      simple database:             yes

    System User:                   pulse
    System Group:                  pulse
    Access Group:                  pulse-access
    Enable per-user EsounD socket: yes
    Force preopen:                 no
    Preopened modules:             all

    Legacy Database Entry Support: no

[7m>>> pulseaudio 8.0 Building[27m
PATH="/home/femtotech/dev/buildroot/output/host/bin:/home/femtotech/dev/buildroot/output/host/sbin:/home/femtotech/dev/buildroot/output/host/usr/bin:/home/femtotech/dev/buildroot/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /usr/bin/make -j5  -C /home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
/usr/bin/make  all-recursive
make[2]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
Making all in src
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
/usr/bin/make  all-am
make[4]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
  CC       pulsecore/libpulsecore_sconv_neon_la-sconv_neon.lo
  CC       pulsecore/libpulsecore_remap_neon_la-remap_neon.lo
  CC       pulsecore/libpulsecore_mix_neon_la-mix_neon.lo
  CC       pulsecore/protocol-cli.lo
  CC       pulsecore/protocol-simple.lo
  CC       pulsecore/protocol-http.lo
  CC       pulsecore/mime-type.lo
  CC       pulsecore/libprotocol_native_la-protocol-native.lo
  CC       pulsecore/protocol-esound.lo
  CC       modules/rtp/module_rtp_send_la-module-rtp-send.lo
  CC       modules/rtp/module_rtp_recv_la-module-rtp-recv.lo
In file included from ./pulsecore/asyncmsgq.h:27:0,
                 from ./pulsecore/core.h:46,
                 from ./pulsecore/client.h:27,
                 from pulsecore/protocol-native.c:40:
pulsecore/protocol-native.c: In function 'record_stream_new':
./pulsecore/msgobject.h:39:33: warning: cast increases required alignment of target type [-Wcast-align]
 #define pa_msgobject_new(type) ((type*) pa_msgobject_new_internal(sizeof(type), type##_type_id, type##_check_type))
                                 ^
pulsecore/protocol-native.c:705:9: note: in expansion of macro 'pa_msgobject_new'
     s = pa_msgobject_new(record_stream);
         ^
pulsecore/protocol-native.c: In function 'playback_stream_new':
./pulsecore/msgobject.h:39:33: warning: cast increases required alignment of target type [-Wcast-align]
 #define pa_msgobject_new(type) ((type*) pa_msgobject_new_internal(sizeof(type), type##_type_id, type##_check_type))
                                 ^
pulsecore/protocol-native.c:1179:9: note: in expansion of macro 'pa_msgobject_new'
     s = pa_msgobject_new(playback_stream);
         ^
  CC       modules/module_cli_protocol_unix_la-module-protocol-stub.lo
In file included from modules/rtp/module-rtp-recv.c:27:0:
modules/rtp/module-rtp-recv.c: In function 'mcast_socket':
modules/rtp/module-rtp-recv.c:455:21: warning: cast increases required alignment of target type [-Wcast-align]
         if ((ntohl(((const struct sockaddr_in*) sa)->sin_addr.s_addr) & ipv4_mcast_mask) == ipv4_mcast_mask) {
                     ^
modules/rtp/module-rtp-recv.c:458:34: warning: cast increases required alignment of target type [-Wcast-align]
             mr4.imr_multiaddr = ((const struct sockaddr_in*) sa)->sin_addr;
                                  ^
modules/rtp/module-rtp-recv.c:464:14: warning: cast increases required alignment of target type [-Wcast-align]
         if (((const struct sockaddr_in6*) sa)->sin6_addr.s6_addr[0] == 0xff) {
              ^
modules/rtp/module-rtp-recv.c:467:37: warning: cast increases required alignment of target type [-Wcast-align]
             mr6.ipv6mr_multiaddr = ((const struct sockaddr_in6*) sa)->sin6_addr;
                                     ^
  CC       modules/module_simple_protocol_unix_la-module-protocol-stub.lo
  CC       modules/module_http_protocol_unix_la-module-protocol-stub.lo
  CC       modules/module_native_protocol_unix_la-module-protocol-stub.lo
  CC       modules/module_esound_protocol_unix_la-module-protocol-stub.lo
  CC       modules/module-pipe-sink.lo
  CC       modules/module-pipe-source.lo
  CC       modules/module-esound-compat-spawnfd.lo
  CC       modules/module-esound-compat-spawnpid.lo
  CC       modules/module-match.lo
  CC       modules/libalsa_util_la-reserve-wrap.lo
  CC       modules/libalsa_util_la-udev-util.lo
  CC       modules/libalsa_util_la-reserve.lo
  CC       modules/libalsa_util_la-reserve-monitor.lo
  CC       modules/alsa/module_alsa_sink_la-module-alsa-sink.lo
  CC       modules/alsa/module_alsa_source_la-module-alsa-source.lo
  CC       modules/alsa/module_alsa_card_la-module-alsa-card.lo
  CC       modules/module_mmkbd_evdev_la-module-mmkbd-evdev.lo
  CC       modules/module_hal_detect_la-module-hal-detect-compat.lo
  CC       modules/module_udev_detect_la-module-udev-detect.lo
  CC       modules/module_rygel_media_server_la-module-rygel-media-server.lo
  CC       utils/pacat-pacat.o
  CC       utils/pactl-pactl.o
modules/module-udev-detect.c: In function 'inotify_cb':
modules/module-udev-detect.c:616:21: warning: cast increases required alignment of target type [-Wcast-align]
             event = (struct inotify_event*) ((uint8_t*) event + len);
                     ^
  CC       utils/pasuspender-pasuspender.o
  CC       utils/pacmd-pacmd.o
/bin/sed -e "s|@pkglibdir[@]|/usr/lib/pulseaudio|g" utils/padsp.in > padsp
  CC       pulse/libpulsecommon_8.0_la-client-conf.lo
  CC       pulse/libpulsecommon_8.0_la-fork-detect.lo
  CC       pulse/libpulsecommon_8.0_la-format.lo
  CC       pulse/libpulsecommon_8.0_la-xmalloc.lo
  CC       pulse/libpulsecommon_8.0_la-proplist.lo
  CC       pulse/libpulsecommon_8.0_la-utf8.lo
  CC       pulse/libpulsecommon_8.0_la-channelmap.lo
  CC       pulse/libpulsecommon_8.0_la-sample.lo
  CC       pulse/libpulsecommon_8.0_la-util.lo
  CC       pulse/libpulsecommon_8.0_la-timeval.lo
  CC       pulse/libpulsecommon_8.0_la-rtclock.lo
  CC       pulse/libpulsecommon_8.0_la-volume.lo
  CC       pulsecore/libpulsecommon_8.0_la-authkey.lo
  CC       pulsecore/libpulsecommon_8.0_la-conf-parser.lo
  CC       pulsecore/libpulsecommon_8.0_la-core-error.lo
  CC       pulsecore/libpulsecommon_8.0_la-core-format.lo
  CC       pulsecore/libpulsecommon_8.0_la-core-rtclock.lo
  CC       pulsecore/libpulsecommon_8.0_la-core-util.lo
  CC       pulsecore/libpulsecommon_8.0_la-dynarray.lo
  CC       pulsecore/libpulsecommon_8.0_la-fdsem.lo
  CC       pulsecore/libpulsecommon_8.0_la-flist.lo
  CC       pulsecore/libpulsecommon_8.0_la-g711.lo
pulsecore/fdsem.c: In function 'pa_fdsem_new':
pulsecore/fdsem.c:74:15: warning: cast increases required alignment of target type [-Wcast-align]
     f->data = (pa_fdsem_data*) ((uint8_t*) f + PA_ALIGN(sizeof(pa_fdsem)));
               ^
  CC       pulsecore/libpulsecommon_8.0_la-hashmap.lo
  CC       pulsecore/libpulsecommon_8.0_la-i18n.lo
pulsecore/hashmap.c: In function 'remove_entry':
pulsecore/hashmap.c:54:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_HASH(h) ((struct hashmap_entry**) ((uint8_t*) (h) + PA_ALIGN(sizeof(pa_hashmap))))
                     ^
pulsecore/hashmap.c:102:9: note: in expansion of macro 'BY_HASH'
         BY_HASH(h)[hash] = e->bucket_next;
         ^
pulsecore/hashmap.c: In function 'hash_scan':
pulsecore/hashmap.c:54:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_HASH(h) ((struct hashmap_entry**) ((uint8_t*) (h) + PA_ALIGN(sizeof(pa_hashmap))))
                     ^
pulsecore/hashmap.c:127:14: note: in expansion of macro 'BY_HASH'
     for (e = BY_HASH(h)[hash]; e; e = e->bucket_next)
              ^
pulsecore/hashmap.c: In function 'pa_hashmap_put':
pulsecore/hashmap.c:54:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_HASH(h) ((struct hashmap_entry**) ((uint8_t*) (h) + PA_ALIGN(sizeof(pa_hashmap))))
                     ^
pulsecore/hashmap.c:152:22: note: in expansion of macro 'BY_HASH'
     e->bucket_next = BY_HASH(h)[hash];
                      ^
pulsecore/hashmap.c:54:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_HASH(h) ((struct hashmap_entry**) ((uint8_t*) (h) + PA_ALIGN(sizeof(pa_hashmap))))
                     ^
pulsecore/hashmap.c:154:9: note: in expansion of macro 'BY_HASH'
     if (BY_HASH(h)[hash])
         ^
pulsecore/hashmap.c:54:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_HASH(h) ((struct hashmap_entry**) ((uint8_t*) (h) + PA_ALIGN(sizeof(pa_hashmap))))
                     ^
pulsecore/hashmap.c:155:9: note: in expansion of macro 'BY_HASH'
         BY_HASH(h)[hash]->bucket_previous = e;
         ^
pulsecore/hashmap.c:54:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_HASH(h) ((struct hashmap_entry**) ((uint8_t*) (h) + PA_ALIGN(sizeof(pa_hashmap))))
                     ^
pulsecore/hashmap.c:156:5: note: in expansion of macro 'BY_HASH'
     BY_HASH(h)[hash] = e;
     ^
  CC       pulsecore/libpulsecommon_8.0_la-idxset.lo
  CC       pulsecore/libpulsecommon_8.0_la-arpa-inet.lo
  CC       pulsecore/libpulsecommon_8.0_la-iochannel.lo
pulsecore/idxset.c: In function 'remove_entry':
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:121:9: note: in expansion of macro 'BY_DATA'
         BY_DATA(s)[hash] = e->data_next;
         ^
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:57:22: note: in expansion of macro 'BY_DATA'
 #define BY_INDEX(i) (BY_DATA(i) + NBUCKETS)
                      ^
pulsecore/idxset.c:131:9: note: in expansion of macro 'BY_INDEX'
         BY_INDEX(s)[e->idx % NBUCKETS] = e->index_next;
         ^
pulsecore/idxset.c: In function 'data_scan':
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:153:14: note: in expansion of macro 'BY_DATA'
     for (e = BY_DATA(s)[hash]; e; e = e->data_next)
              ^
pulsecore/idxset.c: In function 'index_scan':
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:57:22: note: in expansion of macro 'BY_DATA'
 #define BY_INDEX(i) (BY_DATA(i) + NBUCKETS)
                      ^
pulsecore/idxset.c:165:14: note: in expansion of macro 'BY_INDEX'
     for (e = BY_INDEX(s)[hash]; e; e = e->index_next)
              ^
pulsecore/idxset.c: In function 'pa_idxset_put':
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:194:20: note: in expansion of macro 'BY_DATA'
     e->data_next = BY_DATA(s)[hash];
                    ^
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:196:9: note: in expansion of macro 'BY_DATA'
     if (BY_DATA(s)[hash])
         ^
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:197:9: note: in expansion of macro 'BY_DATA'
         BY_DATA(s)[hash]->data_previous = e;
         ^
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:198:5: note: in expansion of macro 'BY_DATA'
     BY_DATA(s)[hash] = e;
     ^
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:57:22: note: in expansion of macro 'BY_DATA'
 #define BY_INDEX(i) (BY_DATA(i) + NBUCKETS)
                      ^
pulsecore/idxset.c:203:21: note: in expansion of macro 'BY_INDEX'
     e->index_next = BY_INDEX(s)[hash];
                     ^
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:57:22: note: in expansion of macro 'BY_DATA'
 #define BY_INDEX(i) (BY_DATA(i) + NBUCKETS)
                      ^
pulsecore/idxset.c:205:9: note: in expansion of macro 'BY_INDEX'
     if (BY_INDEX(s)[hash])
         ^
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:57:22: note: in expansion of macro 'BY_DATA'
 #define BY_INDEX(i) (BY_DATA(i) + NBUCKETS)
                      ^
pulsecore/idxset.c:206:9: note: in expansion of macro 'BY_INDEX'
         BY_INDEX(s)[hash]->index_previous = e;
         ^
pulsecore/idxset.c:56:21: warning: cast increases required alignment of target type [-Wcast-align]
 #define BY_DATA(i) ((struct idxset_entry**) ((uint8_t*) (i) + PA_ALIGN(sizeof(pa_idxset))))
                     ^
pulsecore/idxset.c:57:22: note: in expansion of macro 'BY_DATA'
 #define BY_INDEX(i) (BY_DATA(i) + NBUCKETS)
                      ^
pulsecore/idxset.c:207:5: note: in expansion of macro 'BY_INDEX'
     BY_INDEX(s)[hash] = e;
     ^
  CC       pulsecore/libpulsecommon_8.0_la-ioline.lo
  CC       pulsecore/libpulsecommon_8.0_la-ipacl.lo
pulsecore/iochannel.c: In function 'pa_iochannel_write_with_creds':
pulsecore/iochannel.c:324:9: warning: cast increases required alignment of target type [-Wcast-align]
     u = (struct ucred*) CMSG_DATA(&cmsg.hdr);
         ^
pulsecore/iochannel.c: In function 'pa_iochannel_write_with_fds':
pulsecore/iochannel.c:375:15: warning: cast increases required alignment of target type [-Wcast-align]
     msgdata = (int*) CMSG_DATA(&cmsg.hdr);
               ^
pulsecore/iochannel.c: In function 'pa_iochannel_read_with_ancil_data':
pulsecore/iochannel.c:448:35: warning: cast increases required alignment of target type [-Wcast-align]
                         pa_close(((int*) CMSG_DATA(cmh))[i]);
                                   ^
  CC       pulsecore/libpulsecommon_8.0_la-lock-autospawn.lo
  CC       pulsecore/libpulsecommon_8.0_la-log.lo
  CC       pulsecore/libpulsecommon_8.0_la-ratelimit.lo
  CC       pulsecore/libpulsecommon_8.0_la-mcalign.lo
  CC       pulsecore/libpulsecommon_8.0_la-memblock.lo
  CC       pulsecore/libpulsecommon_8.0_la-memblockq.lo
pulsecore/log.c: In function 'pa_log_levelv_meta':
pulsecore/log.c:373:14: warning: variable '_show_backtrace' set but not used [-Wunused-but-set-variable]
     unsigned _show_backtrace;
              ^
  CC       pulsecore/libpulsecommon_8.0_la-memchunk.lo
  CC       pulsecore/libpulsecommon_8.0_la-once.lo
  CC       pulsecore/libpulsecommon_8.0_la-packet.lo
  CC       pulsecore/libpulsecommon_8.0_la-parseaddr.lo
  CC       pulsecore/libpulsecommon_8.0_la-pdispatch.lo
  CC       pulsecore/libpulsecommon_8.0_la-pid.lo
  CC       pulsecore/libpulsecommon_8.0_la-pipe.lo
  CC       pulsecore/libpulsecommon_8.0_la-memtrap.lo
  CC       pulsecore/libpulsecommon_8.0_la-aupdate.lo
  CC       pulsecore/libpulsecommon_8.0_la-proplist-util.lo
  CC       pulsecore/libpulsecommon_8.0_la-pstream-util.lo
  CC       pulsecore/libpulsecommon_8.0_la-pstream.lo
  CC       pulsecore/libpulsecommon_8.0_la-queue.lo
  CC       pulsecore/libpulsecommon_8.0_la-random.lo
  CC       pulsecore/libpulsecommon_8.0_la-sample-util.lo
  CC       pulsecore/libpulsecommon_8.0_la-srbchannel.lo
pulsecore/pstream.c: In function 'prepare_next_write_item':
pulsecore/pstream.c:541:34: warning: cast increases required alignment of target type [-Wcast-align]
             uint32_t *shm_info = (uint32_t *) &p->write.minibuf[PA_PSTREAM_DESCRIPTOR_SIZE];
                                  ^
  CC       pulsecore/libpulsecommon_8.0_la-shm.lo
pulsecore/sample-util.c: In function 'pa_sample_clamp':
pulsecore/sample-util.c:288:17: warning: cast increases required alignment of target type [-Wcast-align]
             s = (const float*) ((const uint8_t*) s + sstr);
                 ^
pulsecore/sample-util.c:289:17: warning: cast increases required alignment of target type [-Wcast-align]
             d = (float*) ((uint8_t*) d + dstr);
                 ^
pulsecore/sample-util.c:301:17: warning: cast increases required alignment of target type [-Wcast-align]
             s = (const float*) ((const uint8_t*) s + sstr);
                 ^
pulsecore/sample-util.c:302:17: warning: cast increases required alignment of target type [-Wcast-align]
             d = (float*) ((uint8_t*) d + dstr);
                 ^
  CC       pulsecore/libpulsecommon_8.0_la-bitset.lo
  CC       pulsecore/libpulsecommon_8.0_la-socket-client.lo
  CC       pulsecore/libpulsecommon_8.0_la-socket-server.lo
  CC       pulsecore/libpulsecommon_8.0_la-socket-util.lo
  CC       pulsecore/libpulsecommon_8.0_la-strbuf.lo
  CC       pulsecore/libpulsecommon_8.0_la-strlist.lo
  CC       pulsecore/libpulsecommon_8.0_la-svolume_c.lo
pulsecore/socket-util.c: In function 'pa_socket_address_is_local':
pulsecore/socket-util.c:307:21: warning: cast increases required alignment of target type [-Wcast-align]
             return ((const struct sockaddr_in*) sa)->sin_addr.s_addr == INADDR_LOOPBACK;
                     ^
pulsecore/socket-util.c:311:29: warning: cast increases required alignment of target type [-Wcast-align]
             return memcmp(&((const struct sockaddr_in6*) sa)->sin6_addr, &in6addr_loopback, sizeof(struct in6_addr)) == 0;
                             ^
  CC       pulsecore/libpulsecommon_8.0_la-svolume_arm.lo
  CC       pulsecore/libpulsecommon_8.0_la-svolume_mmx.lo
  CC       pulsecore/libpulsecommon_8.0_la-svolume_sse.lo
  CC       pulsecore/libpulsecommon_8.0_la-tagstruct.lo
  CC       pulsecore/libpulsecommon_8.0_la-time-smoother.lo
  CC       pulsecore/libpulsecommon_8.0_la-tokenizer.lo
  CC       pulsecore/libpulsecommon_8.0_la-usergroup.lo
  CC       pulsecore/libpulsecommon_8.0_la-sndfile-util.lo
  CC       pulsecore/libpulsecommon_8.0_la-poll-posix.lo
  CC       pulsecore/libpulsecommon_8.0_la-mutex-posix.lo
  CC       pulsecore/libpulsecommon_8.0_la-thread-posix.lo
  CC       pulsecore/libpulsecommon_8.0_la-semaphore-posix.lo
  CC       pulsecore/libpulsecommon_8.0_la-dbus-util.lo
  CC       pulsecore/libpulsecommon_8.0_la-rtkit.lo
  CC       pulse/libpulse_la-channelmap.lo
  CC       pulse/libpulse_la-context.lo
  CC       pulse/libpulse_la-direction.lo
  CC       pulse/libpulse_la-error.lo
  CC       pulse/libpulse_la-ext-device-manager.lo
  CC       pulse/libpulse_la-ext-device-restore.lo
  CC       pulse/libpulse_la-ext-stream-restore.lo
  CC       pulse/libpulse_la-format.lo
  CC       pulse/libpulse_la-introspect.lo
  CC       pulse/libpulse_la-mainloop-api.lo
  CC       pulse/libpulse_la-mainloop-signal.lo
  CC       pulse/libpulse_la-mainloop.lo
  CC       pulse/libpulse_la-operation.lo
  CC       pulse/libpulse_la-rtclock.lo
  CC       pulse/libpulse_la-proplist.lo
  CC       pulse/libpulse_la-sample.lo
  CC       pulse/libpulse_la-scache.lo
  CC       pulse/libpulse_la-stream.lo
  CC       pulse/libpulse_la-subscribe.lo
  CC       pulse/libpulse_la-thread-mainloop.lo
  CC       pulse/libpulse_la-timeval.lo
  CC       pulse/libpulse_la-utf8.lo
  CC       pulse/libpulse_la-util.lo
  CC       pulse/libpulse_la-volume.lo
  CC       pulse/libpulse_la-xmalloc.lo
  CC       pulse/libpulse_simple_la-simple.lo
  CC       pulse/libpulse_mainloop_glib_la-glib-mainloop.lo
  CC       pulsecore/cli.lo
  CC       pulsecore/filter/libpulsecore_8.0_la-lfe-filter.lo
  CC       pulsecore/filter/libpulsecore_8.0_la-biquad.lo
  CC       pulsecore/filter/libpulsecore_8.0_la-crossover.lo
  CC       pulsecore/libpulsecore_8.0_la-asyncmsgq.lo
  CC       pulsecore/libpulsecore_8.0_la-asyncq.lo
  CC       pulsecore/libpulsecore_8.0_la-auth-cookie.lo
  CC       pulsecore/libpulsecore_8.0_la-cli-command.lo
pulsecore/asyncq.c: In function 'push':
pulsecore/asyncq.c:71:29: warning: cast increases required alignment of target type [-Wcast-align]
 #define PA_ASYNCQ_CELLS(x) ((pa_atomic_ptr_t*) ((uint8_t*) (x) + PA_ALIGN(sizeof(struct pa_asyncq))))
                             ^
pulsecore/asyncq.c:140:13: note: in expansion of macro 'PA_ASYNCQ_CELLS'
     cells = PA_ASYNCQ_CELLS(l);
             ^
pulsecore/asyncq.c: In function 'pa_asyncq_pop':
pulsecore/asyncq.c:71:29: warning: cast increases required alignment of target type [-Wcast-align]
 #define PA_ASYNCQ_CELLS(x) ((pa_atomic_ptr_t*) ((uint8_t*) (x) + PA_ALIGN(sizeof(struct pa_asyncq))))
                             ^
pulsecore/asyncq.c:230:13: note: in expansion of macro 'PA_ASYNCQ_CELLS'
     cells = PA_ASYNCQ_CELLS(l);
             ^
pulsecore/asyncq.c: In function 'pa_asyncq_read_before_poll':
pulsecore/asyncq.c:71:29: warning: cast increases required alignment of target type [-Wcast-align]
 #define PA_ASYNCQ_CELLS(x) ((pa_atomic_ptr_t*) ((uint8_t*) (x) + PA_ALIGN(sizeof(struct pa_asyncq))))
                             ^
pulsecore/asyncq.c:272:13: note: in expansion of macro 'PA_ASYNCQ_CELLS'
     cells = PA_ASYNCQ_CELLS(l);
             ^
  CC       pulsecore/libpulsecore_8.0_la-cli-text.lo
  CC       pulsecore/libpulsecore_8.0_la-client.lo
  CC       pulsecore/libpulsecore_8.0_la-card.lo
  CC       pulsecore/libpulsecore_8.0_la-core-scache.lo
  CC       pulsecore/libpulsecore_8.0_la-core-subscribe.lo
  CC       pulsecore/libpulsecore_8.0_la-core.lo
  CC       pulsecore/libpulsecore_8.0_la-hook-list.lo
  CC       pulsecore/libpulsecore_8.0_la-ltdl-helper.lo
  CC       pulsecore/libpulsecore_8.0_la-modargs.lo
  CC       pulsecore/libpulsecore_8.0_la-modinfo.lo
  CC       pulsecore/libpulsecore_8.0_la-module.lo
  CC       pulsecore/libpulsecore_8.0_la-msgobject.lo
  CC       pulsecore/libpulsecore_8.0_la-namereg.lo
  CC       pulsecore/libpulsecore_8.0_la-object.lo
  CC       pulsecore/libpulsecore_8.0_la-play-memblockq.lo
  CC       pulsecore/libpulsecore_8.0_la-play-memchunk.lo
  CC       pulsecore/libpulsecore_8.0_la-remap.lo
  CC       pulsecore/libpulsecore_8.0_la-remap_mmx.lo
  CC       pulsecore/libpulsecore_8.0_la-remap_sse.lo
  CC       pulsecore/libpulsecore_8.0_la-resampler.lo
  CC       pulsecore/resampler/libpulsecore_8.0_la-ffmpeg.lo
  CC       pulsecore/resampler/libpulsecore_8.0_la-peaks.lo
  CC       pulsecore/resampler/libpulsecore_8.0_la-trivial.lo
  CC       pulsecore/libpulsecore_8.0_la-rtpoll.lo
  CC       pulsecore/libpulsecore_8.0_la-stream-util.lo
  CC       pulsecore/libpulsecore_8.0_la-mix.lo
  CC       pulsecore/libpulsecore_8.0_la-cpu.lo
  CC       pulsecore/libpulsecore_8.0_la-cpu-arm.lo
  CC       pulsecore/libpulsecore_8.0_la-cpu-x86.lo
  CC       pulsecore/libpulsecore_8.0_la-cpu-orc.lo
  CC       pulsecore/libpulsecore_8.0_la-sconv-s16be.lo
  CC       pulsecore/libpulsecore_8.0_la-sconv-s16le.lo
  CC       pulsecore/libpulsecore_8.0_la-sconv_sse.lo
  CC       pulsecore/libpulsecore_8.0_la-sconv.lo
  CC       pulsecore/libpulsecore_8.0_la-shared.lo
  CC       pulsecore/libpulsecore_8.0_la-sink-input.lo
  CC       pulsecore/libpulsecore_8.0_la-sink.lo
In file included from ./pulsecore/asyncmsgq.h:27:0,
                 from ./pulsecore/core.h:46,
                 from ./pulsecore/module.h:31,
                 from ./pulsecore/sink-input.h:31,
                 from pulsecore/sink.c:39:
pulsecore/sink.c: In function 'pa_sink_new':
./pulsecore/msgobject.h:39:33: warning: cast increases required alignment of target type [-Wcast-align]
 #define pa_msgobject_new(type) ((type*) pa_msgobject_new_internal(sizeof(type), type##_type_id, type##_check_type))
                                 ^
pulsecore/sink.c:185:9: note: in expansion of macro 'pa_msgobject_new'
     s = pa_msgobject_new(pa_sink);
         ^
  CC       pulsecore/libpulsecore_8.0_la-device-port.lo
  CC       pulsecore/libpulsecore_8.0_la-sioman.lo
  CC       pulsecore/libpulsecore_8.0_la-sound-file-stream.lo
In file included from ./pulsecore/asyncmsgq.h:27:0,
                 from ./pulsecore/core.h:46,
                 from ./pulsecore/core-subscribe.h:26,
                 from pulsecore/sink-input.c:36:
pulsecore/sink-input.c: In function 'pa_sink_input_new':
./pulsecore/msgobject.h:39:33: warning: cast increases required alignment of target type [-Wcast-align]
 #define pa_msgobject_new(type) ((type*) pa_msgobject_new_internal(sizeof(type), type##_type_id, type##_check_type))
                                 ^
pulsecore/sink-input.c:465:9: note: in expansion of macro 'pa_msgobject_new'
     i = pa_msgobject_new(pa_sink_input);
         ^
  CC       pulsecore/libpulsecore_8.0_la-sound-file.lo
  CC       pulsecore/libpulsecore_8.0_la-source-output.lo
  CC       pulsecore/libpulsecore_8.0_la-source.lo
In file included from ./pulsecore/asyncmsgq.h:27:0,
                 from ./pulsecore/core.h:46,
                 from ./pulsecore/core-subscribe.h:26,
                 from pulsecore/source-output.c:36:
pulsecore/source-output.c: In function 'pa_source_output_new':
./pulsecore/msgobject.h:39:33: warning: cast increases required alignment of target type [-Wcast-align]
 #define pa_msgobject_new(type) ((type*) pa_msgobject_new_internal(sizeof(type), type##_type_id, type##_check_type))
                                 ^
pulsecore/source-output.c:410:9: note: in expansion of macro 'pa_msgobject_new'
     o = pa_msgobject_new(pa_source_output);
         ^
  CC       pulsecore/libpulsecore_8.0_la-start-child.lo
In file included from ./pulsecore/asyncmsgq.h:27:0,
                 from ./pulsecore/core.h:46,
                 from ./pulsecore/module.h:31,
                 from ./pulsecore/source-output.h:30,
                 from pulsecore/source.c:37:
pulsecore/source.c: In function 'pa_source_new':
./pulsecore/msgobject.h:39:33: warning: cast increases required alignment of target type [-Wcast-align]
 #define pa_msgobject_new(type) ((type*) pa_msgobject_new_internal(sizeof(type), type##_type_id, type##_check_type))
                                 ^
pulsecore/source.c:172:9: note: in expansion of macro 'pa_msgobject_new'
     s = pa_msgobject_new(pa_source);
         ^
  CC       pulsecore/libpulsecore_8.0_la-thread-mq.lo
  CC       pulsecore/libpulsecore_8.0_la-dbus-shared.lo
  CC       pulsecore/libpulsecore_8.0_la-protocol-dbus.lo
  CC       pulsecore/libpulsecore_8.0_la-database-simple.lo
  CC       pulsecore/resampler/libpulsecore_8.0_la-speex.lo
  CC       pulsecore/ffmpeg/libpulsecore_foreign_la-resample2.lo
  CCLD     libpulsecore_sconv_neon.la
  CCLD     libpulsecore_mix_neon.la
  CCLD     libpulsecore_remap_neon.la
  CC       modules/rtp/rtp.lo
  CC       modules/rtp/sdp.lo
  CC       modules/rtp/sap.lo
  CC       modules/rtp/rtsp_client.lo
  CC       modules/rtp/headerlist.lo
modules/rtp/sap.c: In function 'pa_sap_send':
modules/rtp/sap.c:104:37: warning: cast increases required alignment of target type [-Wcast-align]
         iov[1].iov_base = (void*) &((struct sockaddr_in*) sa)->sin_addr;
                                     ^
modules/rtp/sap.c:108:37: warning: cast increases required alignment of target type [-Wcast-align]
         iov[1].iov_base = (void*) &((struct sockaddr_in6*) sa)->sin6_addr;
                                     ^
  CC       modules/module_console_kit_la-module-console-kit.lo
  CC       modules/module-cli.lo
  CC       modules/module_cli_protocol_tcp_la-module-protocol-stub.lo
  CC       modules/module_simple_protocol_tcp_la-module-protocol-stub.lo
  CC       modules/module-null-sink.lo
  CC       modules/module-null-source.lo
  CC       modules/module-sine-source.lo
  CC       modules/module_detect_la-module-detect.lo
  CC       modules/module_volume_restore_la-module-volume-restore.lo
  CC       modules/module_device_manager_la-module-device-manager.lo
  CC       modules/module_device_restore_la-module-device-restore.lo
  CC       modules/module_stream_restore_la-module-stream-restore.lo
  CC       modules/module_card_restore_la-module-card-restore.lo
  CC       modules/module_default_device_restore_la-module-default-device-restore.lo
  CC       modules/module_always_sink_la-module-always-sink.lo
  CC       modules/module_rescue_streams_la-module-rescue-streams.lo
  CC       modules/module_intended_roles_la-module-intended-roles.lo
  CC       modules/module_suspend_on_idle_la-module-suspend-on-idle.lo
  CC       modules/echo-cancel/module_echo_cancel_la-module-echo-cancel.lo
  CC       modules/echo-cancel/module_echo_cancel_la-null.lo
  CC       modules/echo-cancel/module_echo_cancel_la-adrian-aec.lo
  CC       modules/echo-cancel/module_echo_cancel_la-adrian.lo
  CC       modules/echo-cancel/module_echo_cancel_la-speex.lo
  CC       modules/module_http_protocol_tcp_la-module-protocol-stub.lo
  CC       modules/module-sine.lo
modules/echo-cancel/adrian.c: In function 'pa_adrian_ec_run':
modules/echo-cancel/adrian.c:107:18: warning: cast increases required alignment of target type [-Wcast-align]
         int r = *(int16_t *)(rec + i);
                  ^
modules/echo-cancel/adrian.c:108:18: warning: cast increases required alignment of target type [-Wcast-align]
         int p = *(int16_t *)(play + i);
                  ^
modules/echo-cancel/adrian.c:109:10: warning: cast increases required alignment of target type [-Wcast-align]
         *(int16_t *)(out + i) = (int16_t) AEC_doAEC(ec->params.priv.adrian.aec, r, p);
          ^
modules/echo-cancel/speex.c: In function 'pa_speex_ec_run':
modules/echo-cancel/speex.c:207:58: warning: cast increases required alignment of target type [-Wcast-align]
     speex_echo_cancellation(ec->params.priv.speex.state, (const spx_int16_t *) rec, (const spx_int16_t *) play,
                                                          ^
modules/echo-cancel/speex.c:207:85: warning: cast increases required alignment of target type [-Wcast-align]
     speex_echo_cancellation(ec->params.priv.speex.state, (const spx_int16_t *) rec, (const spx_int16_t *) play,
                                                                                     ^
modules/echo-cancel/speex.c:208:29: warning: cast increases required alignment of target type [-Wcast-align]
                             (spx_int16_t *) out);
                             ^
modules/echo-cancel/speex.c:212:62: warning: cast increases required alignment of target type [-Wcast-align]
         speex_preprocess_run(ec->params.priv.speex.pp_state, (spx_int16_t *) out);
                                                              ^
  CC       modules/module_native_protocol_tcp_la-module-protocol-stub.lo
  CC       modules/module_native_protocol_fd_la-module-native-protocol-fd.lo
  CC       modules/module-combine-sink.lo
  CC       modules/module-combine.lo
  CC       modules/module-remap-sink.lo
  CC       modules/module-remap-source.lo
  CC       modules/module_ladspa_sink_la-module-ladspa-sink.lo
modules/module-ladspa-sink.c: In function 'module_ladspa_sink_LTX_pa__init':
modules/module-ladspa-sink.c:1151:27: warning: cast increases required alignment of target type [-Wcast-align]
             u->input[c] = (LADSPA_Data*) pa_xnew(uint8_t, (unsigned) u->block_size);
                           ^
modules/module-ladspa-sink.c:1154:28: warning: cast increases required alignment of target type [-Wcast-align]
             u->output[c] = (LADSPA_Data*) pa_xnew(uint8_t, (unsigned) u->block_size);
                            ^
modules/module-ladspa-sink.c:1158:27: warning: cast increases required alignment of target type [-Wcast-align]
             u->input[c] = (LADSPA_Data*) pa_xnew(uint8_t, (unsigned) u->block_size);
                           ^
  CC       modules/module-tunnel-sink-new.lo
  CC       modules/module-tunnel-source-new.lo
  CC       modules/module_tunnel_sink_la-module-tunnel.lo
  CC       modules/module-tunnel.lo
  CC       modules/module_position_event_sounds_la-module-position-event-sounds.lo
  CC       modules/module_augment_properties_la-module-augment-properties.lo
  CC       modules/module_role_cork_la-module-role-cork.lo
  CC       modules/module-loopback.lo
  CC       modules/module_virtual_sink_la-module-virtual-sink.lo
  CC       modules/module_virtual_source_la-module-virtual-source.lo
  CC       modules/module_virtual_surround_sink_la-module-virtual-surround-sink.lo
  CC       modules/module-switch-on-connect.lo
  CC       modules/module-switch-on-port-available.lo
  CC       modules/module-filter-apply.lo
  CC       modules/module-filter-heuristics.lo
  CC       modules/module_role_ducking_la-module-role-ducking.lo
  CC       modules/module_esound_protocol_tcp_la-module-protocol-stub.lo
  CC       modules/module-esound-sink.lo
  CC       modules/oss/module-oss.lo
  CC       modules/oss/oss-util.lo
  CC       modules/alsa/libalsa_util_la-alsa-util.lo
  CC       modules/alsa/libalsa_util_la-alsa-ucm.lo
  CC       modules/alsa/libalsa_util_la-alsa-mixer.lo
  CC       modules/alsa/libalsa_util_la-alsa-sink.lo
  CC       modules/alsa/libalsa_util_la-alsa-source.lo
  CC       modules/dbus/module_dbus_protocol_la-iface-card.lo
  CC       modules/dbus/module_dbus_protocol_la-iface-card-profile.lo
  CC       modules/dbus/module_dbus_protocol_la-iface-client.lo
  CC       modules/dbus/module_dbus_protocol_la-iface-core.lo
  CC       modules/dbus/module_dbus_protocol_la-iface-device.lo
  CC       modules/dbus/module_dbus_protocol_la-iface-device-port.lo
  CC       modules/dbus/module_dbus_protocol_la-iface-memstats.lo
  CC       modules/dbus/module_dbus_protocol_la-iface-module.lo
  CC       modules/dbus/module_dbus_protocol_la-iface-sample.lo
  CC       modules/dbus/module_dbus_protocol_la-iface-stream.lo
  CC       modules/dbus/module_dbus_protocol_la-module-dbus-protocol.lo
  CC       modules/raop/libraop_la-raop_client.lo
  CC       modules/raop/libraop_la-base64.lo
  CC       modules/raop/module_raop_sink_la-module-raop-sink.lo
  CC       tests/lo-test-util.lo
  CC       utils/libpulsedsp_la-padsp.lo
  CC       daemon/pulseaudio-caps.o
daemon/caps.c:41:5: warning: redundant redeclaration of ?setresgid? [-Wredundant-decls]
 int setresgid(gid_t r, gid_t e, gid_t s);
     ^
In file included from daemon/caps.c:25:0:
/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/unistd.h:770:12: note: previous declaration of ?setresgid? was here
 extern int setresgid (__gid_t __rgid, __gid_t __egid, __gid_t __sgid)
            ^
daemon/caps.c:42:5: warning: redundant redeclaration of ?setresuid? [-Wredundant-decls]
 int setresuid(uid_t r, uid_t e, uid_t s);
     ^
In file included from daemon/caps.c:25:0:
/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/unistd.h:765:12: note: previous declaration of ?setresuid? was here
 extern int setresuid (__uid_t __ruid, __uid_t __euid, __uid_t __suid)
            ^
  CC       daemon/pulseaudio-cmdline.o
  CC       daemon/pulseaudio-daemon-conf.o
  CC       daemon/pulseaudio-cpulimit.o
utils/padsp.c:1539:5: warning: no previous prototype for '__open_2' [-Wmissing-prototypes]
 int __open_2(const char *filename, int flags) {
     ^
utils/padsp.c: In function 'stat':
utils/padsp.c:2481:5: warning: implicit declaration of function '__xstat64' [-Wimplicit-function-declaration]
     ret = __xstat64(_STAT_VER, "/dev", &parent);
     ^
utils/padsp.c: At top level:
utils/padsp.c:2578:5: warning: no previous prototype for '__open64_2' [-Wmissing-prototypes]
 int __open64_2(const char *filename, int flags) {
     ^
utils/padsp.c:2595:5: warning: no previous prototype for '__xstat' [-Wmissing-prototypes]
 int __xstat(int ver, const char *pathname, struct stat *buf) {
     ^
utils/padsp.c:2615:5: warning: no previous prototype for '__xstat64' [-Wmissing-prototypes]
 int __xstat64(int ver, const char *pathname, struct stat64 *buf) {
     ^
  CC       daemon/pulseaudio-dumpmodules.o
  CC       daemon/pulseaudio-ltdl-bind-now.o
  CC       daemon/pulseaudio-main.o
  CCLD     libpulsecommon-8.0.la
  CC       daemon/pulseaudio-server-lookup.o
  CCLD     libpulsecore-foreign.la
  CCLD     libpulse.la
  CCLD     libpulse-simple.la
  CCLD     libpulse-mainloop-glib.la
  CCLD     libpulsecore-8.0.la
  CCLD     libpulsedsp.la
  CCLD     pacat
  CCLD     pactl
  CCLD     pasuspender
  CCLD     pacmd
  CCLD     libcli.la
  CCLD     libprotocol-simple.la
  CCLD     libprotocol-http.la
  CCLD     libprotocol-native.la
  CCLD     libprotocol-esound.la
  CCLD     librtp.la
  CCLD     module-console-kit.la
  CCLD     module-cli.la
  CCLD     module-simple-protocol-tcp.la
  CCLD     module-null-sink.la
  CCLD     module-null-source.la
  CCLD     module-sine-source.la
  CCLD     module-detect.la
  CCLD     module-volume-restore.la
  CCLD     module-device-manager.la
  CCLD     module-device-restore.la
  CCLD     module-stream-restore.la
  CCLD     module-card-restore.la
  CCLD     module-default-device-restore.la
  CCLD     module-always-sink.la
  CCLD     module-rescue-streams.la
  CCLD     module-intended-roles.la
  CCLD     module-suspend-on-idle.la
  CCLD     module-echo-cancel.la
  CCLD     module-http-protocol-tcp.la
  CCLD     module-sine.la
  CCLD     module-native-protocol-tcp.la
  CCLD     module-native-protocol-fd.la
  CCLD     module-combine.la
  CCLD     module-combine-sink.la
  CCLD     module-remap-sink.la
  CCLD     module-remap-source.la
  CCLD     module-ladspa-sink.la
  CCLD     module-tunnel-sink-new.la
  CCLD     module-tunnel-source-new.la
  CCLD     module-tunnel-sink.la
  CCLD     module-tunnel-source.la
  CCLD     module-position-event-sounds.la
  CCLD     module-augment-properties.la
  CCLD     module-role-cork.la
  CCLD     module-loopback.la
  CCLD     module-virtual-sink.la
  CCLD     module-virtual-source.la
  CCLD     module-virtual-surround-sink.la
  CCLD     module-switch-on-connect.la
  CCLD     module-switch-on-port-available.la
  CCLD     module-filter-apply.la
  CCLD     module-filter-heuristics.la
  CCLD     module-role-ducking.la
  CCLD     module-esound-protocol-tcp.la
  CCLD     module-esound-sink.la
  CCLD     module-rtp-send.la
  CCLD     module-rtp-recv.la
  CCLD     module-simple-protocol-unix.la
  CCLD     module-http-protocol-unix.la
  CCLD     module-native-protocol-unix.la
  CCLD     module-esound-protocol-unix.la
  CCLD     module-pipe-sink.la
  CCLD     module-pipe-source.la
  CCLD     module-esound-compat-spawnfd.la
  CCLD     module-esound-compat-spawnpid.la
  CCLD     module-match.la
  CCLD     liboss-util.la
  CCLD     libalsa-util.la
  CCLD     module-mmkbd-evdev.la
  CCLD     module-hal-detect.la
  CCLD     module-udev-detect.la
  CCLD     module-rygel-media-server.la
  CCLD     module-dbus-protocol.la
  CCLD     libraop.la
  CCLD     libprotocol-cli.la
  CCLD     liblo-test-util.la
  CCLD     module-oss.la
  CCLD     module-alsa-sink.la
  CCLD     module-alsa-source.la
  CCLD     module-alsa-card.la
  CCLD     module-raop-sink.la
  CCLD     module-cli-protocol-tcp.la
  CCLD     module-cli-protocol-unix.la
  CCLD     pulseaudio
make[4]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
Making all in doxygen
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/doxygen"
make[3]: Nessuna operazione da eseguire per "all".
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/doxygen"
Making all in man
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[3]: Nessuna operazione da eseguire per "all".
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
Making all in po
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/po"
make[3]: Nessuna operazione da eseguire per "all".
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/po"
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[3]: Nessuna operazione da eseguire per "all-am".
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[2]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
[7m>>> pulseaudio 8.0 Installing to staging directory[27m
PATH="/home/femtotech/dev/buildroot/output/host/bin:/home/femtotech/dev/buildroot/output/host/sbin:/home/femtotech/dev/buildroot/output/host/usr/bin:/home/femtotech/dev/buildroot/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /usr/bin/make -j5 DESTDIR=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot install -C /home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
/usr/bin/make  install-recursive
make[2]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
Making install in src
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
/usr/bin/make  install-am
make[4]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
make[5]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/pulseaudio/alsa-mixer/paths'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   libpulsecommon-8.0.la '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/etc/dbus-1/system.d'
 /usr/bin/install -c esdcompat padsp '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/pulseaudio/alsa-mixer/profile-sets'
 /usr/bin/install -c -m 644 modules/alsa/mixer/paths/analog-input-aux.conf modules/alsa/mixer/paths/analog-input.conf modules/alsa/mixer/paths/analog-input.conf.common modules/alsa/mixer/paths/analog-input-fm.conf modules/alsa/mixer/paths/analog-input-linein.conf modules/alsa/mixer/paths/analog-input-mic.conf modules/alsa/mixer/paths/analog-input-dock-mic.conf modules/alsa/mixer/paths/analog-input-front-mic.conf modules/alsa/mixer/paths/analog-input-headphone-mic.conf modules/alsa/mixer/paths/analog-input-headset-mic.conf modules/alsa/mixer/paths/analog-input-internal-mic.conf modules/alsa/mixer/paths/analog-input-internal-mic-always.conf modules/alsa/mixer/paths/analog-input-rear-mic.conf modules/alsa/mixer/paths/analog-input-mic.conf.common modules/alsa/mixer/paths/analog-input-mic-line.conf modules/alsa/mixer/paths/analog-input-tvtuner.conf modules/alsa/mixer/paths/analog-input-video.conf modules/alsa/mixer/paths/analog-output.conf modules/alsa/mixer/paths/analog-output-speaker.conf modules/alsa/mixer/paths/analog-output-speaker-always.conf modules/alsa/mixer/paths/analog-output.conf.common modules/alsa/mixer/paths/analog-output-headphones.conf modules/alsa/mixer/paths/analog-output-headphones-2.conf modules/alsa/mixer/paths/analog-output-lineout.conf modules/alsa/mixer/paths/analog-output-mono.conf modules/alsa/mixer/paths/iec958-stereo-output.conf modules/alsa/mixer/paths/hdmi-output-0.conf modules/alsa/mixer/paths/hdmi-output-1.conf modules/alsa/mixer/paths/hdmi-output-2.conf modules/alsa/mixer/paths/hdmi-output-3.conf modules/alsa/mixer/paths/hdmi-output-4.conf modules/alsa/mixer/paths/hdmi-output-5.conf modules/alsa/mixer/paths/hdmi-output-6.conf modules/alsa/mixer/paths/hdmi-output-7.conf '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/pulseaudio/alsa-mixer/paths'
 /usr/bin/install -c -m 644 daemon/pulseaudio-system.conf '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/etc/dbus-1/system.d'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/lib/udev/rules.d'
 /usr/bin/install -c -m 644 modules/alsa/mixer/profile-sets/default.conf modules/alsa/mixer/profile-sets/force-speaker.conf modules/alsa/mixer/profile-sets/force-speaker-and-int-mic.conf modules/alsa/mixer/profile-sets/maudio-fasttrack-pro.conf modules/alsa/mixer/profile-sets/native-instruments-audio4dj.conf modules/alsa/mixer/profile-sets/native-instruments-audio8dj.conf modules/alsa/mixer/profile-sets/native-instruments-traktor-audio2.conf modules/alsa/mixer/profile-sets/native-instruments-traktor-audio6.conf modules/alsa/mixer/profile-sets/native-instruments-traktor-audio10.conf modules/alsa/mixer/profile-sets/native-instruments-traktorkontrol-s4.conf modules/alsa/mixer/profile-sets/native-instruments-korecontroller.conf modules/alsa/mixer/profile-sets/kinect-audio.conf modules/alsa/mixer/profile-sets/sb-omni-surround-5.1.conf '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/pulseaudio/alsa-mixer/profile-sets'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/etc/pulse'
 /usr/bin/install -c -m 644 default.pa system.pa daemon.conf client.conf '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/etc/pulse'
 /usr/bin/install -c -m 644 modules/alsa/mixer/profile-sets/90-pulseaudio.rules '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/lib/udev/rules.d'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/pulse'
libtool: install: /usr/bin/install -c .libs/libpulsecommon-8.0.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio/libpulsecommon-8.0.so
 /usr/bin/install -c -m 644 pulse/cdecl.h pulse/channelmap.h pulse/context.h pulse/def.h pulse/direction.h pulse/error.h pulse/ext-device-manager.h pulse/ext-device-restore.h pulse/ext-stream-restore.h pulse/format.h pulse/gccmacro.h pulse/introspect.h pulse/mainloop-api.h pulse/mainloop-signal.h pulse/mainloop.h pulse/operation.h pulse/proplist.h pulse/pulseaudio.h pulse/rtclock.h pulse/sample.h pulse/scache.h pulse/simple.h pulse/stream.h pulse/subscribe.h pulse/thread-mainloop.h pulse/timeval.h pulse/utf8.h pulse/util.h pulse/version.h pulse/volume.h pulse/xmalloc.h pulse/glib-mainloop.h '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/pulse'
libtool: install: /usr/bin/install -c .libs/libpulsecommon-8.0.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio/libpulsecommon-8.0.la
libtool: install: warning: remember to run `libtool --finish /usr/lib/pulseaudio'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   libpulse.la libpulse-simple.la libpulse-mainloop-glib.la '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib'
libtool: install: /usr/bin/install -c .libs/libpulse.so.0.19.0 /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpulse.so.0.19.0
libtool: install: (cd /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib && { ln -s -f libpulse.so.0.19.0 libpulse.so.0 || { rm -f libpulse.so.0 && ln -s libpulse.so.0.19.0 libpulse.so.0; }; })
libtool: install: (cd /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib && { ln -s -f libpulse.so.0.19.0 libpulse.so || { rm -f libpulse.so && ln -s libpulse.so.0.19.0 libpulse.so; }; })
libtool: install: /usr/bin/install -c .libs/libpulse.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpulse.la
libtool: install: /usr/bin/install -c .libs/libpulse-simple.so.0.1.0 /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpulse-simple.so.0.1.0
libtool: install: (cd /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib && { ln -s -f libpulse-simple.so.0.1.0 libpulse-simple.so.0 || { rm -f libpulse-simple.so.0 && ln -s libpulse-simple.so.0.1.0 libpulse-simple.so.0; }; })
libtool: install: (cd /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib && { ln -s -f libpulse-simple.so.0.1.0 libpulse-simple.so || { rm -f libpulse-simple.so && ln -s libpulse-simple.so.0.1.0 libpulse-simple.so; }; })
libtool: install: /usr/bin/install -c .libs/libpulse-simple.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpulse-simple.la
libtool: install: /usr/bin/install -c .libs/libpulse-mainloop-glib.so.0.0.5 /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpulse-mainloop-glib.so.0.0.5
libtool: install: (cd /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib && { ln -s -f libpulse-mainloop-glib.so.0.0.5 libpulse-mainloop-glib.so.0 || { rm -f libpulse-mainloop-glib.so.0 && ln -s libpulse-mainloop-glib.so.0.0.5 libpulse-mainloop-glib.so.0; }; })
libtool: install: (cd /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib && { ln -s -f libpulse-mainloop-glib.so.0.0.5 libpulse-mainloop-glib.so || { rm -f libpulse-mainloop-glib.so && ln -s libpulse-mainloop-glib.so.0.0.5 libpulse-mainloop-glib.so; }; })
libtool: install: /usr/bin/install -c .libs/libpulse-mainloop-glib.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpulse-mainloop-glib.la
libtool: install: warning: remember to run `libtool --finish /usr/lib'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   libpulsecore-8.0.la '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   libpulsedsp.la '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio'
  /bin/bash ../libtool   --mode=install /usr/bin/install -c pulseaudio pacat pactl pasuspender pacmd '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin'
libtool: install: /usr/bin/install -c .libs/libpulsecore-8.0.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio/libpulsecore-8.0.so
libtool: install: /usr/bin/install -c .libs/libpulsecore-8.0.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio/libpulsecore-8.0.la
libtool: install: /usr/bin/install -c .libs/libpulsedsp.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio/libpulsedsp.so
libtool: install: warning: remember to run `libtool --finish /usr/lib/pulseaudio'
libtool: install: /usr/bin/install -c .libs/libpulsedsp.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulseaudio/libpulsedsp.la
libtool: install: warning: remember to run `libtool --finish /usr/lib/pulseaudio'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   libcli.la libprotocol-cli.la libprotocol-simple.la libprotocol-http.la libprotocol-native.la libprotocol-esound.la librtp.la module-console-kit.la module-cli.la module-cli-protocol-tcp.la module-simple-protocol-tcp.la module-null-sink.la module-null-source.la module-sine-source.la module-detect.la module-volume-restore.la module-device-manager.la module-device-restore.la module-stream-restore.la module-card-restore.la module-default-device-restore.la module-always-sink.la module-rescue-streams.la module-intended-roles.la module-suspend-on-idle.la module-echo-cancel.la module-http-protocol-tcp.la module-sine.la module-native-protocol-tcp.la module-native-protocol-fd.la module-combine.la module-combine-sink.la module-remap-sink.la module-remap-source.la module-ladspa-sink.la module-tunnel-sink-new.la module-tunnel-source-new.la module-tunnel-sink.la module-tunnel-source.la module-position-event-sounds.la module-augment-properties.la module-role-cork.la module-loopback.la module-virtual-sink.la module-virtual-source.la module-virtual-surround-sink.la module-switch-on-connect.la module-switch-on-port-available.la module-filter-apply.la module-filter-heuristics.la module-role-ducking.la module-esound-protocol-tcp.la module-esound-sink.la module-rtp-send.la module-rtp-recv.la module-cli-protocol-unix.la module-simple-protocol-unix.la module-http-protocol-unix.la module-native-protocol-unix.la module-esound-protocol-unix.la module-pipe-sink.la module-pipe-source.la module-esound-compat-spawnfd.la module-esound-compat-spawnpid.la module-match.la liboss-util.la module-oss.la libalsa-util.la module-alsa-sink.la module-alsa-source.la module-alsa-card.la module-mmkbd-evdev.la module-hal-detect.la module-udev-detect.la module-rygel-media-server.la module-dbus-protocol.la libraop.la module-raop-sink.la '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules'
libtool: install: /usr/bin/install -c pulseaudio /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/pulseaudio
libtool: install: /usr/bin/install -c pacat /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/pacat
libtool: install: /usr/bin/install -c pactl /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/pactl
libtool: install: /usr/bin/install -c pasuspender /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/pasuspender
libtool: install: /usr/bin/install -c pacmd /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/pacmd
libtool: install: /usr/bin/install -c .libs/libcli.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libcli.so
libtool: install: /usr/bin/install -c .libs/libcli.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libcli.la
libtool: install: /usr/bin/install -c .libs/libprotocol-cli.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libprotocol-cli.so
libtool: install: /usr/bin/install -c .libs/libprotocol-cli.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libprotocol-cli.la
libtool: install: /usr/bin/install -c .libs/libprotocol-simple.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libprotocol-simple.so
libtool: install: /usr/bin/install -c .libs/libprotocol-simple.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libprotocol-simple.la
libtool: install: /usr/bin/install -c .libs/libprotocol-http.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libprotocol-http.so
libtool: install: /usr/bin/install -c .libs/libprotocol-http.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libprotocol-http.la
libtool: install: /usr/bin/install -c .libs/libprotocol-native.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libprotocol-native.so
libtool: install: /usr/bin/install -c .libs/libprotocol-native.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libprotocol-native.la
libtool: install: /usr/bin/install -c .libs/libprotocol-esound.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libprotocol-esound.so
libtool: install: /usr/bin/install -c .libs/libprotocol-esound.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libprotocol-esound.la
libtool: install: /usr/bin/install -c .libs/librtp.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/librtp.so
libtool: install: /usr/bin/install -c .libs/librtp.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/librtp.la
libtool: install: /usr/bin/install -c .libs/module-console-kit.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-console-kit.so
libtool: install: /usr/bin/install -c .libs/module-console-kit.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-console-kit.la
libtool: install: /usr/bin/install -c .libs/module-cli.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-cli.so
libtool: install: /usr/bin/install -c .libs/module-cli.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-cli.la
libtool: install: /usr/bin/install -c .libs/module-cli-protocol-tcp.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-cli-protocol-tcp.so
libtool: install: /usr/bin/install -c .libs/module-cli-protocol-tcp.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-cli-protocol-tcp.la
libtool: install: /usr/bin/install -c .libs/module-simple-protocol-tcp.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-simple-protocol-tcp.so
libtool: install: /usr/bin/install -c .libs/module-simple-protocol-tcp.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-simple-protocol-tcp.la
libtool: install: /usr/bin/install -c .libs/module-null-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-null-sink.so
libtool: install: /usr/bin/install -c .libs/module-null-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-null-sink.la
libtool: install: /usr/bin/install -c .libs/module-null-source.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-null-source.so
libtool: install: /usr/bin/install -c .libs/module-null-source.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-null-source.la
libtool: install: /usr/bin/install -c .libs/module-sine-source.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-sine-source.so
libtool: install: /usr/bin/install -c .libs/module-sine-source.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-sine-source.la
libtool: install: /usr/bin/install -c .libs/module-detect.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-detect.so
libtool: install: /usr/bin/install -c .libs/module-detect.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-detect.la
libtool: install: /usr/bin/install -c .libs/module-volume-restore.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-volume-restore.so
libtool: install: /usr/bin/install -c .libs/module-volume-restore.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-volume-restore.la
libtool: install: /usr/bin/install -c .libs/module-device-manager.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-device-manager.so
libtool: install: /usr/bin/install -c .libs/module-device-manager.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-device-manager.la
libtool: install: /usr/bin/install -c .libs/module-device-restore.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-device-restore.so
libtool: install: /usr/bin/install -c .libs/module-device-restore.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-device-restore.la
libtool: install: /usr/bin/install -c .libs/module-stream-restore.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-stream-restore.so
libtool: install: /usr/bin/install -c .libs/module-stream-restore.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-stream-restore.la
libtool: install: /usr/bin/install -c .libs/module-card-restore.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-card-restore.so
libtool: install: /usr/bin/install -c .libs/module-card-restore.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-card-restore.la
libtool: install: /usr/bin/install -c .libs/module-default-device-restore.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-default-device-restore.so
libtool: install: /usr/bin/install -c .libs/module-default-device-restore.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-default-device-restore.la
libtool: install: /usr/bin/install -c .libs/module-always-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-always-sink.so
libtool: install: /usr/bin/install -c .libs/module-always-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-always-sink.la
libtool: install: /usr/bin/install -c .libs/module-rescue-streams.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-rescue-streams.so
libtool: install: /usr/bin/install -c .libs/module-rescue-streams.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-rescue-streams.la
libtool: install: /usr/bin/install -c .libs/module-intended-roles.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-intended-roles.so
libtool: install: /usr/bin/install -c .libs/module-intended-roles.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-intended-roles.la
libtool: install: /usr/bin/install -c .libs/module-suspend-on-idle.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-suspend-on-idle.so
libtool: install: /usr/bin/install -c .libs/module-suspend-on-idle.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-suspend-on-idle.la
libtool: install: /usr/bin/install -c .libs/module-echo-cancel.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-echo-cancel.so
libtool: install: /usr/bin/install -c .libs/module-echo-cancel.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-echo-cancel.la
libtool: install: /usr/bin/install -c .libs/module-http-protocol-tcp.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-http-protocol-tcp.so
libtool: install: /usr/bin/install -c .libs/module-http-protocol-tcp.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-http-protocol-tcp.la
libtool: install: /usr/bin/install -c .libs/module-sine.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-sine.so
libtool: install: /usr/bin/install -c .libs/module-sine.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-sine.la
libtool: install: /usr/bin/install -c .libs/module-native-protocol-tcp.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-native-protocol-tcp.so
libtool: install: /usr/bin/install -c .libs/module-native-protocol-tcp.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-native-protocol-tcp.la
libtool: install: /usr/bin/install -c .libs/module-native-protocol-fd.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-native-protocol-fd.so
libtool: install: /usr/bin/install -c .libs/module-native-protocol-fd.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-native-protocol-fd.la
libtool: install: /usr/bin/install -c .libs/module-combine.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-combine.so
libtool: install: /usr/bin/install -c .libs/module-combine.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-combine.la
libtool: install: /usr/bin/install -c .libs/module-combine-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-combine-sink.so
libtool: install: /usr/bin/install -c .libs/module-combine-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-combine-sink.la
libtool: install: /usr/bin/install -c .libs/module-remap-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-remap-sink.so
libtool: install: /usr/bin/install -c .libs/module-remap-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-remap-sink.la
libtool: install: /usr/bin/install -c .libs/module-remap-source.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-remap-source.so
libtool: install: /usr/bin/install -c .libs/module-remap-source.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-remap-source.la
libtool: install: /usr/bin/install -c .libs/module-ladspa-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-ladspa-sink.so
libtool: install: /usr/bin/install -c .libs/module-ladspa-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-ladspa-sink.la
libtool: install: /usr/bin/install -c .libs/module-tunnel-sink-new.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-tunnel-sink-new.so
libtool: install: /usr/bin/install -c .libs/module-tunnel-sink-new.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-tunnel-sink-new.la
libtool: install: /usr/bin/install -c .libs/module-tunnel-source-new.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-tunnel-source-new.so
libtool: install: /usr/bin/install -c .libs/module-tunnel-source-new.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-tunnel-source-new.la
libtool: install: /usr/bin/install -c .libs/module-tunnel-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-tunnel-sink.so
libtool: install: /usr/bin/install -c .libs/module-tunnel-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-tunnel-sink.la
libtool: install: /usr/bin/install -c .libs/module-tunnel-source.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-tunnel-source.so
libtool: install: /usr/bin/install -c .libs/module-tunnel-source.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-tunnel-source.la
libtool: install: /usr/bin/install -c .libs/module-position-event-sounds.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-position-event-sounds.so
libtool: install: /usr/bin/install -c .libs/module-position-event-sounds.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-position-event-sounds.la
libtool: install: /usr/bin/install -c .libs/module-augment-properties.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-augment-properties.so
libtool: install: /usr/bin/install -c .libs/module-augment-properties.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-augment-properties.la
libtool: install: /usr/bin/install -c .libs/module-role-cork.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-role-cork.so
libtool: install: /usr/bin/install -c .libs/module-role-cork.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-role-cork.la
libtool: install: /usr/bin/install -c .libs/module-loopback.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-loopback.so
libtool: install: /usr/bin/install -c .libs/module-loopback.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-loopback.la
libtool: install: /usr/bin/install -c .libs/module-virtual-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-virtual-sink.so
libtool: install: /usr/bin/install -c .libs/module-virtual-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-virtual-sink.la
libtool: install: /usr/bin/install -c .libs/module-virtual-source.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-virtual-source.so
libtool: install: /usr/bin/install -c .libs/module-virtual-source.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-virtual-source.la
libtool: install: /usr/bin/install -c .libs/module-virtual-surround-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-virtual-surround-sink.so
libtool: install: /usr/bin/install -c .libs/module-virtual-surround-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-virtual-surround-sink.la
libtool: install: /usr/bin/install -c .libs/module-switch-on-connect.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-switch-on-connect.so
libtool: install: /usr/bin/install -c .libs/module-switch-on-connect.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-switch-on-connect.la
libtool: install: /usr/bin/install -c .libs/module-switch-on-port-available.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-switch-on-port-available.so
libtool: install: /usr/bin/install -c .libs/module-switch-on-port-available.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-switch-on-port-available.la
libtool: install: /usr/bin/install -c .libs/module-filter-apply.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-filter-apply.so
libtool: install: /usr/bin/install -c .libs/module-filter-apply.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-filter-apply.la
libtool: install: /usr/bin/install -c .libs/module-filter-heuristics.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-filter-heuristics.so
libtool: install: /usr/bin/install -c .libs/module-filter-heuristics.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-filter-heuristics.la
libtool: install: /usr/bin/install -c .libs/module-role-ducking.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-role-ducking.so
libtool: install: /usr/bin/install -c .libs/module-role-ducking.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-role-ducking.la
libtool: install: /usr/bin/install -c .libs/module-esound-protocol-tcp.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-esound-protocol-tcp.so
libtool: install: /usr/bin/install -c .libs/module-esound-protocol-tcp.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-esound-protocol-tcp.la
libtool: install: /usr/bin/install -c .libs/module-esound-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-esound-sink.so
libtool: install: /usr/bin/install -c .libs/module-esound-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-esound-sink.la
libtool: install: /usr/bin/install -c .libs/module-rtp-send.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-rtp-send.so
libtool: install: /usr/bin/install -c .libs/module-rtp-send.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-rtp-send.la
libtool: install: /usr/bin/install -c .libs/module-rtp-recv.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-rtp-recv.so
libtool: install: /usr/bin/install -c .libs/module-rtp-recv.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-rtp-recv.la
libtool: install: /usr/bin/install -c .libs/module-cli-protocol-unix.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-cli-protocol-unix.so
libtool: install: /usr/bin/install -c .libs/module-cli-protocol-unix.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-cli-protocol-unix.la
libtool: install: /usr/bin/install -c .libs/module-simple-protocol-unix.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-simple-protocol-unix.so
libtool: install: /usr/bin/install -c .libs/module-simple-protocol-unix.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-simple-protocol-unix.la
libtool: install: /usr/bin/install -c .libs/module-http-protocol-unix.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-http-protocol-unix.so
libtool: install: /usr/bin/install -c .libs/module-http-protocol-unix.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-http-protocol-unix.la
libtool: install: /usr/bin/install -c .libs/module-native-protocol-unix.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-native-protocol-unix.so
libtool: install: /usr/bin/install -c .libs/module-native-protocol-unix.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-native-protocol-unix.la
libtool: install: /usr/bin/install -c .libs/module-esound-protocol-unix.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-esound-protocol-unix.so
libtool: install: /usr/bin/install -c .libs/module-esound-protocol-unix.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-esound-protocol-unix.la
libtool: install: /usr/bin/install -c .libs/module-pipe-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-pipe-sink.so
libtool: install: /usr/bin/install -c .libs/module-pipe-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-pipe-sink.la
libtool: install: /usr/bin/install -c .libs/module-pipe-source.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-pipe-source.so
libtool: install: /usr/bin/install -c .libs/module-pipe-source.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-pipe-source.la
libtool: install: /usr/bin/install -c .libs/module-esound-compat-spawnfd.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-esound-compat-spawnfd.so
libtool: install: /usr/bin/install -c .libs/module-esound-compat-spawnfd.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-esound-compat-spawnfd.la
libtool: install: /usr/bin/install -c .libs/module-esound-compat-spawnpid.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-esound-compat-spawnpid.so
libtool: install: /usr/bin/install -c .libs/module-esound-compat-spawnpid.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-esound-compat-spawnpid.la
libtool: install: /usr/bin/install -c .libs/module-match.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-match.so
libtool: install: /usr/bin/install -c .libs/module-match.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-match.la
libtool: install: /usr/bin/install -c .libs/liboss-util.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/liboss-util.so
libtool: install: /usr/bin/install -c .libs/liboss-util.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/liboss-util.la
libtool: install: /usr/bin/install -c .libs/module-oss.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-oss.so
libtool: install: /usr/bin/install -c .libs/module-oss.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-oss.la
libtool: install: /usr/bin/install -c .libs/libalsa-util.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libalsa-util.so
libtool: install: /usr/bin/install -c .libs/libalsa-util.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libalsa-util.la
libtool: install: /usr/bin/install -c .libs/module-alsa-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-alsa-sink.so
libtool: install: /usr/bin/install -c .libs/module-alsa-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-alsa-sink.la
libtool: install: /usr/bin/install -c .libs/module-alsa-source.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-alsa-source.so
libtool: install: /usr/bin/install -c .libs/module-alsa-source.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-alsa-source.la
libtool: install: /usr/bin/install -c .libs/module-alsa-card.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-alsa-card.so
libtool: install: /usr/bin/install -c .libs/module-alsa-card.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-alsa-card.la
libtool: install: /usr/bin/install -c .libs/module-mmkbd-evdev.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-mmkbd-evdev.so
libtool: install: /usr/bin/install -c .libs/module-mmkbd-evdev.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-mmkbd-evdev.la
libtool: install: /usr/bin/install -c .libs/module-hal-detect.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-hal-detect.so
libtool: install: /usr/bin/install -c .libs/module-hal-detect.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-hal-detect.la
libtool: install: /usr/bin/install -c .libs/module-udev-detect.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-udev-detect.so
libtool: install: /usr/bin/install -c .libs/module-udev-detect.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-udev-detect.la
libtool: install: /usr/bin/install -c .libs/module-rygel-media-server.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-rygel-media-server.so
libtool: install: /usr/bin/install -c .libs/module-rygel-media-server.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-rygel-media-server.la
libtool: install: /usr/bin/install -c .libs/module-dbus-protocol.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-dbus-protocol.so
libtool: install: /usr/bin/install -c .libs/module-dbus-protocol.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-dbus-protocol.la
libtool: install: /usr/bin/install -c .libs/libraop.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libraop.so
libtool: install: /usr/bin/install -c .libs/libraop.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/libraop.la
libtool: install: /usr/bin/install -c .libs/module-raop-sink.so /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-raop-sink.so
libtool: install: /usr/bin/install -c .libs/module-raop-sink.lai /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/module-raop-sink.la
libtool: install: warning: remember to run `libtool --finish /usr/lib/pulse-8.0/modules'
/usr/bin/make  install-exec-hook
make[6]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
ln -sf pacat /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/parec
ln -sf pacat /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/pamon
ln -sf pacat /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/paplay
ln -sf pacat /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/parecord
rm -f /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpulsedsp.la
rm -f /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pulse-8.0/modules/*.la
make[6]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
make[5]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
make[4]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
Making install in doxygen
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/doxygen"
make[4]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/doxygen"
make[4]: Nessuna operazione da eseguire per "install-exec-am".
make[4]: Nessuna operazione da eseguire per "install-data-am".
make[4]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/doxygen"
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/doxygen"
Making install in man
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[4]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[4]: Nessuna operazione da eseguire per "install-exec-am".
/usr/bin/make  install-data-hook
make[5]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[5]: Nessuna operazione da eseguire per "install-data-hook".
make[5]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[4]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
Making install in po
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/po"
make[3]: Nessuna operazione da eseguire per "install".
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/po"
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[4]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[4]: Nessuna operazione da eseguire per "install-exec-am".
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/cmake/PulseAudio'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/bash-completion/completions'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/vala/vapi'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/zsh/site-functions'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 PulseAudioConfig.cmake PulseAudioConfigVersion.cmake '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/cmake/PulseAudio'
 /usr/bin/install -c -m 644 vala/libpulse.deps vala/libpulse.vapi vala/libpulse-mainloop-glib.deps vala/libpulse-mainloop-glib.vapi vala/libpulse-simple.deps vala/libpulse-simple.vapi '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/vala/vapi'
 /usr/bin/install -c -m 644 shell-completion/bash/pulseaudio '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/bash-completion/completions'
 /usr/bin/install -c -m 644 libpulse.pc libpulse-simple.pc libpulse-mainloop-glib.pc '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 shell-completion/zsh/_pulseaudio '/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/zsh/site-functions'
/usr/bin/make  install-data-hook
make[5]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/bash-completion/completions/pactl
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/bash-completion/completions/pacmd
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/bash-completion/completions/pasuspender
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/bash-completion/completions/padsp
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/bash-completion/completions/pacat
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/bash-completion/completions/paplay
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/bash-completion/completions/parec
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/share/bash-completion/completions/parecord
make[5]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[4]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[2]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
[7m>>> pulseaudio 8.0 Fixing libtool files[27m
[7m>>> pulseaudio 8.0 Installing to target[27m
PATH="/home/femtotech/dev/buildroot/output/host/bin:/home/femtotech/dev/buildroot/output/host/sbin:/home/femtotech/dev/buildroot/output/host/usr/bin:/home/femtotech/dev/buildroot/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /usr/bin/make -j5 DESTDIR=/home/femtotech/dev/buildroot/output/target install -C /home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
/usr/bin/make  install-recursive
make[2]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
Making install in src
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
/usr/bin/make  install-am
make[4]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
make[5]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/bin'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   libpulsecommon-8.0.la '/home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio'
 /usr/bin/install -c esdcompat padsp '/home/femtotech/dev/buildroot/output/target/usr/bin'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/etc/dbus-1/system.d'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/share/pulseaudio/alsa-mixer/paths'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/share/pulseaudio/alsa-mixer/profile-sets'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/lib/udev/rules.d'
 /usr/bin/install -c -m 644 modules/alsa/mixer/paths/analog-input-aux.conf modules/alsa/mixer/paths/analog-input.conf modules/alsa/mixer/paths/analog-input.conf.common modules/alsa/mixer/paths/analog-input-fm.conf modules/alsa/mixer/paths/analog-input-linein.conf modules/alsa/mixer/paths/analog-input-mic.conf modules/alsa/mixer/paths/analog-input-dock-mic.conf modules/alsa/mixer/paths/analog-input-front-mic.conf modules/alsa/mixer/paths/analog-input-headphone-mic.conf modules/alsa/mixer/paths/analog-input-headset-mic.conf modules/alsa/mixer/paths/analog-input-internal-mic.conf modules/alsa/mixer/paths/analog-input-internal-mic-always.conf modules/alsa/mixer/paths/analog-input-rear-mic.conf modules/alsa/mixer/paths/analog-input-mic.conf.common modules/alsa/mixer/paths/analog-input-mic-line.conf modules/alsa/mixer/paths/analog-input-tvtuner.conf modules/alsa/mixer/paths/analog-input-video.conf modules/alsa/mixer/paths/analog-output.conf modules/alsa/mixer/paths/analog-output-speaker.conf modules/alsa/mixer/paths/analog-output-speaker-always.conf modules/alsa/mixer/paths/analog-output.conf.common modules/alsa/mixer/paths/analog-output-headphones.conf modules/alsa/mixer/paths/analog-output-headphones-2.conf modules/alsa/mixer/paths/analog-output-lineout.conf modules/alsa/mixer/paths/analog-output-mono.conf modules/alsa/mixer/paths/iec958-stereo-output.conf modules/alsa/mixer/paths/hdmi-output-0.conf modules/alsa/mixer/paths/hdmi-output-1.conf modules/alsa/mixer/paths/hdmi-output-2.conf modules/alsa/mixer/paths/hdmi-output-3.conf modules/alsa/mixer/paths/hdmi-output-4.conf modules/alsa/mixer/paths/hdmi-output-5.conf modules/alsa/mixer/paths/hdmi-output-6.conf modules/alsa/mixer/paths/hdmi-output-7.conf '/home/femtotech/dev/buildroot/output/target/usr/share/pulseaudio/alsa-mixer/paths'
 /usr/bin/install -c -m 644 daemon/pulseaudio-system.conf '/home/femtotech/dev/buildroot/output/target/etc/dbus-1/system.d'
 /usr/bin/install -c -m 644 modules/alsa/mixer/profile-sets/default.conf modules/alsa/mixer/profile-sets/force-speaker.conf modules/alsa/mixer/profile-sets/force-speaker-and-int-mic.conf modules/alsa/mixer/profile-sets/maudio-fasttrack-pro.conf modules/alsa/mixer/profile-sets/native-instruments-audio4dj.conf modules/alsa/mixer/profile-sets/native-instruments-audio8dj.conf modules/alsa/mixer/profile-sets/native-instruments-traktor-audio2.conf modules/alsa/mixer/profile-sets/native-instruments-traktor-audio6.conf modules/alsa/mixer/profile-sets/native-instruments-traktor-audio10.conf modules/alsa/mixer/profile-sets/native-instruments-traktorkontrol-s4.conf modules/alsa/mixer/profile-sets/native-instruments-korecontroller.conf modules/alsa/mixer/profile-sets/kinect-audio.conf modules/alsa/mixer/profile-sets/sb-omni-surround-5.1.conf '/home/femtotech/dev/buildroot/output/target/usr/share/pulseaudio/alsa-mixer/profile-sets'
 /usr/bin/install -c -m 644 modules/alsa/mixer/profile-sets/90-pulseaudio.rules '/home/femtotech/dev/buildroot/output/target/lib/udev/rules.d'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/etc/pulse'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/include/pulse'
 /usr/bin/install -c -m 644 default.pa system.pa daemon.conf client.conf '/home/femtotech/dev/buildroot/output/target/etc/pulse'
 /usr/bin/install -c -m 644 pulse/cdecl.h pulse/channelmap.h pulse/context.h pulse/def.h pulse/direction.h pulse/error.h pulse/ext-device-manager.h pulse/ext-device-restore.h pulse/ext-stream-restore.h pulse/format.h pulse/gccmacro.h pulse/introspect.h pulse/mainloop-api.h pulse/mainloop-signal.h pulse/mainloop.h pulse/operation.h pulse/proplist.h pulse/pulseaudio.h pulse/rtclock.h pulse/sample.h pulse/scache.h pulse/simple.h pulse/stream.h pulse/subscribe.h pulse/thread-mainloop.h pulse/timeval.h pulse/utf8.h pulse/util.h pulse/version.h pulse/volume.h pulse/xmalloc.h pulse/glib-mainloop.h '/home/femtotech/dev/buildroot/output/target/usr/include/pulse'
libtool: install: /usr/bin/install -c .libs/libpulsecommon-8.0.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio/libpulsecommon-8.0.so
libtool: install: /usr/bin/install -c .libs/libpulsecommon-8.0.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio/libpulsecommon-8.0.la
libtool: install: warning: remember to run `libtool --finish /usr/lib/pulseaudio'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/lib'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   libpulse.la libpulse-simple.la libpulse-mainloop-glib.la '/home/femtotech/dev/buildroot/output/target/usr/lib'
libtool: install: /usr/bin/install -c .libs/libpulse.so.0.19.0 /home/femtotech/dev/buildroot/output/target/usr/lib/libpulse.so.0.19.0
libtool: install: (cd /home/femtotech/dev/buildroot/output/target/usr/lib && { ln -s -f libpulse.so.0.19.0 libpulse.so.0 || { rm -f libpulse.so.0 && ln -s libpulse.so.0.19.0 libpulse.so.0; }; })
libtool: install: (cd /home/femtotech/dev/buildroot/output/target/usr/lib && { ln -s -f libpulse.so.0.19.0 libpulse.so || { rm -f libpulse.so && ln -s libpulse.so.0.19.0 libpulse.so; }; })
libtool: install: /usr/bin/install -c .libs/libpulse.lai /home/femtotech/dev/buildroot/output/target/usr/lib/libpulse.la
libtool: install: /usr/bin/install -c .libs/libpulse-simple.so.0.1.0 /home/femtotech/dev/buildroot/output/target/usr/lib/libpulse-simple.so.0.1.0
libtool: install: (cd /home/femtotech/dev/buildroot/output/target/usr/lib && { ln -s -f libpulse-simple.so.0.1.0 libpulse-simple.so.0 || { rm -f libpulse-simple.so.0 && ln -s libpulse-simple.so.0.1.0 libpulse-simple.so.0; }; })
libtool: install: (cd /home/femtotech/dev/buildroot/output/target/usr/lib && { ln -s -f libpulse-simple.so.0.1.0 libpulse-simple.so || { rm -f libpulse-simple.so && ln -s libpulse-simple.so.0.1.0 libpulse-simple.so; }; })
libtool: install: /usr/bin/install -c .libs/libpulse-simple.lai /home/femtotech/dev/buildroot/output/target/usr/lib/libpulse-simple.la
libtool: install: /usr/bin/install -c .libs/libpulse-mainloop-glib.so.0.0.5 /home/femtotech/dev/buildroot/output/target/usr/lib/libpulse-mainloop-glib.so.0.0.5
libtool: install: (cd /home/femtotech/dev/buildroot/output/target/usr/lib && { ln -s -f libpulse-mainloop-glib.so.0.0.5 libpulse-mainloop-glib.so.0 || { rm -f libpulse-mainloop-glib.so.0 && ln -s libpulse-mainloop-glib.so.0.0.5 libpulse-mainloop-glib.so.0; }; })
libtool: install: (cd /home/femtotech/dev/buildroot/output/target/usr/lib && { ln -s -f libpulse-mainloop-glib.so.0.0.5 libpulse-mainloop-glib.so || { rm -f libpulse-mainloop-glib.so && ln -s libpulse-mainloop-glib.so.0.0.5 libpulse-mainloop-glib.so; }; })
libtool: install: /usr/bin/install -c .libs/libpulse-mainloop-glib.lai /home/femtotech/dev/buildroot/output/target/usr/lib/libpulse-mainloop-glib.la
libtool: install: warning: remember to run `libtool --finish /usr/lib'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/bin'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   libpulsecore-8.0.la '/home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   libpulsedsp.la '/home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio'
  /bin/bash ../libtool   --mode=install /usr/bin/install -c pulseaudio pacat pactl pasuspender pacmd '/home/femtotech/dev/buildroot/output/target/usr/bin'
libtool: install: /usr/bin/install -c .libs/libpulsedsp.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio/libpulsedsp.so
libtool: install: /usr/bin/install -c .libs/libpulsedsp.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio/libpulsedsp.la
libtool: install: /usr/bin/install -c .libs/libpulsecore-8.0.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio/libpulsecore-8.0.so
libtool: install: warning: remember to run `libtool --finish /usr/lib/pulseaudio'
libtool: install: /usr/bin/install -c .libs/libpulsecore-8.0.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulseaudio/libpulsecore-8.0.la
libtool: install: warning: remember to run `libtool --finish /usr/lib/pulseaudio'
libtool: install: /usr/bin/install -c pulseaudio /home/femtotech/dev/buildroot/output/target/usr/bin/pulseaudio
libtool: install: /usr/bin/install -c pacat /home/femtotech/dev/buildroot/output/target/usr/bin/pacat
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   libcli.la libprotocol-cli.la libprotocol-simple.la libprotocol-http.la libprotocol-native.la libprotocol-esound.la librtp.la module-console-kit.la module-cli.la module-cli-protocol-tcp.la module-simple-protocol-tcp.la module-null-sink.la module-null-source.la module-sine-source.la module-detect.la module-volume-restore.la module-device-manager.la module-device-restore.la module-stream-restore.la module-card-restore.la module-default-device-restore.la module-always-sink.la module-rescue-streams.la module-intended-roles.la module-suspend-on-idle.la module-echo-cancel.la module-http-protocol-tcp.la module-sine.la module-native-protocol-tcp.la module-native-protocol-fd.la module-combine.la module-combine-sink.la module-remap-sink.la module-remap-source.la module-ladspa-sink.la module-tunnel-sink-new.la module-tunnel-source-new.la module-tunnel-sink.la module-tunnel-source.la module-position-event-sounds.la module-augment-properties.la module-role-cork.la module-loopback.la module-virtual-sink.la module-virtual-source.la module-virtual-surround-sink.la module-switch-on-connect.la module-switch-on-port-available.la module-filter-apply.la module-filter-heuristics.la module-role-ducking.la module-esound-protocol-tcp.la module-esound-sink.la module-rtp-send.la module-rtp-recv.la module-cli-protocol-unix.la module-simple-protocol-unix.la module-http-protocol-unix.la module-native-protocol-unix.la module-esound-protocol-unix.la module-pipe-sink.la module-pipe-source.la module-esound-compat-spawnfd.la module-esound-compat-spawnpid.la module-match.la liboss-util.la module-oss.la libalsa-util.la module-alsa-sink.la module-alsa-source.la module-alsa-card.la module-mmkbd-evdev.la module-hal-detect.la module-udev-detect.la module-rygel-media-server.la module-dbus-protocol.la libraop.la module-raop-sink.la '/home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules'
libtool: install: /usr/bin/install -c pactl /home/femtotech/dev/buildroot/output/target/usr/bin/pactl
libtool: install: /usr/bin/install -c pasuspender /home/femtotech/dev/buildroot/output/target/usr/bin/pasuspender
libtool: install: /usr/bin/install -c pacmd /home/femtotech/dev/buildroot/output/target/usr/bin/pacmd
libtool: install: /usr/bin/install -c .libs/libcli.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libcli.so
libtool: install: /usr/bin/install -c .libs/libcli.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libcli.la
libtool: install: /usr/bin/install -c .libs/libprotocol-cli.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libprotocol-cli.so
libtool: install: /usr/bin/install -c .libs/libprotocol-cli.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libprotocol-cli.la
libtool: install: /usr/bin/install -c .libs/libprotocol-simple.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libprotocol-simple.so
libtool: install: /usr/bin/install -c .libs/libprotocol-simple.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libprotocol-simple.la
libtool: install: /usr/bin/install -c .libs/libprotocol-http.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libprotocol-http.so
libtool: install: /usr/bin/install -c .libs/libprotocol-http.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libprotocol-http.la
libtool: install: /usr/bin/install -c .libs/libprotocol-native.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libprotocol-native.so
libtool: install: /usr/bin/install -c .libs/libprotocol-native.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libprotocol-native.la
libtool: install: /usr/bin/install -c .libs/libprotocol-esound.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libprotocol-esound.so
libtool: install: /usr/bin/install -c .libs/libprotocol-esound.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libprotocol-esound.la
libtool: install: /usr/bin/install -c .libs/librtp.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/librtp.so
libtool: install: /usr/bin/install -c .libs/librtp.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/librtp.la
libtool: install: /usr/bin/install -c .libs/module-console-kit.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-console-kit.so
libtool: install: /usr/bin/install -c .libs/module-console-kit.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-console-kit.la
libtool: install: /usr/bin/install -c .libs/module-cli.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-cli.so
libtool: install: /usr/bin/install -c .libs/module-cli.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-cli.la
libtool: install: /usr/bin/install -c .libs/module-cli-protocol-tcp.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-cli-protocol-tcp.so
libtool: install: /usr/bin/install -c .libs/module-cli-protocol-tcp.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-cli-protocol-tcp.la
libtool: install: /usr/bin/install -c .libs/module-simple-protocol-tcp.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-simple-protocol-tcp.so
libtool: install: /usr/bin/install -c .libs/module-simple-protocol-tcp.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-simple-protocol-tcp.la
libtool: install: /usr/bin/install -c .libs/module-null-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-null-sink.so
libtool: install: /usr/bin/install -c .libs/module-null-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-null-sink.la
libtool: install: /usr/bin/install -c .libs/module-null-source.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-null-source.so
libtool: install: /usr/bin/install -c .libs/module-null-source.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-null-source.la
libtool: install: /usr/bin/install -c .libs/module-sine-source.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-sine-source.so
libtool: install: /usr/bin/install -c .libs/module-sine-source.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-sine-source.la
libtool: install: /usr/bin/install -c .libs/module-detect.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-detect.so
libtool: install: /usr/bin/install -c .libs/module-detect.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-detect.la
libtool: install: /usr/bin/install -c .libs/module-volume-restore.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-volume-restore.so
libtool: install: /usr/bin/install -c .libs/module-volume-restore.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-volume-restore.la
libtool: install: /usr/bin/install -c .libs/module-device-manager.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-device-manager.so
libtool: install: /usr/bin/install -c .libs/module-device-manager.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-device-manager.la
libtool: install: /usr/bin/install -c .libs/module-device-restore.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-device-restore.so
libtool: install: /usr/bin/install -c .libs/module-device-restore.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-device-restore.la
libtool: install: /usr/bin/install -c .libs/module-stream-restore.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-stream-restore.so
libtool: install: /usr/bin/install -c .libs/module-stream-restore.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-stream-restore.la
libtool: install: /usr/bin/install -c .libs/module-card-restore.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-card-restore.so
libtool: install: /usr/bin/install -c .libs/module-card-restore.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-card-restore.la
libtool: install: /usr/bin/install -c .libs/module-default-device-restore.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-default-device-restore.so
libtool: install: /usr/bin/install -c .libs/module-default-device-restore.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-default-device-restore.la
libtool: install: /usr/bin/install -c .libs/module-always-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-always-sink.so
libtool: install: /usr/bin/install -c .libs/module-always-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-always-sink.la
libtool: install: /usr/bin/install -c .libs/module-rescue-streams.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-rescue-streams.so
libtool: install: /usr/bin/install -c .libs/module-rescue-streams.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-rescue-streams.la
libtool: install: /usr/bin/install -c .libs/module-intended-roles.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-intended-roles.so
libtool: install: /usr/bin/install -c .libs/module-intended-roles.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-intended-roles.la
libtool: install: /usr/bin/install -c .libs/module-suspend-on-idle.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-suspend-on-idle.so
libtool: install: /usr/bin/install -c .libs/module-suspend-on-idle.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-suspend-on-idle.la
libtool: install: /usr/bin/install -c .libs/module-echo-cancel.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-echo-cancel.so
libtool: install: /usr/bin/install -c .libs/module-echo-cancel.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-echo-cancel.la
libtool: install: /usr/bin/install -c .libs/module-http-protocol-tcp.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-http-protocol-tcp.so
libtool: install: /usr/bin/install -c .libs/module-http-protocol-tcp.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-http-protocol-tcp.la
libtool: install: /usr/bin/install -c .libs/module-sine.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-sine.so
libtool: install: /usr/bin/install -c .libs/module-sine.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-sine.la
libtool: install: /usr/bin/install -c .libs/module-native-protocol-tcp.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-native-protocol-tcp.so
libtool: install: /usr/bin/install -c .libs/module-native-protocol-tcp.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-native-protocol-tcp.la
libtool: install: /usr/bin/install -c .libs/module-native-protocol-fd.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-native-protocol-fd.so
libtool: install: /usr/bin/install -c .libs/module-native-protocol-fd.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-native-protocol-fd.la
libtool: install: /usr/bin/install -c .libs/module-combine.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-combine.so
libtool: install: /usr/bin/install -c .libs/module-combine.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-combine.la
libtool: install: /usr/bin/install -c .libs/module-combine-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-combine-sink.so
libtool: install: /usr/bin/install -c .libs/module-combine-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-combine-sink.la
libtool: install: /usr/bin/install -c .libs/module-remap-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-remap-sink.so
libtool: install: /usr/bin/install -c .libs/module-remap-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-remap-sink.la
libtool: install: /usr/bin/install -c .libs/module-remap-source.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-remap-source.so
libtool: install: /usr/bin/install -c .libs/module-remap-source.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-remap-source.la
libtool: install: /usr/bin/install -c .libs/module-ladspa-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-ladspa-sink.so
libtool: install: /usr/bin/install -c .libs/module-ladspa-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-ladspa-sink.la
libtool: install: /usr/bin/install -c .libs/module-tunnel-sink-new.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-tunnel-sink-new.so
libtool: install: /usr/bin/install -c .libs/module-tunnel-sink-new.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-tunnel-sink-new.la
libtool: install: /usr/bin/install -c .libs/module-tunnel-source-new.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-tunnel-source-new.so
libtool: install: /usr/bin/install -c .libs/module-tunnel-source-new.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-tunnel-source-new.la
libtool: install: /usr/bin/install -c .libs/module-tunnel-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-tunnel-sink.so
libtool: install: /usr/bin/install -c .libs/module-tunnel-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-tunnel-sink.la
libtool: install: /usr/bin/install -c .libs/module-tunnel-source.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-tunnel-source.so
libtool: install: /usr/bin/install -c .libs/module-tunnel-source.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-tunnel-source.la
libtool: install: /usr/bin/install -c .libs/module-position-event-sounds.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-position-event-sounds.so
libtool: install: /usr/bin/install -c .libs/module-position-event-sounds.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-position-event-sounds.la
libtool: install: /usr/bin/install -c .libs/module-augment-properties.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-augment-properties.so
libtool: install: /usr/bin/install -c .libs/module-augment-properties.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-augment-properties.la
libtool: install: /usr/bin/install -c .libs/module-role-cork.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-role-cork.so
libtool: install: /usr/bin/install -c .libs/module-role-cork.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-role-cork.la
libtool: install: /usr/bin/install -c .libs/module-loopback.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-loopback.so
libtool: install: /usr/bin/install -c .libs/module-loopback.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-loopback.la
libtool: install: /usr/bin/install -c .libs/module-virtual-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-virtual-sink.so
libtool: install: /usr/bin/install -c .libs/module-virtual-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-virtual-sink.la
libtool: install: /usr/bin/install -c .libs/module-virtual-source.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-virtual-source.so
libtool: install: /usr/bin/install -c .libs/module-virtual-source.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-virtual-source.la
libtool: install: /usr/bin/install -c .libs/module-virtual-surround-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-virtual-surround-sink.so
libtool: install: /usr/bin/install -c .libs/module-virtual-surround-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-virtual-surround-sink.la
libtool: install: /usr/bin/install -c .libs/module-switch-on-connect.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-switch-on-connect.so
libtool: install: /usr/bin/install -c .libs/module-switch-on-connect.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-switch-on-connect.la
libtool: install: /usr/bin/install -c .libs/module-switch-on-port-available.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-switch-on-port-available.so
libtool: install: /usr/bin/install -c .libs/module-switch-on-port-available.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-switch-on-port-available.la
libtool: install: /usr/bin/install -c .libs/module-filter-apply.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-filter-apply.so
libtool: install: /usr/bin/install -c .libs/module-filter-apply.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-filter-apply.la
libtool: install: /usr/bin/install -c .libs/module-filter-heuristics.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-filter-heuristics.so
libtool: install: /usr/bin/install -c .libs/module-filter-heuristics.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-filter-heuristics.la
libtool: install: /usr/bin/install -c .libs/module-role-ducking.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-role-ducking.so
libtool: install: /usr/bin/install -c .libs/module-role-ducking.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-role-ducking.la
libtool: install: /usr/bin/install -c .libs/module-esound-protocol-tcp.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-esound-protocol-tcp.so
libtool: install: /usr/bin/install -c .libs/module-esound-protocol-tcp.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-esound-protocol-tcp.la
libtool: install: /usr/bin/install -c .libs/module-esound-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-esound-sink.so
libtool: install: /usr/bin/install -c .libs/module-esound-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-esound-sink.la
libtool: install: /usr/bin/install -c .libs/module-rtp-send.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-rtp-send.so
libtool: install: /usr/bin/install -c .libs/module-rtp-send.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-rtp-send.la
libtool: install: /usr/bin/install -c .libs/module-rtp-recv.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-rtp-recv.so
libtool: install: /usr/bin/install -c .libs/module-rtp-recv.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-rtp-recv.la
libtool: install: /usr/bin/install -c .libs/module-cli-protocol-unix.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-cli-protocol-unix.so
libtool: install: /usr/bin/install -c .libs/module-cli-protocol-unix.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-cli-protocol-unix.la
libtool: install: /usr/bin/install -c .libs/module-simple-protocol-unix.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-simple-protocol-unix.so
libtool: install: /usr/bin/install -c .libs/module-simple-protocol-unix.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-simple-protocol-unix.la
libtool: install: /usr/bin/install -c .libs/module-http-protocol-unix.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-http-protocol-unix.so
libtool: install: /usr/bin/install -c .libs/module-http-protocol-unix.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-http-protocol-unix.la
libtool: install: /usr/bin/install -c .libs/module-native-protocol-unix.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-native-protocol-unix.so
libtool: install: /usr/bin/install -c .libs/module-native-protocol-unix.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-native-protocol-unix.la
libtool: install: /usr/bin/install -c .libs/module-esound-protocol-unix.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-esound-protocol-unix.so
libtool: install: /usr/bin/install -c .libs/module-esound-protocol-unix.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-esound-protocol-unix.la
libtool: install: /usr/bin/install -c .libs/module-pipe-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-pipe-sink.so
libtool: install: /usr/bin/install -c .libs/module-pipe-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-pipe-sink.la
libtool: install: /usr/bin/install -c .libs/module-pipe-source.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-pipe-source.so
libtool: install: /usr/bin/install -c .libs/module-pipe-source.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-pipe-source.la
libtool: install: /usr/bin/install -c .libs/module-esound-compat-spawnfd.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-esound-compat-spawnfd.so
libtool: install: /usr/bin/install -c .libs/module-esound-compat-spawnfd.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-esound-compat-spawnfd.la
libtool: install: /usr/bin/install -c .libs/module-esound-compat-spawnpid.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-esound-compat-spawnpid.so
libtool: install: /usr/bin/install -c .libs/module-esound-compat-spawnpid.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-esound-compat-spawnpid.la
libtool: install: /usr/bin/install -c .libs/module-match.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-match.so
libtool: install: /usr/bin/install -c .libs/module-match.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-match.la
libtool: install: /usr/bin/install -c .libs/liboss-util.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/liboss-util.so
libtool: install: /usr/bin/install -c .libs/liboss-util.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/liboss-util.la
libtool: install: /usr/bin/install -c .libs/module-oss.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-oss.so
libtool: install: /usr/bin/install -c .libs/module-oss.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-oss.la
libtool: install: /usr/bin/install -c .libs/libalsa-util.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libalsa-util.so
libtool: install: /usr/bin/install -c .libs/libalsa-util.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libalsa-util.la
libtool: install: /usr/bin/install -c .libs/module-alsa-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-alsa-sink.so
libtool: install: /usr/bin/install -c .libs/module-alsa-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-alsa-sink.la
libtool: install: /usr/bin/install -c .libs/module-alsa-source.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-alsa-source.so
libtool: install: /usr/bin/install -c .libs/module-alsa-source.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-alsa-source.la
libtool: install: /usr/bin/install -c .libs/module-alsa-card.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-alsa-card.so
libtool: install: /usr/bin/install -c .libs/module-alsa-card.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-alsa-card.la
libtool: install: /usr/bin/install -c .libs/module-mmkbd-evdev.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-mmkbd-evdev.so
libtool: install: /usr/bin/install -c .libs/module-mmkbd-evdev.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-mmkbd-evdev.la
libtool: install: /usr/bin/install -c .libs/module-hal-detect.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-hal-detect.so
libtool: install: /usr/bin/install -c .libs/module-hal-detect.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-hal-detect.la
libtool: install: /usr/bin/install -c .libs/module-udev-detect.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-udev-detect.so
libtool: install: /usr/bin/install -c .libs/module-udev-detect.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-udev-detect.la
libtool: install: /usr/bin/install -c .libs/module-rygel-media-server.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-rygel-media-server.so
libtool: install: /usr/bin/install -c .libs/module-rygel-media-server.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-rygel-media-server.la
libtool: install: /usr/bin/install -c .libs/module-dbus-protocol.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-dbus-protocol.so
libtool: install: /usr/bin/install -c .libs/module-dbus-protocol.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-dbus-protocol.la
libtool: install: /usr/bin/install -c .libs/libraop.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libraop.so
libtool: install: /usr/bin/install -c .libs/libraop.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/libraop.la
libtool: install: /usr/bin/install -c .libs/module-raop-sink.so /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-raop-sink.so
libtool: install: /usr/bin/install -c .libs/module-raop-sink.lai /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/module-raop-sink.la
libtool: install: warning: remember to run `libtool --finish /usr/lib/pulse-8.0/modules'
/usr/bin/make  install-exec-hook
make[6]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
ln -sf pacat /home/femtotech/dev/buildroot/output/target/usr/bin/parec
ln -sf pacat /home/femtotech/dev/buildroot/output/target/usr/bin/pamon
ln -sf pacat /home/femtotech/dev/buildroot/output/target/usr/bin/paplay
ln -sf pacat /home/femtotech/dev/buildroot/output/target/usr/bin/parecord
rm -f /home/femtotech/dev/buildroot/output/target/usr/lib/libpulsedsp.la
rm -f /home/femtotech/dev/buildroot/output/target/usr/lib/pulse-8.0/modules/*.la
make[6]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
make[5]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
make[4]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/src"
Making install in doxygen
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/doxygen"
make[4]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/doxygen"
make[4]: Nessuna operazione da eseguire per "install-exec-am".
make[4]: Nessuna operazione da eseguire per "install-data-am".
make[4]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/doxygen"
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/doxygen"
Making install in man
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[4]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[4]: Nessuna operazione da eseguire per "install-exec-am".
/usr/bin/make  install-data-hook
make[5]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[5]: Nessuna operazione da eseguire per "install-data-hook".
make[5]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[4]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/man"
Making install in po
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/po"
make[3]: Nessuna operazione da eseguire per "install".
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0/po"
make[3]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[4]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[4]: Nessuna operazione da eseguire per "install-exec-am".
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/lib/cmake/PulseAudio'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/share/bash-completion/completions'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/share/vala/vapi'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/share/zsh/site-functions'
 /bin/mkdir -p '/home/femtotech/dev/buildroot/output/target/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 shell-completion/bash/pulseaudio '/home/femtotech/dev/buildroot/output/target/usr/share/bash-completion/completions'
 /usr/bin/install -c -m 644 vala/libpulse.deps vala/libpulse.vapi vala/libpulse-mainloop-glib.deps vala/libpulse-mainloop-glib.vapi vala/libpulse-simple.deps vala/libpulse-simple.vapi '/home/femtotech/dev/buildroot/output/target/usr/share/vala/vapi'
 /usr/bin/install -c -m 644 PulseAudioConfig.cmake PulseAudioConfigVersion.cmake '/home/femtotech/dev/buildroot/output/target/usr/lib/cmake/PulseAudio'
 /usr/bin/install -c -m 644 libpulse.pc libpulse-simple.pc libpulse-mainloop-glib.pc '/home/femtotech/dev/buildroot/output/target/usr/lib/pkgconfig'
 /usr/bin/install -c -m 644 shell-completion/zsh/_pulseaudio '/home/femtotech/dev/buildroot/output/target/usr/share/zsh/site-functions'
/usr/bin/make  install-data-hook
make[5]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/target/usr/share/bash-completion/completions/pactl
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/target/usr/share/bash-completion/completions/pacmd
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/target/usr/share/bash-completion/completions/pasuspender
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/target/usr/share/bash-completion/completions/padsp
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/target/usr/share/bash-completion/completions/pacat
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/target/usr/share/bash-completion/completions/paplay
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/target/usr/share/bash-completion/completions/parec
ln -s -f pulseaudio /home/femtotech/dev/buildroot/output/target/usr/share/bash-completion/completions/parecord
make[5]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[4]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[3]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[2]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/pulseaudio-8.0"
/usr/bin/install -D -m 755 package/pulseaudio/S50pulseaudio /home/femtotech/dev/buildroot/output/target/etc/init.d/S50pulseaudio
rm -rf /home/femtotech/dev/buildroot/output/target/usr/share/vala
