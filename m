From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 22:48:33 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/freescale-imx: Move DDR FW
 choice down to firmware-imx package
In-Reply-To: <1594382445-4464-2-git-send-email-stephane.viau@oss.nxp.com>
References: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
 <1594382445-4464-2-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200711224833.339c7f96@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jul 2020 14:00:42 +0200
Stephane Viau <stephane.viau@oss.nxp.com> wrote:

> The DDR FW along with all other FW code that need to be used in
> bootloader or installed on target are related to the firmware-imx package.
> 
> This patch does this job as well as fixing the conjugation of NEED*s* in
> the symbol name. Also take advantage of this patch to make the DDR FW
> dependant on BR2_PACKAGE_FIRMWARE_IMX.
> 
> Note that BR2_PACKAGE_FIRMWARE_IMX_xxx is the preferred naming
> convention for the upcoming couple of patches.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>

I have applied, with some changes. See below.

>  choice
>  	bool "DDR training binaries"
> -	default BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
> +	default BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
>  	help
>  	  Choose the DDR training binaries to be used depending on the
>  	  kind of memory that is available on the target board (DDR4,
>  	  LPDDR4, etc...).
>  
> -config BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
> +config BR2_PACKAGE_FIRMWARE_IMX_LPDDR4

When renaming options, we need to keep the old option name in
Config.in.legacy so that it doesn't get silently dropped when users
update to a newer Buildroot version.

>  	bool "lpddr4"
>  	help
>  	  Use LPDDR4 binaries (i.e.: lpddr4_pmu_train_*.bin)
>  
> -config BR2_PACKAGE_FIRMWARE_DDRFW_DDR4
> +config BR2_PACKAGE_FIRMWARE_IMX_DDR4

Same here.

I fixed that when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
