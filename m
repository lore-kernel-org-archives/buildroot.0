From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Tue, 19 Apr 2016 16:53:05 +0200
Subject: [Buildroot] [PATCH v2 0/6] Add development rootfs
Message-ID: <1461077591-24238-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

These patches add package to provide an "out of the box" rootfs with tools to
test the features of the SoC.

Even if it is not a real demo, this kind of rootfs is useful for us because
the customer will have tools to test audio, display, i2c, etc. It can also
be used for training.

Until now, we had this rootfs in the atmel buildroot repository but since we
have decided to remove it to rely only on the mainline, it will be great these
defconfigs included.

Changes:
- v2:
  - Bump to linux4sam_5.3
  - Explain the purpose of these defconfigs in the readme file
  - Revert the archive download from github instead of cloning the repository.
    The same tag is used for u-boot and linux so we have the same filename
    linux4sam_5.3.tar.gz.
- v1:
  - Add other dev_defconfig
  - Add comments in defconfigs
  - Use the archive instead of cloning git repository

Ludovic Desroches (6):
  configs: atmel: add sd card development image for sama5d2 xplained
  configs: atmel: add sd card development image for sama5d4 xplained
  configs: atmel: add development rootfs for sama5d4 xplained
  configs: atmel: add sd card development image for sama5d3 xplained
  configs: atmel: add development rootfs for sama5d3 xplained
  board/atmel: update documentation with development defconfigs

 board/atmel/readme.txt                           |  15 ++++
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 105 +++++++++++++++++++++++
 configs/atmel_sama5d3_xplained_dev_defconfig     | 101 ++++++++++++++++++++++
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 104 ++++++++++++++++++++++
 configs/atmel_sama5d4_xplained_dev_defconfig     | 105 +++++++++++++++++++++++
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 105 +++++++++++++++++++++++
 6 files changed, 535 insertions(+)
 create mode 100644 configs/atmel_sama5d2_xplained_mmc_dev_defconfig
 create mode 100644 configs/atmel_sama5d3_xplained_dev_defconfig
 create mode 100644 configs/atmel_sama5d3_xplained_mmc_dev_defconfig
 create mode 100644 configs/atmel_sama5d4_xplained_dev_defconfig
 create mode 100644 configs/atmel_sama5d4_xplained_mmc_dev_defconfig

-- 
2.5.0
