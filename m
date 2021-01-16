From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 17:30:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix gallium-xa
 configure option
In-Reply-To: <20210104215901.103994-1-bernd.kuhls@t-online.de>
References: <20210104215901.103994-1-bernd.kuhls@t-online.de>
Message-ID: <20210116163047.GN2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-01-04 22:59 +0100, Bernd Kuhls spake thusly:
> Fixes build warning:
> 
> output/build/mesa3d-20.3.2/meson.build:727: WARNING:
>  gallium-xa option "false" deprecated, please use "disabled" instead.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/mesa3d.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 5eca1f0906..a366eee4e9 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -74,7 +74,7 @@ endif
>  else
>  MESA3D_CONF_OPTS += \
>  	-Dglx=disabled \
> -	-Dgallium-xa=false
> +	-Dgallium-xa=disabled
>  endif
>  
>  ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> -- 
> 2.29.2
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
