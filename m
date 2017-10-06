From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 18:48:38 +0200
Subject: [Buildroot] [PATCH] u-boot: add option to specify config
 fragments
In-Reply-To: <20171006134633.22940-1-peter@korsgaard.com>
References: <20171006134633.22940-1-peter@korsgaard.com>
Message-ID: <ce535501-4703-fe8e-83fa-f706c3871079@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-10-17 15:46, Peter Korsgaard wrote:
> U-Boot nowadays also uses kconfig, so we can handle config fragments like we
> do for barebox/busybox/linux.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  boot/uboot/Config.in | 6 ++++++
>  boot/uboot/uboot.mk  | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 84b7fb42ee..8215912339 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -129,6 +129,12 @@ config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
>  	depends on BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
>  	help
>  	  Path to the U-Boot configuration file.
> +
> +config BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
> +	string "Additional configuration fragment files"
> +	help
> +	  A space-separated list of configuration fragment files,
> +	  that will be merged to the main U-Boot configuration file.
>  endif
>  
>  config BR2_TARGET_UBOOT_NEEDS_DTC
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 14a8cc949a..fdacf16856 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -196,6 +196,7 @@ else ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
>  UBOOT_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE))
>  endif # BR2_TARGET_UBOOT_USE_DEFCONFIG
>  
> +UBOOT_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES))
>  UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>  UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS)
>  define UBOOT_HELP_CMDS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
