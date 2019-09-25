From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Sep 2019 21:17:16 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/mesa3d: add OSMesa
 classic needs dri swrast"
In-Reply-To: <20190925190556.5956-2-bernd.kuhls@t-online.de>
References: <20190925190556.5956-1-bernd.kuhls@t-online.de>
 <20190925190556.5956-2-bernd.kuhls@t-online.de>
Message-ID: <20190925191716.GE7274@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2019-09-25 21:05 +0200, Bernd Kuhls spake thusly:
> This reverts commit 1ad2c7f678b91635ab8499b67824951d003a1bce.

A revert is when a commit was faulty. But 1ad2c7f6 was not faulty : it
properly accounted for a limitation of the upstream package.

However, it is the bump to a newer mesa3d version that allows to relax
the condition now that upstream has lifted their limitation.

As such, IMHO, this patch should either:

  - be squashed with the previous one, keeping the link to the
    upstream commit (which is very nice of you to provide!),

  - or be kept in a separate patch, but not identified as a revert.

I would favour the first option.

Regards,
Yann E. MORIN.

> See upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=19.2&id=b816edcbf40abca1e3d68b1a706f5670b3fcf4d7
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 403693770c..99b3818235 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -299,14 +299,10 @@ comment "Off-screen Rendering"
>  
>  config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
>  	bool "OSMesa (classic) library"
> -	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
>  	help
>  	  The OSMesa classic API provides functions for
>  	  making off-screen renderings.
>  
> -comment "OSMesa classic requires dri (classic) swrast"
> -	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
> -
>  if BR2_PACKAGE_MESA3D_DRIVER
>  
>  comment "OpenGL API Support"
> -- 
> 2.20.1
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
