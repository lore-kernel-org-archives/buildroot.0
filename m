From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:20:51 +0100
Subject: [Buildroot] [PATCH v4] configs/bananapi_m1_plus_defconfig: new
 defconfig
In-Reply-To: <20210125174403.877853-1-fskoneczny@gmail.com>
References: <20210125174403.877853-1-fskoneczny@gmail.com>
Message-ID: <20210125222051.256792d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Jan 2021 18:44:03 +0100
Filip Skoneczny <fskoneczny@gmail.com> wrote:

> This commit adds support for Sinovoip's Banana Pi
> M1+. It is mostly based on bananapro_defconfig
> but with appropriate device tree and minor tweaks:
> 
> - apply bananapi-m1-plus device tree in linux
> - apply bananapi_m1_plus defconfig for uboot
> - apply patch for OOB IRQs on new device tree
> - update device tree name in boot.cmd, genimage.cfg
> - update symlink for BRCM driver in rootfs_overlay
> - overall clean-up of the config
> 
> Tested on BPI-M1+ V1_1.
> 
> Signed-off-by: Filip Skoneczny <fskoneczny@gmail.com>
> ---
>  DEVELOPERS                                    |  4 ++
>  board/sinovoip/m1-plus/boot.cmd               |  5 ++
>  board/sinovoip/m1-plus/genimage.cfg           | 37 +++++++++++
>  board/sinovoip/m1-plus/linux-wifi.fragment    | 10 +++
>  ...nanapi-m1-plus-Disable-OOB-IRQ-for-b.patch | 39 +++++++++++
>  board/sinovoip/m1-plus/post-build.sh          |  4 ++
>  board/sinovoip/m1-plus/readme.txt             | 64 +++++++++++++++++++
>  ...rcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt |  1 +
>  .../lib/firmware/brcm/brcmfmac43362-sdio.txt  | 56 ++++++++++++++++
>  configs/bananapi_m1_plus_defconfig            | 44 +++++++++++++
>  10 files changed, 264 insertions(+)
>  create mode 100644 board/sinovoip/m1-plus/boot.cmd
>  create mode 100644 board/sinovoip/m1-plus/genimage.cfg
>  create mode 100644 board/sinovoip/m1-plus/linux-wifi.fragment
>  create mode 100644 board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch
>  create mode 100755 board/sinovoip/m1-plus/post-build.sh
>  create mode 100644 board/sinovoip/m1-plus/readme.txt
>  create mode 120000 board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt
>  create mode 100644 board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
>  create mode 100644 configs/bananapi_m1_plus_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
