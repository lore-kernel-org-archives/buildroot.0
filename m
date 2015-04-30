From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 30 Apr 2015 09:46:44 -0500
Subject: [Buildroot] [PATCH 7/8] configs: add defconfig for Atmel
	sama5d3 Xplained
In-Reply-To: <1430398311-10804-8-git-send-email-alexandre.belloni@free-electrons.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1430398311-10804-8-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <CAMQcK5+XSqStQkJTBQUwzsWvCjQk=Uq8Z5g0yP_p1TXqsQCoLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandre,

On Thu, Apr 30, 2015 at 7:51 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  configs/atmel_sama5d3_xplained_defconfig | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 configs/atmel_sama5d3_xplained_defconfig
>
> diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
> new file mode 100644
> index 000000000000..ba3c9cd664bd
> --- /dev/null
> +++ b/configs/atmel_sama5d3_xplained_defconfig
> @@ -0,0 +1,22 @@
> +BR2_arm=y
> +BR2_cortex_a5=y
> +BR2_ARM_EABIHF=y
> +BR2_ARM_FPU_VFPV4D16=y
> +BR2_ARM_INSTRUCTIONS_THUMB2=y
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-3.18-at91"

'linux-3.18-at91' appears to be a branch which means that it could be
updated and break this config?

I believe in order to ensure that a build is reproducible for everyone
that this should be a tag or commit SHA. This would also apply to all
your other new NAND configurations for the Atmel boards.

Thanks,
-Ryan

> +BR2_LINUX_KERNEL_DEFCONFIG="sama5"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7"
> +BR2_TARGET_AT91BOOTSTRAP3=y
> +BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainednf_uboot"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="sama5d3_xplained_nandflash"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2015.01-at91"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_PACKAGE_HOST_SAM_BA=y

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
