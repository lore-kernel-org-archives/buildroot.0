From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 31 Jan 2018 07:58:17 +0000
Subject: [Buildroot] [PATCH v2] board: add support for ARC HS
 Development Kit (HSDK)
In-Reply-To: <20171219145554.17718-1-didin@synopsys.com>
References: <20171219145554.17718-1-didin@synopsys.com>
Message-ID: <1517385496.6038.3.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 2017-12-19 at 17:55 +0300, Evgeniy Didin wrote:
> Synopsys DesignWare HSDK (which stands for ARC HS
> Development Kit) is the latest and greatest development
> platform that sports quad-core ARC HS38 in real silicon.
> 
> Most noticeable features of the board are:
>  * Quad-core ARC HS38 CPU running at 1GHz
>  * 4Gb of DDR
>  * Built-in Vivante GPU (well supported via open source
>    Etnaviv drivers)
>  * Built-in Wi-Fi/Bluetooth module (RedPine RS-9113)
> 
> And as usual we have:
>  * [micro] SD-card slot
>  * 2 USB 2.0 ports
>  * 1Gbit Ethernet port
>  * Built-in Digilent JTAG probe
>  * Serial port accessible via micro-USB port
> 
> Writing sdcard.img on SDcard creates two partitions:
>  * FAT32 with uImage and uboot.env
>  * EXT4 with root filesystem
> 
> We modify kernel config because in default hsdk kernel config
> CONFIG_INITRAMFS_SOURCE parameter is set and when we build
> rootfs separately (BR2_TARGET_ROOTFS_INITRAMFS is not set)
> error appears. Also we set up CONFIG_ARC_UBOOT_SUPPORT which
> enables usage of uboot variables in the boot process.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> ---
> Changes since v1:
> -add entries in DEVELOPERS and .gitlab-ci.yml
> -change genimage-hsdk.cfg to genimage.cfg
> -enable BR2_TARGET_UBOOT_ENVIMAGE against mkenvimage in post-image.sh
> -add renaming "uboot-env.bin" to "uboot.env" in post-image.sh
> -changed tar to gzip when archiving sdcard.img

I'm worried if we can make it merged before the next Buildroot
release. Any comments [except probably requirement to rebase as 
it's been more than a month since v2 was posted] or/and suggestions on
this one?

-Alexey
