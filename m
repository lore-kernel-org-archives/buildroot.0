From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 4 Oct 2020 13:59:46 +0200
Subject: [Buildroot] [PATCH v2 1/4] boot/uboot: add stm32 binary format
In-Reply-To: <20201002142426.1375026-1-shlomi.39sd@gmail.com>
References: <20200927061606.10239-1-shlomi.39sd@gmail.com>
 <20201002142426.1375026-1-shlomi.39sd@gmail.com>
Message-ID: <a059c60c-b081-7753-50b3-e6f4d5533022@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Shlomi,

On 02.10.2020 16:24, Shlomi Vaknin wrote:
> Add `.stm32` binary format that uboot generates for the trusted configuration.
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> ---
>   boot/uboot/Config.in | 4 ++++
>   boot/uboot/uboot.mk  | 5 +++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index a87a642581..d317624fb6 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -267,6 +267,10 @@ config BR2_TARGET_UBOOT_FORMAT_KWB
>   	bool "u-boot.kwb (Marvell)"
>   	depends on BR2_arm
>   
> +config BR2_TARGET_UBOOT_FORMAT_STM32
> +        bool "u-boot.stm32"
> +        depends on BR2_arm
> +
The indents seem to be wrong and that option is not sorted alphabetically.

Anyway here is my:

Tested-by: Bartosz Bilas <b.bilas@grinn-global.com>

Best
Bartek
>   config BR2_TARGET_UBOOT_FORMAT_ELF
>   	bool "u-boot.elf"
>   
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 1831466780..080e6beb08 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -62,6 +62,11 @@ UBOOT_BINS += u-boot.kwb
>   UBOOT_MAKE_TARGET += u-boot.kwb
>   endif
>   
> +ifeq ($(BR2_TARGET_UBOOT_FORMAT_STM32),y)
> +UBOOT_BINS += u-boot.stm32
> +UBOOT_MAKE_TARGET += u-boot.stm32
> +endif
> +
>   ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
>   UBOOT_BINS += u-boot.ais
>   UBOOT_MAKE_TARGET += u-boot.ais
