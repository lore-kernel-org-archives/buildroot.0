From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Feb 2021 21:47:59 +0100
Subject: [Buildroot] [PATCH] package/refpolicy: do not use the bare
 target in the configuration step
In-Reply-To: <20210210185158.1254415-1-atenart@kernel.org>
References: <20210210185158.1254415-1-atenart@kernel.org>
Message-ID: <20210210204759.GD1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine, All,

On 2021-02-10 19:51 +0100, Antoine Tenart spake thusly:
> The 'bare' target is a clean target, removing generated files from
> previous builds. Here in Buildroot we'll only build the refpolicy from a
> clean state and we don't need to execute this target. Remove it.

Will that still do correct builds with 'make refpolicy-rebuild' ?

Regards,
Yann E. MORIN.

> Signed-off-by: Antoine Tenart <atenart@kernel.org>
> ---
>  package/refpolicy/refpolicy.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> index 0194708b378d..62d96e68043c 100644
> --- a/package/refpolicy/refpolicy.mk
> +++ b/package/refpolicy/refpolicy.mk
> @@ -108,7 +108,7 @@ define REFPOLICY_CONFIGURE_CMDS
>  	$(if $(REFPOLICY_EXTRA_MODULES_DIRS), \
>  		$(REFPOLICY_COPY_EXTRA_MODULES)
>  	)
> -	$(REFPOLICY_MAKE) -C $(@D) bare conf
> +	$(REFPOLICY_MAKE) -C $(@D) conf
>  	$(REFPOLICY_CONFIGURE_MODULES)
>  endef
>  
> -- 
> 2.29.2
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
