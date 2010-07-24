From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 24 Jul 2010 03:46:44 +0200
Subject: [Buildroot] [PATCH] Purge libglib2 dev files from target
In-Reply-To: <1279789149-16142-1-git-send-email-m-starostik@versanet.de>
References: <1279789149-16142-1-git-send-email-m-starostik@versanet.de>
Message-ID: <1279936004.30974.17.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeudi 22 juillet 2010 ? 11:03 +0200, Malte Starostik a ?crit :
> * Don't install libglib2 development binaries and to target unless
>   BR2_HAVE_DEVFILES is set
> * Don't install gdb plugins unless BR2_TARGET_GDB is set
> * Remove $(TARGET_DIR)/usr/share/aclocal from target-finalize when not
>   installing devfiles
> * Same for /usr/share/gdb in the absence of BR2_TARGET_GDB
> * Remove some redundant cleanup from individual packages
> 
> Signed-off-by: Malte Starostik <m-starostik@versanet.de>

Maybe you can split your patch in two. One part which would be related
to strip the debug files, the second would be related to strip dev files
(aclocal directories).

> +
> +define LIBGLIB2_REMOVE_GDB_FILES
> +	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gdb
> +	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
> +endef
> +

Why using rmdir ? rm -rf isn't good enough ?

Otherwise looks good ! :)

Acked-by: Lionel Landwerlin <llandwerlin@gmail.com>

Regards,

-- 
Lionel Landwerlin
