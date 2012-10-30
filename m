From: Alexander Varnin <fenixk19@mail.ru>
Date: Tue, 30 Oct 2012 14:52:08 +0400
Subject: [Buildroot] Problem building curlftpfs within buildroot
Message-ID: <508FB158.1090205@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello. I'm trying to build self-made package curlftpfs within buildroot. 
It is simple autotools based package. Build fails with pthread error:

/home/varnin/buildroot/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.5.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: 
note: 'pthread_create' is defined in DSO 
/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0 
so try adding it to the linker command line
/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0: 
could not read symbols: Invalid operation
collect2: ld returned 1 exit status

I'm using buildroot toolchain to build my application that uses threads, 
and it compiles and works normally. What could be the problem?
I'm attaching build log.
-------------- next part --------------
make
>>> curlftpfs 0.9.2 Extracting
gzip -d -c /home/varnin/buildroot/dl/curlftpfs-0.9.2.tar.gz | tar --strip-components=1 -C /home/varnin/buildroot/output/build/curlftpfs-0.9.2  -xf -
>>> curlftpfs 0.9.2 Patching package//curlftpfs
>>> curlftpfs 0.9.2  Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find /home/varnin/buildroot/output/build/curlftpfs-0.9.2 -name $file); do cp support/gnuconfig/$file $i; done; done
>>> curlftpfs 0.9.2 Patching libtool

Applying buildroot-libtool-v1.5.patch using patch: 
patching file ltmain.sh
Hunk #1 succeeded at 297 (offset 24 lines).
Hunk #2 succeeded at 2466 (offset 58 lines).
Hunk #3 succeeded at 2612 (offset 60 lines).
Hunk #4 succeeded at 5702 (offset 89 lines).
Hunk #5 succeeded at 6027 (offset 89 lines).
>>> curlftpfs 0.9.2 Configuring
(cd /home/varnin/buildroot/output/build/curlftpfs-0.9.2/ && rm -rf config.cache && PATH="/home/varnin/buildroot/output/host/bin:/home/varnin/buildroot/output/host/usr/bin:/home/varnin/buildroot/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" AR="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar" AS="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as" LD="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld" NM="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm" CC="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc" GCC="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc" CPP="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cpp" CXX="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++" FC="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gfortran" RANLIB="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib" STRIP="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip" OBJCOPY="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objcopy" OBJDUMP="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="-O2 -I/home/varnin/buildroot/output/host/include -I/home/varnin/buildroot/output/host/usr/include" CXXFLAGS_FOR_BUILD="-I/home/varnin/buildroot/output/host/include -I/home/varnin/buildroot/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/varnin/buildroot/output/host/lib -L/home/varnin/buildroot/output/host/usr/lib -Wl,-rpath,/home/varnin/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as" DEFAULT_LINKER="/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld" CFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CXXFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="" FCFLAGS="" PKG_CONFIG="/home/varnin/buildroot/output/host/usr/bin/pkg-config" PERLLIB="/home/varnin/buildroot/output/host/usr/lib/perl" STAGING_DIR="/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot" ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no LIBS=-lpthread ./configure --target=arm-unknown-linux-uclibcgnueabi --host=arm-unknown-linux-uclibcgnueabi --build=i686-pc-linux-gnu --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --program-prefix="" --disable-gtk-doc --disable-nls  --disable-ipv6 --enable-static --enable-shared   )
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking for arm-unknown-linux-uclibcgnueabi-strip... /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip
checking for arm-unknown-linux-uclibcgnueabi-gcc... /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc accepts -g... yes
checking for /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc option to accept ISO C89... none needed
checking for style of include used by make... GNU
checking dependency style of /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc... gcc3
checking how to run the C preprocessor... /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cpp
checking for a BSD-compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking whether make sets $(MAKE)... (cached) yes
checking build system type... i686-pc-linux-gnu
checking host system type... arm-unknown-linux-uclibcgnueabi
checking for a sed that does not truncate output... /bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ld used by /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc... /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
checking if the linker (/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld) is GNU ld... yes
checking for /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld option to reload object files... -r
checking for BSD-compatible nm... /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm
checking how to recognize dependent libraries... pass_all
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
checking dlfcn.h usability... yes
checking dlfcn.h presence... yes
checking for dlfcn.h... yes
checking whether we are using the GNU C++ compiler... yes
checking whether /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++ accepts -g... yes
checking dependency style of /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++... gcc3
checking how to run the C++ preprocessor... /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++ -E
checking for arm-unknown-linux-uclibcgnueabi-g77... no
checking for arm-unknown-linux-uclibcgnueabi-xlf... no
checking for arm-unknown-linux-uclibcgnueabi-f77... no
checking for arm-unknown-linux-uclibcgnueabi-frt... no
checking for arm-unknown-linux-uclibcgnueabi-pgf77... no
checking for arm-unknown-linux-uclibcgnueabi-cf77... no
checking for arm-unknown-linux-uclibcgnueabi-fort77... no
checking for arm-unknown-linux-uclibcgnueabi-fl32... no
checking for arm-unknown-linux-uclibcgnueabi-af77... no
checking for arm-unknown-linux-uclibcgnueabi-xlf90... no
checking for arm-unknown-linux-uclibcgnueabi-f90... no
checking for arm-unknown-linux-uclibcgnueabi-pgf90... no
checking for arm-unknown-linux-uclibcgnueabi-pghpf... no
checking for arm-unknown-linux-uclibcgnueabi-epcf90... no
checking for arm-unknown-linux-uclibcgnueabi-gfortran... no
checking for arm-unknown-linux-uclibcgnueabi-g95... no
checking for arm-unknown-linux-uclibcgnueabi-xlf95... no
checking for arm-unknown-linux-uclibcgnueabi-f95... no
checking for arm-unknown-linux-uclibcgnueabi-fort... no
checking for arm-unknown-linux-uclibcgnueabi-ifort... no
checking for arm-unknown-linux-uclibcgnueabi-ifc... no
checking for arm-unknown-linux-uclibcgnueabi-efc... no
checking for arm-unknown-linux-uclibcgnueabi-pgf95... no
checking for arm-unknown-linux-uclibcgnueabi-lf95... no
checking for arm-unknown-linux-uclibcgnueabi-ftn... no
checking for g77... no
checking for xlf... no
checking for f77... no
checking for frt... no
checking for pgf77... no
checking for cf77... no
checking for fort77... no
checking for fl32... no
checking for af77... no
checking for xlf90... no
checking for f90... no
checking for pgf90... no
checking for pghpf... no
checking for epcf90... no
checking for gfortran... no
checking for g95... no
checking for xlf95... no
checking for f95... no
checking for fort... no
checking for ifort... no
checking for ifc... no
checking for efc... no
checking for pgf95... no
checking for lf95... no
checking for ftn... no
checking whether we are using the GNU Fortran 77 compiler... no
checking whether  accepts -g... no
checking the maximum length of command line arguments... 805306365
checking command to parse /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm output from /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc object... ok
checking for objdir... .libs
checking for arm-unknown-linux-uclibcgnueabi-ar... /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar
checking for arm-unknown-linux-uclibcgnueabi-ranlib... /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib
checking for arm-unknown-linux-uclibcgnueabi-strip... (cached) /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip
checking if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc supports -fno-rtti -fno-exceptions... no
checking for /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc option to produce PIC... -fPIC
checking if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc PIC flag -fPIC works... yes
checking if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc static flag -static works... yes
checking if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc supports -c -o file.o... yes
checking whether the /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc linker (/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
configure: creating libtool
appending configuration tag "CXX" to libtool
checking for ld used by /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++... /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
checking if the linker (/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld) is GNU ld... yes
checking whether the /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++ linker (/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld) supports shared libraries... yes
checking for /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++ option to produce PIC... -fPIC
checking if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++ PIC flag -fPIC works... yes
checking if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++ static flag -static works... yes
checking if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++ supports -c -o file.o... yes
checking whether the /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++ linker (/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld) supports shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
appending configuration tag "F77" to libtool
checking pkg-config is at least version 0.9.0... yes
checking for GLIB... yes
checking for FUSE... yes
checking for gawk... (cached) mawk
checking for curl-config... no
checking whether libcurl is usable... yes
checking for curl_free... yes
checking for fuse_opt_parse... yes
checking for ANSI C header files... (cached) yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking netinet/in.h usability... yes
checking netinet/in.h presence... yes
checking for netinet/in.h... yes
checking for stdint.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for unistd.h... (cached) yes
checking for an ANSI C-conforming const... yes
checking for uid_t in sys/types.h... yes
checking for inline... inline
checking for mode_t... yes
checking for off_t... yes
checking for size_t... yes
checking for struct stat.st_blksize... yes
checking for struct stat.st_blocks... yes
checking for struct stat.st_rdev... yes
checking whether time.h and sys/time.h may both be included... yes
checking whether struct tm is in sys/time.h or time.h... time.h
checking for unistd.h... (cached) yes
checking for working chown... no
checking for stdlib.h... (cached) yes
checking for GNU libc compatible malloc... (cached) yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking for unistd.h... (cached) yes
checking utime.h usability... yes
checking utime.h presence... yes
checking for utime.h... yes
checking for alarm... yes
checking for working mktime... no
checking for stdlib.h... (cached) yes
checking for GNU libc compatible realloc... (cached) yes
checking sys/select.h usability... yes
checking sys/select.h presence... yes
checking for sys/select.h... yes
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking types of arguments for select... int,fd_set *,struct timeval *
checking for strftime... yes
checking whether utime accepts a null argument... no
checking for ftruncate... yes
checking for getpass... yes
checking for memmove... yes
checking for memset... yes
checking for mkdir... yes
checking for realpath... yes
checking for rmdir... yes
checking for select... yes
checking for strchr... yes
checking for strdup... yes
checking for strrchr... yes
checking for strstr... yes
checking for strtoull... yes
checking for utime... yes
checking for iconv... yes
checking for iconv declaration... 
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
configure: creating ./config.status
config.status: creating Makefile
config.status: creating compat/Makefile
config.status: creating tests/Makefile
config.status: creating doc/Makefile
config.status: creating config.h
config.status: executing depfiles commands
>>> curlftpfs 0.9.2 Building
PATH="/home/varnin/buildroot/output/host/bin:/home/varnin/buildroot/output/host/usr/bin:/home/varnin/buildroot/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" PERLLIB="/home/varnin/buildroot/output/host/usr/lib/perl"  /usr/bin/make -j2  -C /home/varnin/buildroot/output/build/curlftpfs-0.9.2/
make[1]: Entering directory `/home/varnin/buildroot/output/build/curlftpfs-0.9.2'
/usr/bin/make  all-recursive
make[2]: Entering directory `/home/varnin/buildroot/output/build/curlftpfs-0.9.2'
Making all in compat
make[3]: Entering directory `/home/varnin/buildroot/output/build/curlftpfs-0.9.2/compat'
if /bin/bash ../libtool --tag=CC --mode=compile /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I..     -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include   -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse    -MT fuse_opt.lo -MD -MP -MF ".deps/fuse_opt.Tpo" -c -o fuse_opt.lo fuse_opt.c; \
	then mv -f ".deps/fuse_opt.Tpo" ".deps/fuse_opt.Plo"; else rm -f ".deps/fuse_opt.Tpo"; exit 1; fi
mkdir .libs
 /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.. -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse -MT fuse_opt.lo -MD -MP -MF .deps/fuse_opt.Tpo -c fuse_opt.c  -fPIC -DPIC -o .libs/fuse_opt.o
 /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.. -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse -MT fuse_opt.lo -MD -MP -MF .deps/fuse_opt.Tpo -c fuse_opt.c -o fuse_opt.o >/dev/null 2>&1
/bin/bash ../libtool --tag=CC --mode=link /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include   -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse      -o libcompat.la   fuse_opt.lo  -lglib-2.0 -lintl   -lfuse   -lcurl
/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar cru .libs/libcompat.a .libs/fuse_opt.o
/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib .libs/libcompat.a
creating libcompat.la
(cd .libs && rm -f libcompat.la && ln -s ../libcompat.la libcompat.la)
make[3]: Leaving directory `/home/varnin/buildroot/output/build/curlftpfs-0.9.2/compat'
Making all in doc
make[3]: Entering directory `/home/varnin/buildroot/output/build/curlftpfs-0.9.2/doc'
make[3]: ???? `all' ?? ??????? ?????????? ??????.
make[3]: Leaving directory `/home/varnin/buildroot/output/build/curlftpfs-0.9.2/doc'
make[3]: Entering directory `/home/varnin/buildroot/output/build/curlftpfs-0.9.2'
if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.  -DFUSE_USE_VERSION=26   -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include   -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse    -MT cache.o -MD -MP -MF ".deps/cache.Tpo" -c -o cache.o cache.c; \
	then mv -f ".deps/cache.Tpo" ".deps/cache.Po"; else rm -f ".deps/cache.Tpo"; exit 1; fi
if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.  -DFUSE_USE_VERSION=26   -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include   -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse    -MT ftpfs-ls.o -MD -MP -MF ".deps/ftpfs-ls.Tpo" -c -o ftpfs-ls.o ftpfs-ls.c; \
	then mv -f ".deps/ftpfs-ls.Tpo" ".deps/ftpfs-ls.Po"; else rm -f ".deps/ftpfs-ls.Tpo"; exit 1; fi
if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.  -DFUSE_USE_VERSION=26   -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include   -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse    -MT charset_utils.o -MD -MP -MF ".deps/charset_utils.Tpo" -c -o charset_utils.o charset_utils.c; \
	then mv -f ".deps/charset_utils.Tpo" ".deps/charset_utils.Po"; else rm -f ".deps/charset_utils.Tpo"; exit 1; fi
if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.  -DFUSE_USE_VERSION=26   -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include   -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse    -MT path_utils.o -MD -MP -MF ".deps/path_utils.Tpo" -c -o path_utils.o path_utils.c; \
	then mv -f ".deps/path_utils.Tpo" ".deps/path_utils.Po"; else rm -f ".deps/path_utils.Tpo"; exit 1; fi
if /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I.  -DFUSE_USE_VERSION=26   -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include   -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse    -MT ftpfs.o -MD -MP -MF ".deps/ftpfs.Tpo" -c -o ftpfs.o ftpfs.c; \
	then mv -f ".deps/ftpfs.Tpo" ".deps/ftpfs.Po"; else rm -f ".deps/ftpfs.Tpo"; exit 1; fi
rm -f libcurlftpfs.a
/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar cru libcurlftpfs.a cache.o ftpfs-ls.o charset_utils.o path_utils.o 
/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib libcurlftpfs.a
ftpfs.c: In function 'cancel_previous_multi':
ftpfs.c:201:17: warning: comparison between 'CURLMcode' and 'enum <anonymous>'
ftpfs.c: In function 'ftpfs_read_chunk':
ftpfs.c:367:21: warning: comparison between 'CURLMcode' and 'enum <anonymous>'
ftpfs.c: In function 'ftpfs_write_thread':
ftpfs.c:499:8: warning: unused variable 'range'
ftpfs.c: At top level:
ftpfs.c:621:12: warning: 'buffer_file' defined but not used
/bin/bash ./libtool --tag=CC --mode=link /home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include   -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse    -liconv  -o curlftpfs  ftpfs.o libcurlftpfs.a -lglib-2.0 -lintl   -lfuse   -lcurl
mkdir .libs
/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -D_FILE_OFFSET_BITS=64 -I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse -o curlftpfs ftpfs.o  /home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libiconv.so libcurlftpfs.a /home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libglib-2.0.so /home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libintl.so /home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libfuse.so /home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libcurl.so   -Wl,--rpath -Wl,/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib -Wl,--rpath -Wl,/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
/home/varnin/buildroot/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.5.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: ftpfs.o: undefined reference to symbol 'pthread_create'
/home/varnin/buildroot/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.5.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: note: 'pthread_create' is defined in DSO /home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0 so try adding it to the linker command line
/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0: could not read symbols: Invalid operation
collect2: ld returned 1 exit status
make[3]: *** [curlftpfs] ?????? 1
make[3]: Leaving directory `/home/varnin/buildroot/output/build/curlftpfs-0.9.2'
make[2]: *** [all-recursive] ?????? 1
make[2]: Leaving directory `/home/varnin/buildroot/output/build/curlftpfs-0.9.2'
make[1]: *** [all] ?????? 2
make[1]: Leaving directory `/home/varnin/buildroot/output/build/curlftpfs-0.9.2'
make: *** [/home/varnin/buildroot/output/build/curlftpfs-0.9.2/.stamp_built] ?????? 2
