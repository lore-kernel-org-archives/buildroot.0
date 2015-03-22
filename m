From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 14:12:02 +0100
Subject: [Buildroot] [PATCH 2/2] config: Add defconfig for Freescale
 i.MX28 EVK
In-Reply-To: <1426701961-2619-2-git-send-email-vincent.stehle@freescale.com>
References: <1426701961-2619-1-git-send-email-vincent.stehle@freescale.com>
 <1426701961-2619-2-git-send-email-vincent.stehle@freescale.com>
Message-ID: <550EBFA2.7000103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/03/15 19:06, Vincent Stehl? wrote:
> The i.MX28 Evaluation Kit (or EVK) is Freescale's evaluation board based on the
> i.MX287 Applications Processor.
> 
> This defconfig is based on mainline u-boot and Linux kernel.
> 
> Also, we add an SD card creation script and documentation, shamelessly based on
> the ones for i.MX5/6 by Luca Ceresoli.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
[snip]
> diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
> new file mode 100644
> index 0000000..15cedeb
> --- /dev/null
> +++ b/configs/freescale_imx28evk_defconfig
> @@ -0,0 +1,18 @@
> +# architecture
> +BR2_arm=y
> +BR2_arm926t=y
> +
> +# system
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +
> +# kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_DEFCONFIG="mxs"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-evk"

 For reproducible builds, the kernel and bootloader versions should be fixed to
something that you tested.

 I'll assume that that's 3.19.2 and 2015.01 and resubmit.

 Regards,
 Arnout

> +
> +# bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="mx28evk"
> +BR2_TARGET_UBOOT_FORMAT_SD=y
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
