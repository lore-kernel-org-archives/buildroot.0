From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Nov 2012 00:04:25 +0100
Subject: [Buildroot] [PATCH v4 6/6] Add config file for the snowball
	board
In-Reply-To: <1353927919-7250-7-git-send-email-gregory.hermant@calao-systems.com>
References: <1353927919-7250-1-git-send-email-gregory.hermant@calao-systems.com>
 <1353927919-7250-7-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <50B69879.3030102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/11/12 12:05, Gregory Hermant wrote:
>
> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
> ---
>   configs/calao_snowball_defconfig |   28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>   create mode 100644 configs/calao_snowball_defconfig
>
> diff --git a/configs/calao_snowball_defconfig b/configs/calao_snowball_defconfig
> new file mode 100644
> index 0000000..700be5d
> --- /dev/null
> +++ b/configs/calao_snowball_defconfig
> @@ -0,0 +1,28 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_GCC_VERSION_4_7_X=y
> +# BR2_SOFT_FLOAT is not set
> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> +BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> +BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

  Are all of these needed? AFAICS only WCHAR is really needed
(for dbus, for bluez-utils).

> +BR2_VFP_FLOAT=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA2"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_FBSET=y

  Why is FBSET needed?


  Regards,
  Arnout

> +BR2_PACKAGE_SNOWBALL_HDMISERVICE=y
> +BR2_PACKAGE_LIBNL=y
> +BR2_PACKAGE_SNOWBALL_INIT=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_TARGET_ROOTFS_TAR_GZIP=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="snowball"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://igloocommunity.org/git/kernel/igloo-kernel.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="stable-linux-ux500-3.4"
> +BR2_LINUX_KERNEL_PATCH="board/calao/snowball/"
> +BR2_LINUX_KERNEL_DEFCONFIG="u8500"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
