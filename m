From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Dec 2015 10:41:17 +0100
Subject: [Buildroot] [PATCH 1/2] libgudev: remove systemd dependency
In-Reply-To: <1449055626-4640-1-git-send-email-yegorslists@googlemail.com>
References: <1449055626-4640-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151207094117.GA4258@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,All,

On 2015-12-02 12:27 +0100, yegorslists at googlemail.com spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Since version 3.1.3 eudev doesn't provide internal libgudev,
> so this package can now be used as an ordinary stand-alone
> package.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libgudev/Config.in | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
> index 9b64ffc..4596fa1 100644
> --- a/package/libgudev/Config.in
> +++ b/package/libgudev/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_LIBGUDEV
>  	bool "libgudev"
> -	depends on BR2_INIT_SYSTEMD
>  	depends on BR2_USE_WCHAR # gettext
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> @@ -18,5 +17,4 @@ config BR2_PACKAGE_LIBGUDEV
>  
>  comment "libgudev needs a toolchain w/ wchar, threads"
>  	depends on BR2_USE_MMU
> -	depends on BR2_INIT_SYSTEMD
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.1.4
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
