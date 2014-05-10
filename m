From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 May 2014 16:14:43 +0200
Subject: [Buildroot] [PATCH] fs: use our own mkpasswd when creating users
In-Reply-To: <1399729186-30497-1-git-send-email-yann.morin.1998@free.fr>
References: <1399729186-30497-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <536E3453.9070503@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 10/05/2014 15:39, Yann E. MORIN a ?crit :
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Export PATH=$(BR_PATH) so that our own mkpasswd is found before
> any existing host-system one.
> 
> Reported-by: Romain Naour <romain.naour@openwide.fr>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 831365e..47199c7 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -83,7 +83,7 @@ ifneq ($$(ROOTFS_USERS_TABLES),)
>  	cat $$(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
>  endif
>  	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' >> $(USERS_TABLE)
> -	$(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
> +	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
>  	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
>  	chmod a+x $$(FAKEROOT_SCRIPT)
>  	$$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
> 

Tested-by: Romain Naour <romain.naour@openwide.fr>

Tested on Fedora host which has an incompatible version of mkpasswd.

Best regards,
Romain Naour
