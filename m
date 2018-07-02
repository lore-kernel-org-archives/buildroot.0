From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jul 2018 23:48:01 +0200
Subject: [Buildroot] [PATCH v3 10/22] package/x11r7/xkeyboard-config:
 switch to xorgproto
In-Reply-To: <20180630110853.29339-11-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-11-bernd.kuhls@t-online.de>
Message-ID: <20180702214801.GP2604@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2018-06-30 13:08 +0200, Bernd Kuhls spake thusly:
> The new package xorgproto will combine and replace all current xproto_*
> packages. For details read
> https://lists.x.org/archives/xorg-announce/2018-February/002835.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xkeyboard-config/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
> index 5d1d6a72ed..c941742421 100644
> --- a/package/x11r7/xkeyboard-config/Config.in
> +++ b/package/x11r7/xkeyboard-config/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_XKEYBOARD_CONFIG
>  	# Runtime dependencies
>  	select BR2_PACKAGE_XAPP_XKBCOMP if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_XPROTO_XPROTO if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_XORG7

I'm always a bit warry about dependencies selected, that are not in the
.mk. Is it missing there?

But since that is not a problem your patch introduces:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	help
>  	  keyboard configuration database for X
>  
> -- 
> 2.17.1
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
