From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 May 2014 16:17:25 +0200
Subject: [Buildroot] [PATCH] fs: use our own tools when calling the
	fakerooted script
In-Reply-To: <1399729942-13571-1-git-send-email-yann.morin.1998@free.fr>
References: <1399729942-13571-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <536E34F5.5030902@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 10/05/2014 15:52, Yann E. MORIN a ?crit :
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> export PATH=$(BR_PATH) so that the fakerooted script uses our
> own tools before any of the host-system ones.
> 
> Reported-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 47199c7..919db25 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -86,7 +86,7 @@ endif
>  	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
>  	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
>  	chmod a+x $$(FAKEROOT_SCRIPT)
> -	$$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
> +	PATH=$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
>  	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
>  	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
>  ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
> 

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain Naour
