From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 22:46:06 +0200
Subject: [Buildroot] [pull request v5] Pull request for branch
	for-2011.08/bootloaders
Message-ID: <cover.1310417153.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit bd76bc5f80b963570e8eda92efc961e683264402:

  CHANGES: update with recent changes (2011-07-11 07:44:24 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.08/bootloaders

Philippe Reynes (1):
      Add x-loader bootloader

Thomas Petazzoni (10):
      linux: rename LINUX26 to LINUX
      linux: convert to the GENTARGETS infrastructure
      u-boot: rename to uboot
      Improve TARGETS handling for bootloaders and kernel
      linux: allow specification of a custom Git repository as a source
      u-boot: allow specification of custom Git repo as source
      barebox: bump version
      at91dataflashboot: use "config" instead of "menuconfig"
      linux: add support for 3.x and -rc versions
      uboot: Add 2011.06, remove 2010.03

 boot/Config.in                              |    3 +-
 boot/at91bootstrap/at91bootstrap.mk         |    8 -
 boot/at91dataflashboot/Config.in            |    2 +-
 boot/at91dataflashboot/at91dataflashboot.mk |    9 --
 boot/barebox/barebox.mk                     |    5 +-
 boot/grub/grub.mk                           |    9 --
 boot/syslinux/syslinux.mk                   |    9 --
 boot/u-boot/u-boot-2010.03-fix-avr32.patch  |    5 -
 boot/{u-boot => uboot}/Config.in            |   24 +++-
 boot/{u-boot/u-boot.mk => uboot/uboot.mk}   |   90 +++++-------
 boot/xloader/Config.in                      |   15 ++
 boot/xloader/xloader.mk                     |   37 +++++
 linux/Config.in                             |   15 ++
 linux/linux.mk                              |  208 ++++++++++++++-------------
 package/Makefile.package.in                 |   16 ++-
 15 files changed, 248 insertions(+), 207 deletions(-)
 delete mode 100644 boot/u-boot/u-boot-2010.03-fix-avr32.patch
 rename boot/{u-boot => uboot}/Config.in (85%)
 rename boot/{u-boot/u-boot.mk => uboot/uboot.mk} (57%)
 create mode 100644 boot/xloader/Config.in
 create mode 100644 boot/xloader/xloader.mk

Thanks,
-- 
Thomas Petazzoni
