From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Apr 2014 22:41:49 +0200
Subject: [Buildroot] [PATCH 1/1] libubox: Disable lua binding on no mmu
In-Reply-To: <1396902806-2308-1-git-send-email-romain.naour@openwide.fr>
References: <1396902806-2308-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140407204149.GD3215@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-04-07 22:33 +0200, Romain Naour spake thusly:
> The Lua binding option of libubox need to be
> explicitly disabled on no mmu case.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1a5/1a5c50f8ca0ae70c1e0d3733765f521790b97a30/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libubox/libubox.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
> index b552227..74db0cc 100644
> --- a/package/libubox/libubox.mk
> +++ b/package/libubox/libubox.mk
> @@ -10,14 +10,12 @@ LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
>  LIBUBOX_INSTALL_STAGING = YES
>  LIBUBOX_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_JSON_C),json-c)
>  
> -ifeq ($(BR2_USE_MMU),y) # fork()
> -ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> +ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
>  LIBUBOX_DEPENDENCIES += lua
>  LIBUBOX_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
>  	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
>  else
>  LIBUBOX_CONF_OPT += -DBUILD_LUA:BOOL=OFF
>  endif
> -endif # MMU
>  
>  $(eval $(cmake-package))
> -- 
> 1.9.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
