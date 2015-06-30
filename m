From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 23:29:41 +0200
Subject: [Buildroot] [PATCH v3 1/1] board: add support for WarPboard
In-Reply-To: <1435324405-26828-1-git-send-email-lambertarthur22@gmail.com>
References: <1435324405-26828-1-git-send-email-lambertarthur22@gmail.com>
Message-ID: <20150630232941.5a2a1b2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arthur LAMBERT,

On Fri, 26 Jun 2015 15:13:25 +0200, Arthur LAMBERT wrote:
> This is a set of patch to add support for warpboard (Freescale board based on imx6sl)
> 
> The patch contains :
>   - defconfig for warpboard
>   - linux patches from Fabio Estevam to fix device tree due to last change on warpboard schematics (rev 1.12)
>   and to fix kernel imx_v6_v7 defconfig which use incorrect hci protocol
>   - specific firmware file for warpboard bluetooth (nvram : brcmfmac4330-sdio.txt)

That's a detail, but the commit log should be wrapped to 80 columns.



> +- transfer uboot into flash by running this command in host side:
> + $ sudo dfu-util -D output/images/u-boot.imx -a boot

So maybe you should build the host-dfu-util package of Buildroot by
selecting it in the Buildroot defconfig, and use it here?

> +- remove power and put warpboard into normal boot mode by opening the jumper.
> +
> +Update linux & rootfs
> +=====================
> +
> +Use ums command from uboot prompt to mount emmc as mass storage and update zImage, device tree and rootfs file

Which rootfs file? The tarball or the ext2 one?

> +Enable bluetooth (need to enable bluez-util)
> +================
> +hciattach /dev/ttymxc4 any
> +hciconfig hci0 up

Maybe:

Using Bluetooth
===============

Enable the bluez_utils package, and then:

$ hciattach /dev/ttymxc4 any
$ hciconfig hci0 up

Of course, make sure you're really talking about bluez_utils or
bluez_utils5, we have two separate packages in Buildroot.

Could you take into account those minor comments, and send an updated
version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
