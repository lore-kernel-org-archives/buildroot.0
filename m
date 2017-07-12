From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 Jul 2017 02:55:27 +0300
Subject: [Buildroot] [PATCH 0/4] Update patches applied to WebKitGTK+,
	fix Wayland-only builds
Message-ID: <20170712235531.20444-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch set removes a patch which has been included upstream for a while,
and then adds two to fix the build for ARMv8-A, plus one patch to fix the
build when only Wayland is used (and X11 is disabled). All the patches were
pulled from their respective bug reports at bugs.webkit.org and they will be
included in future releases.

Tested by building for the Raspberry Pi 3, using raspberrypi3_defconfig as
starting point, which makes the cross-compiler specifically target ARMv8-A
(so it defined __ARCH_ARM_8A__ instead of the more generic __ARCH_ARM_8__).

Cheers,


Adrian Perez de Castro (4):
  webkitgtk: Remove patch uneeded for the current version
  webkitgtk: Add patches which allow building for ARMv8-A
  webkitgtk: Add patch to allow Wayland-only builds
  webkitgtk: Ensure that Mesa headers do not include X11 headers on
    Wayland builds

 ...lure-to-build-when-the-compiler-specifica.patch | 20 ++++++++
 package/webkitgtk/0001-fix-gcc6-builds.patch       | 53 ----------------------
 ...-to-build-when-the-compiler-specifically-.patch | 20 ++++++++
 .../webkitgtk/0003-angle-egl-wayland-support.patch | 45 ++++++++++++++++++
 package/webkitgtk/webkitgtk.mk                     |  3 ++
 5 files changed, 88 insertions(+), 53 deletions(-)
 create mode 100644 package/webkitgtk/0001-bmalloc-Failure-to-build-when-the-compiler-specifica.patch
 delete mode 100644 package/webkitgtk/0001-fix-gcc6-builds.patch
 create mode 100644 package/webkitgtk/0002-WTF-Failure-to-build-when-the-compiler-specifically-.patch
 create mode 100644 package/webkitgtk/0003-angle-egl-wayland-support.patch

-- 
2.13.2
