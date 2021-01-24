From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 16:43:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgeos: disable inlining on arm
In-Reply-To: <20210124134959.894937-1-fontaine.fabrice@gmail.com>
References: <20210124134959.894937-1-fontaine.fabrice@gmail.com>
Message-ID: <20210124154339.GB2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-24 14:49 +0100, Fabrice Fontaine spake thusly:
> Disable inlining which raise build failures on arm.
> It should be noted that inlining is already disabled by usptream on
> arm64: https://github.com/libgeos/geos/issues/353
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/52024b2ccc5d17612731809a5dabcc29a4a1170b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libgeos/libgeos.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
> index 7b4ace122d..d7905cbb21 100644
> --- a/package/libgeos/libgeos.mk
> +++ b/package/libgeos/libgeos.mk
> @@ -12,4 +12,8 @@ LIBGEOS_LICENSE_FILES = COPYING
>  LIBGEOS_INSTALL_STAGING = YES
>  LIBGEOS_CONFIG_SCRIPTS = geos-config
>  
> +ifeq ($(BR2_arm)$(BR2_armeb),y)
> +LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
> +endif
> +
>  $(eval $(cmake-package))
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
