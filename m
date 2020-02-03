From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 17:42:58 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi: needs extra encodings in
 libiconv
In-Reply-To: <20200201125921.1193669-2-bernd.kuhls@t-online.de>
References: <20200201125921.1193669-1-bernd.kuhls@t-online.de>
 <20200201125921.1193669-2-bernd.kuhls@t-online.de>
Message-ID: <20200203164258.GI3299@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-02-01 13:59 +0100, Bernd Kuhls spake thusly:
> The Kodi build system also enables extra encodings:
> https://github.com/xbmc/xbmc/blob/Leia/tools/depends/target/libiconv/Makefile#L13
> 
> Without them addons fail to install:
> https://github.com/garbear/kodi-steamlink/issues/34#issuecomment-579392269
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index f592e18e13..65e7768d6d 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -65,6 +65,7 @@ menuconfig BR2_PACKAGE_KODI
>  	select BR2_PACKAGE_LIBCURL
>  	select BR2_PACKAGE_LIBFRIBIDI
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +	select BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS if !BR2_ENABLE_LOCALE
>  	select BR2_PACKAGE_LIBPLIST
>  	select BR2_PACKAGE_LIBSAMPLERATE
>  	select BR2_PACKAGE_LZO
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
