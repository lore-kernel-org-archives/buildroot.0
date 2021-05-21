From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 11:35:55 +0200
Subject: [Buildroot] [PATCH] package/waylandpp: add dependency to
 BR2_INSTALL_LIBSTDCPP
In-Reply-To: <20210521091403.29209-1-heiko.thiery@gmail.com>
References: <20210521091403.29209-1-heiko.thiery@gmail.com>
Message-ID: <20210521093555.GH3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2021-05-21 11:14 +0200, Heiko Thiery spake thusly:
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/waylandpp/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
> index 3d7362b3c0..86ca965056 100644
> --- a/package/waylandpp/Config.in
> +++ b/package/waylandpp/Config.in
> @@ -3,14 +3,16 @@ config BR2_PACKAGE_WAYLANDPP
>  	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_INSTALL_LIBSTDCPP

You forgot to propagate that dependency to packages that select
waylandpp, namely kodi, so I've done that and applied to master,
thanks.

Regards,
Yann E. MORIN.

>  	depends on BR2_PACKAGE_WAYLAND
>  	help
>  	  Wayland C++ bindings
>  
>  	  https://github.com/NilsBrause/waylandpp
>  
> -comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
> +comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9, C++ support"
>  	depends on BR2_PACKAGE_WAYLAND
>  	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
>  		!BR2_HOST_GCC_AT_LEAST_4_9 || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_INSTALL_LIBSTDCPP
> -- 
> 2.30.0
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
