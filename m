From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2015 23:04:04 +0200
Subject: [Buildroot] [PATCH 1/1] eudev: add cxx dependency
In-Reply-To: <1433616116-30527-1-git-send-email-tomasz.gorochowik@gmail.com>
References: <1433616116-30527-1-git-send-email-tomasz.gorochowik@gmail.com>
Message-ID: <20150606210404.GH3581@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tomasz, All,

On 2015-06-06 20:41 +0200, Tomasz Gorochowik spake thusly:
> Dynamic /dev management using eudev requires c++ support

eudev is written entirely in C, not C++.

What is the problem yuou are trying to fix?

Regards,
Yann E. MORIN.

> Signed-off-by: Tomasz Gorochowik <tomasz.gorochowik@gmail.com>
> ---
>  system/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 84cde94..9ef3897 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -114,13 +114,14 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
>  config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>  	bool "Dynamic using eudev"
>  	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU # eudev
>  	select BR2_PACKAGE_EUDEV
>  
> -comment "eudev needs a toolchain w/ wchar, dynamic library"
> +comment "eudev needs a toolchain w/ wchar, cxx, dynamic lib"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_BUILDROOT_CXX || BR2_STATIC_LIBS
>  
>  endchoice
>  
> -- 
> 2.4.2
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
