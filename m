From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Sat, 20 Feb 2016 23:15:01 +0100
Subject: [Buildroot] state of olimex_imx233_olinuxino_defconfig
Message-ID: <CAPiYbRL+v9QK+cK1D+kmyPx58wx8ehmZVWGDQHRTzRe5=diHfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I recently tried olimex_imx233_olinuxino_defconfig and created the SD
card according to the readme.txt. It failed to boot with:
"
PowerPrep start initialize power...
Battery Voltage = 0.74V
No battery or bad battery
detected!!!.Disabling battery
voltage measurements./r/nLLCFeb 16 201616:01:38
EMI_CTRL 0x1C084040
FRAC 0x92926192
init_ddr_mt46v32m16_133Mhz
power 0x00820710
Frac 0x92926192
start change cpu freq
hbus 0x00000003
cpu 0x00010001
LLLLLLLFCLJ
"
Looks like the handover to the kernel is somehow broken, as it is not starting.

I then decided to drop mxs-bootlets completely and was able to boot it
directly with u-boot.
This requires an extra partition on the SD card where the uImage is
located (as per default u-boot environment).
So I changed my layout to:
16MB - type 0x53 - <uboot.sd>
a few MB - VFAT - copy uImage here
rest - Linux - <rootfs.ext2>

I am however not sure if I should submit an updated defconfig or a new
one like olimex_imx233_olinuxino_uboot_defconfig and extend the
readme.txt to cover both use cases?

Cheers, Phil
