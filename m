From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Dec 2015 22:45:43 +0100
Subject: [Buildroot] [PATCH v7 03/33] package/libevas-generic-loaders:
 svg loader: add MMU dependency
In-Reply-To: <1449523775-6582-4-git-send-email-romain.naour@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-4-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151207214542.GB14874@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

I think a better title and log would have been:

    package/libevas-generic-loaders: add missing MMU dependency

    The MMU dependency from glib2 via librsvg was not propagated
    to the SVG loader.

    sob...

Anyway:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v6: new patch
> ---
>  package/libevas-generic-loaders/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
> index c69f5e8..72d4adb 100644
> --- a/package/libevas-generic-loaders/Config.in
> +++ b/package/libevas-generic-loaders/Config.in
> @@ -16,6 +16,7 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
>  	bool "SVG loader"
>  	select BR2_PACKAGE_LIBRSVG
>  	select BR2_PACKAGE_CAIRO
> +	depends on BR2_USE_MMU # librsvg -> glib2
>  	depends on BR2_USE_WCHAR # librsvg -> glib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
> @@ -25,6 +26,7 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
>  
>  comment "SVG loader needs a toolchain w/ wchar, threads, C++"
>  	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
>  
>  endif
> -- 
> 2.4.3
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
