From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 10 May 2013 12:03:38 +0200
Subject: [Buildroot] [PATCH v6 0/2] new boards
Message-ID: <1368180220-458-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v6:
  - use defconfig file instead of a patch
  - lock linux version 3.9.1 for kernel and headers
v5:
  - drop already accepted patches
  - add comments to the defconfigs
  - add comment about pro3 watchdog
  - add BR2_arm926t=y
  - lock down kernel and headers
v4:
  - add patch to use BR2_LINUX_KERNEL_LATEST_VERSION
  - change back BR2_TARGET_BAREBOX_2013_04 -> BR2_TARGET_BAREBOX_LATEST_VERSION
  - bump barebox
v3:
  - removed BR2_PREFER_STATIC_LIB=y from boards defconfigs
    as asked by Thomas
  - renamed BR2_TARGET_BAREBOX_LATEST_VERSION -> BR2_TARGET_BAREBOX_2013_04
    as asked by Thomas
v2:
  - Telit EVK-PRO3: use barebox custom version option

Fabio Porcedda (2):
  configs: add defconfig for Telit EVK-PRO3
  configs: add defconfig for Atmel AT91SAM9260-EK Nand Flash Boot

 board/atmel/at91sam9260ek/linux-3.9.config         |  98 +++++++++
 ...04.0-0001-watchdog-add-keep-alive-support.patch |  88 ++++++++
 ...02-watchdog-add-at91sam9-watchdog-support.patch | 228 +++++++++++++++++++++
 ...0003-at91sam9260-9g20-add-wathdog-support.patch |  40 ++++
 ...0004-at91sam9260-9g20-fix-wathdog-support.patch |  26 +++
 ...13.04.0-0005-watchdog-enable-for-evk-pro3.patch |  26 +++
 board/telit/evk-pro3/linux-3.9.config              | 201 ++++++++++++++++++
 board/telit/evk-pro3/readme.txt                    |  28 +++
 configs/at91sam9260eknf_defconfig                  |  32 +++
 configs/telit_evk_pro3_defconfig                   |  33 +++
 10 files changed, 800 insertions(+)
 create mode 100644 board/atmel/at91sam9260ek/linux-3.9.config
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
 create mode 100644 board/telit/evk-pro3/linux-3.9.config
 create mode 100644 board/telit/evk-pro3/readme.txt
 create mode 100644 configs/at91sam9260eknf_defconfig
 create mode 100644 configs/telit_evk_pro3_defconfig

-- 
1.8.1.4
