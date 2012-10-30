From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Oct 2012 23:09:27 +0100
Subject: [Buildroot] [PATCH 1/6] Add config file for the snowball board
In-Reply-To: <1351500073-4351-2-git-send-email-gregory.hermant@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-2-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <50905017.8080301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/29/12 09:41, Gregory Hermant wrote:
>
> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
> ---
>   configs/calao_snowball_defconfig |   52 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
>   create mode 100644 configs/calao_snowball_defconfig
>
> diff --git a/configs/calao_snowball_defconfig b/configs/calao_snowball_defconfig
> new file mode 100644
> index 0000000..68f0a51
> --- /dev/null
> +++ b/configs/calao_snowball_defconfig
> @@ -0,0 +1,52 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_TOOLCHAIN_EXTERNAL=y

  We don't use external toolchains for the defconfigs, unless the internal
one doesn't work for some reason (e.g. microblaze).

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA2"
> +BR2_PACKAGE_BUSYBOX_CONFIG="board/calao/snowball/busybox-1.20.x.config"

  This file should be created in the same patch, otherwise this defconfig
isn't working.

  Also, is it really necessary to have a custom busybox config?

> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_BZIP2=y
> +BR2_PACKAGE_FBSET=y
> +BR2_PACKAGE_FBTERM=y
> +BR2_PACKAGE_FBV=y
> +BR2_PACKAGE_QT=y
> +BR2_PACKAGE_QT_DEMOS=y
> +BR2_PACKAGE_QT_LICENSE_APPROVED=y
> +BR2_PACKAGE_QT_MOUSE_PC=y
> +BR2_PACKAGE_QT_MOUSE_LINUXTP=y
> +BR2_PACKAGE_QT_MOUSE_LINUXINPUT=y
> +BR2_PACKAGE_QT_MOUSE_TSLIB=y
> +BR2_PACKAGE_MINICOM=y
> +BR2_PACKAGE_LUA=y
> +BR2_PACKAGE_OPENSSL=y
> +BR2_PACKAGE_SQLITE=y
> +BR2_PACKAGE_LIBELF=y
> +BR2_PACKAGE_PCRE=y
> +BR2_PACKAGE_LIBXML2=y

  We don't select any packages in a defconfig, unless they're required
for booting correctly.  We certainly don't want to build Qt!

> +BR2_PACKAGE_HDMISERVICE=y
> +BR2_PACKAGE_SNOWBALL_FIRMWARE=y
> +BR2_PACKAGE_SNOWBALL_INIT=y

  These packages don't exist yet; the patches adding them should come
before this patch.

  Note that for these, it could be relevant to include them in the
defconfig - they're not strictly required for booting, but I guess
you want them in practice.

> +BR2_PACKAGE_BLUEZ_UTILS=y
> +BR2_PACKAGE_IW=y
> +BR2_PACKAGE_WGET=y
> +BR2_PACKAGE_WIRELESS_TOOLS=y
> +BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
> +BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
> +BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
> +BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_WPS=y
> +BR2_TARGET_ROOTFS_TAR_GZIP=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="u8500_snowball"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://igloocommunity.org/git/boot/u-boot-ux500.git"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="master"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://igloocommunity.org/git/kernel/igloo-kernel.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="stable-linux-ux500-3.4"
> +BR2_LINUX_KERNEL_PATCH="board/calao/snowball/linux-3.4.patch"

  This patch is more than a month old - how come it's not yet accepted
upstream?

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/snowball/linux-3.4.config"

  Any reason why the u8500_defconfig isn't appropriate?

> +BR2_LINUX_KERNEL_INSTALL_TARGET=y

  Why?


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
