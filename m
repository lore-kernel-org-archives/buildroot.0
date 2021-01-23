From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 23:34:24 +0100
Subject: [Buildroot] [PATCH v4 4/8] boot/uboot/imx8: Add new target
 needed for mainline u-boot
In-Reply-To: <20201125183017.15585-5-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
 <20201125183017.15585-5-xroumegue@gmail.com>
Message-ID: <20210123233424.30f84a1f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Nov 2020 19:30:13 +0100
Xavier Roumegue <xroumegue@gmail.com> wrote:

> Mainline u-boot support for the iMX8M based boards is no longer
> using the external imx-mkimage command and instead building
> the fit image directly inside U-Boot.
> 
> This fit image usually embeds ddr/hdmi firmware for iMX8M target.
> 
> Inspired from
> https://github.com/SolidRun/buildroot/commit/0f2b2971e836b508bf9c2dac34426a59a9d83572
> 
> Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
> ---
>  boot/uboot/Config.in | 5 +++++
>  boot/uboot/uboot.mk  | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index f2faff826b..2e1d836cf8 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -281,6 +281,11 @@ config BR2_TARGET_UBOOT_FORMAT_DTB_IMX
>  config BR2_TARGET_UBOOT_FORMAT_ITB
>  	bool "u-boot.itb"
>  
> +config BR2_TARGET_UBOOT_FORMAT_IMX_FIT
> +	bool "flash.bin"
> +	select BR2_PACKAGE_FIRMWARE_IMX
> +	select BR2_TARGET_UBOOT_NEEDS_FW

I concur with Gary here, this should be just:

config BR2_TARGET_UBOOT_FORMAT_FLASH_BIN
	bool "flash.bin"

and it should just trigger the build of the "flash.bin" target. The
dependency on i.MX firmware should be handled by the separate U-Boot
option I have proposed in reply to your PATCH 2/8.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
