From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 21:59:10 +0200
Subject: [Buildroot] [RFC/next 1/1] package/hostapd: enable MD4 in
 openssl
In-Reply-To: <20210522194845.593676-1-geomatsi@gmail.com>
References: <20210522194845.593676-1-geomatsi@gmail.com>
Message-ID: <20210522195910.GC3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, All,

On 2021-05-22 22:48 +0300, Sergey Matyukevich spake thusly:
> Hostapd assumes that openssl always provides MD4 support. However MD4
> support in openssl has become optional since  commit a83d41867c8d
> ("package/libopenssl: add option to enable some features").
> 
> Select openssl MD4 support in hostapd Kconfig to avoid build failures.
> 
> Fixes:
> http://autobuild.buildroot.net/results/09ce1d8009da98cd2a3f2c8488abaa9f060a9d6b/
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/hostapd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> index 54d2086c09..1ac7f6cd5a 100644
> --- a/package/hostapd/Config.in
> +++ b/package/hostapd/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOSTAPD
>  	bool "hostapd"
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  User space daemon for wireless access points.
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
