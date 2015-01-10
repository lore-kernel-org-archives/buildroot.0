From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 16:43:55 +0100
Subject: [Buildroot] [PATCH v2 4/8] boot/uboot: Add uboot-menuconfig and
 friends
In-Reply-To: <1420897647-25001-5-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
 <1420897647-25001-5-git-send-email-jkrause@posteo.de>
Message-ID: <20150110164355.17d96522@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 10 Jan 2015 14:47:23 +0100, J?rg Krause wrote:

>  ifeq ($(BR2_TARGET_UBOOT),y)
> +ifeq ($(BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG),y)
> +uboot-menuconfig uboot-xconfig uboot-gconfig uboot-nconfig: uboot-configure
> +	$(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_OPTS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
> +	rm -f $(UBOOT_DIR)/.stamp_{built,target_installed,images_installed}
> +uboot-savedefconfig: uboot-configure
> +	$(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_OPTS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
> +ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
> +uboot-update-defconfig: uboot-savedefconfig
> +	cp -f $(UBOOT_DIR)/defconfig $(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)
> +else
> +uboot-update-defconfig: ;
> +endif # BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
> +endif # BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG

Please use the kconfig-package infrastructure.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
