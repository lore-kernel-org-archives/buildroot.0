From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Dec 2018 22:18:46 +0100
Subject: [Buildroot] [PATCH v4 1/3] fs/common.mk: rename
 FULL_DEVICE_TABLE to ROOTFS_FULL_DEVICES_TABLE
In-Reply-To: <20181203210508.27831-2-thomas.petazzoni@bootlin.com>
References: <20181203210508.27831-1-thomas.petazzoni@bootlin.com>
 <20181203210508.27831-2-thomas.petazzoni@bootlin.com>
Message-ID: <20181203211846.GA11195@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-03 22:05 +0100, Thomas Petazzoni spake thusly:
> In commit 6b50f988ad0a6044530b30344d52139da2994237 ("fs/common.mk:
> rename internal variable"), USERS_TABLE was renamed to
> ROOTFS_FULL_USERS_TABLE.
> 
> This commit follows the same direction by renaming the
> FULL_DEVICE_TABLE variable to ROOTFS_FULL_DEVICE_TABLE.
> 
> In addition, for consistency, the file itself is renamed
> full_device_table.txt.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/common.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 6c67fbfbbd..6ad4cd0b01 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -28,12 +28,12 @@
>  # macro will automatically generate a compressed filesystem image.
>  
>  FS_DIR = $(BUILD_DIR)/buildroot-fs
> -FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
>  ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
>  	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
>  
>  ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
>  
> +ROOTFS_FULL_DEVICES_TABLE = $(FS_DIR)/full_devices_table.txt
>  ROOTFS_FULL_USERS_TABLE = $(FS_DIR)/full_users_table.txt
>  
>  ifeq ($(BR2_REPRODUCIBLE),y)
> @@ -58,12 +58,12 @@ ifneq ($(ROOTFS_USERS_TABLES),)
>  	cat $(ROOTFS_USERS_TABLES) >> $(ROOTFS_FULL_USERS_TABLE)
>  endif
>  ifneq ($(ROOTFS_DEVICE_TABLES),)
> -	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
> +	cat $(ROOTFS_DEVICE_TABLES) > $(ROOTFS_FULL_DEVICES_TABLE)
>  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> -	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(FULL_DEVICE_TABLE)
> +	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(ROOTFS_FULL_DEVICES_TABLE)
>  endif
>  endif
> -	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
> +	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(ROOTFS_FULL_DEVICES_TABLE)
>  
>  rootfs-common-show-depends:
>  	@echo $(ROOTFS_COMMON_DEPENDENCIES)
> @@ -125,7 +125,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
>  
>  	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(ROOTFS_FULL_USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
> -	echo "$$(HOST_DIR)/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
> +	echo "$$(HOST_DIR)/bin/makedevs -d $$(ROOTFS_FULL_DEVICES_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
>  		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
>  		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
> -- 
> 2.19.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
