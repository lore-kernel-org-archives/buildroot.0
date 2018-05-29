From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 29 May 2018 14:49:29 +0200
Subject: [Buildroot] [PATCH 2/2] configs/stm32f469: force usage of
 BINUTILS 2.28.x
In-Reply-To: <1527595765-23055-2-git-send-email-christophe.priouzeau@st.com>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <1527595765-23055-2-git-send-email-christophe.priouzeau@st.com>
Message-ID: <9875052f-e652-4bc0-9cc7-7c4ebdcfdf56@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 29/05/2018 ? 14:09, Christophe PRIOUZEAU a ?crit?:
> Due to runtime issue with the usage of BINUTILS 2.29.x,
> we need to use the version 2.28.x
> 
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>

Fixes: #11051

Acked-by: Romain Naour <romain.naour@smile.fr>

> ---
>  configs/stm32f469_disco_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
> index 8b77d8c..e5cacaf 100644
> --- a/configs/stm32f469_disco_defconfig
> +++ b/configs/stm32f469_disco_defconfig
> @@ -2,6 +2,7 @@ BR2_arm=y
>  BR2_cortex_m4=y
>  BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
> +BR2_BINUTILS_VERSION_2_28_X=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> 
