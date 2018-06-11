From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 11 Jun 2018 10:42:49 -0700
Subject: [Buildroot] Test of Joseph Kogut Chromium patches V3
In-Reply-To: <5936aa62-5aec-877f-7ad6-e39c991005a2@tidomat.se>
References: <mailman.2198.1528722821.16495.buildroot@busybox.net>
 <5936aa62-5aec-877f-7ad6-e39c991005a2@tidomat.se>
Message-ID: <CAMWSM7jTQRr45PzSFv07i7VX7PDSbbSA-qoKoUqLgv4_W8niKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sven,

Forwarding this to the mailing list.

If you are already subscribed, keep in mind that your message will
automatically be rejected if it's not sent as plain text.

<snip>

> I have applied V3 Chromium patches to 2018.05 and it goes this far:
>
>>>> chromium 67.0.3396.79 Configuring
> mkdir -p
> /home/tidomat/Desktop/buildroot-2018.05/output/build/chromium-67.0.3396.79/third_party/node/linux/node-linux-x64/bin
> ln -sf /home/tidomat/Desktop/buildroot-2018.05/output/host/bin/node
> /home/tidomat/Desktop/buildroot-2018.05/output/build/chromium-67.0.3396.79/third_party/node/linux/node-linux-x64/bin/
> # The host's toolchain (GCC) is used for generating binaries that are to be
> # run on the host. We can use Buildroot's HOST_*FLAGS variables for this
> # toolchain.
> #
> # The generated host-clang toolchain is used for binaries that are built for
> # the target, as well as for the V8 engine that's used to generate the V8
> # snapshot on the host.
> ( cd
> /home/tidomat/Desktop/buildroot-2018.05/output/build/chromium-67.0.3396.79;
> PATH="/home/tidomat/Desktop/buildroot-2018.05/output/host/bin:/home/tidomat/Desktop/buildroot-2018.05/output/host/sbin:/home/tidomat/bin:/home/tidomat/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> /home/tidomat/Desktop/buildroot-2018.05/output/host/bin/python2
> tools/gn/bootstrap/bootstrap.py -s --no-clean; HOST_AR="/usr/bin/ar"
> HOST_NM="/usr/bin/nm" HOST_CC="/usr/bin/gcc" HOST_CXX="/usr/bin/g++"
> HOST_CFLAGS="-O2
> -I/home/tidomat/Desktop/buildroot-2018.05/output/host/include"
> HOST_CXXFLAGS="-O2
> -I/home/tidomat/Desktop/buildroot-2018.05/output/host/include"
> V8_AR="/usr/bin/ar" V8_NM="/usr/bin/nm" V8_CC="clang" V8_CXX="clang++"
> V8_CFLAGS="--target=x86_64-buildroot-linux-gnu"
> V8_CXXFLAGS="--target=x86_64-buildroot-linux-gnu"
> V8_LDFLAGS="--gcc-toolchain="/usr"" TARGET_AR="ar" TARGET_NM="nm"
> TARGET_CC="clang" TARGET_CXX="clang++"
> TARGET_CFLAGS="--gcc-toolchain=/home/tidomat/Desktop/buildroot-2018.05/output/host"
> TARGET_CXXFLAGS="--gcc-toolchain=/home/tidomat/Desktop/buildroot-2018.05/output/host"
> TARGET_LDFLAGS="--gcc-toolchain=/home/tidomat/Desktop/buildroot-2018.05/output/host"
> out/Release/gn gen out/Release
> --args="host_toolchain=\"/home/tidomat/Desktop/buildroot-2018.05/package/chromium/toolchain:host\"
> v8_snapshot_toolchain=\"/home/tidomat/Desktop/buildroot-2018.05/package/chromium/toolchain:v8_snapshot\"
> custom_toolchain=\"/home/tidomat/Desktop/buildroot-2018.05/package/chromium/toolchain:target\"
> use_lld=true is_clang=true clang_use_chrome_plugins=false
> treat_warnings_as_errors=false use_gnome_keyring=false
> linux_use_bundled_binutils=false use_sysroot=false
> target_sysroot=\"/home/tidomat/Desktop/buildroot-2018.05/output/host/arm-buildroot-linux-gnueabihf/sysroot\"
> target_cpu=\""arm"\" enable_nacl=false use_dbus=true use_cups=true
> use_system_zlib=true use_system_libjpeg=true use_system_libpng=true
> use_system_libdrm=true use_system_harfbuzz=true use_system_freetype=true
> use_allocator=\"none\" is_debug=false use_pulseaudio=false use_gtk3=false"
> --script-executable=/home/tidomat/Desktop/buildroot-2018.05/output/host/bin/python2
> )
> Building gn manually in a temporary directory for bootstrapping...
> ninja: Entering directory
> `/home/tidomat/Desktop/buildroot-2018.05/output/build/chromium-67.0.3396.79/out_bootstrap'
> [412/412] LINK gn
> ERROR at //printing/BUILD.gn:146:22: Script returned non-zero exit code.
>       cups_version = exec_script("cups_config_helper.py",
>                      ^----------
> Current dir:
> /home/tidomat/Desktop/buildroot-2018.05/output/build/chromium-67.0.3396.79/out/Release/
> Command: /home/tidomat/Desktop/buildroot-2018.05/output/host/bin/python2
> --
> /home/tidomat/Desktop/buildroot-2018.05/output/build/chromium-67.0.3396.79/printing/cups_config_helper.py
> --api-version
> Returned 1.
> stderr:
>
> Traceback (most recent call last):
>   File
> "/home/tidomat/Desktop/buildroot-2018.05/output/build/chromium-67.0.3396.79/printing/cups_config_helper.py",
> line 106, in <module>
>     sys.exit(main())
>   File
> "/home/tidomat/Desktop/buildroot-2018.05/output/build/chromium-67.0.3396.79/printing/cups_config_helper.py",
> line 76, in main
>     subprocess.call([cups_config, '--api-version'])
>   File
> "/home/tidomat/Desktop/buildroot-2018.05/output/host/lib/python2.7/subprocess.py",
> line 168, in call
>     return Popen(*popenargs, **kwargs).wait()
>   File
> "/home/tidomat/Desktop/buildroot-2018.05/output/host/lib/python2.7/subprocess.py",
> line 390, in __init__
>     errread, errwrite)
>   File
> "/home/tidomat/Desktop/buildroot-2018.05/output/host/lib/python2.7/subprocess.py",
> line 1025, in _execute_child
>     raise child_exception
> OSError: [Errno 2] No such file or directory
>
> See //BUILD.gn:141:7: which caused the file to be included.
>       "//printing:printing_unittests",
>       ^------------------------------
> package/pkg-generic.mk:213: recipe for target
> '/home/tidomat/Desktop/buildroot-2018.05/output/build/chromium-67.0.3396.79/.stamp_configured'
> failed
> make[1]: ***
> [/home/tidomat/Desktop/buildroot-2018.05/output/build/chromium-67.0.3396.79/.stamp_configured]
> Error 1
> Makefile:79: recipe for target '_all' failed
> make: *** [_all] Error 2
>
>

On Mon, Jun 11, 2018 at 7:34 AM, Sven Norinder <sven.norinder@tidomat.se> wrote:
> Sorry forgot to say: building for RPi3 armhf on X64.
>
> /Sven
>
>

Please bottom post, it makes the conversation easier to follow. Could
you include your config?

I haven't seen this error before, it appears to me that the Chromium
build is attempting to run a script called cups_config_helper.py, and
it doesn't exist. This file should be part of the source distribution.
I have it in my tree at
output/build/chromium-67.0.3396.79/printing/cups_config_helper.py.

We could also probably make cups/printing support an optional
dependency, based on whether or not cups is enabled.

Lastly, these patches are based on the master branch. Could you retry a
clean build on that branch?

Best regards,

Joseph
