From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 27 Dec 2019 12:54:17 +0530
Subject: [Buildroot] [PATCH v3 0/3] Support 32-bit code generation for
 Armv8 targets
In-Reply-To: <20190205104512.23718-1-kostap@marvell.com>
References: <20190205104512.23718-1-kostap@marvell.com>
Message-ID: <CAMty3ZCvG9-Ahd+awg-1ozNnOXavOf8-U91BTwCZHrvJDnH5MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 5, 2019 at 4:15 PM <kostap@marvell.com> wrote:
>
> From: Konstantin Porotchkin <kostap@marvell.com>
>
> This patch set adds support for building images for SoC that make usage
> of Armv8 application CPUs and Cortex-M/Cortex-R service CPUs.
> The application CPU cross-toolchain is unable to generate 32-bit THUMB
> code, therefore usage of secondary toolchain is needed.
> The required pre-built toolchain is taken from ARM developers site and
> installed in host filesystem only.
> The patch set makes use of dual toolchain for adding support for Marvell
> Armada 3700 SoC that uses both Cortex-A53 and Cortex-M3 CPUs for running
> system firmware.
>
> V3 changes:
> patch #1 (arm-gnu-rm-toolchain)
> - Move the toolchain from installation folder to host FS instead of copy it
> - Add symbolic links in $(HOST_DIR)/bin to the toolchain executables
> - Add source files information (download link, license)
> - Change the hash values from localy calculated sha256 to md5 provided by ARM
> patch #2 (a3700-utils-marvell) - no changes
> patch #3 (a3700 boot image build support)
> - Use the $(HOST_DIR)/bin/* links instead of installation path for CROSS_CM3
>
> V2 changes:
> patch #1 (arm-gnu-rm-toolchain)
> - Remove Config.in.host
> - Remove custom extract command
> - Set installation path to $(HOST_DIR)/opt//opt/gcc-arm-none-eabi
> - Update commit message according to review notes
> patch #2 (a3700-utils-marvell) - no changes
> patch #3 (a3700 boot image build support)
> - Update CROSS_CM3 path in arm-trusted-firmware to reflect patch #1 changes
>
> Konstantin Porotchkin (3):
>   package/arm-gnu-rm-toolchain: new package
>   boot: a3700-utils-marvell: Add Armada-3700 utilities
>   boot: arm-trusted-firmware: add support for Marvell Armada 3700
>
>  boot/Config.in                                |  1 +
>  boot/a3700-utils-marvell/Config.in            | 46 +++++++++++++++++++
>  .../a3700-utils-marvell.hash                  |  2 +
>  .../a3700-utils-marvell.mk                    | 28 +++++++++++
>  .../arm-trusted-firmware.mk                   |  7 +++
>  .../arm-gnu-rm-toolchain.hash                 |  3 ++
>  .../arm-gnu-rm-toolchain.mk                   | 28 +++++++++++
>  7 files changed, 115 insertions(+)
>  create mode 100644 boot/a3700-utils-marvell/Config.in
>  create mode 100644 boot/a3700-utils-marvell/a3700-utils-marvell.hash
>  create mode 100644 boot/a3700-utils-marvell/a3700-utils-marvell.mk
>  create mode 100644 package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
>  create mode 100644 package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk

Any chance of picking or reviewing these changes? rockchip rk3399 do
require similar arm32 dependency for ATF. Let us know if you need any
help so-that on this regard.


Jagan.
