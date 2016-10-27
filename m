From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed, 26 Oct 2016 20:08:05 -0400
Subject: [Buildroot] [PATCH 0/2] add the TS-4600 board support
Message-ID: <20161027000807.20206-1-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following commits introduce the support of the TS-4600 board.

This board is a bit particular, the bootloader is based on a custom
imx-bootlets from Freescale and its code and toolchain are included
in the Linux code repository.

This bootloader combines the Linux image and the freescale bootstream
into one blob.
The package ts4600-bootrom has been introduced to reflect this logic.

Also, and because of missing drivers support in Linux, a tool from
Technologic System is required to access the FPGA registers and to
configure the ethernet PHY controller and feed the watchdog.
This tool has no repository or archive for the TS-4600 board family and
the source has been taken from the Technologic System FTP.
The package ts4600-tshwctl includes this source code so.

Best Regards,
Sebastien.

Sebastien Bourdelin (2):
  configs: add defconfig for TS-4600
  ts4600-tshwctl: add ts4600-tshwctl package

 board/technologic/ts4600/genimage.cfg    |   18 +
 board/technologic/ts4600/linux.fragment  |    2 +
 board/technologic/ts4600/post-image.sh   |   18 +
 board/technologic/ts4600/readme.txt      |   57 +
 boot/Config.in                           |    1 +
 boot/ts4600-bootrom/Config.in            |    6 +
 boot/ts4600-bootrom/ts4600-bootrom-sign  |  124 ++
 boot/ts4600-bootrom/ts4600-bootrom.mk    |   33 +
 configs/ts4600_defconfig                 |   21 +
 package/Config.in                        |    1 +
 package/ts4600-tshwctl/Config.in         |    8 +
 package/ts4600-tshwctl/S00watchdogd      |   30 +
 package/ts4600-tshwctl/S01ethswitch      |   21 +
 package/ts4600-tshwctl/src/Makefile      |   16 +
 package/ts4600-tshwctl/src/i2c-dev.h     |  335 +++
 package/ts4600-tshwctl/src/ispspi.c      |  132 ++
 package/ts4600-tshwctl/src/ispvm.c       | 3408 ++++++++++++++++++++++++++++++
 package/ts4600-tshwctl/src/tshwctl.c     | 2904 +++++++++++++++++++++++++
 package/ts4600-tshwctl/src/vmopcode.h    |  192 ++
 package/ts4600-tshwctl/ts4600-tshwctl.mk |   23 +
 20 files changed, 7350 insertions(+)
 create mode 100644 board/technologic/ts4600/genimage.cfg
 create mode 100644 board/technologic/ts4600/linux.fragment
 create mode 100755 board/technologic/ts4600/post-image.sh
 create mode 100644 board/technologic/ts4600/readme.txt
 create mode 100644 boot/ts4600-bootrom/Config.in
 create mode 100755 boot/ts4600-bootrom/ts4600-bootrom-sign
 create mode 100644 boot/ts4600-bootrom/ts4600-bootrom.mk
 create mode 100644 configs/ts4600_defconfig
 create mode 100644 package/ts4600-tshwctl/Config.in
 create mode 100644 package/ts4600-tshwctl/S00watchdogd
 create mode 100644 package/ts4600-tshwctl/S01ethswitch
 create mode 100644 package/ts4600-tshwctl/src/Makefile
 create mode 100644 package/ts4600-tshwctl/src/i2c-dev.h
 create mode 100644 package/ts4600-tshwctl/src/ispspi.c
 create mode 100644 package/ts4600-tshwctl/src/ispvm.c
 create mode 100644 package/ts4600-tshwctl/src/tshwctl.c
 create mode 100644 package/ts4600-tshwctl/src/vmopcode.h
 create mode 100644 package/ts4600-tshwctl/ts4600-tshwctl.mk

-- 
2.10.0
