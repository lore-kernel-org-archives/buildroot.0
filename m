From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 13 May 2019 09:42:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/mono: needs C++
In-Reply-To: <20190512104542.12573-1-fontaine.fabrice@gmail.com>
References: <20190512104542.12573-1-fontaine.fabrice@gmail.com>
Message-ID: <CA+_SqVbOgiTx4W_n4sBigC9p2Z_=M8LE_XmuaUSuFfESO+F8Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 12, 2019 at 12:45 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> mono needs a working C++ compiler to get the exact type of size_t since
> version 5.16.0.179 and
> https://github.com/mono/mono/commit/d8af77551de1f59803a46946786e0f9a5eb5cb9d
>
> Fixes:
>  - http://autobuild.buildroot.org/results/ee6d037154127cc6572f06e9a78bae383ea381bc
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/mono/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index a375a98448..0d555bfa82 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -12,6 +12,7 @@ config BR2_PACKAGE_MONO_ARCH_SUPPORTS
>  config BR2_PACKAGE_MONO
>         bool "mono"
>         depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
> +       depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on !BR2_STATIC_LIBS
>         help
> @@ -20,6 +21,7 @@ config BR2_PACKAGE_MONO
>
>           http://download.mono-project.com/sources/mono/
>
> -comment "mono needs a toolchain w/ threads, dynamic library"
> +comment "mono needs a toolchain w/ C++, threads, dynamic library"
>         depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
> -       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +       depends on !BR2_INSTALL_LIBSTDCPP || \
> +               !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
