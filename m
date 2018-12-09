From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 14:27:25 +0100
Subject: [Buildroot] [PATCH] confifs/aarch64_efi: needs dosfstools
In-Reply-To: <20181209103556.25979-1-yann.morin.1998@free.fr>
References: <20181209103556.25979-1-yann.morin.1998@free.fr>
Message-ID: <20181209142725.4df1e086@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Dec 2018 11:35:56 +0100, Yann E. MORIN wrote:
> Fixes:
>     https://gitlab.com/ymorin/buildroot/-/jobs/131924126
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  configs/aarch64_efi_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
> index ecc050fc5e..1c918e2a4f 100644
> --- a/configs/aarch64_efi_defconfig
> +++ b/configs/aarch64_efi_defconfig
> @@ -32,3 +32,6 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Host tools for genimage
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y

You also needs mtools for genimage to support creating a FAT filesystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
