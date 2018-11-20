From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 20 Nov 2018 19:31:04 +0300
Subject: [Buildroot] [PATCH next 4/5]
 configs/solidrun_macchiatobin_mainline: bump kernel and U-Boot
In-Reply-To: <2ef4e9d2b5fff465da879d99e412437ea7109b66.1542720610.git.baruch@tkos.co.il>
References: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
 <2ef4e9d2b5fff465da879d99e412437ea7109b66.1542720610.git.baruch@tkos.co.il>
Message-ID: <20181120163104.wxmaqro2yukllssf@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Bump U-Boot to version 2018.11. This version supports autodetection of
> SD/eMMC boot source, so we can now enable environment load from SD card.
> Add a U-Boot kconfig fragment that sets SD/eMMC as environment load/save
> device. This avoids stale environment values from the SPI flash. That in
> turn, allows to use the more convenient distro boot which is enabled in
> the default environment.
> 
> Bump kernel to version 4.19.2. This version enables
> CONFIG_PHY_MVEBU_CP110_COMPHY in the arm64 defconfig, so remove it from
> the kernel kconfig fragment. Enable support for SFP modules detection
> and configuration. Leave the PHY drivers for now to keep them built into
> the kernel. The kernel defconfig builds these drivers as modules. But
> that does not work as expected in the default configuration.
> 
> Cc: Sergey Matyukevich <geomatsi@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  board/solidrun/macchiatobin/extlinux.conf          |  4 ++++
>  board/solidrun/macchiatobin/linux-extras.config    |  2 +-
>  board/solidrun/macchiatobin/post-build-mainline.sh |  5 +++++
>  board/solidrun/macchiatobin/uboot-fragment.config  |  2 ++
>  configs/solidrun_macchiatobin_mainline_defconfig   | 13 ++++++++-----
>  5 files changed, 20 insertions(+), 6 deletions(-)
>  create mode 100644 board/solidrun/macchiatobin/extlinux.conf
>  create mode 100755 board/solidrun/macchiatobin/post-build-mainline.sh
>  create mode 100644 board/solidrun/macchiatobin/uboot-fragment.config
 
Thanks! Verified the changes on MacchiatoBin v2 board:

Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

By the way, it looks like mainline U-Boot v2018.11 still detects only 2GiB
of DRAM on my boards. Meanwhile vendor U-Boot provided by alternative
config solidrun_macchiatobin_marvell_defconfig detects 4GiB.

Regards,
Sergey
