From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 22:33:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: enable MD4 in
 openssl
In-Reply-To: <20210522201209.642371-1-geomatsi@gmail.com>
References: <20210522201209.642371-1-geomatsi@gmail.com>
Message-ID: <20210522203340.GJ3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, All,

On 2021-05-22 23:12 +0300, Sergey Matyukevich spake thusly:
> Hostapd/wpa_supplicant crypto backend assumes that openssl always
> provides MD4 support. However MD4 support in openssl has become
> optional since  commit a83d41867c8d ("package/libopenssl: add
> option to enable some features").
> 
> Select openssl MD4 support in wpa_supplicant Kconfig to avoid
> build failures.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wpa_supplicant/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index 27ad22430a..67117c141b 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -1,6 +1,7 @@
>  menuconfig BR2_PACKAGE_WPA_SUPPLICANT
>  	bool "wpa_supplicant"
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  WPA supplicant for secure wireless networks
>  
> -- 
> 2.31.1
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
