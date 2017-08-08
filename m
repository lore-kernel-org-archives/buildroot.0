From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 Aug 2017 19:47:34 +0000
Subject: [Buildroot] [Bug 10021] libqeglfs-viv-integration.so file is
 missing for qt5 on armv7
In-Reply-To: <bug-10021-163@https.bugs.busybox.net/>
References: <bug-10021-163@https.bugs.busybox.net/>
Message-ID: <bug-10021-163-swSNMIlN4G@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10021

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Refik Tuzakli from comment #0)

Hello Refik,

did a buildroot compile with your defconfig file, your missing
libqeglfs-viv-integration.so file is compiled and installed here:

$ find target   -name "*-viv-*"
target/usr/lib/qt/plugins/egldeviceintegrations/libqeglfs-viv-integration.so

Mind to try a complete rebuild (after 'make clean')?

In case of failure please post the qt5base configure summary output, e.g.:

Configure summary:

Building on: linux-g++ (x86_64, CPU features: mmx sse sse2)
Building for: devices/linux-buildroot-g++ (arm, CPU features: <none>)
Configuration: cross_compile compile_examples enable_new_dtags largefile shared
release c++11 c++14 c++1z concurrent dbus mremap reduce_exports release_tools
stl
Build options:
  Mode ................................... release; optimized tools
  Optimize release build for size ........ no
  Building shared libraries .............. yes
  Using C++ standard ..................... C++1z
  Using gold linker ...................... no
  Using new DTAGS ........................ yes
  Using precompiled headers .............. no
  Using LTCG ............................. no
  Target compiler supports:
    NEON ................................. no
  Build parts ............................ examples libs
Qt modules and options:
[...]
  EGL .................................... yes
  OpenVG ................................. yes
  OpenGL:
    Desktop OpenGL ....................... no
    OpenGL ES 2.0 ........................ yes
    OpenGL ES 3.0 ........................ yes
    OpenGL ES 3.1 ........................ no
  Session Management ..................... yes
Features used by QPA backends:
  evdev .................................. yes
  libinput ............................... yes
  INTEGRITY HID .......................... no
  mtdev .................................. yes
  tslib .................................. yes
  xkbcommon-evdev ........................ no
QPA backends:
  DirectFB ............................... no
  EGLFS .................................. yes
  EGLFS details:
    EGLFS i.Mx6 .......................... yes
    EGLFS i.Mx6 Wayland .................. no
    EGLFS EGLDevice ...................... no
    EGLFS GBM ............................ no
    EGLFS Mali ........................... no
    EGLFS Raspberry Pi ................... no
    EGL on X11 ........................... no
  LinuxFB ................................ no
[...]


And additinonal the lines about the egl-viv test:

> gmake[2]: Entering directory '.../build/qt5base-5.9.1/config.tests/qpa/eglfs-viv'
[...]
> gmake[2]: Leaving directory '.../build/qt5base-5.9.1/config.tests/qpa/eglfs-viv'
test config.gui.tests.egl-viv succeeded

Did only a compile test here, no runtime test, because of lack of i.mx6 board
at hand...

Regards,
Peter

-- 
You are receiving this mail because:
You are on the CC list for the bug.
