From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2012 22:53:03 +0100
Subject: [Buildroot] [PATCH v2 6/6] Add config file for the snowball
	board
In-Reply-To: <1352742102-19010-7-git-send-email-gregory.hermant@calao-systems.com>
References: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352742102-19010-7-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <50A16FBF.1060702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/12 18:41, Gregory Hermant wrote:
>
> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
> ---
>   configs/calao_snowball_defconfig |   49 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
>   create mode 100644 configs/calao_snowball_defconfig
>
> diff --git a/configs/calao_snowball_defconfig b/configs/calao_snowball_defconfig
> new file mode 100644
> index 0000000..e5e67bf
> --- /dev/null
> +++ b/configs/calao_snowball_defconfig
> @@ -0,0 +1,49 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_GCC_VERSION_4_7_X=y
> +# BR2_SOFT_FLOAT is not set
> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> +BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> +BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_VFP_FLOAT=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA2"
> +BR2_PACKAGE_BUSYBOX_CONFIG="board/calao/snowball/busybox-1.20.x.config"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_BZIP2=y
> +BR2_PACKAGE_FBSET=y
> +BR2_PACKAGE_FBTERM=y
> +BR2_PACKAGE_HDMISERVICE=y
> +BR2_PACKAGE_MINICOM=y
> +BR2_PACKAGE_LUA=y
> +BR2_PACKAGE_OPENSSL=y
> +BR2_PACKAGE_SQLITE=y
> +BR2_PACKAGE_JPEG=y
> +BR2_PACKAGE_LIBPNG=y
> +BR2_PACKAGE_LIBUNGIF=y
> +BR2_PACKAGE_LIBELF=y
> +BR2_PACKAGE_PCRE=y
> +BR2_PACKAGE_LIBXML2=y
> +BR2_PACKAGE_SNOWBALL_INIT=y
> +BR2_PACKAGE_IW=y
> +BR2_PACKAGE_WGET=y

  I have the feeling that I've said this before, but: are all of these
really needed?  I can't imagine why you'd want anything that is also
already provided by busybox; I don't see why you'd need minicom or lua
in a minimal configuration; all the libraries make no sense if there
no package using them, but then that package should select them.

  For the wireless packages below I'm willing to make an exception
(though I'm not sure why the lib is needed).

> +BR2_PACKAGE_WIRELESS_TOOLS=y
> +BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
> +BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
> +BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
> +BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_WPS=y
> +BR2_TARGET_ROOTFS_TAR_GZIP=y

  I thought the idea was to put it on an SD card?  Then it makes more
sense to build an ext2 fs, no?


  Regards,
  Arnout

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
