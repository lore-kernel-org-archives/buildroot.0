From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 16:08:32 +0200
Subject: [Buildroot] [PATCH 1/3] Revert "package/libtirpc: install rpc.h"
In-Reply-To: <20210717134436.995829-1-fontaine.fabrice@gmail.com>
References: <20210717134436.995829-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717140832.GS12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, All,

Series of three patches: applied to master, thanks.

Regards,
Yann E. MORIN.

On 2021-07-17 15:44 +0200, Fabrice Fontaine spake thusly:
> This reverts commit b991962993357092625e5b18d8203acd1e9b8b1f.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libtirpc/libtirpc.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
> index 8cdc453cd4..2678c144e9 100644
> --- a/package/libtirpc/libtirpc.mk
> +++ b/package/libtirpc/libtirpc.mk
> @@ -21,7 +21,6 @@ LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
>  LIBTIRPC_CONF_OPTS = --disable-gssapi
>  
>  define HOST_LIBTIRPC_INSTALL_CMDS
> -	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/rpc.h $(HOST_DIR)/include/rpc/rpc.h
>  	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
>  	$(INSTALL) -D -m 0644 $(@D)/tirpc/netconfig.h $(HOST_DIR)/include/netconfig.h
>  endef
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
