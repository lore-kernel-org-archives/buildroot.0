From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Aug 2020 00:16:04 +0200
Subject: [Buildroot] [PATCH] system: set default PATH according to
 BR2_ROOTFS_MERGED_USR
In-Reply-To: <20200808155527.24726-1-paul@crapouillou.net>
References: <20200808155527.24726-1-paul@crapouillou.net>
Message-ID: <20200816221604.GL24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2020-08-08 17:55 +0200, Paul Cercueil spake thusly:
> Use "/usr/bin:/usr/sbin" as the default path if BR2_ROOTFS_MERGED_USR
> is enabled, otherwise use "/bin:/sbin:/usr/bin:/usr/sbin".
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  system/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 5063797976..b8b7c16529 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -402,7 +402,8 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
>  
>  config BR2_SYSTEM_DEFAULT_PATH
>  	string "Set the system's default PATH"
> -	default "/bin:/sbin:/usr/bin:/usr/sbin"
> +	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
> +	default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
>  	help
>  	  Sets the system's default PATH. It is being used in
>  	  /etc/profile in the skeleton-init-common package and by some
> -- 
> 2.28.0
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
