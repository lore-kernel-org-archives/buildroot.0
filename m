From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Nov 2015 19:29:54 +0100
Subject: [Buildroot] [PATCH] system: Fix warning when selecting systemd
In-Reply-To: <1446834225-19878-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1446834225-19878-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151106182954.GB3746@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2015-11-06 19:23 +0100, Maxime Hadjinlian spake thusly:
> With systemd and a custom skeleton, you end up with the following
> warning:
> warning: (BR2_INIT_SYSTEMD) selects BR2_ROOTFS_MERGED_USR which has
> unmet direct dependencies (BR2_ROOTFS_SKELETON_DEFAULT)
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  system/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 4d07010..92712a8 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -92,7 +92,7 @@ config BR2_INIT_SYSTEMD
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> -	select BR2_ROOTFS_MERGED_USR
> +	select BR2_ROOTFS_MERGED_USR if BR2_ROOTFS_SKELETON_DEFAULT
>  	select BR2_PACKAGE_SYSTEMD
>  
>  comment "systemd needs (e)glibc toolchain, headers >= 3.10"
> -- 
> 2.6.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
