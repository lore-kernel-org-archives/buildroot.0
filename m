From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 22:15:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: propagate missing
 libdrm-freedreno deps
In-Reply-To: <20200525022342.2216086-1-james.hilliard1@gmail.com>
References: <20200525022342.2216086-1-james.hilliard1@gmail.com>
Message-ID: <20200526201542.GC8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-05-24 20:23 -0600, James Hilliard spake thusly:
> Libdrm freedreno depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be
> as such we need to propagate those dependencies to mesa's gallium
> freedreno driver.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/mesa3d/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index dd512d9b76..ecdbf9ce64 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -111,6 +111,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
>  
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
>  	bool "Gallium freedreno driver"
> +	depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be # libdrm-freedreno

And what about the dependency to atomics?

That one is tricky, because it causes a circular dependency that is very
hard to break... However, we can't leave it as-is; we need at least
comment explaining the situation (see MESA3D_GALLIUM_DRIVER_R300), or a
proper solution...

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_LIBDRM_FREEDRENO
>  	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
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
