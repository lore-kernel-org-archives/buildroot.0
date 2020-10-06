From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 22:19:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add missing depends and
 driver name to r100 driver
In-Reply-To: <20200209183441.130187-1-james.hilliard1@gmail.com>
References: <20200209183441.130187-1-james.hilliard1@gmail.com>
Message-ID: <20201006201929.GQ11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-09 11:34 -0700, James Hilliard spake thusly:
> Propagate libdrm dependencies.
> 
> Add r100 to menu name to differentiate from r200 dri driver.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index ff39652508..788705544d 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -355,7 +355,9 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
>  	  Support for Nvidia-based GPUs.
>  
>  config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
> -	bool "DRI radeon driver"
> +	bool "DRI radeon r100 driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
>  	select BR2_PACKAGE_MESA3D_DRI_DRIVER
>  	select BR2_PACKAGE_LIBDRM_RADEON
>  	help
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
