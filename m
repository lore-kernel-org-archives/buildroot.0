From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 21:01:13 +0100
Subject: [Buildroot] [PATCH v2 2/3] configs/andes_nds32_ae3xx: new
 defconfig
In-Reply-To: <20190123123947.5084-3-nylon7@andestech.com>
References: <20190123123947.5084-1-nylon7@andestech.com>
 <20190123123947.5084-3-nylon7@andestech.com>
Message-ID: <20190204210113.2c51188f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Jan 2019 20:39:46 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1846748e01..2f53e01b72 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2303,3 +2303,5 @@ F:	arch/Config.in.nds32
>  F:	package/binutils
>  F:	package/gcc
>  F:	package/linux-headers
> +F:	board/andes
> +F:	configs/andes_ae3xx_defconfig

Please keep entries alphabetically sorted.

> diff --git a/configs/andes_ae3xx_defconfig b/configs/andes_ae3xx_defconfig
> new file mode 100644
> index 0000000000..d5c196d76b
> --- /dev/null
> +++ b/configs/andes_ae3xx_defconfig
> @@ -0,0 +1,14 @@
> +BR2_nds32=y
> +BR2_GLOBAL_PATCH_DIR="board/andes/patches/"
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz"
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="nds32le-linux"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_17=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.17.tar.xz"

Use BR2_LINUX_KERNEL_CUSTOM_VERSION and
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE instead.

Also, for our defconfigs, we require a readme.txt file, in
board/andes/ae3xx/readme.txt, which briefly says how to use the
defconfig. See other readme.txt files in board/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
