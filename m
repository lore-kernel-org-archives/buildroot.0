From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Sep 2011 07:52:15 +0000 (UTC)
Subject: [Buildroot] [Bug 4231] New: libneon.so: undefined reference to
	`SSL_SESSION_cmp'
Message-ID: <bug-4231-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4231

           Summary: libneon.so: undefined reference to `SSL_SESSION_cmp'
           Product: buildroot
           Version: 2010.08
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: marco_cantu_ranzani at libero.it
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


>>> neon 0.28.3 Extracting
gzip -d -c /root/buildroot/buildroot_e_v11.08/dl/neon-0.28.3.tar.gz | tar
--strip-components=1 -C
/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3  -xf -
>>> neon 0.28.3 Patching package/neon
for file in config.guess config.sub; do for i in $(find
/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3 -name $file); do cp
package/gnuconfig/$file $i; done; done
>>> neon 0.28.3 Patching libtool

Applying buildroot-libtool-v1.5.patch using plaintext: 
patching file ltmain.sh
Hunk #1 succeeded at 291 (offset 18 lines).
Hunk #2 succeeded at 2445 (offset 37 lines).
Hunk #3 succeeded at 2591 (offset 39 lines).
Hunk #4 succeeded at 5668 (offset 55 lines).
Hunk #5 succeeded at 5993 (offset 55 lines).
>>> neon 0.28.3 Configuring
(cd /root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/ && rm -rf
config.cache &&
PATH="/root/buildroot/buildroot_e_v11.08/output/host/bin:/root/buildroot/buildroot_e_v11.08/output/host/usr/bin:/root/buildroot/buildroot_e_v11.08/output/host/usr/sbin/:/usr/local/arm/4.3.2/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin"
AR="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar"
AS="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as"
LD="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld"
NM="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm"
CC="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc"
GCC="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc"
CPP="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cpp"
CXX="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++"
FC="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gfortran"
RANLIB="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib"
STRIP="true"
OBJCOPY="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objcopy"
OBJDUMP="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="-O2
-I/root/buildroot/buildroot_e_v11.08/output/host/include
-I/root/buildroot/buildroot_e_v11.08/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/root/buildroot/buildroot_e_v11.08/output/host/include
-I/root/buildroot/buildroot_e_v11.08/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/root/buildroot/buildroot_e_v11.08/output/host/lib
-L/root/buildroot/buildroot_e_v11.08/output/host/usr/lib
-Wl,-rpath,/root/buildroot/buildroot_e_v11.08/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as"
DEFAULT_LINKER="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld"
CFLAGS="-pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CXXFLAGS="-pipe -Os  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/pkg-config"
PERLLIB="/root/buildroot/buildroot_e_v11.08/output/host/usr/lib/perl"
STAGING_DIR="/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot"
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no
ac_cv_prog_XML2_CONFIG=/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/bin/xml2-config
./configure --target=arm-linux --host=arm-linux --build=i686-pc-linux-gnu
--prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --program-prefix=""
--disable-gtk-doc --disable-nls   --enable-static --enable-shared 
--without-gssapi --disable-rpath --with-libxml2=yes --with-expat=no
--with-zlib=/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
--with-ssl
--with-expat=/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libexpat.la
--with-libxml2=no --disable-webdav --with-ssl )
checking for a BSD-compatible install... /usr/bin/install -c
checking build system type... i686-pc-linux-gnu
checking host system type... arm-unknown-linux-gnu
checking for arm-linux-gcc...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
accepts -g... yes
checking for
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
option to accept ISO C89... none needed
checking for a sed that does not truncate output... /bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ld used by
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
checking if the linker
(/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld)
is GNU ld... yes
checking for
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
option to reload object files... -r
checking for BSD-compatible nm...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm
checking whether ln -s works... yes
checking how to recognize dependent libraries... pass_all
checking how to run the C preprocessor...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cpp
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
checking whether
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
accepts -g... yes
checking how to run the C++ preprocessor...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
-E
checking for arm-linux-g77... no
checking for arm-linux-xlf... no
checking for arm-linux-f77... no
checking for arm-linux-frt... no
checking for arm-linux-pgf77... no
checking for arm-linux-cf77... no
checking for arm-linux-fort77... no
checking for arm-linux-fl32... no
checking for arm-linux-af77... no
checking for arm-linux-xlf90... no
checking for arm-linux-f90... no
checking for arm-linux-pgf90... no
checking for arm-linux-pghpf... no
checking for arm-linux-epcf90... no
checking for arm-linux-gfortran... no
checking for arm-linux-g95... no
checking for arm-linux-xlf95... no
checking for arm-linux-f95... no
checking for arm-linux-fort... no
checking for arm-linux-ifort... no
checking for arm-linux-ifc... no
checking for arm-linux-efc... no
checking for arm-linux-pgf95... no
checking for arm-linux-lf95... no
checking for arm-linux-ftn... no
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
checking command to parse
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm
output from
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
object... ok
checking for objdir... .libs
checking for arm-linux-ar...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar
checking for arm-linux-ranlib...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib
checking for arm-linux-strip... true
checking if
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
supports -fno-rtti -fno-exceptions... no
checking for
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
option to produce PIC... -fPIC
checking if
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
PIC flag -fPIC works... yes
checking if
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
static flag -static works... yes
checking if
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
supports -c -o file.o... yes
checking whether the
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
linker
(/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld)
supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... no
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
configure: creating libtool
appending configuration tag "CXX" to libtool
checking for ld used by
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
checking if the linker
(/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld)
is GNU ld... yes
checking whether the
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
linker
(/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld)
supports shared libraries... yes
checking for
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
option to produce PIC... -fPIC
checking if
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
PIC flag -fPIC works... yes
checking if
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
static flag -static works... yes
checking if
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
supports -c -o file.o... yes
checking whether the
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
linker
(/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld)
supports shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
appending configuration tag "F77" to libtool
checking for library containing strerror... none required
checking for inline... inline
checking for an ANSI C-conforming const... yes
checking for size_t... yes
checking for off_t... yes
checking for uname... Linux
checking whether make sets $(MAKE)... yes
checking for int... yes
checking size of int... 4
checking for long... yes
checking size of long... 4
checking for long long... yes
checking size of long long... 8
checking for gcc -Wformat -Werror sanity... yes
checking errno.h usability... yes
checking errno.h presence... yes
checking for errno.h... yes
checking stdarg.h usability... yes
checking stdarg.h presence... yes
checking for stdarg.h... yes
checking for string.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for size_t... (cached) yes
checking size of size_t... 4
checking how to print size_t... u
checking for off_t... (cached) yes
checking size of off_t... 8
checking how to print off_t... lld
checking for ssize_t... yes
checking size of ssize_t... 4
checking how to print ssize_t... d
checking for time_t... yes
checking size of time_t... 4
checking how to print time_t... ld
checking for pid_t... yes
checking whether time.h and sys/time.h may both be included... yes
checking for arm-linux-ar...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar
checking for arm-linux-ranlib...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking for stdint.h... (cached) yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking for pipe... yes
checking for isatty... yes
checking for usleep... yes
checking for shutdown... yes
checking for setlocale... yes
checking whether byte ordering is bigendian... (cached) no
checking whether strerror_r is declared... yes
checking for strerror_r... yes
checking whether strerror_r returns char *... yes
checking for snprintf... yes
checking for vsnprintf... yes
checking for sys/time.h... (cached) yes
checking for limits.h... yes
checking for sys/select.h... yes
checking for arpa/inet.h... yes
checking for libintl.h... yes
checking for signal.h... yes
checking for sys/socket.h... yes
checking for netinet/in.h... yes
checking for netinet/tcp.h... yes
checking for netdb.h... yes
checking for sys/poll.h... yes
checking for sys/limits.h... no
checking for fcntl.h... yes
checking for iconv.h... yes
checking for timezone global... yes
configure: LFS support unnecessary, off_t is not 32-bit
checking for strtoll... yes
checking for strcasecmp... yes
checking for signal... yes
checking for setvbuf... yes
checking for setsockopt... yes
checking for stpcpy... yes
checking for poll... yes
checking for fcntl... yes
checking for getsockopt... yes
checking whether stpcpy is declared... yes
checking for library containing socket... none needed
checking for library containing getaddrinfo... none needed
checking for gai_strerror... yes
checking for getnameinfo... yes
checking for inet_ntop... yes
configure: IPv6 support is enabled
checking for working AI_ADDRCONFIG... no
checking for socklen_t... yes
checking for struct tm.tm_gmtoff... yes
checking for struct tm.__tm_gmtoff... no
configure: zlib not enabled
checking whether to enable ACL support in neon... no
checking for pkg-config...
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/pkg-config
checking for openssl pkg-config data... yes
configure: using SSL library configuration from pkg-config
checking openssl/ssl.h usability... yes
checking openssl/ssl.h presence... yes
checking for openssl/ssl.h... yes
checking openssl/opensslv.h usability... yes
checking openssl/opensslv.h presence... yes
checking for openssl/opensslv.h... yes
checking OpenSSL version is >= 0.9.7... yes
configure: OpenSSL >= 0.9.7; EGD support not needed in neon
configure: SSL support enabled, using OpenSSL (0.9.7 or later)
checking for CRYPTO_set_idptr_callback... no
configure: Thread-safe SSL not supported
configure: SOCKSv5 support is not enabled
configure: WebDAV support is not enabled
configure: Internationalization support not enabled
configure: debugging is enabled
checking for openssl... /usr/bin/openssl
checking for certutil... notfound
checking for pk12util... notfound
checking for pkg-config... (cached)
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/pkg-config
configure: creating ./config.status
config.status: creating neon-config
config.status: creating Makefile
config.status: creating src/Makefile
config.status: creating test/Makefile
config.status: creating neon.pc
config.status: creating test/makekeys
config.status: creating config.h
configure: Configured to build neon 0.28.3:

  Install prefix:  /usr
  Compiler:       
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
  XML Parser:      none needed
  SSL library:     SSL support enabled, using OpenSSL (0.9.7 or later)
  zlib support:    zlib not enabled
  Build libraries: Shared=yes, Static=yes

>>> neon 0.28.3 Building
PATH="/root/buildroot/buildroot_e_v11.08/output/host/bin:/root/buildroot/buildroot_e_v11.08/output/host/usr/bin:/root/buildroot/buildroot_e_v11.08/output/host/usr/sbin/:/usr/local/arm/4.3.2/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin"
PERLLIB="/root/buildroot/buildroot_e_v11.08/output/host/usr/lib/perl" 
/usr/bin/make -j8  -C
/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/
make[1]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3'
make[2]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/src'
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_request.c -o ne_request.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_session.c -o ne_session.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_basic.c -o ne_basic.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_string.c -o ne_string.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_uri.c -o ne_uri.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_dates.c -o ne_dates.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_alloc.c -o ne_alloc.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_md5.c -o ne_md5.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_utils.c -o ne_utils.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_socket.c -o ne_socket.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_auth.c -o ne_auth.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_redirect.c -o ne_redirect.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_compress.c -o ne_compress.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_i18n.c -o ne_i18n.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_pkcs11.c -o ne_pkcs11.lo
/bin/bash ../libtool --quiet --mode=compile
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-DHAVE_CONFIG_H    -I.. -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -c ne_openssl.c -o ne_openssl.lo
/bin/bash ../libtool --quiet --mode=link
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-no-undefined  -rpath /usr/lib -version-info 28:3:1 -export-symbols-regex
'^ne_[^_]' -o libneon.la ne_request.lo ne_session.lo ne_basic.lo  ne_string.lo
ne_uri.lo ne_dates.lo ne_alloc.lo ne_md5.lo ne_utils.lo ne_socket.lo ne_auth.lo
ne_redirect.lo ne_compress.lo ne_i18n.lo ne_pkcs11.lo  ne_openssl.lo
-L/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr//lib
-lssl -lcrypto -ldl   
make[2]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/src'
make[1]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3'
>>> neon 0.28.3 Installing to staging directory
PATH="/root/buildroot/buildroot_e_v11.08/output/host/bin:/root/buildroot/buildroot_e_v11.08/output/host/usr/bin:/root/buildroot/buildroot_e_v11.08/output/host/usr/sbin/:/usr/local/arm/4.3.2/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin"
PERLLIB="/root/buildroot/buildroot_e_v11.08/output/host/usr/lib/perl" 
/usr/bin/make -j8
DESTDIR=/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
install -C /root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/
make[1]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3'
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/bin
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/man/man3
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/doc/neon-0.28.3/html
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/man/man1
NLS not enabled.
make[2]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/src'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/src'
Installing ne_request.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
for d in ./doc/html/*.html; do \
        /usr/bin/install -c -m 644 $d
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/doc/neon-0.28.3/html;
\
    done
Installing neon-config into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/bin
for m in ./doc/man/*.3; do \
     /usr/bin/install -c -m 644 $m
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/man/man3;
done
Installing ne_session.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_utils.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
Installing ne_uri.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_socket.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_basic.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
/bin/bash ./libtool --mode=install /usr/bin/install -c src/libneon.la \
       
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libneon.la
Installing ne_207.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_props.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig
Installing ne_xml.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_dates.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_string.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
/usr/bin/install -c -m 644 neon.pc
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/neon.pc
Installing ne_defs.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_locks.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_alloc.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_md5.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_i18n.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_redirect.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_auth.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_compress.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_acl.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_ssl.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_xmlreq.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
Installing ne_pkcs11.h into
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
/usr/bin/install -c src/.libs/libneon.so.27.1.3
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libneon.so.27.1.3
(cd
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
&& { ln -s -f libneon.so.27.1.3 libneon.so.27 || { rm -f libneon.so.27 && ln -s
libneon.so.27.1.3 libneon.so.27; }; })
(cd
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
&& { ln -s -f libneon.so.27.1.3 libneon.so || { rm -f libneon.so && ln -s
libneon.so.27.1.3 libneon.so; }; })
/usr/bin/install -c src/.libs/libneon.lai
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libneon.la
/usr/bin/install -c src/.libs/libneon.a
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libneon.a
chmod 644
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libneon.a
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libneon.a
libtool: install: warning: remember to run `libtool --finish /usr/lib'
for m in ./doc/man/*.1; do \
     /usr/bin/install -c -m 644 $m
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/man/man1;
done
make[1]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3'
for i in $(find
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib*
-name "*.la"); do cp -f $i $i~; /bin/sed -i -e "s:\(['=
]\)/usr:\\1/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr:g"
$i; done
>>> neon 0.28.3 Installing to target
PATH="/root/buildroot/buildroot_e_v11.08/output/host/bin:/root/buildroot/buildroot_e_v11.08/output/host/usr/bin:/root/buildroot/buildroot_e_v11.08/output/host/usr/sbin/:/usr/local/arm/4.3.2/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin"
PERLLIB="/root/buildroot/buildroot_e_v11.08/output/host/usr/lib/perl" 
/usr/bin/make -j8 DESTDIR=/root/buildroot/buildroot_e_v11.08/output/target 
install -C /root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/
make[1]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3'
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
/usr/bin/install -c -d /root/buildroot/buildroot_e_v11.08/output/target/usr/bin
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/target/usr/share/man/man3
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/target/usr/share/doc/neon-0.28.3/html
make[2]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/src'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/src'
Installing ne_request.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/target/usr/share/man/man1
Installing neon-config into
/root/buildroot/buildroot_e_v11.08/output/target/usr/bin
for d in ./doc/html/*.html; do \
        /usr/bin/install -c -m 644 $d
/root/buildroot/buildroot_e_v11.08/output/target/usr/share/doc/neon-0.28.3/html;
\
    done
NLS not enabled.
for m in ./doc/man/*.3; do \
     /usr/bin/install -c -m 644 $m
/root/buildroot/buildroot_e_v11.08/output/target/usr/share/man/man3; done
/usr/bin/install -c -d /root/buildroot/buildroot_e_v11.08/output/target/usr/lib
Installing ne_session.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_utils.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
/bin/bash ./libtool --mode=install /usr/bin/install -c src/libneon.la \
        /root/buildroot/buildroot_e_v11.08/output/target/usr/lib/libneon.la
Installing ne_uri.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_socket.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
/usr/bin/install -c -d
/root/buildroot/buildroot_e_v11.08/output/target/usr/lib/pkgconfig
Installing ne_basic.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_207.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
/usr/bin/install -c -m 644 neon.pc
/root/buildroot/buildroot_e_v11.08/output/target/usr/lib/pkgconfig/neon.pc
Installing ne_props.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_xml.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_dates.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_string.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_defs.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_locks.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_alloc.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_md5.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_i18n.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_redirect.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_auth.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_compress.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_acl.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_ssl.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_xmlreq.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
Installing ne_pkcs11.h into
/root/buildroot/buildroot_e_v11.08/output/target/usr/include/neon
/usr/bin/install -c src/.libs/libneon.so.27.1.3
/root/buildroot/buildroot_e_v11.08/output/target/usr/lib/libneon.so.27.1.3
(cd /root/buildroot/buildroot_e_v11.08/output/target/usr/lib && { ln -s -f
libneon.so.27.1.3 libneon.so.27 || { rm -f libneon.so.27 && ln -s
libneon.so.27.1.3 libneon.so.27; }; })
(cd /root/buildroot/buildroot_e_v11.08/output/target/usr/lib && { ln -s -f
libneon.so.27.1.3 libneon.so || { rm -f libneon.so && ln -s libneon.so.27.1.3
libneon.so; }; })
/usr/bin/install -c src/.libs/libneon.lai
/root/buildroot/buildroot_e_v11.08/output/target/usr/lib/libneon.la
/usr/bin/install -c src/.libs/libneon.a
/root/buildroot/buildroot_e_v11.08/output/target/usr/lib/libneon.a
chmod 644 /root/buildroot/buildroot_e_v11.08/output/target/usr/lib/libneon.a
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib
/root/buildroot/buildroot_e_v11.08/output/target/usr/lib/libneon.a
libtool: install: warning: remember to run `libtool --finish /usr/lib'
for m in ./doc/man/*.1; do \
     /usr/bin/install -c -m 644 $m
/root/buildroot/buildroot_e_v11.08/output/target/usr/share/man/man1; done
make[1]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3'
rm -f -f /root/buildroot/buildroot_e_v11.08/output/target/usr/bin/neon-config
>>> rpm 5.2.0 Building
PATH="/root/buildroot/buildroot_e_v11.08/output/host/bin:/root/buildroot/buildroot_e_v11.08/output/host/usr/bin:/root/buildroot/buildroot_e_v11.08/output/host/usr/sbin/:/usr/local/arm/4.3.2/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin"
PERLLIB="/root/buildroot/buildroot_e_v11.08/output/host/usr/lib/perl" 
/usr/bin/make -j1  -C
/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/
make[1]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0'
/usr/bin/make  all-recursive
make[2]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0'
Making all in db3
make[3]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/db3'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/db3'
Making all in pcre
make[3]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/pcre'
/usr/bin/make  all-am
make[4]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/pcre'
make[4]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/pcre'
make[3]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/pcre'
Making all in file
make[3]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file'
/usr/bin/make  all-recursive
make[4]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file'
Making all in src
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file/src'
/usr/bin/make  all-am
make[6]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file/src'
make[6]: Nothing to be done for `all-am'.
make[6]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file/src'
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file/src'
Making all in magic
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file/magic'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file/magic'
Making all in doc
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file/doc'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file/doc'
Making all in python
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file/python'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file/python'
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file'
make[5]: Nothing to be done for `all-am'.
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file'
make[4]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file'
make[3]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/file'
Making all in xz
make[3]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz'
/usr/bin/make  all-recursive
make[4]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz'
Making all in src
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src'
Making all in liblzma
make[6]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma'
Making all in api
make[7]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/api'
make[7]: Nothing to be done for `all'.
make[7]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/api'
Making all in common
make[7]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/common'
make[7]: Nothing to be done for `all'.
make[7]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/common'
Making all in check
make[7]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/check'
make[7]: Nothing to be done for `all'.
make[7]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/check'
Making all in lz
make[7]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/lz'
make[7]: Nothing to be done for `all'.
make[7]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/lz'
Making all in lzma
make[7]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/lzma'
make[7]: Nothing to be done for `all'.
make[7]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/lzma'
Making all in rangecoder
make[7]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/rangecoder'
make[7]: Nothing to be done for `all'.
make[7]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/rangecoder'
Making all in delta
make[7]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/delta'
make[7]: Nothing to be done for `all'.
make[7]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/delta'
Making all in simple
make[7]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/simple'
make[7]: Nothing to be done for `all'.
make[7]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma/simple'
make[7]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma'
make[7]: Nothing to be done for `all-am'.
make[7]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma'
make[6]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/liblzma'
Making all in xz
make[6]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/xz'
make[6]: Nothing to be done for `all'.
make[6]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/xz'
Making all in xzdec
make[6]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/xzdec'
make[6]: Nothing to be done for `all'.
make[6]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/xzdec'
Making all in scripts
make[6]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/scripts'
make[6]: Nothing to be done for `all'.
make[6]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src/scripts'
make[6]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src'
make[6]: Nothing to be done for `all-am'.
make[6]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src'
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/src'
Making all in po
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/po'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/po'
Making all in tests
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/tests'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz/tests'
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz'
make[5]: Nothing to be done for `all-am'.
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz'
make[4]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz'
make[3]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/xz'
Making all in misc
make[3]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/misc'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/misc'
Making all in rpmio
make[3]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmio'
/usr/bin/make  all-recursive
make[4]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmio'
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmio'
make[5]: Nothing to be done for `all-am'.
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmio'
make[4]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmio'
make[3]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmio'
Making all in rpmdb
make[3]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmdb'
/usr/bin/make  all-recursive
make[4]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmdb'
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmdb'
make[5]: Nothing to be done for `all-am'.
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmdb'
make[4]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmdb'
make[3]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmdb'
Making all in lib
make[3]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/lib'
/usr/bin/make  all-recursive
make[4]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/lib'
make[5]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/lib'
make[5]: Nothing to be done for `all-am'.
make[5]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/lib'
make[4]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/lib'
make[3]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/lib'
Making all in build
make[3]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/build'
make[4]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/build'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/build'
make[3]: Leaving directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/build'
Making all in rpmconstant
make[3]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmconstant'
/usr/bin/make  all-am
make[4]: Entering directory
`/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmconstant'
/bin/bash ../libtool --tag=CC   --mode=link
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
 -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/beecrypt
-I/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
-DHAVE_MUTEX_THREAD_ONLY -D_GNU_SOURCE -D_REENTRANT   
-L/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
-L/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
    -o rpmconstant constant.o librpmconstant.la -lbeecrypt -lbz2 -lz -lpopt
-lpthread  -lneon  
libtool: link:
/root/buildroot/buildroot_e_v11.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/beecrypt
-I/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/neon
-DHAVE_MUTEX_THREAD_ONLY -D_GNU_SOURCE -D_REENTRANT -o rpmconstant constant.o 
-L/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
./.libs/librpmconstant.so
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libbeecrypt.so
-lbz2 -lz
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libpopt.so
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libiconv.so
-lpthread
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libneon.so
-L/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr//lib
-lssl -lcrypto -ldl -Wl,-rpath
-Wl,/root/buildroot/buildroot_e_v11.08/output/build/rpm-5.2.0/rpmconstant/.libs
-Wl,-rpath
-Wl,/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
-Wl,-rpath
-Wl,/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.so:
warning: gethostbyname is obsolescent, use getnameinfo() instead.
/root/buildroot/buildroot_e_v11.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libneon.so:
undefined reference to `SSL_SESSION_cmp'
collect2: ld returned 1 exit status

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
