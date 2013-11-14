From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Thu, 14 Nov 2013 14:42:54 -0200
Subject: [Buildroot] qt5base: Regression with 2013.11_rc1 or HEAD
Message-ID: <CAAEAJfA07aJ29cyQfXGb-rCjD7HfBPbwbpodb9iHSk+U5MG+aQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Fatih,

One of the Qt5 patches no longer applies. Mind taking a look?

The relevant config is:

http://sprunge.us/MTQc

zeta at localhost ~/buildroot/buildroot-ppst $ make qt5base
>>> qt5base 5.1.1 Extracting
xzcat /home/zeta/buildroot/buildroot-ppst/dl/qtbase-opensource-src-5.1.1.tar.xz
| tar --strip-components=1 -C
/home/zeta/buildroot/buildroot-ppst/output/build/qt5base-5.1.1  -xf -
>>> qt5base 5.1.1 Patching

Applying qt5base-0001-xcb-Add-egl-cflags-when-opengles2-is-enabled.patch
using patch:
patching file src/plugins/platforms/xcb/xcb-plugin.pro

Applying qt5base-0002-mkspecs-files.patch using patch:
patching file mkspecs/devices/linux-buildroot-g++/qmake.conf
patching file mkspecs/devices/linux-buildroot-g++/qplatformdefs.h

Applying qt5base-0003-uclibc-no-lfs.patch using patch:
patching file mkspecs/common/posix/qplatformdefs.h

Applying qt5base-0004-egl-cflags.patch using patch:
patching file configure
Hunk #1 succeeded at 5391 (offset 457 lines).
patching file mkspecs/features/egl.prf

Applying qt5base-0005-fix-gui-build-without-png.patch using patch:
patching file src/gui/kernel/qplatformtheme.cpp

Applying qt5base-0006-qeglfshooksrpi-update-vc_dispmanx_element_change_attributes.patch
using patch:
patching file mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp

Applying qt5base-0007-detect-posix_fallocate-at-configure-time.patch
using patch:
patching file config.tests/unix/posix_fallocate/posix_fallocate.cpp
patching file config.tests/unix/posix_fallocate/posix_fallocate.pro
patching file configure
Hunk #1 succeeded at 952 (offset -16 lines).
Hunk #2 succeeded at 5535 (offset -119 lines).
Hunk #3 succeeded at 5878 (offset -102 lines).
Hunk #4 succeeded at 6383 with fuzz 1 (offset -79 lines).
patching file src/3rdparty/sqlite.pri
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- saving rejects to file src/3rdparty/sqlite.pri.rej
patching file src/3rdparty/sqlite/sqlite3.c
Patch failed!  Please fix
qt5base-0007-detect-posix_fallocate-at-configure-time.patch!
make: *** [/home/zeta/buildroot/buildroot-ppst/output/build/qt5base-5.1.1/.stamp_patched]
Error 1


-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
