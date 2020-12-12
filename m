From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Dec 2020 23:01:23 +0100
Subject: [Buildroot] [PATCH 0/4 v3] package/ti-stgx: tentative bump (branch
 yem/ti-sgx-stuff)
Message-ID: <cover.1607810474.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a respin based on the initial patch from Adam:
    https://patchwork.ozlabs.org/project/buildroot/patch/20200702201125.3639873-1-aduskett at gmail.com/

That patch did help some people (see the replies), but unfortunately it
still has a few shortcomings that I have tried to address.

The two most prominent changes this series implements are:

  - split the original patch into a subset to break the problem-space
    into more manageable pieces,

  - fix the build of qt5bqse when used with TI SGX GL stack (and
    probably with a few other similarly weird GL stacks), while still
    keeping buildability and functionality on all platforms.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Adam Duskett (3):
      configs/beaglebone_qt5: switch to using KMS instead of wayland+weston
      package/ti-sgx-demos: use KMS-based demos
      package/ti-sgx-{km, um}: bump to SDK 06.01.00.08 versions

Yann E. MORIN (1):
      package/qt5base: fix build with TI SGX GL stack

 Config.in.legacy                                   |  7 +++
 board/beaglebone/readme.txt                        | 12 ++++-
 .../rootfs_overlay/etc/qt5/eglfs_kms_cfg.json      | 15 ++++++
 configs/beaglebone_qt5_defconfig                   |  5 +-
 package/Config.in                                  |  1 -
 ...on-for-obscure-EGLNativeDisplayType-types.patch | 63 ++++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk                     |  4 +-
 package/ti-sgx-demos/ti-sgx-demos.mk               |  2 +-
 package/ti-sgx-km/ti-sgx-km.hash                   |  4 +-
 package/ti-sgx-km/ti-sgx-km.mk                     |  4 +-
 .../0001-Add-missing-sys-sysmacros.h-include.patch | 25 ---------
 package/ti-sgx-libgbm/Config.in                    | 12 -----
 package/ti-sgx-libgbm/ti-sgx-libgbm.hash           |  3 --
 package/ti-sgx-libgbm/ti-sgx-libgbm.mk             | 32 -----------
 package/ti-sgx-um/Config.in                        |  1 -
 package/ti-sgx-um/ti-sgx-um.hash                   |  4 +-
 package/ti-sgx-um/ti-sgx-um.mk                     |  4 +-
 17 files changed, 108 insertions(+), 90 deletions(-)
 create mode 100644 board/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json
 create mode 100644 package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch
 delete mode 100644 package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch
 delete mode 100644 package/ti-sgx-libgbm/Config.in
 delete mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.hash
 delete mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
