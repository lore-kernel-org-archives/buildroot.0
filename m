From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 09:41:38 +0100
Subject: [Buildroot] [PATCH 3/4] configs: atmel: add sama5d2 xplained
 support
In-Reply-To: <1458808152-15778-3-git-send-email-ludovic.desroches@atmel.com>
References: <1458808152-15778-1-git-send-email-ludovic.desroches@atmel.com>
 <1458808152-15778-3-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20160324094138.21e745d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 09:29:11 +0100, Ludovic Desroches wrote:
> This defconfig allows to build all the components to boot from a sd card on a
> SAMA5D2 Xplained board. For more details, please read the
> board/atmel/xplained/readme.txt file.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  configs/atmel_sama5d2_xplained_mmc_defconfig | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 configs/atmel_sama5d2_xplained_mmc_defconfig
> 
> diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
> new file mode 100644
> index 0000000..4e15d94
> --- /dev/null
> +++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
> @@ -0,0 +1,26 @@
> +BR2_arm=y
> +BR2_cortex_a5=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_FPU_VFPV4=y
> +BR2_ARM_INSTRUCTIONS_THUMB2=y
> +BR2_KERNEL_HEADERS_4_1=y

Not good, we want to use the "Same as kernel" option for the kernel
headers.

(And same comment as for the other patches in terms of selecting the
kernel/u-boot/at91bootstrap3 versions).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
