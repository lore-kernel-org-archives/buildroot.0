From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 21:10:09 +0100
Subject: [Buildroot] [PATCH 0/3] rpi: bumps,
	and support for rpi2 (branch yem/rpi-bumps)
Message-ID: <cover.1424635766.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series bumps the RPi packages, and adds support for the Raspberry Pi 2.

Thanks to James and Guillermo for independently providing similar patchsets
to add support for the RPi-2. :-)

Regards,
Yann E. MORIN.


The following changes since commit 7b46d551e6b7f62f1cd0483357a68b90107c509a:

  weston: add patch to fix uClibc build caused CLOCK_BOOTTIME (2015-02-22 12:45:26 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/rpi-bumps

for you to fetch changes up to ce51aa53f9f02f95284eb78edef084896dbc94bb:

  configs: add Raspberry Pi 2 defconfig (2015-02-22 21:08:40 +0100)

----------------------------------------------------------------
James Hebden (2):
      package/rpi-firmware: bump version
      configs: add Raspberry Pi 2 defconfig

Yann E. MORIN (1):
      package/rpi-userland: bump version

 configs/raspberrypi2_defconfig                     |  15 +++
 package/rpi-firmware/rpi-firmware.mk               |   9 +-
 ...s-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch} | 108 ++++++++++++--------
 ...make-vmcs.cmake-allow-to-override-VMCS_IN.patch |   7 +-
 ...emove-faulty-assert-to-make-weston-happy-.patch |  33 ++++++
 .../rpi-userland/0003-remove-faulty-assert.patch   |  21 ----
 package/rpi-userland/0004-fix-musl-compile.patch   | 113 ---------------------
 package/rpi-userland/rpi-userland.mk               |   2 +-
 8 files changed, 119 insertions(+), 189 deletions(-)
 create mode 100644 configs/raspberrypi2_defconfig
 rename package/rpi-userland/{0001-add-pkgconfig-files.patch => 0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch} (60%)
 create mode 100644 package/rpi-userland/0003-interface-remove-faulty-assert-to-make-weston-happy-.patch
 delete mode 100644 package/rpi-userland/0003-remove-faulty-assert.patch
 delete mode 100644 package/rpi-userland/0004-fix-musl-compile.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
