From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 23:10:28 +0100
Subject: [Buildroot] [PATCH v2 2/4] configs: atmel: add support for
 sama5d4 xplained boot from sd card
In-Reply-To: <1458830564-27350-2-git-send-email-ludovic.desroches@atmel.com>
References: <1458830564-27350-1-git-send-email-ludovic.desroches@atmel.com>
 <1458830564-27350-2-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20160324231028.6cca1fce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 15:42:42 +0100, Ludovic Desroches wrote:

> +BR2_arm=y
> +BR2_cortex_a5=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_INSTRUCTIONS_THUMB2=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
> +BR2_LINUX_KERNEL_DEFCONFIG="sama5"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
> +BR2_TARGET_AT91BOOTSTRAP3=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.4"
> +BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainedsd_uboot_secure"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.2"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d4_xplained_mmc"
> +BR2_PACKAGE_HOST_SAM_BA=y

host-samba is not needed/useful for SD card configurations, so I've
dropped this last line and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
