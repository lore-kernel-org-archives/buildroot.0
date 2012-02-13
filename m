From: Mathieu <mbriand@adeneo-embedded.com>
Date: Mon, 13 Feb 2012 10:56:23 +0100
Subject: [Buildroot] [PATCH] Add Freescale MX53 support
In-Reply-To: <1329126226-23552-1-git-send-email-mbriand@adeneo-embedded.com>
References: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
 <1329126226-23552-1-git-send-email-mbriand@adeneo-embedded.com>
Message-ID: <1329126983.24097.1.camel@mathieu-OptiPlex-745>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

So, finally, I realized there IS a good kernel defconfig in freescale
git, I just had to look in the right branch, not in master... sorry.

I hope I fixed all your comments about my patch (except maybe about
mx53/imx53 name, I'm still not shure what is better). If some changes
are still needed, please say so.

On Mon, 2012-02-13 at 10:43 +0100, Mathieu Briand wrote:
> Buildroot config and Linux Kernel config.
> Freescale binaries (xf86 video driver and multimedia codecs) not supported yet.
> 
> Signed-off-by: Mathieu Briand <mbriand@adeneo-embedded.com>
> ---
>  configs/mx53loco_defconfig |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 configs/mx53loco_defconfig
> 
> diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
> new file mode 100644
> index 0000000..eab5b18
> --- /dev/null
> +++ b/configs/mx53loco_defconfig
> @@ -0,0 +1,18 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a8=y
> +
> +# System
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="mx53_loco"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="http://opensource.freescale.com/pub/scm/imx/uboot-imx.git"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="http://opensource.freescale.com/pub/scm/imx/linux-2.6-imx.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx5"
