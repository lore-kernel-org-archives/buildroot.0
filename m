From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Apr 2016 22:33:10 +0200
Subject: [Buildroot] [PATCH v4 2/3] core/pkg-kconfig: Do not use $(call
 ...) without parameters
In-Reply-To: <1460971383-10595-3-git-send-email-romain.izard.pro@gmail.com>
References: <1460971383-10595-1-git-send-email-romain.izard.pro@gmail.com>
 <1460971383-10595-3-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <20160418203310.GD3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-04-18 11:23 +0200, Romain Izard spake thusly:
> When there are no parameters, simply use $(var) instead of $(call var)
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changelog:
> v3: new
> v4: no change
> 
>  package/pkg-kconfig.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index cb177bb..4033915 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -87,7 +87,7 @@ define $(2)_FIXUP_DOT_CONFIG
>  endef
>  
>  $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
> -	$$(call $(2)_FIXUP_DOT_CONFIG)
> +	$$($(2)_FIXUP_DOT_CONFIG)
>  
>  # Before running configure, the configuration file should be present and fixed
>  $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
> @@ -139,7 +139,7 @@ $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
>  		$$($(2)_KCONFIG_OPTS) $$(*)
>  	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
>  	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
> -	$$(call $(2)_FIXUP_DOT_CONFIG)
> +	$$($(2)_FIXUP_DOT_CONFIG)
>  
>  # Saving back the configuration
>  #
> -- 
> 2.5.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
