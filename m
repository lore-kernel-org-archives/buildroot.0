From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 10:03:40 +0200
Subject: [Buildroot] [PATCH v4 0/3] ARM Trusted Firmware packages
Message-ID: <1476518623-30654-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new iteration of Joao Pinto's patches to add packages for
the ARM Trusted Firmware bootloader, and the SCP Firmware used on the
ARM Juno platform.

The vexpress-firmware that contains the SCP Firmware is specific to
the ARM Juno.

The ARM Trusted Firmware package however can be used for other
platforms: lots of ARM64 platforms use ATF.

This new iteration improves a number of things compared to Joao's
proposal, the detailed changes are visible in the packages commit log
themselves.

Thomas

Joao Pinto (3):
  vexpress-firmware: new package
  arm-trusted-firmware: new package
  configs/arm_juno: add the bootloader build

 board/arm/juno/readme.txt                          | 21 ++++++-
 boot/Config.in                                     |  2 +
 boot/arm-trusted-firmware/Config.in                | 65 ++++++++++++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  3 +
 boot/arm-trusted-firmware/arm-trusted-firmware.mk  | 69 ++++++++++++++++++++++
 boot/vexpress-firmware/Config.in                   |  6 ++
 boot/vexpress-firmware/vexpress-firmware.mk        | 20 +++++++
 configs/arm_juno_defconfig                         | 10 ++++
 8 files changed, 193 insertions(+), 3 deletions(-)
 create mode 100644 boot/arm-trusted-firmware/Config.in
 create mode 100644 boot/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 boot/arm-trusted-firmware/arm-trusted-firmware.mk
 create mode 100644 boot/vexpress-firmware/Config.in
 create mode 100644 boot/vexpress-firmware/vexpress-firmware.mk

-- 
2.7.4
