From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 17:10:56 +0200
Subject: [Buildroot] [PATCH RESEND 2/2] configs/imx6q-sabresd_defconfig:
 Switch to SPL boot
In-Reply-To: <1505567532-11583-2-git-send-email-festevam@gmail.com>
References: <1505567532-11583-1-git-send-email-festevam@gmail.com>
 <1505567532-11583-2-git-send-email-festevam@gmail.com>
Message-ID: <e6553555-07ef-3d2c-7302-8bdcb264b0cb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-09-17 15:12, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> U-Boot 2017.07 has switched to SPL boot, which allows the same binary to
> boot on imx6dl, imx6q and imx6qp sabresd boards.
> 
> Switch to the SPL mechanism.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

 Applied both to master, thanks. However, as a follow-up patch, could you:

- rename this to imx6-sabresd_defconfig (since it now also supports DL and Q+);
- also swith the _qt5 config to SPL;
- maybe also merge board/freescale/imx6q-sabresd into board/freescale/imx6sabre,
i.e. a single readme for all imx6sabre board that explains the difference
between the Freescale and the upstream configs.

 Also, could a Solo not be supported with the same defconfig?

 Regards,
 Arnout

> ---
>  configs/imx6q-sabresd_defconfig | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/imx6q-sabresd_defconfig b/configs/imx6q-sabresd_defconfig
> index b26dc2a..e010315 100644
> --- a/configs/imx6q-sabresd_defconfig
> +++ b/configs/imx6q-sabresd_defconfig
> @@ -22,10 +22,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  
>  # Bootloader
>  BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
> +BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
> -BR2_TARGET_UBOOT_FORMAT_IMX=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> @@ -33,4 +35,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.1"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
