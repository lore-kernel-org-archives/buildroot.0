From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  6 May 2013 16:10:52 +0200
Subject: [Buildroot] [PATCH v4 0/5]   barebox new option and new boards
Message-ID: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v4:
  - add patch to use BR2_LINUX_KERNEL_LATEST_VERSION
  - change back BR2_TARGET_BAREBOX_2013_04 -> BR2_TARGET_BAREBOX_LATEST_VERSION
  - bump barebox
v3:
  - removed BR2_PREFER_STATIC_LIB=y from boards defconfigs
    as asked by Thoms
  - renamed BR2_TARGET_BAREBOX_LATEST_VERSION -> BR2_TARGET_BAREBOX_2013_04
    as asked by Thoms
v2:
  - Telit EVK-PRO3: use barebox custom version option

Fabio Porcedda (5):
  barebox: add custom version option
  barebox: bump version to 2013.05.0
  linux: use BR2_LINUX_KERNEL_LATEST_VERSION as option name
  configs: add defconfig for Telit EVK-PRO3
  configs: add defconfig for Atmel AT91SAM9260-EK Nand Flash Boot

 .../linux-ARM-at91-enable-nand-ubifs-boot.patch    |  44 ++++
 ...04.0-0001-watchdog-add-keep-alive-support.patch |  88 ++++++++
 ...02-watchdog-add-at91sam9-watchdog-support.patch | 228 +++++++++++++++++++++
 ...0003-at91sam9260-9g20-add-wathdog-support.patch |  40 ++++
 ...0004-at91sam9260-9g20-fix-wathdog-support.patch |  26 +++
 ...13.04.0-0005-watchdog-enable-for-evk-pro3.patch |  26 +++
 ...t91-at91_dt_defconfig-update-for-evk-pro3.patch |  44 ++++
 board/telit/evk-pro3/readme.txt                    |  28 +++
 boot/barebox/Config.in                             |  27 ++-
 configs/at91sam9260eknf_defconfig                  |  14 ++
 configs/telit_evk_pro3_defconfig                   |  15 ++
 linux/Config.in                                    |   4 +-
 12 files changed, 567 insertions(+), 17 deletions(-)
 create mode 100644 board/atmel/at91sam9260ek/linux-ARM-at91-enable-nand-ubifs-boot.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
 create mode 100644 board/telit/evk-pro3/linux-0001-ARM-at91-at91_dt_defconfig-update-for-evk-pro3.patch
 create mode 100644 board/telit/evk-pro3/readme.txt
 create mode 100644 configs/at91sam9260eknf_defconfig
 create mode 100644 configs/telit_evk_pro3_defconfig

-- 
1.8.1.4
