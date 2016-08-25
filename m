From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 25 Aug 2016 17:04:38 +0300
Subject: [Buildroot] [PATCH v1 0/9] board: introduce common infrastructure
	for Intel SoCs
Message-ID: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot often is used for embedded world where Intel, for example, is
presented by a number of boards, such as Intel Galileo, Edison, and Joule.

This series introduces a common infrastructure to build images for such boards.
Besides that it has a brand new set of the ACPI ASL examples to support devices
that can be used with open connected boards.

The series has been tested on Intel Joule, Minnowboard, Minnowboard MAX, and
partially on many other boards and devices.

Andy Shevchenko (3):
  package/acpica: Add host configuration to the tool
  board/intel/common: Add common files for x86 boards
  board/intel/common: Add possibility for adding ACPI tables to the
    initrd

Mika Westerberg (6):
  board / intel: Add SPI peripherals for Minnowboard MAX
  board / intel: Add SPI peripherals for Joule
  board / intel: Add Aosong AM2315 sensor for Intel Joule
  board / intel: Add GPIO LEDs for Intel Joule
  board / intel: Add GPIO LEDs for Intel Minnowboard
  board / intel: Add GPIO buttons for Intel Minnowboard

 board/intel/common/README.rst                      | 113 +++++++++++++++++++++
 board/intel/common/cmdline                         |   1 +
 board/intel/common/libshell-intel                  |  26 +++++
 board/intel/common/post-build.d/10-install-modules |  23 +++++
 board/intel/common/post-build.d/README             |   4 +
 board/intel/common/post-build.sh                   |  16 +++
 board/intel/common/post-image.d/10-prepare-cmdline |  26 +++++
 .../common/post-image.d/30-append-custom-cmdline   |  17 ++++
 board/intel/common/post-image.d/40-prepare-initrd  |  14 +++
 board/intel/common/post-image.d/80-acpi-tables     |  86 ++++++++++++++++
 board/intel/common/post-image.d/README             |   4 +
 board/intel/common/post-image.sh                   |  16 +++
 board/intel/joule/acpi/am2315.asl                  |  36 +++++++
 board/intel/joule/acpi/at25.asl                    |  56 ++++++++++
 board/intel/joule/acpi/leds.asl                    | 107 +++++++++++++++++++
 board/intel/joule/acpi/spidev.asl                  |  42 ++++++++
 board/intel/minnowboard-max/acpi/at25.asl          |  58 +++++++++++
 board/intel/minnowboard-max/acpi/m25p80.asl        |  52 ++++++++++
 board/intel/minnowboard/acpi/buttons.asl           | 104 +++++++++++++++++++
 board/intel/minnowboard/acpi/leds.asl              |  82 +++++++++++++++
 configs/intel_defconfig                            |  30 ++++++
 package/Config.in.host                             |   1 +
 package/acpica/Config.in.host                      |   9 ++
 package/acpica/acpica.mk                           |  15 +++
 24 files changed, 938 insertions(+)
 create mode 100644 board/intel/common/README.rst
 create mode 100644 board/intel/common/cmdline
 create mode 100644 board/intel/common/libshell-intel
 create mode 100755 board/intel/common/post-build.d/10-install-modules
 create mode 100644 board/intel/common/post-build.d/README
 create mode 100755 board/intel/common/post-build.sh
 create mode 100755 board/intel/common/post-image.d/10-prepare-cmdline
 create mode 100755 board/intel/common/post-image.d/30-append-custom-cmdline
 create mode 100755 board/intel/common/post-image.d/40-prepare-initrd
 create mode 100755 board/intel/common/post-image.d/80-acpi-tables
 create mode 100644 board/intel/common/post-image.d/README
 create mode 100755 board/intel/common/post-image.sh
 create mode 100644 board/intel/joule/acpi/am2315.asl
 create mode 100644 board/intel/joule/acpi/at25.asl
 create mode 100644 board/intel/joule/acpi/leds.asl
 create mode 100644 board/intel/joule/acpi/spidev.asl
 create mode 100644 board/intel/minnowboard-max/acpi/at25.asl
 create mode 100644 board/intel/minnowboard-max/acpi/m25p80.asl
 create mode 100644 board/intel/minnowboard/acpi/buttons.asl
 create mode 100644 board/intel/minnowboard/acpi/leds.asl
 create mode 100644 configs/intel_defconfig
 create mode 100644 package/acpica/Config.in.host

-- 
2.8.1
