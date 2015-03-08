From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 08 Mar 2015 11:53:48 +0100
Subject: [Buildroot] gcc-4.9.2 with c++ is broken without wchar
Message-ID: <XnsA457790498159berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

before sending a patch I would like to post my findings for discussion.
A build using this defconfig fails in host-gcc-final-4.9.2:

BR2_BINUTILS_VERSION_2_25=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

make[2]: Entering directory `/home/fli4l/br3/output/build/host-gcc-final-
4.9.2/build/i586-buildroot-linux-uclibc/libcilkrts'
[...]
In file included from ../../../libcilkrts/runtime/c_reducers.c:55:0:
../../../libcilkrts/include/cilk/reducer_min_max.h: In function 
?cilk_c_reducer_max_identity_wchar_t?:
../../../libcilkrts/include/cilk/reducer_min_max.h:3157:61: error: 
?WCHAR_MIN? undeclared (first use in this function)
 CILK_C_REDUCER_MAX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
[...]

Apparently c++ support depends on wchar now?

A build with this defconfig succeeds:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_BINUTILS_VERSION_2_25=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

Regards, Bernd
