From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 18:25:23 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: select EXPAT for freedreno
In-Reply-To: <20210116160948.1364227-1-festevam@gmail.com>
References: <20210116160948.1364227-1-festevam@gmail.com>
Message-ID: <20210116172523.GO2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2021-01-16 13:09 -0300, Fabio Estevam spake thusly:
> Select expat when building the freedreno driver to fix the
> following error:
> 
> Run-time dependency expat found: NO (tried pkgconfig and cmake)
> Looking for a fallback subproject for the dependency expat
> Downloading expat source from https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2
> <urlopen error unknown url type: https>
> A fallback URL could be specified using source_fallback_url key in the wrap file
> 
> output/build/mesa3d-20.3.2/meson.build:1366:2: ERROR: could not get https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2 is the internet available?

Right when you sent this patch, we were discussing the exact same error
with Titouan, but about the virgl driver.

> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to master, but with the following changes:

  - make it a generic fix, not tied to freedreno, reported by Fabio
  - rewrite commit log to explain the root cause
  - also reported about virgl, by Titouan

Please look at the new commit log I pushed for further details, and how
I eventually tweaked the file.

I'll try to push a fix upstream, so maybe next time we bump, we can
further relax the dependency by reverting the patch I applied.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 45eb62b701a7..773fbfde220e 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -119,6 +119,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_LIBDRM_FREEDRENO
>  	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
> +	select BR2_PACKAGE_EXPAT
>  	help
>  	  Mesa driver for Freedreno GPUs.
>  
> -- 
> 2.25.1
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
