From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 23:00:51 +0200
Subject: [Buildroot] [PATCH 1/1] uboot: Support multiple environment
 source files
In-Reply-To: <1454201313-17766-1-git-send-email-camh@xdna.net>
References: <1454201313-17766-1-git-send-email-camh@xdna.net>
Message-ID: <20160531230051.10cd0d50@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jan 2016 11:48:33 +1100, Cam Hutchison wrote:

> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index d539b31..515b1ea 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -171,9 +171,10 @@ define UBOOT_INSTALL_IMAGES_CMDS
>  	$(if $(BR2_TARGET_UBOOT_SPL),
>  		cp -dpf $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) $(BINARIES_DIR)/)
>  	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
> +		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
>  		$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
>  		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
> -		-o $(BINARIES_DIR)/uboot-env.bin $(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
> +		-o $(BINARIES_DIR)/uboot-env.bin -)

The lines following the pipe should have been indented by one more tab
(but it admittedly wasn't done so far). I've fixed that up and applied
your patch to our next branch.

Thanks, and sorry for the long delay!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
