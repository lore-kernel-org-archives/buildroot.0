From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 23:46:43 +0100
Subject: [Buildroot] [PATCH] Initial support for i.mx6 sabreauto board
In-Reply-To: <BLU0-SMTP2974AC9E5F7279077E2563AF7F20@phx.gbl>
References: <BLU0-SMTP2974AC9E5F7279077E2563AF7F20@phx.gbl>
Message-ID: <20140307234643.605da11f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Abdul Hussain,

On Fri, 8 Nov 2013 21:44:06 +0530, Abdul Hussain wrote:
> Signed-off-by: Abdul Hussain <hussain.abdul@outlook.com>
> ---
>  configs/freescale_imx6sabreauto_defconfig |    9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 configs/freescale_imx6sabreauto_defconfig
> 
> diff --git a/configs/freescale_imx6sabreauto_defconfig b/configs/freescale_imx6sabreauto_defconfig
> new file mode 100644
> index 0000000..d02a395
> --- /dev/null
> +++ b/configs/freescale_imx6sabreauto_defconfig
> @@ -0,0 +1,9 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/snapshot/linux-2.6-imx-imx_3.0.35_4.1.0.tar.bz2"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx6"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"

A specific U-Boot version should be used, see all the other defconfig
files we have in Buildroot.

Also, a specific kernel headers version should be specified, which
matches the 3.0.x kernel being used here.

Could you take these comments into account, and resubmit an updated
version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
