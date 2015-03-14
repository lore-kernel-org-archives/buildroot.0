From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 23:50:50 +0100
Subject: [Buildroot] [PATCH 10/15] system: drop largefile depends
In-Reply-To: <1426270934-15499-11-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-11-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150314225050.GN4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-13 15:22 -0300, Gustavo Zacarias spake thusly:
> Drop the largefile conditional for eudev and systemd.

Drop the largefile conditional for eudev and systemd, since it's now
always 'y' anyway.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Otherwise:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  system/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 9973cc2..3516056 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -89,7 +89,6 @@ config BR2_INIT_SYSTEMD
>  	bool "systemd"
>  	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
> -	depends on BR2_LARGEFILE
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_INET_IPV6
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> @@ -124,15 +123,14 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
>  
>  config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>  	bool "Dynamic using eudev"
> -	depends on BR2_LARGEFILE
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU # eudev
>  	select BR2_PACKAGE_EUDEV
>  
> -comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
> +comment "eudev needs a toolchain w/ wchar, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
>  
>  endchoice
>  
> -- 
> 2.0.5
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
