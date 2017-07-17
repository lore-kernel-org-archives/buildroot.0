From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jul 2017 23:26:20 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-JetjsIyKKx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #7 from Ivan <ivan.nazarenko@gmail.com> ---
Here are they: The error:
/home/ivan/buildroot-git/buildroot/buildroot/output/host/bin/arm-buildroot-linux-musleabihf-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/ivan/buildroot-git/buildroot/buildroot/output/host/arm-buildroot-linux-musleabihf/sysroot
-O3 -O3 -std=c++1z -fvisibility=hidden -fvisibility-inlines-hidden -Wall -W
-Wvla -Wdate-time -Wshift-overflow=2 -Wduplicated-cond -D_REENTRANT -fPIC
-DQT_NO_USING_NAMESPACE -DQT_NO_FOREACH -DQT_HAVE_POLL -DQT_HAVE_PPOLL
-DQT_BUILD_CORE_LIB -DQT_BUILDING_QT -DQT_NO_CAST_TO_ASCII
-DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER
-DQT_DEPRECATED_WARNINGS -DQT_DISABLE_DEPRECATED_BEFORE=0x050000
-D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -I. -Iglobal
-I../3rdparty/harfbuzz/src -I../3rdparty/md5 -I../3rdparty/md4
-I../3rdparty/sha3 -I../3rdparty/double-conversion/include
-I../3rdparty/double-conversion/include/double-conversion -I../3rdparty/forkfd
-I../../include -I../../include/QtCore -I../../include/QtCore/5.8.0
-I../../include/QtCore/5.8.0/QtCore -I.moc
-I/home/ivan/buildroot-git/buildroot/buildroot/output/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/glib-2.0
-I/home/ivan/buildroot-git/buildroot/buildroot/output/host/arm-buildroot-linux-musleabihf/sysroot/usr/lib/glib-2.0/include
-I/home/ivan/buildroot-git/buildroot/buildroot/output/host/arm-buildroot-linux-musleabihf/sysroot/usr/include
-I../../mkspecs/devices/linux-buildroot-g++ -o .obj/qreadwritelock.o
thread/qreadwritelock.cpp
In file included from
../../include/QtCore/5.8.0/QtCore/private/../../../../../src/corelib/tools/qsimd_p.h:293:0,
                 from ../../include/QtCore/5.8.0/QtCore/private/qsimd_p.h:1,
                 from global/qlogging.cpp:57:
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:
In function ?void __arm_ldc(unsigned int, unsigned int, const void*)?:
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:48:49:
error: invalid conversion from ?const void*? to ?const int*? [-fpermissive]
   return __builtin_arm_ldc (__coproc, __CRd, __p);
                                                 ^
<built-in>: note:   initializing argument 3 of ?void __builtin_arm_ldc(unsigned
int, unsigned int, const int*)?
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:
In function ?void __arm_ldcl(unsigned int, unsigned int, const void*)?:
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:55:50:
error: invalid conversion from ?const void*? to ?const int*? [-fpermissive]
   return __builtin_arm_ldcl (__coproc, __CRd, __p);
                                                  ^
<built-in>: note:   initializing argument 3 of ?void
__builtin_arm_ldcl(unsigned int, unsigned int, const int*)?
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:
In function ?void __arm_stc(unsigned int, unsigned int, void*)?:
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:62:49:
error: invalid conversion from ?void*? to ?int*? [-fpermissive]
   return __builtin_arm_stc (__coproc, __CRd, __p);
                                                 ^
<built-in>: note:   initializing argument 3 of ?void __builtin_arm_stc(unsigned
int, unsigned int, int*)?
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:
In function ?void __arm_stcl(unsigned int, unsigned int, void*)?:
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:69:50:
error: invalid conversion from ?void*? to ?int*? [-fpermissive]
   return __builtin_arm_stcl (__coproc, __CRd, __p);
                                                  ^
<built-in>: note:   initializing argument 3 of ?void
__builtin_arm_stcl(unsigned int, unsigned int, int*)?
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:
In function ?void __arm_ldc2(unsigned int, unsigned int, const void*)?:
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:100:50:
error: invalid conversion from ?const void*? to ?const int*? [-fpermissive]
   return __builtin_arm_ldc2 (__coproc, __CRd, __p);
                                                  ^
<built-in>: note:   initializing argument 3 of ?void
__builtin_arm_ldc2(unsigned int, unsigned int, const int*)?
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:
In function ?void __arm_ldc2l(unsigned int, unsigned int, const void*)?:
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:107:51:
error: invalid conversion from ?const void*? to ?const int*? [-fpermissive]
   return __builtin_arm_ldc2l (__coproc, __CRd, __p);
                                                   ^
<built-in>: note:   initializing argument 3 of ?void
__builtin_arm_ldc2l(unsigned int, unsigned int, const int*)?
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:
In function ?void __arm_stc2(unsigned int, unsigned int, void*)?:
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:114:50:
error: invalid conversion from ?void*? to ?int*? [-fpermissive]
   return __builtin_arm_stc2 (__coproc, __CRd, __p);
                                                  ^
<built-in>: note:   initializing argument 3 of ?void
__builtin_arm_stc2(unsigned int, unsigned int, int*)?
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:
In function ?void __arm_stc2l(unsigned int, unsigned int, void*)?:
/home/ivan/buildroot-git/buildroot/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.1.0/include/arm_acle.h:121:51:
error: invalid conversion from ?void*? to ?int*? [-fpermissive]
   return __builtin_arm_stc2l (__coproc, __CRd, __p);
                                                   ^
<built-in>: note:   initializing argument 3 of ?void
__builtin_arm_stc2l(unsigned int, unsigned int, int*)?
g++ -Wl,--gc-sections -Wl,-O1 -o ../../../bin/uic .obj/customwidgetsinfo.o
.obj/databaseinfo.o .obj/driver.o .obj/treewalker.o .obj/ui4.o .obj/validator.o
.obj/cppextractimages.o .obj/cppwritedeclaration.o .obj/cppwriteicondata.o
.obj/cppwriteicondeclaration.o .obj/cppwriteiconinitialization.o
.obj/cppwriteincludes.o .obj/cppwriteinitialization.o .obj/main.o .obj/uic.o  
-L/home/ivan/buildroot-git/buildroot/buildroot/output/build/qt5base-5.8.0/lib
-lQt5Bootstrap -lpthread 
Makefile:11089: recipe for target '.obj/qlogging.o' failed
make[4]: *** [.obj/qlogging.o] Error 1
make[4]: *** Waiting for unfinished jobs....
Makefile:163: recipe for target 'sub-corelib-make_first' failed
make[3]: *** [sub-corelib-make_first] Error 2
Makefile:46: recipe for target 'sub-src-make_first' failed
make[2]: *** [sub-src-make_first] Error 2
package/pkg-generic.mk:227: recipe for target
'/home/ivan/buildroot-git/buildroot/buildroot/output/build/qt5base-5.8.0/.stamp_built'
failed
make[1]: ***
[/home/ivan/buildroot-git/buildroot/buildroot/output/build/qt5base-5.8.0/.stamp_built]
Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
