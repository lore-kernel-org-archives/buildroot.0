From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 6 Oct 2020 13:59:20 +0200
Subject: [Buildroot] [PATCH v2 4/4] configs/mx6cubox: bump Linux and
 U-Boot versions
In-Reply-To: <CAOMZO5A8cxt2maWjEzL98E8w5+ZkLeQK+Gr=BFTDjmC6s+hn1w@mail.gmail.com>
References: <20201006103955.464562-1-francois.perrad@gadz.org>
 <20201006103955.464562-4-francois.perrad@gadz.org>
 <CAOMZO5A8cxt2maWjEzL98E8w5+ZkLeQK+Gr=BFTDjmC6s+hn1w@mail.gmail.com>
Message-ID: <CAB0FRstDzgLnG+rNyhZoxr8QE2JnukJekOQGAp0448Ox0vBYrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 6 oct. 2020 ? 13:23, Fabio Estevam <festevam@gmail.com> a ?crit :

> Hi Francois,
>
> On Tue, Oct 6, 2020 at 7:40 AM Francois Perrad <fperrad@gmail.com> wrote:
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  configs/mx6cubox_defconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
> > index 91848bc07..dc26758ef 100644
> > --- a/configs/mx6cubox_defconfig
> > +++ b/configs/mx6cubox_defconfig
> > @@ -17,7 +17,7 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/solidrun/mx6cubox/post-image.sh"
> >  # Kernel
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.8"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.69"
> >  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i
> imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard
> imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i
> imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard
> imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
> > @@ -32,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
> >  BR2_TARGET_UBOOT=y
> >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> >  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> > -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
>
> What about using 2020.07?
>
>

With 2020.07 (or 2020.04 or 2020.10), something goes wrong
I think it is related to
https://gitlab.denx.de/u-boot/u-boot/-/commit/6c3fbf3e456c49c2f43c0c286106a0d4b099b67b


U-Boot SPL 2020.07 (Oct 06 2020 - 13:33:44 +0200)
WDT:   Not found!
Trying to boot from MMC1


U-Boot 2020.07 (Oct 06 2020 - 13:33:44 +0200)

CPU:   Freescale i.MX6SOLO rev1.3 996 MHz (running at 792 MHz)
CPU:   Commercial temperature grade (0C to 95C) at 36C
Reset cause: POR
Board: MX6 Cubox-i
DRAM:  512 MiB
MMC:   FSL_SDHC: 1, FSL_SDHC: 2
Loading Environment from MMC... *** Warning - bad CRC, using default
environment

No panel detected: default to HDMI
Display: HDMI (1024x768)
In:    serial
Out:   serial
Err:   serial
Net:
Warning: ethernet at 2188000 using MAC address from ROM
eth0: ethernet at 2188000
Hit any key to stop autoboot:  0
switch to partitions #0, OK
mmc1 is current device
Scanning mmc 1:1...
Found U-Boot script /boot/boot.scr
336 bytes read in 12 ms (27.3 KiB/s)
## Executing script at 12000000
SCRIPT FAILED: continuing...
switch to partitions #0, OK
mmc2(part 0) is current device
** No partition table - mmc 2 **
No SATA device found!
starting USB...



> Thanks
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201006/c0ade0d6/attachment-0001.html>
