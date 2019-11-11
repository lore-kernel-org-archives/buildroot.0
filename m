From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 11 Nov 2019 11:51:18 +0300
Subject: [Buildroot] [PATCH 1/1] add pattern based copy for ATF as
 already used for u-boot. This add support for different platforms where the
 binaries have different extension
In-Reply-To: <1573221183-25905-1-git-send-email-michael.schenk@noser.com>
References: <1573221183-25905-1-git-send-email-michael.schenk@noser.com>
Message-ID: <20191111085118.5ymswhzmvkpdkwit@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Signed-off-by: Michael Schenk <michael.schenk@noser.com>
> ---
>  boot/arm-trusted-firmware/Config.in               | 7 +++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 +++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

...

>  define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
> -	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
> +	$(foreach f,$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES)), \
> +		cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/
> +	)
>  	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
>  	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
>  endef

Looks good to me: Reviewed-by: Sergey Matyukevich <geomatsi@gmail.com>

For better understanding of the rationale behind the change, it would
be great if you could share some technical details of your use-case.

Regards,
Sergey
