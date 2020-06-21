From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 09:24:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/mediastreamer: fix comment
In-Reply-To: <20200620205703.413331-1-bernd.kuhls@t-online.de>
References: <20200620205703.413331-1-bernd.kuhls@t-online.de>
Message-ID: <20200621072423.GW2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-06-20 22:57 +0200, Bernd Kuhls spake thusly:
> Fix inversed logic, comment should be shown for static-only toolchains.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mediastreamer/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
> index b3ba5a0cb0..b12535e82c 100644
> --- a/package/mediastreamer/Config.in
> +++ b/package/mediastreamer/Config.in
> @@ -18,7 +18,7 @@ config BR2_PACKAGE_MEDIASTREAMER
>  
>  comment "mediastreamer needs a toolchain w/ threads, C++, dynamic library"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_STATIC_LIBS
> +		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>  
>  comment "mediastreamer needs a toolchain not affected by GCC bug 64735"
>  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> -- 
> 2.26.2
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
