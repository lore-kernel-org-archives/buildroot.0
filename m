From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  6 Jan 2013 21:56:19 +0100
Subject: [Buildroot] [pull request] Pull request for branch rpi-support
Message-ID: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Version 3 of this series regarding the support of the RaspberryPi board.

    - libcofi :
        - License added
        - Fixes of the make option
        - Fixes of the install
    - rpi-userland :
        - Added a patch from Floris Bos so the userland could compile with
        uClibc
        - Added the dependency to BR2_INSTALL_LIBSTDCPP and BR2_LARGEFILE
    - rpi-firmware :
        - Getting rid of the cmdline.txt files
        - Add the cmline in config.txt along with a comment encouraging the user
        to create its own config.txt
        - Moving all results in BINARIES_DIR instead of TARGET_DIR

The following changes since commit 4ec970246547dce915aaeff8394a3b0303a205db:

  sam-ba: select BR2_HOSTARCH_NEEDS_IA32_LIBS (2013-01-06 21:37:40 +0100)

are available in the git repository at:

  http://github.com/maximeh/buildroot.git rpi-support

for you to fetch changes up to 5460810c1bece1a398cf9a97e7ee521d75cf05f2:

  rpi-firmware: New package (2013-01-06 21:49:27 +0100)

----------------------------------------------------------------
Maxime Hadjinlian (3):
      libcofi: new package
      rpi-userland: new package
      rpi-firmware: New package

 package/Config.in                                  |    3 +
 package/libcofi/Config.in                          |    8 +++
 package/libcofi/libcofi.mk                         |   20 ++++++
 package/rpi-firmware/Config.in                     |    9 +++
 package/rpi-firmware/config.txt                    |   13 ++++
 package/rpi-firmware/rpi-firmware.mk               |   21 ++++++
 package/rpi-userland/Config.in                     |   18 +++++
 ...0002-Test-for-the-existence-of-execinfo-h.patch |   69 ++++++++++++++++++++
 ...make-vmcs.cmake-allow-to-override-VMCS_IN.patch |   26 ++++++++
 package/rpi-userland/rpi-userland.mk               |   20 ++++++
 10 files changed, 207 insertions(+)
 create mode 100644 package/libcofi/Config.in
 create mode 100644 package/libcofi/libcofi.mk
 create mode 100644 package/rpi-firmware/Config.in
 create mode 100644 package/rpi-firmware/config.txt
 create mode 100644 package/rpi-firmware/rpi-firmware.mk
 create mode 100644 package/rpi-userland/Config.in
 create mode 100644 package/rpi-userland/rpi-userland-0002-Test-for-the-existence-of-execinfo-h.patch
 create mode 100644 package/rpi-userland/rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
 create mode 100644 package/rpi-userland/rpi-userland.mk

Regards,
Maxime Hadjinlian

--
