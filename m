From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Sep 2019 14:50:02 +0000
Subject: [Buildroot] [Bug 12231] New: QtWebengine fails to build with
 "<stdlib.h> not found" on gcc-8 ARM and x86 toolchains
Message-ID: <bug-12231-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12231

            Bug ID: 12231
           Summary: QtWebengine fails to build with "<stdlib.h> not found"
                    on gcc-8 ARM and x86 toolchains
           Product: buildroot
           Version: 2019.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: thomas at t2ft.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8256
  --> https://bugs.busybox.net/attachment.cgi?id=8256&action=edit
archive with 2 configurations for ARM and x86

Tried to build rootfs with QtWebEngine (Qt.5.12) with current stable release
2019.08.x and attached configurations.

First I tried to cross compile for an ARM based board with 32bit 4.4 kernel and
buildroot's own gcc-8 toolchain, without success (arm.config in attached
configs.tar.gz).
Error message is:

[4033/14096] CXX obj/skia/skia/SkDiscardableMemory_chrome.o
FAILED: obj/skia/skia/SkDiscardableMemory_chrome.o 
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/host/bin/arm-buildroot-linux-gnueabihf-g++
-MMD -MF obj/skia/skia/SkDiscardableMemory_chrome.o.d -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DOFFICIAL_BUILD -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-DCR_SYSROOT_HASH=b2165ab47ab9c4cc780db53ace1b08607d68ae31 -DNDEBUG -DNVALGRIND
-DDYNAMIC_ANNOTATIONS_ENABLED=0 -DSK_IGNORE_LINEONLY_AA_CONVEX_PATH_OPTS
-DSK_HAS_PNG_LIBRARY -DSK_HAS_WEBP_LIBRARY -DSK_HAS_JPEG_LIBRARY
-DSK_SUPPORT_GPU=1
-DSK_GPU_WORKAROUNDS_HEADER=\"gpu/config/gpu_driver_bug_workaround_autogen.h\"
-DSK_GAMMA_EXPONENT=1.2 -DSK_GAMMA_CONTRAST=0.2
-DSK_DEFAULT_FONT_CACHE_LIMIT=20971520 -DWEBP_EXTERN=extern
-DUSE_SYSTEM_LIBJPEG -DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0
-DU_STATIC_IMPLEMENTATION -DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE
-DUCHAR_TYPE=uint16_t -Igen -I../../3rdparty/chromium
-I../../3rdparty/chromium/skia/config -I../../3rdparty/chromium/skia/ext
-I../../3rdparty/chromium/third_party/skia/include/c
-I../../3rdparty/chromium/third_party/skia/include/config
-I../../3rdparty/chromium/third_party/skia/include/core
-I../../3rdparty/chromium/third_party/skia/include/effects
-I../../3rdparty/chromium/third_party/skia/include/encode
-I../../3rdparty/chromium/third_party/skia/include/gpu
-I../../3rdparty/chromium/third_party/skia/include/images
-I../../3rdparty/chromium/third_party/skia/include/lazy
-I../../3rdparty/chromium/third_party/skia/include/pathops
-I../../3rdparty/chromium/third_party/skia/include/pdf
-I../../3rdparty/chromium/third_party/skia/include/pipe
-I../../3rdparty/chromium/third_party/skia/include/ports
-I../../3rdparty/chromium/third_party/skia/include/utils
-I../../3rdparty/chromium/third_party/skia/src/gpu
-I../../3rdparty/chromium/third_party/skia/src/sksl
-I../../3rdparty/chromium/third_party/skia/include/codec
-I../../3rdparty/chromium/third_party/skia/include/private
-I../../3rdparty/chromium/third_party/skia/include/client/android
-I../../3rdparty/chromium/third_party/skia/src/codec
-I../../3rdparty/chromium/third_party/skia/src/core
-I../../3rdparty/chromium/third_party/skia/src/image
-I../../3rdparty/chromium/third_party/skia/src/images
-I../../3rdparty/chromium/third_party/skia/src/opts
-I../../3rdparty/chromium/third_party/skia/src/pdf
-I../../3rdparty/chromium/third_party/skia/src/ports
-I../../3rdparty/chromium/third_party/skia/src/shaders
-I../../3rdparty/chromium/third_party/skia/src/shaders/gradients
-I../../3rdparty/chromium/third_party/skia/src/sfnt
-I../../3rdparty/chromium/third_party/skia/src/utils
-I../../3rdparty/chromium/third_party/skia/src/lazy
-I../../3rdparty/chromium/third_party/skia/third_party/gif
-I../../3rdparty/chromium/third_party/skia/src/effects/gradients -Igen
-I../../3rdparty/chromium/third_party/libwebp/src
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -march=armv7-a -mfloat-abi=hard -mtune=generic-armv7-a -mfpu=vfpv3-d16
-fno-omit-frame-pointer -g0 -fvisibility=hidden -Wno-psabi
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -O2 -fno-ident -fdata-sections -ffunction-sections
-isystem../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libpng16
-isystem../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-isystem../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/freetype2
-isystem../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-std=gnu++14 -fno-exceptions -fno-rtti
--sysroot=../../../../../host/arm-buildroot-linux-gnueabihf/sysroot
-fvisibility-inlines-hidden -Wno-narrowing -Wno-attributes -Wno-class-memaccess
-Wno-subobject-linkage -c
../../3rdparty/chromium/skia/ext/SkDiscardableMemory_chrome.cc -o
obj/skia/skia/SkDiscardableMemory_chrome.o
In file included from
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/host/arm-buildroot-linux-gnueabihf/include/c++/8.3.0/ext/string_conversions.h:41,
                 from
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/host/arm-buildroot-linux-gnueabihf/include/c++/8.3.0/bits/basic_string.h:6400,
                 from
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/host/arm-buildroot-linux-gnueabihf/include/c++/8.3.0/string:52,
                 from
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/host/arm-buildroot-linux-gnueabihf/include/c++/8.3.0/stdexcept:39,
                 from
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/host/arm-buildroot-linux-gnueabihf/include/c++/8.3.0/array:39,
                 from
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/host/arm-buildroot-linux-gnueabihf/include/c++/8.3.0/tuple:39,
                 from
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/host/arm-buildroot-linux-gnueabihf/include/c++/8.3.0/bits/unique_ptr.h:37,
                 from
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/host/arm-buildroot-linux-gnueabihf/include/c++/8.3.0/memory:80,
                 from
../../3rdparty/chromium/skia/ext/SkDiscardableMemory_chrome.h:8,
                 from
../../3rdparty/chromium/skia/ext/SkDiscardableMemory_chrome.cc:5:
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/host/arm-buildroot-linux-gnueabihf/include/c++/8.3.0/cstdlib:75:15:
schwerwiegender Fehler: stdlib.h: Datei oder Verzeichnis nicht gefunden
 #include_next <stdlib.h>
               ^~~~~~~~~~
Kompilierung beendet.
[4037/14096] CXX
obj/components/services/font/public/cpp/cpp/font_service_thread.o
ninja: build stopped: subcommand failed.
Makefile.gn_run:397: recipe for target 'run_ninja' failed
make[5]: *** [run_ninja] Error 1
Makefile:82: recipe for target 'sub-gn_run-pro-make_first' failed
make[4]: *** [sub-gn_run-pro-make_first] Error 2
Makefile:79: recipe for target 'sub-core-make_first' failed
make[3]: *** [sub-core-make_first] Error 2
Makefile:48: recipe for target 'sub-src-make_first' failed
make[2]: *** [sub-src-make_first] Error 2
package/pkg-generic.mk:238: recipe for target
'/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/build/qt5webengine-5.12.4/.stamp_built'
failed
make[1]: ***
[/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/build/qt5webengine-5.12.4/.stamp_built]
Error 2
/home/rk/rk/tvi3309a/buildroot/output/t2ft_rk3288/Makefile:23: recipe for
target '_all' failed
make: *** [_all] Error 2
Command exited with non-zero status 1
you take 12:16.13 to build builroot
====Build buildroot failed!====



Originally in mkspecs/common/gcc-base.conf" there was a line
"QMAKE_CFLAGS_ISYSTEM        =-isystem". After searching the web I tried to
rebuild complete qtwebengine with this line changes to "QMAKE_CFLAGS_ISYSTEM   
    =". But same error again.

Then, for verification, I tried to make a build with minimal config changes
from defconfig on my 64bit host machine for a x86 target (x86.config in
attached configs.tar.gz). Build failed in this case, too. With identical error
message:

[3516/14565] CXX obj/skia/skia/SkCanvasStack.o
FAILED: obj/skia/skia/SkCanvasStack.o 
/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/host/bin/i686-buildroot-linux-gnu-g++
-MMD -MF obj/skia/skia/SkCanvasStack.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV
-DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC -DFULL_SAFE_BROWSING
-DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DOFFICIAL_BUILD -DCHROMIUM_BUILD
-DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-DCR_SYSROOT_HASH=b8639749e2b561a7462d7e7978ca74ee4044bdab -DNDEBUG -DNVALGRIND
-DDYNAMIC_ANNOTATIONS_ENABLED=0 -DSK_IGNORE_LINEONLY_AA_CONVEX_PATH_OPTS
-DSK_HAS_PNG_LIBRARY -DSK_HAS_WEBP_LIBRARY -DSK_HAS_JPEG_LIBRARY
-DSK_SUPPORT_GPU=1
-DSK_GPU_WORKAROUNDS_HEADER=\"gpu/config/gpu_driver_bug_workaround_autogen.h\"
-DSK_GAMMA_EXPONENT=1.2 -DSK_GAMMA_CONTRAST=0.2
-DSK_DEFAULT_FONT_CACHE_LIMIT=20971520 -DWEBP_EXTERN=extern
-DUSE_LIBJPEG_TURBO=1 -DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0
-DU_STATIC_IMPLEMENTATION -DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE
-DUCHAR_TYPE=uint16_t -Igen -I../../3rdparty/chromium
-I../../3rdparty/chromium/skia/config -I../../3rdparty/chromium/skia/ext
-I../../3rdparty/chromium/third_party/skia/include/c
-I../../3rdparty/chromium/third_party/skia/include/config
-I../../3rdparty/chromium/third_party/skia/include/core
-I../../3rdparty/chromium/third_party/skia/include/effects
-I../../3rdparty/chromium/third_party/skia/include/encode
-I../../3rdparty/chromium/third_party/skia/include/gpu
-I../../3rdparty/chromium/third_party/skia/include/images
-I../../3rdparty/chromium/third_party/skia/include/lazy
-I../../3rdparty/chromium/third_party/skia/include/pathops
-I../../3rdparty/chromium/third_party/skia/include/pdf
-I../../3rdparty/chromium/third_party/skia/include/pipe
-I../../3rdparty/chromium/third_party/skia/include/ports
-I../../3rdparty/chromium/third_party/skia/include/utils
-I../../3rdparty/chromium/third_party/skia/src/gpu
-I../../3rdparty/chromium/third_party/skia/src/sksl
-I../../3rdparty/chromium/third_party/skia/include/codec
-I../../3rdparty/chromium/third_party/skia/include/private
-I../../3rdparty/chromium/third_party/skia/include/client/android
-I../../3rdparty/chromium/third_party/skia/src/codec
-I../../3rdparty/chromium/third_party/skia/src/core
-I../../3rdparty/chromium/third_party/skia/src/image
-I../../3rdparty/chromium/third_party/skia/src/images
-I../../3rdparty/chromium/third_party/skia/src/opts
-I../../3rdparty/chromium/third_party/skia/src/pdf
-I../../3rdparty/chromium/third_party/skia/src/ports
-I../../3rdparty/chromium/third_party/skia/src/shaders
-I../../3rdparty/chromium/third_party/skia/src/shaders/gradients
-I../../3rdparty/chromium/third_party/skia/src/sfnt
-I../../3rdparty/chromium/third_party/skia/src/utils
-I../../3rdparty/chromium/third_party/skia/src/lazy
-I../../3rdparty/chromium/third_party/skia/third_party/gif
-I../../3rdparty/chromium/third_party/skia/src/effects/gradients
-I../../3rdparty/chromium/third_party/libwebp/src
-I../../3rdparty/chromium/third_party/libpng
-I../../3rdparty/chromium/third_party/zlib
-I../../3rdparty/chromium/third_party/libjpeg_turbo
-I../../3rdparty/chromium/third_party/icu/source/common
-I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
--param=ssp-buffer-size=4 -fstack-protector -funwind-tables -fPIC -pipe
-pthread -m32 -msse2 -mfpmath=sse -mmmx -fno-omit-frame-pointer -g0
-fvisibility=hidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -O2 -fno-ident -fdata-sections -ffunction-sections
-isystem../../../../../host/i686-buildroot-linux-gnu/sysroot/usr/include/freetype2
-isystem../../../../../host/i686-buildroot-linux-gnu/sysroot/usr/include
-std=gnu++14 -fno-exceptions -fno-rtti
--sysroot=../../../../../host/i686-buildroot-linux-gnu/sysroot
-fvisibility-inlines-hidden -Wno-narrowing -Wno-attributes -Wno-class-memaccess
-Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/skia/src/utils/SkCanvasStack.cpp -o
obj/skia/skia/SkCanvasStack.o
In file included from
/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/include/c++/8.3.0/ext/string_conversions.h:41,
                 from
/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/include/c++/8.3.0/bits/basic_string.h:6400,
                 from
/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/include/c++/8.3.0/string:52,
                 from
/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/include/c++/8.3.0/stdexcept:39,
                 from
/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/include/c++/8.3.0/array:39,
                 from
/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/include/c++/8.3.0/tuple:39,
                 from
/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/include/c++/8.3.0/functional:54,
                 from
../../3rdparty/chromium/third_party/skia/include/core/SkRefCnt.h:15,
                 from
../../3rdparty/chromium/third_party/skia/include/core/SkPaint.h:26,
                 from
../../3rdparty/chromium/third_party/skia/include/core/SkCanvas.h:25,
                 from
../../3rdparty/chromium/third_party/skia/include/core/SkCanvasVirtualEnforcer.h:11,
                 from
../../3rdparty/chromium/third_party/skia/include/utils/SkNWayCanvas.h:13,
                 from
../../3rdparty/chromium/third_party/skia/src/utils/SkCanvasStack.h:11,
                 from
../../3rdparty/chromium/third_party/skia/src/utils/SkCanvasStack.cpp:7:
/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/include/c++/8.3.0/cstdlib:75:15:
schwerwiegender Fehler: stdlib.h: Datei oder Verzeichnis nicht gefunden
 #include_next <stdlib.h>
               ^~~~~~~~~~
Kompilierung beendet.
[3520/14565] CXX obj/services/tracing/lib/coordinator.o
ninja: build stopped: subcommand failed.
make[4]: *** [Makefile.gn_run:337: run_ninja] Fehler 1
make[4]: Verzeichnis
?/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/build/qt5webengine-5.12.4/src/core?
wird verlassen
make[3]: *** [Makefile:82: sub-gn_run-pro-make_first] Fehler 2
make[3]: Verzeichnis
?/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/build/qt5webengine-5.12.4/src/core?
wird verlassen
make[2]: *** [Makefile:80: sub-core-make_first] Fehler 2
make[2]: Verzeichnis
?/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/build/qt5webengine-5.12.4/src?
wird verlassen
make[1]: *** [Makefile:49: sub-src-make_first] Fehler 2
make[1]: Verzeichnis
?/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/build/qt5webengine-5.12.4?
wird verlassen
make: *** [package/pkg-generic.mk:241:
/home/tt/t2ft/000_Projekte/embeddedLinux/buildroot/buildroot/output/build/qt5webengine-5.12.4/.stamp_built]
Fehler 2

Looks like qtwebengine is very sensitive, because this kind of error appears
over an over again, but none of the fixes I found did help in my case. Maybe
the cause is that I do not complile a kernel with buildroot? But I cannot
compile a kernel with buildroot, because my arm based board requires a heavily
patched kernel from the SOC maker.

Cheers
  Thomas

-- 
You are receiving this mail because:
You are on the CC list for the bug.
