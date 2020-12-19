From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2020 12:26:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang.mk: postpone
 evaluation of TARGET_DIR and HOST_DIR
In-Reply-To: <20201218055856.3489177-1-tianyuanhao@aliyun.com>
References: <20201218055856.3489177-1-tianyuanhao@aliyun.com>
Message-ID: <20201219112621.GI3188@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tian, All,

On 2020-12-18 13:58 +0800, Tian Yuanhao via buildroot spake thusly:
> When BR2_PER_PACKAGE_DIRECTORIES=y, $(TARGET_DIR) is evaluated as
> $(BASE_DIR)/target, but $$(TARGET_DIR) is evaluated as
> $(BASE_DIR)/per-package/$(PKG)_NAME/target.
> 
> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>

Good catch! Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-golang.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 3813e1c406..d07242310d 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -121,7 +121,7 @@ endif
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
>  	$$(foreach d,$$($(2)_INSTALL_BINS),\
> -		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(TARGET_DIR)/usr/bin/$$(d)
> +		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(TARGET_DIR)/usr/bin/$$(d)
>  	)
>  endef
>  endif
> @@ -130,7 +130,7 @@ endif
>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
>  	$$(foreach d,$$($(2)_INSTALL_BINS),\
> -		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(HOST_DIR)/bin/$$(d)
> +		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(HOST_DIR)/bin/$$(d)
>  	)
>  endef
>  endif
> -- 
> 2.25.1
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
