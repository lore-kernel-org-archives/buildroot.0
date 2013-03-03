From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Mar 2013 19:28:24 +0100
Subject: [Buildroot] [PATCH] u-boot: u-boot SPL is usually under ./spl/
In-Reply-To: <1362329351-7738-1-git-send-email-carlo.caione@gmail.com>
References: <1362329351-7738-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <20130303192824.2a2faf5d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlo Caione,

On Sun,  3 Mar 2013 17:49:11 +0100, Carlo Caione wrote:
> Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index ea77259..3dfcca3 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -103,7 +103,7 @@ endef
>  define UBOOT_INSTALL_IMAGES_CMDS
>  	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
>  	$(if $(BR2_TARGET_UBOOT_SPL),
> -		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
> +		cp -dpf $(@D)/spl/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)

In the case of OMAP, the SPL gets generated in the main source
directory. For which configuration do you see that it is installed only
in the spl/ sub-directory?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
