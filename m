From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 19 May 2015 16:21:39 +0200
Subject: [Buildroot] [PATCH v3 0/9] configs: defconfigs for Atmel boards
Message-ID: <1432045308-16825-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series updates and adds defconfigs for the recent(ish) atmel boards. They
use Atmel's u-boot and kernel tree and are meant to be flashed on the NAND
flash.

It also provides a flahing helper to ease the flashing of the board and
includes documentation on how to do so.

Changes in v3:
 - select 3.18 headers for the toolchain
 - rename the documentation
 - update the flasher helper to support more boards
 - update the tcl script to the latest version from Atmel (demos v4.7)
   It has better debug messages and takes the dtb filename as a parameter
   It also supports giving different video modes to support the DRM/KMS display driver

Changes in v2:
 - Add flashing helper and instructions
 - Update the existing xplained readme
 - Use commit ids instead of branch names
 - Include ubi image generation in the defconfig

Alexandre Belloni (9):
  configs: update at91sam9g45m10ek defconfig
  configs: add defconfig for Atmel at91sam9rlek
  configs: add defconfig for Atmel at91sam9x5ek
  configs: add defconfig for Atmel sama5d3xek
  configs: add defconfig for Atmel sama5d4ek
  configs: add defconfig for Atmel sama5d4 Xplained Ultra
  configs: add defconfig for Atmel sama5d3 Xplained
  atmel: add a flashing helper and documentation
  configs: rename atmel_xplained_defconfig

 board/atmel/flasher.sh                             | 136 ++++++++
 board/atmel/nandflash.tcl                          | 358 +++++++++++++++++++++
 board/atmel/readme.txt                             | 107 ++++++
 board/atmel/xplained/readme.txt                    |   8 +-
 configs/at91sam9g45m10ek_defconfig                 |  25 +-
 configs/at91sam9rlek_defconfig                     |  24 ++
 configs/at91sam9x5ek_defconfig                     |  25 ++
 configs/atmel_sama5d3_xplained_defconfig           |  29 ++
 ...config => atmel_sama5d3_xplained_mmc_defconfig} |   0
 configs/atmel_sama5d3xek_defconfig                 |  29 ++
 configs/atmel_sama5d4_xplained_defconfig           |  33 ++
 configs/atmel_sama5d4ek_defconfig                  |  33 ++
 12 files changed, 798 insertions(+), 9 deletions(-)
 create mode 100755 board/atmel/flasher.sh
 create mode 100644 board/atmel/nandflash.tcl
 create mode 100644 board/atmel/readme.txt
 create mode 100644 configs/at91sam9rlek_defconfig
 create mode 100644 configs/at91sam9x5ek_defconfig
 create mode 100644 configs/atmel_sama5d3_xplained_defconfig
 rename configs/{atmel_xplained_defconfig => atmel_sama5d3_xplained_mmc_defconfig} (100%)
 create mode 100644 configs/atmel_sama5d3xek_defconfig
 create mode 100644 configs/atmel_sama5d4_xplained_defconfig
 create mode 100644 configs/atmel_sama5d4ek_defconfig

-- 
2.1.4
