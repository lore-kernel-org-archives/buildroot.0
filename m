From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Nov 2020 09:10:51 +0100
Subject: [Buildroot] [PATCH] package/cryptsetup: really break circular
 dependency
In-Reply-To: <20201113225207.302037-1-romain.naour@gmail.com>
References: <20201113225207.302037-1-romain.naour@gmail.com>
Message-ID: <20201114081051.GI771438@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-11-13 23:52 +0100, Romain Naour spake thusly:
> The commit [1] should fix a circular dependency by
> using util-linux-libs instead of util-linux if
> BR2_PACKAGE_UTIL_LINUX_LIBS is set.
> 
> But util-linux is still in CRYPTSETUP_DEPENDENCIES.
> Remove it to really break the circular dependency.
> 
> [1] e3c86f5c9e466ed5135e824d6dcebcfd7f5ac1ab
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cryptsetup/cryptsetup.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 60097595b4..a59a0c7570 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -9,7 +9,7 @@ CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
>  CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>  CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>  CRYPTSETUP_DEPENDENCIES = \
> -	lvm2 popt util-linux host-pkgconf json-c libargon2 \
> +	lvm2 popt host-pkgconf json-c libargon2 \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
>  	$(TARGET_NLS_DEPENDENCIES)
> -- 
> 2.25.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
