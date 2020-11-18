From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 18 Nov 2020 16:14:28 +0100
Subject: [Buildroot] [PATCH] package/gvfs: show warning when
 BR2_STATIC_LIBS=y
In-Reply-To: <20201118131323.3166176-1-buildroot@heine.tech>
References: <20201118131323.3166176-1-buildroot@heine.tech>
Message-ID: <CAPi7W827aSiD8oGJ61x+gaUOoeGUYdLRB3fvAFu+DaiwwCXwXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le mer. 18 nov. 2020 ? 14:13, Michael Nosthoff <buildroot@heine.tech> a ?crit :
>
> Fixes:
>
> showing "gvfs needs a toolchain w/ wchar, threads, dynamic library"
> while also showing "gvfs[ ]"
> when !BR2_STATIC_LIBS
Thanks for fixing this mistake.
Reviewed-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> introduced by 4266c9f54f635e8a9d0a7fdedfb1c84c1de10785
>
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/gvfs/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
> index 5a6b3e73ec..68ad291436 100644
> --- a/package/gvfs/Config.in
> +++ b/package/gvfs/Config.in
> @@ -20,4 +20,4 @@ config BR2_PACKAGE_GVFS
>  comment "gvfs needs a toolchain w/ wchar, threads, dynamic library"
>         depends on BR2_USE_MMU
>         depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> -               !BR2_STATIC_LIBS
> +               BR2_STATIC_LIBS
> --
> 2.25.1
>
Best Regards,

Fabrice
