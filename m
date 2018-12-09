From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 9 Dec 2018 18:36:56 +0100
Subject: [Buildroot] [PATCHv2] configs/aarch64_efi: needs
 host-{dosfstools, mtools}
In-Reply-To: <20181209170726.11543-1-yann.morin.1998@free.fr>
References: <20181209170726.11543-1-yann.morin.1998@free.fr>
Message-ID: <CAK4VdL1APK0=8FSm5S_LdJhruxyhxTmpL1uE7zsoyh3SdLf6MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 9, 2018 at 6:07 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Fixes:
>     https://gitlab.com/ymorin/buildroot/-/jobs/131924126
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks for these fixes. This defconfig should look and work pretty
similar to pc_x86_64_efi_defconfig. With this patch the set of host
tools is the same as pc_x86_64_efi_defconfig, so looks good now.

Reviewed-by: Erico Nunes <nunes.erico@gmail.com>



>
> ---
> Changes v1 -> v2:
>   - add mtools too  (Thomas)
> ---
>  configs/aarch64_efi_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
> index ecc050fc5e..e87193218e 100644
> --- a/configs/aarch64_efi_defconfig
> +++ b/configs/aarch64_efi_defconfig
> @@ -32,3 +32,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# Host tools for genimage
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> --
> 2.14.1
>
