From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 22:32:49 +0100
Subject: [Buildroot] [PATCH v2] configs: add defconfig for Freescale
	i.MX31 PDK
In-Reply-To: <1426780358-15223-1-git-send-email-vincent.stehle@freescale.com>
References: <550A0AF9.5050101@mind.be>
 <1426780358-15223-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <550B4081.3070906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Quick remark, I don't have time for a full review now]

On 19/03/15 16:52, Vincent Stehl? wrote:
> diff --git a/board/freescale/imx31_3stack/patches/linux/linux-imx31_3stack_defconfig-enable-support-for-initramfs.patch b/board/freescale/imx31_3stack/patches/linux/linux-imx31_3stack_defconfig-enable-support-for-initramfs.patch
> new file mode 100644
> index 0000000..6c326d9
> --- /dev/null
> +++ b/board/freescale/imx31_3stack/patches/linux/linux-imx31_3stack_defconfig-enable-support-for-initramfs.patch
> @@ -0,0 +1,30 @@
> +From d951151b94a03c1ad33bcfec223358a0e7437115 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
> +Date: Thu, 19 Mar 2015 10:53:56 +0100
> +Subject: [PATCH] imx31_3stack_defconfig: enable support for initramfs
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> +---
> + arch/arm/configs/imx31_3stack_defconfig | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/arch/arm/configs/imx31_3stack_defconfig b/arch/arm/configs/imx31_3stack_defconfig
> +index d54abf1..ca5d885 100644
> +--- a/arch/arm/configs/imx31_3stack_defconfig
> ++++ b/arch/arm/configs/imx31_3stack_defconfig
> +@@ -55,7 +55,8 @@ CONFIG_SYSFS_DEPRECATED=y
> + CONFIG_SYSFS_DEPRECATED_V2=y
> + # CONFIG_RELAY is not set
> + # CONFIG_NAMESPACES is not set
> +-# CONFIG_BLK_DEV_INITRD is not set
> ++CONFIG_BLK_DEV_INITRD=y
> ++CONFIG_INITRAMFS_SOURCE=""

 This shouldn't be needed, since buildroot will enable these automatically when
cpio or initramfs filesystem is selected. If not, there's something wrong with
the linux/kconfig infrastructure...


 Regards,
 Arnout

> + CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> + CONFIG_SYSCTL=y
> + CONFIG_EMBEDDED=y
> +-- 
> +2.1.4


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
