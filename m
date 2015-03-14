From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 23:49:41 +0100
Subject: [Buildroot] [PATCH 09/15] busybox: force lfs build
In-Reply-To: <1426270934-15499-10-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-10-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150314224941.GM4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-13 15:22 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I think your commit logs are a bit terse. Maybe add just this
blurb:

    BR2_LARGEFILE is now always 'y' so the conditional is now
    meaningless.

(comment valid for other patches as well...)

Regards,
Yann E. MORIN.

> ---
>  package/busybox/busybox.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index a3ac7e7..7ab7f84 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -92,17 +92,10 @@ define BUSYBOX_SET_MMU
>  endef
>  endif
>  
> -ifeq ($(BR2_LARGEFILE),y)
>  define BUSYBOX_SET_LARGEFILE
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_FDISK_SUPPORT_LARGE_DISKS,$(BUSYBOX_BUILD_CONFIG))
>  endef
> -else
> -define BUSYBOX_SET_LARGEFILE
> -	$(call KCONFIG_DISABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
> -	$(call KCONFIG_DISABLE_OPT,CONFIG_FDISK_SUPPORT_LARGE_DISKS,$(BUSYBOX_BUILD_CONFIG))
> -endef
> -endif
>  
>  # If IPv6 is enabled then enable basic ifupdown support for it
>  ifeq ($(BR2_INET_IPV6),y)
> -- 
> 2.0.5
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
