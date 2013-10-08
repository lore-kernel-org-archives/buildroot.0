From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 00:09:46 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem/rpi-wayland
Message-ID: <cover.1381269937.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series makes it possible to run weston on the raspberrypi.

The series:
  - starts with three fixes (patches 1 through 3)
  - then bumps wayland and weston (patches 4 and 5)
  - fixes weston configure.ac with patches from upstream (patches 6 and 7)
  - modifies weston to build more than one compositor (patch 8)
  - fixes rpi-userland (patch 9)
  - actualt enables the rpicompoisotor in weston (path 10)
  - prepares EGL support for compositors (patch 11)

Please pay special attention to commit logs of patches 6 and 9, they are
tricky. I can add more details, or reworks them, if need be.

Regards,
Yann E. MORIN.


The following changes since commit 637421c51f854414c8ecbaf047d1bddd2ac411cd:

  lvm2: bump to version 2.02.103 and add license information (2013-10-08 22:54:45 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/rpi-wayland

for you to fetch changes up to fd39ceba9fbd9a3ca62b4920112316a573c76525:

  package/weston: add option to enable EGL (2013-10-08 23:21:55 +0200)

----------------------------------------------------------------
Yann E. MORIN (11):
      package/rpi-userland: rename patches
      package/weston: fix variable name
      package/weston: requires host-pkgconf
      package/wayland: bump version
      package/weston: bump version
      package/weston: fix configure.ac to check for wayland-scanner
      package/weston: fix configure.ac for fbdev compositor
      package/weston: introduce infrastructure to select other compositors
      package/rpi-userland: add patch to remove faulty assert()
      package/weston: add RPi compositor
      package/weston: add option to enable EGL

 ... => rpi-userland-000-add-pkgconfig-files.patch} |  0
 ...ake-vmcs.cmake-allow-to-override-VMCS_IN.patch} |  0
 .../rpi-userland-002-remove-faulty-assert.patch    | 21 ++++++++++++++
 package/wayland/wayland.mk                         |  3 +-
 package/weston/Config.in                           | 23 ++++++++++++++--
 ...02-fix-configure.ac-check-wayland-scanner.patch | 26 ++++++++++++++++++
 ...ompositor-fbdev-drop-dependency-on-libdrm.patch | 22 +++++++++++++++
 package/weston/weston.mk                           | 32 ++++++++++++++++++----
 8 files changed, 119 insertions(+), 8 deletions(-)
 rename package/rpi-userland/{rpi-userland-add-pkgconfig-files.patch => rpi-userland-000-add-pkgconfig-files.patch} (100%)
 rename package/rpi-userland/{rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch => rpi-userland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch} (100%)
 create mode 100644 package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch
 create mode 100644 package/weston/weston-0002-fix-configure.ac-check-wayland-scanner.patch
 create mode 100644 package/weston/weston-0003-compositor-fbdev-drop-dependency-on-libdrm.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
