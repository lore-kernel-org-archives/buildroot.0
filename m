From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jul 2014 19:37:12 +0200
Subject: [Buildroot] [PATCH 1/1] system: move tz setup outside of
 default skeleton clause
In-Reply-To: <1406481852-15592-1-git-send-email-danomimanchego123@gmail.com>
References: <1406481852-15592-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140727173712.GE3895@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2014-07-27 13:24 -0400, Danomi Manchego spake thusly:
> Allow time zone setup and installation for configurations
> using custom skeletons as well as default skeletons.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  system/Config.in |   26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 1be7e5d..e7e146a 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -267,6 +267,19 @@ config BR2_TARGET_GENERIC_GETTY_OPTIONS
>  endmenu
>  endif
>  
> +config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
> +	bool "remount root filesystem read-write during boot"
> +	default y
> +	help
> +	  The root filesystem is typically mounted read-only at boot.
> +	  By default, buildroot remounts it in read-write mode early during the
> +	  boot process.
> +	  Say no here if you would rather like your root filesystem to remain
> +	  read-only.
> +	  If unsure, say Y.
> +
> +endif # BR2_ROOTFS_SKELETON_DEFAULT
> +
>  config BR2_TARGET_TZ_INFO
>  	bool "Install timezone info"
>  	# No timezone for musl; only for uClibc or (e)glibc.
> @@ -306,19 +319,6 @@ config BR2_TARGET_LOCALTIME
>  
>  endif # BR2_TARGET_TZ_INFO
>  
> -config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
> -	bool "remount root filesystem read-write during boot"
> -	default y
> -	help
> -	  The root filesystem is typically mounted read-only at boot.
> -	  By default, buildroot remounts it in read-write mode early during the
> -	  boot process.
> -	  Say no here if you would rather like your root filesystem to remain
> -	  read-only.
> -	  If unsure, say Y.
> -
> -endif # BR2_ROOTFS_SKELETON_DEFAULT
> -
>  config BR2_ROOTFS_USERS_TABLES
>  	string "Path to the users tables"
>  	help
> -- 
> 1.7.9.5
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
