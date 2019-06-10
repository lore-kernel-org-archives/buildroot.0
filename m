From: Nathan Ford <nford@westpond.com>
Date: Mon, 10 Jun 2019 08:53:42 -0400
Subject: [Buildroot] [Bug 11776] New: qt5webengine 5.12.2 build failed
 with arm toolchain and linaro toolchain
In-Reply-To: <bug-11776-163@https.bugs.busybox.net/>
References: <bug-11776-163@https.bugs.busybox.net/>
Message-ID: <CAOgXH4e+tjK5Ct0SGMe5D1DrmojtSF4yEQHMMnFCowBNiPJu=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Does anyone have any ideas / fixes for this issue? I'm running into the
latter ' fatal error: stdlib.h: No such file or directory' since updating
to buildroot-2019.05. While not exactly the same as the above from an
include path perspective, the final error is the same ( pasted below ).

I've tried 4 different toolchains:
 - External gcc 6.3.0
 - External gcc 8.3.0
 - Buildroot built 8.x
 - Buildroot built 7.x
and all produce the same error.

2019.02.1 with the same buildroot config compiles fine ( with the external
6.3.0 toolchain ).

Does any one have any ideas or pointers on where to look to figure this out?

Thanks,
--Nate

FAILED: obj/skia/skia/SkNullCanvas.o
/home/nate/wpt/flexstream-1u/buildroot/output_container/host/bin/x86_64-mx400-linux-gnu-g++
-MMD -MF obj/skia/skia/SkNullCanvas.o.d -DV8_DEPRECATION_WARNINGS
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC
-DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL
-DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-DCR_SYSROOT_HASH=4e7db513b0faeea8fb410f70c9909e8736f5c0ab -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0
-DSK_IGNORE_LINEONLY_AA_CONVEX_PATH_OPTS -DSK_HAS_PNG_LIBRARY
-DSK_HAS_WEBP_LIBRARY -DSK_HAS_JPEG_LIBRARY -DSK_SUPPORT_GPU=1
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
--param=ssp-buffer-size=4 -fstack-protector -Wno-builtin-macro-redefined
-D__DATE__= -D__TIME__= -D__TIMESTAMP__= -funwind-tables -fPIC -pipe
-pthread -m64 -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
-Wno-unused-parameter -O2 -fno-ident -fdata-sections -ffunction-sections
-isystem../../../../../host/x86_64-buildroot-linux-gnu/sysroot/usr/include/libpng16
-isystem../../../../../host/x86_64-buildroot-linux-gnu/sysroot/usr/include
-isystem../../../../../host/x86_64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-isystem../../../../../host/x86_64-buildroot-linux-gnu/sysroot/usr/include
-std=gnu++14 -fno-exceptions -fno-rtti
--sysroot=../../../../../host/x86_64-buildroot-linux-gnu/sysroot
-fvisibility-inlines-hidden -Wno-narrowing -Wno-attributes
-Wno-class-memaccess -Wno-subobject-linkage -c
../../3rdparty/chromium/third_party/skia/src/utils/SkNullCanvas.cpp -o
obj/skia/skia/SkNullCanvas.o
In file included from
/opt/toolchains/x86_64-mx400-linux-gnu/x86_64-mx400-linux-gnu/include/c++/8.3.0/ext/string_conversions.h:41,
                 from
/opt/toolchains/x86_64-mx400-linux-gnu/x86_64-mx400-linux-gnu/include/c++/8.3.0/bits/basic_string.h:6400,
                 from
/opt/toolchains/x86_64-mx400-linux-gnu/x86_64-mx400-linux-gnu/include/c++/8.3.0/string:52,
                 from
/opt/toolchains/x86_64-mx400-linux-gnu/x86_64-mx400-linux-gnu/include/c++/8.3.0/stdexcept:39,
                 from
/opt/toolchains/x86_64-mx400-linux-gnu/x86_64-mx400-linux-gnu/include/c++/8.3.0/array:39,
                 from
/opt/toolchains/x86_64-mx400-linux-gnu/x86_64-mx400-linux-gnu/include/c++/8.3.0/tuple:39,
                 from
/opt/toolchains/x86_64-mx400-linux-gnu/x86_64-mx400-linux-gnu/include/c++/8.3.0/functional:54,
                 from
../../3rdparty/chromium/third_party/skia/include/core/SkRefCnt.h:15,
                 from
../../3rdparty/chromium/third_party/skia/include/core/SkPaint.h:26,
                 from
../../3rdparty/chromium/third_party/skia/include/core/SkCanvas.h:25,
                 from
../../3rdparty/chromium/third_party/skia/include/utils/SkNullCanvas.h:11,
                 from
../../3rdparty/chromium/third_party/skia/src/utils/SkNullCanvas.cpp:8:
/opt/toolchains/x86_64-mx400-linux-gnu/x86_64-mx400-linux-gnu/include/c++/8.3.0/cstdlib:75:15:
fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
               ^~~~~~~~~~
compilation terminated.


On Thu, Apr 11, 2019 at 5:04 AM <bugzilla@busybox.net> wrote:

> https://bugs.busybox.net/show_bug.cgi?id=11776
>
>             Bug ID: 11776
>            Summary: qt5webengine 5.12.2 build failed with arm toolchain
>                     and linaro toolchain
>            Product: buildroot
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P5
>          Component: Other
>           Assignee: unassigned at buildroot.uclibc.org
>           Reporter: jacky at ticctv.cn
>                 CC: buildroot at uclibc.org
>   Target Milestone: ---
>
> I'm using the least buildroot (commit
> 4e3be3ae9d4c9f1b0c035eee0c923a724f9a9316)
> to build qt5webengine. The qt5webengine version is  v5.12.2.
> I use arm toolchain and linaro toolchain for building, but both failed.
>
> Here is the build log for arm toolchain:
> dev at Dev:^buildroot-qt$make
> >>> qt5webengine 5.12.2 Building
>
> PATH="/home/dev/buildroot-qt/host/bin:/home/dev/buildroot-qt/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
>
> PATH=/home/dev/buildroot-qt/build/qt5webengine-5.12.2/host-bin:"/home/dev/buildroot-qt/host/bin:/home/dev/buildroot-qt/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> NINJAFLAGS="-j9"
>
> GN_PKG_CONFIG_HOST=/home/dev/buildroot-qt/build/qt5webengine-5.12.2/host-bin/host-pkg-config
> /usr/bin/make -j9 -C /home/dev/buildroot-qt/build/qt5webengine-5.12.2
> cd src/ && ( test -e Makefile || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/src.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile
> cd buildtools/ && ( test -e Makefile ||
> /home/dev/buildroot-qt/host/bin/qmake
> -o Makefile
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/buildtools/
> buildtools.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile
> cd webengine/ui/ && ( test -e Makefile ||
> /home/dev/buildroot-qt/host/bin/qmake
> -o Makefile
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/webengine/ui/ui.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile
> cd webengine/ui2/ && ( test -e Makefile ||
> /home/dev/buildroot-qt/host/bin/qmake -o Makefile
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/webengine/ui2/ui2.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile
> ( test -e Makefile.configure_host || /home/dev/buildroot-qt/host/bin/qmake
> -o
> Makefile.configure_host
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/buildtools/
> configure_host.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.configure_host
> ( test -e Makefile.ninja || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile.ninja
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/buildtools/ninja.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.ninja
> make[4]: Nothing to be done for 'first'.
> make[4]: Nothing to be done for 'first'.
> make[5]: Nothing to be done for 'first'.
> ( test -e Makefile.configure_target ||
> /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile.configure_target
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/buildtools/
> configure_target.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.configure_target
> make[5]: Nothing to be done for 'first'.
> ( test -e Makefile.gn || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile.gn
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/buildtools/gn.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.gn
> make[5]: Nothing to be done for 'first'.
> make[5]: Nothing to be done for 'first'.
> cd core/ && ( test -e Makefile || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/
> core.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile
> ( test -e Makefile.core_headers || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile.core_headers
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/core_headers.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.core_headers
> make[5]: Nothing to be done for 'first'.
> ( test -e Makefile.core_generator || /home/dev/buildroot-qt/host/bin/qmake
> -o
> Makefile.core_generator
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/
> core_generator.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.core_generator
> make[5]: Nothing to be done for 'first'.
> ( test -e Makefile.gn_run || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile.gn_run
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/gn_run.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.gn_run
> ninja -j9 -C
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/debug
> QtWebEngineCore
> ninja: Entering directory
> `/home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/debug'
> [1/11410] CXX obj/sandbox/linux/seccomp_bpf/syscall_sets.o
> FAILED: obj/sandbox/linux/seccomp_bpf/syscall_sets.o
> /home/dev/buildroot-qt/host/bin/aarch64-linux-gnu-g++ -MMD -MF
> obj/sandbox/linux/seccomp_bpf/syscall_sets.o.d -DSANDBOX_IMPLEMENTATION
> -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1
> -DUSE_OZONE=1 -DNO_TCMALLOC -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD
> -DSAFE_BROWSING_DB_LOCAL -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED
> -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS
> -DCR_SYSROOT_HASH=37dfa5f22e2c0e847cee34f9848eb31230c33d35 -D_DEBUG
> -DDYNAMIC_ANNOTATIONS_ENABLED=1 -DWTF_USE_DYNAMIC_ANNOTATIONS=1 -Igen
> -I../../3rdparty/chromium -fno-strict-aliasing --param=ssp-buffer-size=4
> -fstack-protector -Wno-builtin-macro-redefined -D__DATE__= -D__TIME__=
> -D__TIMESTAMP__= -funwind-tables -fPIC -pipe -pthread -Wall
> -Wno-unused-local-typedefs -Wno-maybe-uninitialized
> -Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
> -Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers
> -Wno-unused-parameter -O0 -fno-omit-frame-pointer -g2 -fvisibility=hidden
> -std=gnu++14 -Wno-narrowing -Wno-attributes -Wno-class-memaccess
> -Wno-subobject-linkage -fno-exceptions -fno-rtti
> --sysroot=../../../../../host/aarch64-buildroot-linux-gnu/sysroot
> -fvisibility-inlines-hidden -c
> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_sets.cc
> -o
> obj/sandbox/linux/seccomp_bpf/syscall_sets.o
> In file included from
>
> ../../3rdparty/chromium/sandbox/linux/system_headers/arm64_linux_syscalls.h:8,
>                  from
> ../../3rdparty/chromium/sandbox/linux/system_headers/linux_syscalls.h:33,
>                  from
>
> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_sets.cc:8:
> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_sets.cc:
> In
> static member function 'static bool
> sandbox::SyscallSets::IsFileSystem(int)':
>
> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_sets.cc:112:10:
> error: '__NR3264_fstatat' was not declared in this scope
>      case __NR_newfstatat:  // fstatat(). EPERM not a valid errno.
>           ^~~~~~~~~~~~~~~
> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_sets.cc:
> In
> static member function 'static bool
> sandbox::SyscallSets::IsAllowedFileSystemAccessViaFd(int)':
>
> ../../3rdparty/chromium/sandbox/linux/seccomp-bpf-helpers/syscall_sets.cc:161:10:
> error: '__NR3264_fstat' was not declared in this scope
>      case __NR_fstat:
>           ^~~~~~~~~~
> [9/11410] CXX
>
> obj/services/service_manager/sandbox/sandbox/bpf_cros_arm_gpu_policy_linux.o
> ninja: build stopped: subcommand failed.
> Makefile.gn_run:336: recipe for target 'run_ninja' failed
> make[5]: *** [run_ninja] Error 1
> Makefile:82: recipe for target 'sub-gn_run-pro-make_first' failed
> make[4]: *** [sub-gn_run-pro-make_first] Error 2
> Makefile:79: recipe for target 'sub-core-make_first' failed
> make[3]: *** [sub-core-make_first] Error 2
> Makefile:48: recipe for target 'sub-src-make_first' failed
> make[2]: *** [sub-src-make_first] Error 2
> package/pkg-generic.mk:238: recipe for target
> '/home/dev/buildroot-qt/build/qt5webengine-5.12.2/.stamp_built' failed
> make[1]: ***
> [/home/dev/buildroot-qt/build/qt5webengine-5.12.2/.stamp_built]
> Error 2
> Makefile:23: recipe for target '_all' failed
> make: *** [_all] Error 2
>
>
>
> Here is the build log for linaro toolchain:
> dev at Dev:^buildroot-qt$make
> >>> qt5webengine 5.12.2 Building
>
> PATH="/home/dev/buildroot-qt/host/bin:/home/dev/buildroot-qt/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
>
> PATH=/home/dev/buildroot-qt/build/qt5webengine-5.12.2/host-bin:"/home/dev/buildroot-qt/host/bin:/home/dev/buildroot-qt/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> NINJAFLAGS="-j9"
>
> GN_PKG_CONFIG_HOST=/home/dev/buildroot-qt/build/qt5webengine-5.12.2/host-bin/host-pkg-config
> /usr/bin/make -j9 -C /home/dev/buildroot-qt/build/qt5webengine-5.12.2
> cd src/ && ( test -e Makefile || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/src.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile
> cd buildtools/ && ( test -e Makefile ||
> /home/dev/buildroot-qt/host/bin/qmake
> -o Makefile
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/buildtools/
> buildtools.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile
> cd webengine/ui/ && ( test -e Makefile ||
> /home/dev/buildroot-qt/host/bin/qmake
> -o Makefile
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/webengine/ui/ui.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile
> cd webengine/ui2/ && ( test -e Makefile ||
> /home/dev/buildroot-qt/host/bin/qmake -o Makefile
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/webengine/ui2/ui2.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile
> make[4]: Nothing to be done for 'first'.
> make[4]: Nothing to be done for 'first'.
> ( test -e Makefile.configure_host || /home/dev/buildroot-qt/host/bin/qmake
> -o
> Makefile.configure_host
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/buildtools/
> configure_host.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.configure_host
> ( test -e Makefile.ninja || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile.ninja
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/buildtools/ninja.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.ninja
> make[5]: Nothing to be done for 'first'.
> ( test -e Makefile.configure_target ||
> /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile.configure_target
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/buildtools/
> configure_target.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.configure_target
> make[5]: Nothing to be done for 'first'.
> ( test -e Makefile.gn || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile.gn
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/buildtools/gn.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.gn
> make[5]: Nothing to be done for 'first'.
> make[5]: Nothing to be done for 'first'.
> cd core/ && ( test -e Makefile || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/
> core.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile
> ( test -e Makefile.core_headers || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile.core_headers
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/core_headers.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.core_headers
> make[5]: Nothing to be done for 'first'.
> ( test -e Makefile.core_generator || /home/dev/buildroot-qt/host/bin/qmake
> -o
> Makefile.core_generator
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/
> core_generator.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.core_generator
> make[5]: Nothing to be done for 'first'.
> ( test -e Makefile.gn_run || /home/dev/buildroot-qt/host/bin/qmake -o
> Makefile.gn_run
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/gn_run.pro
> WEBENGINE_CONFIG+=use_system_ffmpeg QT_CONFIG-=alsa ) && /usr/bin/make -f
> Makefile.gn_run
> ninja -j9 -C
> /home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/debug
> QtWebEngineCore
> ninja: Entering directory
> `/home/dev/buildroot-qt/build/qt5webengine-5.12.2/src/core/debug'
> [1/11212] CXX obj/skia/skia/convolver.o
> FAILED: obj/skia/skia/convolver.o
> /home/dev/buildroot-qt/host/bin/aarch64-linux-gnu-g++ -MMD -MF
> obj/skia/skia/convolver.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV
> -DUSE_AURA=1
> -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC -DFULL_SAFE_BROWSING
> -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DCHROMIUM_BUILD
> -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -DCR_SYSROOT_HASH=37dfa5f22e2c0e847cee34f9848eb31230c33d35 -D_DEBUG
> -DDYNAMIC_ANNOTATIONS_ENABLED=1 -DWTF_USE_DYNAMIC_ANNOTATIONS=1
> -DSK_IGNORE_LINEONLY_AA_CONVEX_PATH_OPTS -DSK_HAS_PNG_LIBRARY
> -DSK_HAS_WEBP_LIBRARY -DSK_HAS_JPEG_LIBRARY -DSK_SUPPORT_GPU=1
>
> -DSK_GPU_WORKAROUNDS_HEADER=\"gpu/config/gpu_driver_bug_workaround_autogen.h\"
> -DSK_GAMMA_EXPONENT=1.2 -DSK_GAMMA_CONTRAST=0.2
> -DSK_DEFAULT_FONT_CACHE_LIMIT=20971520 -DWEBP_EXTERN=extern
> -DUSE_LIBJPEG_TURBO=1 -DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0
> -DU_STATIC_IMPLEMENTATION -DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE
> -DUCHAR_TYPE=uint16_t -Igen -I../../3rdparty/chromium
> -I../../3rdparty/chromium/skia/config -I../../3rdparty/chromium/skia/ext
> -I../../3rdparty/chromium/third_party/skia/include/c
> -I../../3rdparty/chromium/third_party/skia/include/config
> -I../../3rdparty/chromium/third_party/skia/include/core
> -I../../3rdparty/chromium/third_party/skia/include/effects
> -I../../3rdparty/chromium/third_party/skia/include/encode
> -I../../3rdparty/chromium/third_party/skia/include/gpu
> -I../../3rdparty/chromium/third_party/skia/include/images
> -I../../3rdparty/chromium/third_party/skia/include/lazy
> -I../../3rdparty/chromium/third_party/skia/include/pathops
> -I../../3rdparty/chromium/third_party/skia/include/pdf
> -I../../3rdparty/chromium/third_party/skia/include/pipe
> -I../../3rdparty/chromium/third_party/skia/include/ports
> -I../../3rdparty/chromium/third_party/skia/include/utils
> -I../../3rdparty/chromium/third_party/skia/src/gpu
> -I../../3rdparty/chromium/third_party/skia/src/sksl
> -I../../3rdparty/chromium/third_party/skia/include/codec
> -I../../3rdparty/chromium/third_party/skia/include/private
> -I../../3rdparty/chromium/third_party/skia/include/client/android
> -I../../3rdparty/chromium/third_party/skia/src/codec
> -I../../3rdparty/chromium/third_party/skia/src/core
> -I../../3rdparty/chromium/third_party/skia/src/image
> -I../../3rdparty/chromium/third_party/skia/src/images
> -I../../3rdparty/chromium/third_party/skia/src/opts
> -I../../3rdparty/chromium/third_party/skia/src/pdf
> -I../../3rdparty/chromium/third_party/skia/src/ports
> -I../../3rdparty/chromium/third_party/skia/src/shaders
> -I../../3rdparty/chromium/third_party/skia/src/shaders/gradients
> -I../../3rdparty/chromium/third_party/skia/src/sfnt
> -I../../3rdparty/chromium/third_party/skia/src/utils
> -I../../3rdparty/chromium/third_party/skia/src/lazy
> -I../../3rdparty/chromium/third_party/skia/third_party/gif
> -I../../3rdparty/chromium/third_party/skia/src/effects/gradients
> -I../../3rdparty/chromium/third_party/libwebp/src
> -I../../3rdparty/chromium/third_party/libpng
> -I../../3rdparty/chromium/third_party/zlib
> -I../../3rdparty/chromium/third_party/libjpeg_turbo
> -I../../3rdparty/chromium/third_party/icu/source/common
> -I../../3rdparty/chromium/third_party/icu/source/i18n -fno-strict-aliasing
> --param=ssp-buffer-size=4 -fstack-protector -Wno-builtin-macro-redefined
> -D__DATE__= -D__TIME__= -D__TIMESTAMP__= -funwind-tables -fPIC -pipe
> -pthread
> -O0 -fno-omit-frame-pointer -g2 -fvisibility=hidden
> -Wno-unused-local-typedefs
> -Wno-maybe-uninitialized -Wno-deprecated-declarations
> -fno-delete-null-pointer-checks -Wno-comments -Wno-dangling-else
> -Wno-packed-not-aligned -Wno-missing-field-initializers
> -Wno-unused-parameter
>
> -isystem../../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
> -isystem../../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include
> -std=gnu++14 -fno-exceptions -fno-rtti
> --sysroot=../../../../../host/aarch64-buildroot-linux-gnu/sysroot
> -fvisibility-inlines-hidden -Wno-narrowing -Wno-attributes
> -Wno-class-memaccess
> -Wno-subobject-linkage -c ../../3rdparty/chromium/skia/ext/convolver.cc -o
> obj/skia/skia/convolver.o
> In file included from
>
> /home/dev/buildroot-qt/host/opt/ext-toolchain/aarch64-linux-gnu/include/c++/7.3.1/bits/stl_algo.h:59:0,
>                  from
>
> /home/dev/buildroot-qt/host/opt/ext-toolchain/aarch64-linux-gnu/include/c++/7.3.1/algorithm:62,
>                  from ../../3rdparty/chromium/skia/ext/convolver.cc:5:
>
> /home/dev/buildroot-qt/host/opt/ext-toolchain/aarch64-linux-gnu/include/c++/7.3.1/cstdlib:75:15:
> fatal error: stdlib.h: No such file or directory
>  #include_next <stdlib.h>
>                ^~~~~~~~~~
> compilation terminated.
>
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190610/c6683c9e/attachment.html>
