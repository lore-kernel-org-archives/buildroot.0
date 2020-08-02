From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2020 22:22:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: xvmc needs x11
In-Reply-To: <20200802121037.1200692-1-bernd.kuhls@t-online.de>
References: <20200802121037.1200692-1-bernd.kuhls@t-online.de>
Message-ID: <20200802202246.GB2186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-08-02 14:10 +0200, Bernd Kuhls spake thusly:
> This is a follow-up patch to
> 
> https://git.buildroot.net/buildroot/commit/package/mesa3d?id=e79ee3b0f91aa3eb1b20d86701a195e3bd9a26d3
> 
> to make sure that MESA3D_PLATFORMS contains x11 needed by xvmc:
> https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=20.1#n510
> 
> Fixes
> http://autobuild.buildroot.net/results/dae/dae41e30d2ac69b768ec0a5b795a2e559c35bcd3/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 11d04b7a3f..a12ed641a6 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -320,6 +320,7 @@ config BR2_PACKAGE_MESA3D_XVMC
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
>  		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
> +	select BR2_PACKAGE_MESA3D_NEEDS_X11
>  	select BR2_PACKAGE_XLIB_LIBXV
>  	select BR2_PACKAGE_XLIB_LIBXVMC
>  	help
> -- 
> 2.27.0
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
