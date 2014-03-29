From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 29 Mar 2014 17:39:20 +0100
Subject: [Buildroot] rsync fails to build
In-Reply-To: <20140329143057.6e6aa65a@skate>
References: <6699457346BD4E4E8F8D768D2249294C@JohanW7>
 <20140329143057.6e6aa65a@skate>
Message-ID: <9E4B04B54DB642238FDE42DB9E40DE73@JohanW7>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net


Dear Thomas ;

It contains some suspected lines :
(I am using gcc 4.6.x)

checking attr/xattr.h usability... yes
checking attr/xattr.h presence... no
configure.sh: WARNING: attr/xattr.h: accepted by the compiler, rejected by the preprocessor!
configure.sh: WARNING: attr/xattr.h: proceeding with the compiler's result
checking for attr/xattr.h... Yes

My older (working)build does not have these warnings, but the attr package is selected due to the udev selection and udev extras.

(Did you build with the packages attr and acl disabled ?)

I will do a build using gcc 4.8.x to see if this warning still exists.


[7m>>> rsync 3.1.0 Configuring[27m
(cd /home/brcpy/output/build/rsync-3.1.0/ && rm -rf config.cache &&
PATH="/home/brcpy/output/host/bin:/home/brcpy/output/host/usr/bin:/home/brcpy/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/
usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
AR="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ar"
AS="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as"
LD="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld"
NM="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-nm" CC="/home/brcpy/output/host/usr/bin/ccache
/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc" GCC="/home/brcpy/output/host/usr/bin/ccache
/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc"
CPP="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-cpp" CXX="/home/brcpy/output/host/usr/bin/ccache
/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++"
FC="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gfortran"
RANLIB="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib"
READELF="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-readelf"
STRIP="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-strip"
OBJCOPY="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objcopy"
OBJDUMP="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar"
AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/home/brcpy/output/host/usr/bin/ccache /usr/bin/gcc"
GCC_FOR_BUILD="/home/brcpy/output/host/usr/bin/ccache /usr/bin/gcc" CXX_FOR_BUILD="/home/brcpy/output/host/usr/bin/ccache
/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/home/brcpy/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2 -I/home/brcpy/output/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/home/brcpy/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/brcpy/output/host/lib -L/home/brcpy/output/host/usr/lib -Wl,-rpath,/home/brcpy/output/host/usr/lib"
FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as"
DEFAULT_LINKER="/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld" CPPFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os " LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/brcpy/output/host/usr/bin/pkg-config"
STAGING_DIR="/home/brcpy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot" ac_cv_lbl_unaligned_fail=yes
ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes
ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec=""
ac_cv_c_bigendian=no  ./configure --target=arm-buildroot-linux-uclibcgnueabi --host=arm-buildroot-linux-uclibcgnueabi
--build=i686-pc-linux-gnu --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --program-prefix="" --disable-gtk-doc --disable-doc
--disable-docs --disable-documentation --with-xmlto=no --with-fop=no   --enable-ipv6 --enable-static --enable-shared
--disable-debug --with-included-zlib=no --with-included-popt=no )
configure.sh: WARNING: unrecognized options: --disable-gtk-doc, --disable-doc, --disable-docs, --disable-documentation,
--with-xmlto, --with-fop, --enable-static, --enable-shared
configure.sh: Configuring rsync 3.1.0
checking build system type... i686-pc-linux-gnu
checking host system type... arm-buildroot-linux-uclibcgnueabi
checking whether to include debugging symbols... no
checking for arm-buildroot-linux-uclibcgnueabi-gcc... /home/brcpy/output/host/usr/bin/ccache
/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
accepts -g... (cached) no
checking for /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc option to
accept ISO C89... none needed
checking how to run the C preprocessor... /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-cpp
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for a BSD-compatible install... /usr/bin/install -c
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc option to
accept ISO C99... -std=gnu99
checking for /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99
option to accept ISO Standard C... (cached) -std=gnu99
checking for remsh... 0
checking for yodl2man... 0
checking for sh... /bin/sh
checking for fakeroot... /home/buildroot12git/output/host/usr/bin/fakeroot
checking the group for user "nobody"... nogroup
checking for broken largefile support... cross
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking ipv6 stack type... linux-glibc
checking for library containing getaddrinfo... none required
checking whether to call shutdown on all sockets... no
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
checking whether byte ordering is bigendian... (cached) no
checking for dirent.h that defines DIR... yes
checking for library containing opendir... none required
checking whether time.h and sys/time.h may both be included... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking sys/fcntl.h usability... yes
checking sys/fcntl.h presence... yes
checking for sys/fcntl.h... yes
checking sys/select.h usability... yes
checking sys/select.h presence... yes
checking for sys/select.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking sys/unistd.h usability... yes
checking sys/unistd.h presence... yes
checking for sys/unistd.h... yes
checking for unistd.h... (cached) yes
checking utime.h usability... yes
checking utime.h presence... yes
checking for utime.h... yes
checking grp.h usability... yes
checking grp.h presence... yes
checking for grp.h... yes
checking compat.h usability... no
checking compat.h presence... no
checking for compat.h... no
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking ctype.h usability... yes
checking ctype.h presence... yes
checking for ctype.h... yes
checking for sys/wait.h... (cached) yes
checking sys/ioctl.h usability... yes
checking sys/ioctl.h presence... yes
checking for sys/ioctl.h... yes
checking sys/filio.h usability... no
checking sys/filio.h presence... no
checking for sys/filio.h... no
checking for string.h... (cached) yes
checking for stdlib.h... (cached) yes
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking sys/mode.h usability... no
checking sys/mode.h presence... no
checking for sys/mode.h... no
checking sys/un.h usability... yes
checking sys/un.h presence... yes
checking for sys/un.h... yes
checking sys/attr.h usability... no
checking sys/attr.h presence... no
checking for sys/attr.h... no
checking mcheck.h usability... no
checking mcheck.h presence... no
checking for mcheck.h... no
checking arpa/inet.h usability... yes
checking arpa/inet.h presence... yes
checking for arpa/inet.h... yes
checking arpa/nameser.h usability... yes
checking arpa/nameser.h presence... yes
checking for arpa/nameser.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking netdb.h usability... yes
checking netdb.h presence... yes
checking for netdb.h... yes
checking malloc.h usability... yes
checking malloc.h presence... yes
checking for malloc.h... yes
checking float.h usability... yes
checking float.h presence... yes
checking for float.h... yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking iconv.h usability... yes
checking iconv.h presence... yes
checking for iconv.h... yes
checking libcharset.h usability... no
checking libcharset.h presence... no
checking for libcharset.h... no
checking langinfo.h usability... yes
checking langinfo.h presence... yes
checking for langinfo.h... yes
checking sys/acl.h usability... yes
checking sys/acl.h presence... no
configure.sh: WARNING: sys/acl.h: accepted by the compiler, rejected by the preprocessor!
configure.sh: WARNING: sys/acl.h: proceeding with the compiler's result
checking for sys/acl.h... yes
checking acl/libacl.h usability... yes
checking acl/libacl.h presence... no
configure.sh: WARNING: acl/libacl.h: accepted by the compiler, rejected by the preprocessor!
configure.sh: WARNING: acl/libacl.h: proceeding with the compiler's result
checking for acl/libacl.h... yes
checking attr/xattr.h usability... yes
checking attr/xattr.h presence... no
configure.sh: WARNING: attr/xattr.h: accepted by the compiler, rejected by the preprocessor!
configure.sh: WARNING: attr/xattr.h: proceeding with the compiler's result
checking for attr/xattr.h... yes
checking sys/xattr.h usability... yes
checking sys/xattr.h presence... yes
checking for sys/xattr.h... yes
checking sys/extattr.h usability... no
checking sys/extattr.h presence... no
checking for sys/extattr.h... no
checking popt.h usability... yes
checking popt.h presence... yes
checking for popt.h... yes
checking popt/popt.h usability... no
checking popt/popt.h presence... no
checking for popt/popt.h... no
checking linux/falloc.h usability... yes
checking linux/falloc.h presence... yes
checking for linux/falloc.h... yes
checking netinet/in_systm.h usability... yes
checking netinet/in_systm.h presence... yes
checking for netinet/in_systm.h... yes
checking netinet/ip.h usability... yes
checking netinet/ip.h presence... yes
checking for netinet/ip.h... yes
checking zlib.h usability... yes
checking zlib.h presence... yes
checking for zlib.h... yes
checking whether sys/types.h defines makedev... yes
checking if makedev takes 3 args... no
checking size of int... 4
checking size of long... 4
checking size of long long... 8
checking size of short... 2
checking size of int16_t... 2
checking size of uint16_t... 2
checking size of int32_t... 4
checking size of uint32_t... 4
checking size of int64_t... 8
checking size of off_t... 8
checking size of off64_t... 8
checking size of time_t... 4
checking for inline... inline
checking for long double with more range or precision than double... no
checking return type of signal handlers... void
checking for uid_t in sys/types.h... yes
checking for mode_t... yes
checking for off_t... yes
checking for size_t... yes
checking for pid_t... yes
checking for id_t... yes
checking type of array argument to getgroups... gid_t
checking for struct stat.st_rdev... yes
checking for struct stat.st_mtimensec... no
checking for struct stat.st_mtim.tv_nsec... yes
checking for socklen_t... yes
checking for errno in errno.h... yes
checking for connect... yes
checking for library containing inet_ntop... none required
checking for library containing iconv_open... none required
checking for library containing libiconv_open... no
checking for iconv declaration... 
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
checking for inet_ntop... yes
checking for inet_pton... yes
checking for struct addrinfo... yes
checking for struct sockaddr_storage... yes
checking whether defines needed by getaddrinfo exist... yes
checking for getaddrinfo... yes
checking for struct sockaddr.sa_len... no
checking for struct sockaddr_in.sin_len... no
checking for struct sockaddr_un.sun_len... no
checking for struct sockaddr_in6.sin6_scope_id... yes
checking for struct stat64... yes
checking for strcasecmp... yes
checking for aclsort... no
checking for aclsort in -lsec... no
checking for utime.h... (cached) yes
checking whether utime accepts a null argument... guessing yes
checking for size_t... (cached) yes
checking for working alloca.h... yes
checking for alloca... yes
checking for waitpid... yes
checking for wait4... yes
checking for getcwd... yes
checking for strdup... yes
checking for chown... yes
checking for chmod... yes
checking for lchmod... no
checking for mknod... yes
checking for mkfifo... yes
checking for fchmod... yes
checking for fstat... yes
checking for ftruncate... yes
checking for strchr... yes
checking for readlink... yes
checking for link... yes
checking for utime... yes
checking for utimes... yes
checking for lutimes... yes
checking for strftime... yes
checking for memmove... yes
checking for lchown... yes
checking for vsnprintf... yes
checking for snprintf... yes
checking for vasprintf... yes
checking for asprintf... yes
checking for setsid... yes
checking for strpbrk... yes
checking for strlcat... yes
checking for strlcpy... yes
checking for strtol... yes
checking for mallinfo... yes
checking for getgroups... yes
checking for setgroups... yes
checking for geteuid... yes
checking for getegid... yes
checking for setlocale... yes
checking for setmode... no
checking for open64... yes
checking for lseek64... yes
checking for mkstemp64... yes
checking for mtrace... no
checking for va_copy... no
checking for __va_copy... no
checking for seteuid... yes
checking for strerror... yes
checking for putenv... yes
checking for iconv_open... yes
checking for locale_charset... no
checking for nl_langinfo... yes
checking for getxattr... yes
checking for extattr_get_link... no
checking for sigaction... yes
checking for sigprocmask... yes
checking for setattrlist... no
checking for getgrouplist... yes
checking for initgroups... yes
checking for utimensat... yes
checking for posix_fallocate... yes
checking for attropen... no
checking for setvbuf... yes
checking for useable fallocate... no
checking for SYS_fallocate... yes
checking whether posix_fallocate is efficient... no
checking for getpgrp... yes
checking for tcgetpgrp... yes
checking whether getpgrp requires zero arguments... yes
checking whether chown() modifies symlinks... no
checking whether link() can hard-link symlinks... no
checking whether link() can hard-link special files... no
checking for working socketpair... cross
checking for getpass... yes
checking for poptGetContext in -lpopt... yes
checking whether to use included libpopt... no
checking for deflateParams in -lz... yes
checking whether to use included zlib... no
checking for unsigned char... yes
checking for broken readdir... cross
checking for utimbuf... yes
checking if gettimeofday takes tz argument... yes
checking for C99 vsnprintf... cross
checking for secure mkstemp... cross
checking if mknod creates FIFOs... cross
checking if mknod creates sockets... cross
checking whether -c -o works... yes
checking for stunnel... stunnel
checking for stunnel4... stunnel
checking for _acl... no
checking for __acl... no
checking for _facl... no
checking for __facl... no
checking whether to support ACLs... running tests:
checking for acl_get_file in -lacl... no
checking for ACL support... no
checking ACL test results... No ACL support found
checking whether to support extended attributes... Using Linux xattrs
configure.sh: creating ./config.status
config.status: creating Makefile
config.status: creating lib/dummy
config.status: creating zlib/dummy
config.status: creating popt/dummy
config.status: creating shconfig
config.status: creating config.h
configure.sh: WARNING: unrecognized options: --disable-gtk-doc, --disable-doc, --disable-docs, --disable-documentation,
--with-xmlto, --with-fop, --enable-static, --enable-shared

    rsync 3.1.0 configuration successful

[7m>>> rsync 3.1.0 Building[27m
PATH="/home/brcpy/output/host/bin:/home/brcpy/output/host/usr/bin:/home/brcpy/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/
usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"  /usr/bin/make -j5  -C /home/brcpy/output/build/rsync-3.1.0/
make[1]: Entering directory `/home/brcpy/output/build/rsync-3.1.0'
perl ./mkproto.pl ./*.c ./lib/compat.c
sed 's;\@bindir\@;/usr/bin;g' <./rsync-ssl.in >rsync-ssl
sed 's;\@stunnel4\@;stunnel;g' <./stunnel-rsync.in >stunnel-rsync
sed 's;\@bindir\@;/usr/bin;g' <./stunnel-rsyncd.conf.in >stunnel-rsyncd.conf
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c flist.c -o flist.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c rsync.c -o rsync.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c generator.c -o generator.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c receiver.c -o receiver.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c cleanup.c -o cleanup.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c sender.c -o sender.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c exclude.c -o exclude.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c util.c -o util.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c util2.c -o util2.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c main.c -o main.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c checksum.c -o checksum.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c match.c -o match.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c syscall.c -o syscall.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c log.c -o log.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c backup.c -o backup.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c delete.c -o delete.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c options.c -o options.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c io.c -o io.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c compat.c -o compat.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c hlink.c -o hlink.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c token.c -o token.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c uidlist.c -o uidlist.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c socket.c -o socket.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c hashtable.c -o hashtable.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c fileio.c -o fileio.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c batch.c -o batch.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c clientname.c -o clientname.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c chmod.c -o chmod.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c acls.c -o acls.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c xattrs.c -o xattrs.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c progress.c -o progress.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c pipe.c -o pipe.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c params.c -o params.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c loadparm.c -o loadparm.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c clientserver.c -o clientserver.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c access.c -o access.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c connection.c -o connection.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c authenticate.c -o authenticate.o
In file included from xattrs.c:25:0:
lib/sysxattrs.h:4:24: fatal error: attr/xattr.h: No such file or directory
compilation terminated.
make[1]: *** [xattrs.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/home/brcpy/output/build/rsync-3.1.0'
make: *** [/home/brcpy/output/build/rsync-3.1.0/.stamp_built] Error 2


-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: zaterdag 29 maart 2014 14:31
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] rsync fails to build

Dear Sagaert Johan,

On Sat, 29 Mar 2014 14:11:56 +0100, Sagaert Johan wrote:

> With the latest pull :
> 
> Rsync build seems to be broken
> 
> S=64 -c xattrs.c -o xattrs.o
> /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  
> -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c progress.c -o progress.o /home/brcpy/output/host/usr/bin/ccache
/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  
> -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c pipe.c -o pipe.o /home/brcpy/output/host/usr/bin/ccache
/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  
> -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c params.c -o params.o /home/brcpy/output/host/usr/bin/ccache
/home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  
> -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c loadparm.c -o loadparm.o In file included from xattrs.c:25:0:
> lib/sysxattrs.h:4:24: fatal error: attr/xattr.h: No such file or 
> directory compilation terminated.

It builds fine here.

Can you show the output of the configure step? I believe it might be detecting something from your host machine.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
