From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Jan 2018 21:30:51 +0100
Subject: [Buildroot] [PATCH] qt5wayland: compositor depends on
 BR2_PACKAGE_QT5BASE_OPENGL
In-Reply-To: <1515457090-29564-1-git-send-email-joshua.henderson@microchip.com>
References: <1515457090-29564-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180109203051.GD3834@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua, All,

On 2018-01-08 17:18 -0700, Joshua Henderson spake thusly:
> When building Qt 5.6.3, the qt5wayland compositor depends on Qt OpenGL support.

Certainly not. It can also work on EGL/GLES setups as well.

AFAIK, it can also work with various non-GL wayland backends, like a
rpi-specific one...

I'm not sure what the correct solution is, though, but certainly not a
dependency on GL.

Regards,
Yann E. MORIN.

> Fixes:
>       http://autobuild.buildroot.net/results/289d9b73d99e29d61c2df9ce228fed3968d89f5c
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>  package/qt5/qt5wayland/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
> index 0182d3c..e201830 100644
> --- a/package/qt5/qt5wayland/Config.in
> +++ b/package/qt5/qt5wayland/Config.in
> @@ -18,8 +18,12 @@ config BR2_PACKAGE_QT5WAYLAND
>  
>  if BR2_PACKAGE_QT5WAYLAND
>  
> +comment "qt5wayland compositor needs Qt OpenGL support"
> +	depends on !BR2_PACKAGE_QT5BASE_OPENGL && !BR2_PACKAGE_QT5_VERSION_LATEST
> +
>  config BR2_PACKAGE_QT5WAYLAND_COMPOSITOR
>  	bool "Enable compositor (experimental)"
> +	depends on BR2_PACKAGE_QT5BASE_OPENGL || BR2_PACKAGE_QT5_VERSION_LATEST
>  	help
>  	  The compositor API is still experimental, and not built by
>  	  default.
> -- 
> 2.7.4
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
