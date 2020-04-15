From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 15 Apr 2020 18:18:24 +0200
Subject: [Buildroot] [PATCH 0/7] imx: add i.MX8MNano / Nitrogen8MNano support
Message-ID: <20200415161831.2093348-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series adds support for the Boundary Devices Nitrogen8MNano board.

Since the i.MX8M Nano CPU wasn't supported, the first half of the series
adds said support (close to i.MX8M Mini with a few differences).

Then the second half add Boundary Devices Nitrogen8M Nano platform. I
also bumped the kernel/u-boot revision for all Nitrogen defconfig so
they are all aligned.

Let me know if you have any questions.

Regards,
Gary

Gary Bisson (7):
  package/freescale-imx: add option for i.MX8M Nano
  package/freescale-imx/firmware-imx: add support for i.MX8M Nano
  package/imx-mkimage: add support for i.MX8M Nano
  board/freescale/common/imx: add support for i.MX8M Nano
  configs/nitrogen*: bump kernel revision
  configs/nitrogen*: bump u-boot revision
  configs/nitrogen8mn: new defconfig

 .gitlab-ci.yml                                   |  1 +
 board/boundarydevices/common/readme.txt          |  4 ++++
 .../common/imx/imx8-bootloader-prepare.sh        |  7 +++++++
 configs/nitrogen6sx_defconfig                    |  4 ++--
 configs/nitrogen6x_defconfig                     |  4 ++--
 configs/nitrogen7_defconfig                      |  4 ++--
 configs/nitrogen8m_defconfig                     |  4 ++--
 configs/nitrogen8mm_defconfig                    |  4 ++--
 ...itrogen8m_defconfig => nitrogen8mn_defconfig} | 16 ++++++++--------
 package/freescale-imx/Config.in                  |  5 +++++
 .../freescale-imx/firmware-imx/firmware-imx.mk   |  2 +-
 package/imx-mkimage/imx-mkimage.mk               |  2 +-
 12 files changed, 37 insertions(+), 20 deletions(-)
 copy configs/{nitrogen8m_defconfig => nitrogen8mn_defconfig} (75%)

-- 
2.25.1
