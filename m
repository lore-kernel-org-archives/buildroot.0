From: Herschel Karunaratne <hk@synexint.com>
Date: Mon, 3 Oct 2016 17:51:06 +0530
Subject: [Buildroot] Installing package libclthreads
Message-ID: <00b301d21d70$9e934540$dbb9cfc0$@synexint.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I am trying to install "jconvolver" and have to install  "libclthreads"
needed by jconvolver. "My "libclthreads.mk" is as follows,

 

#####################################################################

#

# libclthreads

#

####################################################################

 

LIBCLTHREADS_VERSION = 2.4.0

LIBCLTHREADS_SOURCE = clthreads-$(LIBCLTHREADS_VERSION).tar.bz2

LIBCLTHREADS_SITE = http://kokkinizta.linuxaudio.org/linuxaudio/downloads

LIBCLTHREADS_LICENSE = LGPLv2.1+

LIBCLTHREADS_LICENSE_FILES = COPYING

LIBCLTHREADS_INSTALL_STAGING = YES

LIBCLTHREADS_INSTALL_TARGET = YES

 

$(eval $(autotools-package))

 

 

 

When I build it seems to be OK but nothing in the installed folders. This is
message I get when I build,

 

 

>>> libclthreads 2.4.0 Configuring

(cd
/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/build/libclthre
ads-2.4.0/ && rm -rf config.cache &&
PATH="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/bin:
/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/sbin:/root
/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/bin:/root/w
ork/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/sbin:/usr/loc
al/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/arm-2014.05/bin:/r
oot/bin:/opt/arm-2014.05/bin"
AR="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/bi
n/arm-linux-gnueabihf-ar"
AS="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/bi
n/arm-linux-gnueabihf-as"
LD="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/bi
n/arm-linux-gnueabihf-ld"
NM="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/bi
n/arm-linux-gnueabihf-nm"
CC="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/bi
n/arm-linux-gnueabihf-gcc"
GCC="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/b
in/arm-linux-gnueabihf-gcc"
CPP="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/b
in/arm-linux-gnueabihf-cpp"
CXX="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/b
in/arm-linux-gnueabihf-g++"
FC="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/bi
n/arm-linux-gnueabihf-gfortran"
RANLIB="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/us
r/bin/arm-linux-gnueabihf-ranlib"
READELF="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/u
sr/bin/arm-linux-gnueabihf-readelf"
STRIP="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr
/bin/arm-linux-gnueabihf-strip"
OBJCOPY="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/u
sr/bin/arm-linux-gnueabihf-objcopy"
OBJDUMP="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/u
sr/bin/arm-linux-gnueabihf-objdump" AR_FOR_BUILD="/usr/bin/ar"
AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc"
GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++"
LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/
output/host/usr/include" CFLAGS_FOR_BUILD="-O2
-I/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/incl
ude" CXXFLAGS_FOR_BUILD="-O2
-I/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/incl
ude"
LDFLAGS_FOR_BUILD="-L/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/o
utput/host/lib
-L/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/lib
-Wl,-rpath,/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host
/usr/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/out
put/host/usr/bin/arm-linux-gnueabihf-as"
DEFAULT_LINKER="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output
/host/usr/bin/arm-linux-gnueabihf-ld" CPPFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Os " LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/hos
t/usr/bin/pkg-config"
STAGING_DIR="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/ho
st/usr/arm-buildroot-linux-gnueabihf/sysroot" INTLTOOL_PERL=/usr/bin/perl
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no
CONFIG_SITE=/dev/null ./configure --target=arm-buildroot-linux-gnueabihf
--host=arm-buildroot-linux-gnueabihf --build=x86_64-unknown-linux-gnu
--prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --localstatedir=/var
--program-prefix="" --disable-gtk-doc --disable-gtk-doc-html --disable-doc
--disable-docs --disable-documentation --with-xmlto=no --with-fop=no
--disable-dependency-tracking --enable-ipv6  --disable-static
--enable-shared   )

>>> libclthreads 2.4.0 Building

PATH="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/bin:
/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/sbin:/root
/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/bin:/root/w
ork/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/sbin:/usr/loc
al/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/arm-2014.05/bin:/r
oot/bin:/opt/arm-2014.05/bin"  /usr/bin/make -j5  -C
/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/build/libclthre
ads-2.4.0/

make[1]: Entering directory
`/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/build/libclthr
eads-2.4.0'

g++  -Wall -I. -fpic -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -O2   -c -o
p_thread.o p_thread.cc

g++  -Wall -I. -fpic -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -O2   -c -o
a_thread.o a_thread.cc

g++  -Wall -I. -fpic -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -O2   -c -o
itc_mesg.o itc_mesg.cc

g++  -Wall -I. -fpic -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -O2   -c -o
itc_ip1q.o itc_ip1q.cc

g++  -Wall -I. -fpic -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -O2   -c -o
itc_ctrl.o itc_ctrl.cc

g++  -Wall -I. -fpic -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -O2   -c -o
textmsg.o textmsg.cc

g++ -shared  -Wl,-soname,libclthreads.so.2 -o libclthreads.so.2.4.0
p_thread.o a_thread.o itc_mesg.o itc_ip1q.o itc_ctrl.o textmsg.o -lpthread

make[1]: Leaving directory
`/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/build/libclthr
eads-2.4.0'

>>> libclthreads 2.4.0 Installing to target

PATH="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/bin:
/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/sbin:/root
/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/bin:/root/w
ork/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/sbin:/usr/loc
al/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/arm-2014.05/bin:/r
oot/bin:/opt/arm-2014.05/bin"  /usr/bin/make -j5
DESTDIR=/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/target
install -C
/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/build/libclthre
ads-2.4.0/

make[1]: Entering directory
`/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/build/libclthr
eads-2.4.0'

/usr/bin/install -d /usr/local/lib64

/usr/bin/install -m 644 clthreads.h /usr/local/include

/usr/bin/install -m 755 libclthreads.so.2.4.0 /usr/local/lib64

/sbin/ldconfig -n /usr/local/lib64

ln -sf libclthreads.so.2.4.0 /usr/local/lib64/libclthreads.so

make[1]: Leaving directory
`/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/build/libclthr
eads-2.4.0'

 

 

 

What could have gone wrong?

 

Thanks in advance.

 

 

Regards

Herschel

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161003/1bbd3eec/attachment.html>
