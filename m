From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Tue, 30 Oct 2018 12:30:09 +0100
Subject: [Buildroot] [PATCH 1/1] synergy: needs gcc >= 4.9
In-Reply-To: <20181029153533.6897-1-fontaine.fabrice@gmail.com>
References: <20181029153533.6897-1-fontaine.fabrice@gmail.com>
Message-ID: <CAMOMa6Pk3090oCtnGsr-2L5YhSaJ_oFg7f4ACFTieQ6YLoT6bA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op ma 29 okt. 2018 om 16:35 schreef Fabrice Fontaine
<fontaine.fabrice@gmail.com>:
>
> Since version 1.9.0 and
> https://github.com/symless/synergy-core/commit/c0376e9e2f659aec23a748f9a8d8ee6cd82f1281,
> synergy needs C++14 so add a dependency on
> BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>
> Fixes:
>  - http://autobuild.buildroot.org/results/c4646ee9342ea8bd906bfe2b29996c48cb403ccc
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Reviewed-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> ---
>  package/synergy/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/synergy/Config.in b/package/synergy/Config.in
> index e0ac246155..c1216c4ba9 100644
> --- a/package/synergy/Config.in
> +++ b/package/synergy/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_SYNERGY
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_USE_WCHAR
>         depends on BR2_USE_MMU # fork()
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
>         select BR2_PACKAGE_XLIB_LIBX11
>         select BR2_PACKAGE_XLIB_LIBXTST
>         help
> @@ -14,7 +15,8 @@ config BR2_PACKAGE_SYNERGY
>
>           https://github.com/symless/synergy-core/
>
> -comment "synergy needs a toolchain w/ C++, wchar"
> +comment "synergy needs a toolchain w/ C++, wchar, gcc >= 4.9"
>         depends on BR2_PACKAGE_XORG7
>         depends on BR2_USE_MMU
> -       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
> +               BR2_TOOLCHAIN_GCC_AT_LEAST_4_9)
> --
> 2.17.1
>
