From: Brent Sink <brents_3@hotmail.com>
Date: Thu, 8 Jun 2017 21:52:13 +0000
Subject: [Buildroot] Error when building Qt5 Webengine from buildroot
In-Reply-To: <BN6PR03MB29143BD3F821BA358530ADF4BFC80@BN6PR03MB2914.namprd03.prod.outlook.com>
References: <BN6PR03MB29143BD3F821BA358530ADF4BFC80@BN6PR03MB2914.namprd03.prod.outlook.com>
Message-ID: <BN6PR03MB2914ED0870804EEF5408B906BFC90@BN6PR03MB2914.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and Ga?l,


I'm still struggling getting Qt5 WebEngine to build.  Any thoughts on what may be wrong?  The output from the build is below...


> Hello,

>

> I applied the patch from here: https://patchwork.ozlabs.org/patch/742261/ and then tried to build the Qt5 Webengine package, but I'm getting an error message.  Looking at the output, it mentions a couple > libraries not found and saying that it is going to use Chromium's copies.  I assume this is ok?


> Here is the output:
>
> >>> qt5webengine 5.6.2 Configuring
> ln -s /home/cpa/buildroot/output/host/usr/bin/python2 /home/cpa/buildroot/output/build/qt5webengine-5.6.2/python
> (cd /home/cpa/buildroot/output/build/qt5webengine-5.6.2; PATH="/home/cpa/buildroot/output/host/bin:/home/cpa/buildroot/output/host/sbin:/home/cpa/buildroot/output/host/usr/bin:/home/cpa/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" PATH="/home/cpa/buildroot/output/build/qt5webengine-5.6.2:$PATH" /home/cpa/buildroot/output/host/usr/bin/qmake WEBENGINE_CONFIG=use_system_ffmpeg 'QMAKE_CFLAGS+=-mtune="cortex-a9" -mfloat-abi="hard" -mfpu="vfpv3" -march=armv7-a -marm')
> Info: creating cache file /home/cpa/buildroot/output/build/qt5webengine-5.6.2/.qmake.cache
> Running configure tests
> Checking for khr... yes
> Checking for snappy... no
> Checking for srtp... no
> System zlib or minizip not found. Using Chromium's copies.
> System libxml2 or libxslt not found. Using Chromium's copies.
> System libevent not found. Using Chromium's copy.
> System jsoncpp not found. Using Chromium's copy.
> System libsrtp not found. Using Chromium's copy.
> System snappy not found. Using Chromium's copy.
> Certificate handling.............. Using bundled BoringSSL
> ICU............................... Using internal copy (Default, force system ICU with WEBENGINE_CONFIG+=use_system_icu)
> FFMPEG............................ Using system version
> Proprietary codecs (H264, MP3).... Not enabled         (Default, enable with WEBENGINE_CONFIG+=use_proprietary_codecs)
> Geolocation....................... Enabled
> >>> qt5webengine 5.6.2 Building
> PATH="/home/cpa/buildroot/output/host/bin:/home/cpa/buildroot/output/host/sbin:/home/cpa/buildroot/output/host/usr/bin:/home/cpa/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" PATH="/home/cpa/buildroot/output/build/qt5webengine-5.6.2:$PATH" /usr/bin/make -j3 -C /home/cpa/buildroot/output/build/qt5webengine-5.6.2
> cd src/ && ( test -e Makefile || /home/cpa/buildroot/output/host/usr/bin/qmake /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/src.pro WEBENGINE_CONFIG=use_system_ffmpeg 'QMAKE_CFLAGS+=-mtune="cortex-a9" -mfloat-abi="hard" -mfpu="vfpv3" -march=armv7-a -marm' -o Makefile ) && /usr/bin/make -f Makefile
> cd core/ && ( test -e Makefile || /home/cpa/buildroot/output/host/usr/bin/qmake /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/core.pro WEBENGINE_CONFIG=use_system_ffmpeg 'QMAKE_CFLAGS+=-mtune="cortex-a9" -mfloat-abi="hard" -mfpu="vfpv3" -march=armv7-a -marm' -o Makefile ) && /usr/bin/make -f Makefile
> cd webengine/ui/ && ( test -e Makefile || /home/cpa/buildroot/output/host/usr/bin/qmake /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/webengine/ui/ui.pro WEBENGINE_CONFIG=use_system_ffmpeg 'QMAKE_CFLAGS+=-mtune="cortex-a9" -mfloat-abi="hard" -mfpu="vfpv3" -march=armv7-a -marm' -o Makefile ) && /usr/bin/make -f Makefile
> ( test -e Makefile.core_headers || /home/cpa/buildroot/output/host/usr/bin/qmake /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/core_headers.pro WEBENGINE_CONFIG=use_system_ffmpeg 'QMAKE_CFLAGS+=-mtune="cortex-a9" -mfloat-abi="hard" -mfpu="vfpv3" -march=armv7-a -marm' -o Makefile.core_headers ) && /usr/bin/make -f Makefile.core_headers
> ( test -e Makefile.gyp_configure_host || /home/cpa/buildroot/output/host/usr/bin/qmake /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/gyp_configure_host.pro WEBENGINE_CONFIG=use_system_ffmpeg 'QMAKE_CFLAGS+=-mtune="cortex-a9" -mfloat-abi="hard" -mfpu="vfpv3" -march=armv7-a -marm' -o Makefile.gyp_configure_host ) && /usr/bin/make -f Makefile.gyp_configure_host
> make[4]: Nothing to be done for `first'.
> make[5]: Nothing to be done for `first'.
> ( test -e Makefile.gyp_configure_target || /home/cpa/buildroot/output/host/usr/bin/qmake /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/gyp_configure_target.pro WEBENGINE_CONFIG=use_system_ffmpeg 'QMAKE_CFLAGS+=-mtune="cortex-a9" -mfloat-abi="hard" -mfpu="vfpv3" -march=armv7-a -marm' -o Makefile.gyp_configure_target ) && /usr/bin/make -f Makefile.gyp_configure_target
> make[5]: Nothing to be done for `first'.
> ( test -e Makefile.core_gyp_generator || /home/cpa/buildroot/output/host/usr/bin/qmake /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/core_gyp_generator.pro WEBENGINE_CONFIG=use_system_ffmpeg 'QMAKE_CFLAGS+=-mtune="cortex-a9" -mfloat-abi="hard" -mfpu="vfpv3" -march=armv7-a -marm' -o Makefile.core_gyp_generator ) && /usr/bin/make -f Makefile.core_gyp_generator
> make[5]: Nothing to be done for `first'.
> make[5]: Nothing to be done for `first'.
> ( test -e Makefile.gyp_run || /home/cpa/buildroot/output/host/usr/bin/qmake /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/gyp_run.pro WEBENGINE_CONFIG=use_system_ffmpeg 'QMAKE_CFLAGS+=-mtune="cortex-a9" -mfloat-abi="hard" -mfpu="vfpv3" -march=armv7-a -marm' -o Makefile.gyp_run ) && /usr/bin/make -f Makefile.gyp_run
> Project MESSAGE: Running gyp_qtwebengine "/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core" -D qt_cross_compile=1 -D os_posix=1 -D qt_os="embedded_linux" -I config/embedded_linux.gypi -D use_qt=1 -D v8_use_external_startup_data=0 -D enable_basic_printing=0 -D enable_print_preview=0 -D enable_web_speech=0 -D linux_use_bundled_gold=0 -D linux_use_bundled_binutils=0 -D linux_use_gold_flags=0 -D toolkit_uses_gtk=0 -D use_ash=0 -D use_aura=1 -D use_cairo=0 -D use_clipboard_aurax11=0 -D use_cups=0 -D use_gconf=0 -D use_gio=0 -D use_gnome_keyring=0 -D use_kerberos=0 -D use_pango=0 -D use_openssl=1 -D use_nss_certs=0 -D use_openssl_certs=1 -D use_system_libpng=1 -D use_system_libjpeg=1 -D use_pulseaudio=0 -D use_system_ffmpeg=1 -D clang=0 -D desktop_linux=0 -D disable_nacl=1 -D embedded=1 -D enable_autofill_dialog=0 -D enable_automation=0 -D enable_captive_portal_detection=0 -D enable_extensions=0 -D enable_google_now=0 -D enable_language_detection=0 -D enable_managed_users=0 -D enable_plugin_installation=0 -D enable_plugins=0 -D enable_printing=0 -D enable_session_service=0 -D enable_spellcheck=0 -D enable_task_manager=0 -D enable_themes=0 -D enable_webrtc=0 -D gtest_target_type=none -D host_clang=0 -D notifications=0 -D ozone_auto_platforms=0 -D ozone_platform_dri=0 -D ozone_platform_test=0 -D p2p_apis=0 -D safe_browsing=0 -D toolkit_views=1 -D use_custom_freetype=0 -D use_libpci=0 -D use_ozone=1 -D use_system_fontconfig=1 -D use_x11=0 -D v8_use_snapshot=false -D want_separate_host_toolset=1 -D disable_glibcxx_debug=1 -D remove_webcore_debug_symbols=1 -D remove_v8base_debug_symbols=1 -D disable_fatal_linker_warnings=1 -D sysroot="/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot" -D CXX="/home/cpa/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-g++" -D target_arch=arm -D arm_arch="armv7-a" -D arm_tune="cortex-a9" -D arm_float_abi="hard" -D arm_version="7" -D arm_neon=0 -D arm_neon_optional=1 -D arm_thumb=0.
> using python: /home/cpa/buildroot/output/build/qt5webengine-5.6.2/python version: 2.7.12
> Using extra options found in /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/qmake_extras.gypi
> Using extra options found in /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/qtwebengine_extras.gypi
> Using extra options found in /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/qmake_extras.gypi
> Using extra options found in /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/qtwebengine_extras.gypi
> Updating projects from gyp files...
> bootstrapping ninja...
> warning: A compatible version of re2c (>= 0.11.3) was not found; changes to src/*.in.cc will not affect your build.
> wrote build.ninja.
> bootstrap complete.  rebuilding...
> [24/24] LINK ninja
> /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/ninja/ninja  -C /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/Release
> ninja: Entering directory `/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/core/Release'
> [4677/10203] CXX obj/src/3rdparty/chromium/ui/gfx/image/gfx.image_util.o
> /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/gfx/image/image_util.cc: In function ?bool gfx::VisibleMargins(const gfx::ImageSkia&, int*, int*)?:
> /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/gfx/image/image_util.cc:50:6: warning: assuming signed overflow does not occur when assuming that (X - c) <= X is always true [-Wstrict-overflow]
>  bool VisibleMargins(const ImageSkia& image, int* leading, int* trailing) {
>       ^
> [6055/10203] CXX obj/src/3rdparty/chromium/ui/events/ozone/evdev/events_ozone_evdev.touch_evdev_debug_buffer.o
> FAILED: /home/cpa/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-g++ -MMD -MF obj/src/3rdparty/chromium/ui/events/ozone/evdev/events_ozone_evdev.touch_evdev_debug_buffer.o.d -DV8_DEPRECATION_WARNINGS -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -DNO_TCMALLOC -DDISABLE_NACL -DGL_GLEXT_PROTOTYPES -DEGL_EGLEXT_PROTOTYPES '-DOPENSSLDIR="/usr/lib/ssl"' -DOPENSSL_LOAD_CONF -DEGL_API_FB=1 -DLINUX=1 -DCHROMIUM_BUILD -DUI_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=1 -DUSE_OZONE=1 -DUSE_DEFAULT_RENDER_THEME=1 -DUSE_LIBJPEG_TURBO=1 -DENABLE_ONE_CLICK_SIGNIN -DENABLE_PRE_SYNC_BACKUP -DENABLE_MEDIA_ROUTER=1 -DENABLE_CONFIGURATION_POLICY -DENABLE_HIDPI=1 -DENABLE_TOPCHROME_MD=1 -DDONT_EMBED_BUILD_METADATA -DENABLE_BACKGROUND=1 -DCLD_VERSION=2 -DENABLE_APP_LIST=1 -DENABLE_SETTINGS_APP=1 -DENABLE_SUPERVISED_USERS=1 -DENABLE_MDNS=1 -DENABLE_SERVICE_DISCOVERY=1 -DEVENTS_OZONE_EVDEV_IMPLEMENTATION -DUSE_EVDEV -DUSE_OZONE_EVDEV=1 -DSK_SUPPORT_GPU=1 -DSK_IGNORE_LINEONLY_AA_CONVEX_PATH_OPTS -DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DU_STATIC_IMPLEMENTATION -DUSE_OPENSSL=1 -DUSE_OPENSSL_CERTS=1 -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -D_FORTIFY_SOURCE=2 -Igen/shim_headers/libpng/target -Igen -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/skia/config -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/skia/include/core -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/skia/include/effects -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/skia/include/pdf -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/skia/include/gpu -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/skia/include/lazy -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/skia/include/pathops -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/skia/include/pipe -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/skia/include/ports -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/skia/include/utils -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/skia/ext -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/icu/source/i18n -I/home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/third_party/icu/source/common -I/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include -fstack-protector --param=ssp-buffer-size=4  -pthread -fno-strict-aliasing -Wall -Wno-unused-parameter -Wno-missing-field-initializers -fvisibility=hidden -pipe -fPIC -Wno-unused-local-typedefs -I/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0 -I/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include -I/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0 -I/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include -mtune=cortex-a9 -mfpu=vfpv3-d16 -mfloat-abi=hard --sysroot=/home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot -O2 -fno-ident -fdata-sections -ffunction-sections -funwind-tables -fno-exceptions -fno-rtti -fno-threadsafe-statics -fvisibility-inlines-hidden -Wsign-compare -Wno-abi -std=gnu++11 -Wno-narrowing -Wno-literal-suffix  -c /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/events/ozone/evdev/touch_evdev_debug_buffer.cc -o obj/src/3rdparty/chromium/ui/events/ozone/evdev/events_ozone_evdev.touch_evdev_debug_buffer.o
> In file included from /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/events/ozone/evdev/touch_evdev_debug_buffer.cc:5:0:
> /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/events/ozone/evdev/touch_evdev_debug_buffer.h:37:15: error: field ?device_name_? has incomplete type ?std::__cxx11::string {aka std::__cxx11::basic_string<char>}?
>    std::string device_name_;
>                ^
> In file included from /home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/include/c++/5.4.0/iosfwd:39:0,
>                  from /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/base/memory/scoped_ptr.h:88,
>                  from /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/events/ozone/evdev/touch_evdev_debug_buffer.h:11,
>                  from /home/cpa/buildroot/output/build/qt5webengine-5.6.2/src/3rdparty/chromium/ui/events/ozone/evdev/touch_evdev_debug_buffer.cc:5:
> /home/cpa/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/include/c++/5.4.0/bits/stringfwd.h:71:11: note: declaration of ?std::__cxx11::string {aka class std::__cxx11::basic_string<char>}?
>      class basic_string;
>            ^
> [6055/10203] CXX obj/src/3rdparty/chromium/ui/events/ozone/evdev/events_ozone_evdev.touch_event_converter_evdev.o
> ninja: build stopped: subcommand failed.
> make[5]: *** [invoke_ninja] Error 1
> make[4]: *** [sub-gyp_run-pro-make_first] Error 2
> make[3]: *** [sub-core-make_first] Error 2
> make[2]: *** [sub-src-make_first] Error 2
> make[1]: *** [/home/cpa/buildroot/output/build/qt5webengine-5.6.2/.stamp_built] Error 2
> make: *** [_all] Error 2
> make: Leaving directory `/home/cpa/buildroot'
> cpa at CPA04:~/buildroot/package/qt5/qt5webengine$


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170608/a2594167/attachment.html>
