From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Thu, 26 May 2016 17:03:51 -0400
Subject: [Buildroot] [PATCH v3 0/2] ARM: ts4800: add basic board support
Message-ID: <1464296633-1880-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds support for the TS-4800 SoM manufactured by
Technologic Systems based on the Freescale i.MX515 SoC.

Patrick Keroulas (2):
  ts4800-mbrboot: new package
  configs: add defconfig for TS-4800

 board/technologic/ts4800/genimage.cfg              | 37 +++++++++++
 board/technologic/ts4800/linux.fragment            |  3 +
 ...800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch | 36 +++++++++++
 .../uboot/0002-ts4800-patch-env-to-boot-dts.patch  | 56 +++++++++++++++++
 board/technologic/ts4800/post-image.sh             | 23 +++++++
 configs/ts4800_defconfig                           | 28 +++++++++
 package/Config.in                                  |  1 +
 package/ts4800-mbrboot/Config.in                   |  5 ++
 package/ts4800-mbrboot/src/LICENSE                 | 25 ++++++++
 package/ts4800-mbrboot/src/Makefile                | 21 +++++++
 package/ts4800-mbrboot/src/mbrboot.c               | 72 ++++++++++++++++++++++
 package/ts4800-mbrboot/src/mbrboot.ld              | 56 +++++++++++++++++
 package/ts4800-mbrboot/ts4800-mbrboot.mk           | 22 +++++++
 13 files changed, 385 insertions(+)
 create mode 100644 board/technologic/ts4800/genimage.cfg
 create mode 100644 board/technologic/ts4800/linux.fragment
 create mode 100644 board/technologic/ts4800/patches/uboot/0001-ts4800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch
 create mode 100644 board/technologic/ts4800/patches/uboot/0002-ts4800-patch-env-to-boot-dts.patch
 create mode 100755 board/technologic/ts4800/post-image.sh
 create mode 100644 configs/ts4800_defconfig
 create mode 100644 package/ts4800-mbrboot/Config.in
 create mode 100644 package/ts4800-mbrboot/src/LICENSE
 create mode 100644 package/ts4800-mbrboot/src/Makefile
 create mode 100644 package/ts4800-mbrboot/src/mbrboot.c
 create mode 100644 package/ts4800-mbrboot/src/mbrboot.ld
 create mode 100644 package/ts4800-mbrboot/ts4800-mbrboot.mk

-- 
1.9.1
