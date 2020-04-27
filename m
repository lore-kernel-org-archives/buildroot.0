From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 23:57:04 +0200
Subject: [Buildroot] [PATCH 1/3] board/freescale/imx: Add helper to
 generate fw binary
In-Reply-To: <20200427213402.6148-1-xroumegue@gmail.com>
References: <20200427213402.6148-1-xroumegue@gmail.com>
Message-ID: <20200427235704.56fcde61@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Xavier,

On Mon, 27 Apr 2020 23:34:00 +0200
Xavier Roumegue <xroumegue@gmail.com> wrote:

> This script aims to create an imx compatible boot image embedding
> mainline components, using only upstream uboot mkimage tool, avoiding
> dependencies on proprietary imx mkimage.
> 
> Mainline u-boot can generate a bootable image, but SPL soc proprietary
> firmware dependencies have to be copied on uboot root dir.
> 
> This script prevents additional buildroot uboot recipe hacking to handle
> custom SoC uboot build process.
> 
> The script actions summary is:
> - Append DDR4 firmware to uboot spl binary
> - Generate imx mkimage configuration file, extracting entry points from
>   relevant elf files on the fly.
> - Generate imx boot image using uboot upstream mkimage tool
> 
> Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>

Thanks for this proposal. Could you share a bit more details about the
upstream U-Boot i.MX8 image generation logic? How does it work, how do
you trigger it, which FW binaries need to be copied to the U-Boot build
directory, etc. ?

>  .../common/imx/imx8-generate-fw-image.sh      | 52 +++++++++++++++++++

We should perhaps find better names to distinguish
imx8-bootloader-prepare.sh from imx8-generate-fw-image.sh, and make it
clear which one is for which situation.

Also, is your script suitable for all i.MX8? I see upstream U-Boot has
separate image tools for i.MX8 and i.MX8M.

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
