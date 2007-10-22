From: =?ISO-8859-1?Q?Kim_Str=F8ger?= <ks@sfktech.com>
Date: Mon, 22 Oct 2007 11:53:11 +0200
Subject: [Buildroot] Can not build toolchain for arm.
In-Reply-To: <20071021120218.1C89BA4A39@busybox.net>
References: <20071021120218.1C89BA4A39@busybox.net>
Message-ID: <471C7307.1020204@sfktech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am trying to build just the toolchain for the arm processor,  using
buildroot:  At revision 20315
but I am stock with this error ??



/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:2124:
error: '__mf_biglock' undeclared (first use in this function)
make[5]: *** [pth/mf-runtime.lo] Error 1
make[5]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'


where do I go from here ???

Thanks,

Kim S


I have included the output from the build below
Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf
/home/cz2/Crossdev/buildroot/project_build_arm/uclibc/buildroot-config
mkdir -p /home/cz2/Crossdev/buildroot/project_build_arm/uclibc
cp -dpRf package/config/buildroot-config
/home/cz2/Crossdev/buildroot/project_build_arm/uclibc/buildroot-config
/usr/bin/make -j1 -C
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final all
make[1]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final'
make[2]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final'
make[3]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/libiberty'
make[4]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/libiberty/testsuite'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/libiberty/testsuite'
make[3]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/libiberty'
make[3]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/fixincludes'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/fixincludes'
make[3]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/intl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/intl'
make[3]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/build-i386-pc-linux-gnu/libiberty'
make[4]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/build-i386-pc-linux-gnu/libiberty/testsuite'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/build-i386-pc-linux-gnu/libiberty/testsuite'
make[3]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/build-i386-pc-linux-gnu/libiberty'
make[3]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/build-i386-pc-linux-gnu/fixincludes'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/build-i386-pc-linux-gnu/fixincludes'
make[3]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/libcpp'
test -f config.h || (rm -f stamp-h1 && /usr/bin/make stamp-h1)
make[3]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/libcpp'
make[3]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/libdecnumber'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/libdecnumber'
make[3]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/gcc'
make[3]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/gcc'
Checking multilib configuration for libmudflap...
make[3]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'
/usr/bin/make "AR_FLAGS=rc" "CC_FOR_BUILD=/usr/bin/gcc " "CFLAGS=-g -Os"
"CXXFLAGS=-g -Os" "CFLAGS_FOR_BUILD=" "CFLAGS_FOR_TARGET=-g -Os"
"INSTALL=/usr/bin/install -c"
 "INSTALL_DATA=/usr/bin/install -c -m 644"
"INSTALL_PROGRAM=/usr/bin/install -c" "INSTALL_SCRIPT=/usr/bin/install
-c" "JC1FLAGS=" "LDFLAGS=" "LIBCFLAGS=-g -Os" "LIBCFL
AGS_FOR_TARGET=-g -Os" "MAKE=/usr/bin/make" "MAKEINFO=makeinfo
--split-size=5000000 --split-size=5000000 " "PICFLAG="
"PICFLAG_FOR_TARGET=" "SHELL=/bin/sh" "RUNTESTFLA
GS=" "exec_prefix=/usr" "infodir=/usr/info" "libdir=/usr/lib"
"prefix=/usr" "includedir=/usr/include"
"AR=/home/cz2/Crossdev/buildroot/build_arm/staging_dir/usr/arm-li
nux-uclibc/bin/ar"
"AS=/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/as"
"CC=/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/
./gcc/xgcc
-B/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/
-B/usr/arm-linux-uclibc/bin/ -B/usr/arm-linux-uclibc/lib/ -isystem
/usr/arm-linux-
uclibc/include -isystem /usr/arm-linux-uclibc/sys-include"
"CXX=arm-linux-uclibc-c++ -B/usr/arm-linux-uclibc/bin/
-B/usr/arm-linux-uclibc/lib/ -isystem /usr/arm-linux-
uclibc/include -isystem /usr/arm-linux-uclibc/sys-include"
"LD=/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/collect-ld"
"LIBCFLAGS=-g -Os" "N
M=/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/nm"
"PICFLAG="
"RANLIB=/home/cz2/Crossdev/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc
/bin/ranlib" "DESTDIR=" all-recursive
make[4]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'
Making all in testsuite
make[5]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap/testsuite'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap/testsuite'
make[5]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'
/bin/sh ./libtool --mode=compile
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/xgcc
-B/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2
.1-final/./gcc/ -B/usr/arm-linux-uclibc/bin/
-B/usr/arm-linux-uclibc/lib/ -isystem /usr/arm-linux-uclibc/include
-isystem /usr/arm-linux-uclibc/sys-include -DHAVE_CONF
IG_H -I.
-I/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap
-I.    -Wall -ffunction-sections -fdata-sections -g -Os -DLIBMUDFLAPTH
-c /home/cz2/Cr
ossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c
-o pth/mf-runtime.lo
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/xgcc
-B/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/./gcc/
-B/usr/arm-linux-
uclibc/bin/ -B/usr/arm-linux-uclibc/lib/ -isystem
/usr/arm-linux-uclibc/include -isystem /usr/arm-linux-uclibc/sys-include
-DHAVE_CONFIG_H -I. -I/home/cz2/Crossdev/bui
ldroot/toolchain_build_arm/gcc-4.2.1/libmudflap -I. -Wall
-ffunction-sections -fdata-sections -g -Os -DLIBMUDFLAPTH -c
/home/cz2/Crossdev/buildroot/toolchain_build_arm
/gcc-4.2.1/libmudflap/mf-runtime.c  -fPIC -DPIC -o pth/.libs/mf-runtime.o
In file included from
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:71:
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-impl.h:43:2:
error: #error "Cannot build libmudflapth without pthread.h."
In file included from
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:71:
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-impl.h:229:
error: expected '=', ',', ';', 'asm' or '__attribute__' before
'__mf_biglock'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:188:
error: expected '=', ',', ';', 'asm' or '__attribute__' before
'__mf_biglock'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:245:
error: expected specifier-qualifier-list before 'pthread_t'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mf_set_options':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:494:
warning: implicit declaration of function 'pthread_mutex_trylock'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:494:
error: '__mf_biglock' undeclared (first use in this function)
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:494:
error: (Each undeclared identifier is reported only once
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:494:
error: for each function it appears in.)
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:494:
warning: implicit declaration of function 'pthread_mutex_lock'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:501:
warning: implicit declaration of function 'pthread_mutex_unlock'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mfu_set_options':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:599:
warning: implicit declaration of function 'pthread_self'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mf_check':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:804:
error: '__mf_biglock' undeclared (first use in this function)
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mf_insert_new_object':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1053:
error: '__mf_object_t' has no member named 'alloc_thread'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mf_register':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1099:
error: '__mf_biglock' undeclared (first use in this function)
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mf_unregister':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1201:
error: '__mf_biglock' undeclared (first use in this function)
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mfu_unregister':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1286:
error: '__mf_object_t' has no member named 'deallocated_p'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1287:
error: '__mf_object_t' has no member named 'dealloc_pc'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1290:
error: '__mf_object_t' has no member named 'dealloc_time'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1293:
error: '__mf_object_t' has no member named 'dealloc_thread'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1297:
error: '__mf_object_t' has no member named 'dealloc_backtrace_size'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1298:
error: '__mf_object_t' has no member named 'dealloc_backtrace'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1340:
error: '__mf_object_t' has no member named 'dealloc_backtrace'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1340:
error: '__mf_object_t' has no member named 'dealloc_backtrace'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mf_describe_object':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1673:
error: '__mf_object_t' has no member named 'deallocated_p'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1688:
error: '__mf_object_t' has no member named 'deallocated_p'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1704:
error: '__mf_object_t' has no member named 'alloc_thread'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1717:
error: '__mf_object_t' has no member named 'deallocated_p'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1724:
error: '__mf_object_t' has no member named 'dealloc_time'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1724:
error: '__mf_object_t' has no member named 'dealloc_time'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1725:
error: '__mf_object_t' has no member named 'dealloc_pc'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1727:
error: '__mf_object_t' has no member named 'dealloc_thread'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1735:
error: '__mf_object_t' has no member named 'dealloc_backtrace_size'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1736:
error: '__mf_object_t' has no member named 'dealloc_backtrace'
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mf_report':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:1778:
error: '__mf_biglock' undeclared (first use in this function)
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mf_watch':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:2113:
error: '__mf_biglock' undeclared (first use in this function)
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:
In function '__mf_unwatch':
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:2124:
error: '__mf_biglock' undeclared (first use in this function)
make[5]: *** [pth/mf-runtime.lo] Error 1
make[5]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'
make[2]: *** [all-target-libmudflap] Error 2
make[2]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final'
make: ***
[/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/.compiled]
Error 2
