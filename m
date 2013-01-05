From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  5 Jan 2013 23:55:13 +0100
Subject: [Buildroot] [pull request] Pull request for branch rpi-support
Message-ID: <cover.1357426077.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This is the second version of this series adding some specific RaspberryPi
packages.
The following changes were applied :

    - rpi-fw -> rpi-firmware
        - Now appears in Hardware Handling -> Misc devices fimwares
        - License fixed
        - cmdline.txt files has been merged with config.txt
    - rpi-userland
        - License fixed
        - Applied Samuel Martin's patch to remove most of the cleanup hooks
        - Removed libcofi as a dependency

The following changes since commit 00e1e2aaa881b32f388ddcfcc71224b3c574c0b8:

  xorg-release: ignore some X.org packages (2013-01-05 23:46:52 +0100)

are available in the git repository at:

  http://github.com/maximeh/buildroot.git rpi-support

for you to fetch changes up to 033a0b8264805de1fb670bf727c756b94d4eb34b:

  rpi-firmware: New package (2013-01-05 23:46:52 +0100)

----------------------------------------------------------------
Maxime Hadjinlian (3):
      libcofi: new package
      rpi-userland: new package
      rpi-firmware: New package

 package/Config.in                                  |    3 +++
 package/libcofi/Config.in                          |    8 ++++++
 package/libcofi/libcofi.mk                         |   17 +++++++++++++
 package/rpi-firmware/Config.in                     |    9 +++++++
 package/rpi-firmware/config.txt                    |   13 ++++++++++
 package/rpi-firmware/rpi-firmware.mk               |   21 ++++++++++++++++
 package/rpi-userland/Config.in                     |   11 +++++++++
 ...make-vmcs.cmake-allow-to-override-VMCS_IN.patch |   26 ++++++++++++++++++++
 package/rpi-userland/rpi-userland.mk               |   19 ++++++++++++++
 9 files changed, 127 insertions(+)
 create mode 100644 package/libcofi/Config.in
 create mode 100644 package/libcofi/libcofi.mk
 create mode 100644 package/rpi-firmware/Config.in
 create mode 100644 package/rpi-firmware/config.txt
 create mode 100644 package/rpi-firmware/rpi-firmware.mk
 create mode 100644 package/rpi-userland/Config.in
 create mode 100644 package/rpi-userland/rpi-userland-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
 create mode 100644 package/rpi-userland/rpi-userland.mk

Regards,
Maxime Hadjinlian

--
