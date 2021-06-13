From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 14:35:59 +0200
Subject: [Buildroot] [PATCH 1/1] mtd-utils-2.1.2: ubihealthd depends on
 ubifs support
In-Reply-To: <20210609234819.1860554-2-mmayer@broadcom.com>
References: <20210609234819.1860554-1-mmayer@broadcom.com>
 <20210609234819.1860554-2-mmayer@broadcom.com>
Message-ID: <20210613123559.GP168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2021-06-09 16:48 -0700, Markus Mayer via buildroot spake thusly:
> ubihealthd is only being built, if mtd-utils are being built
> --with-ubifs. Reflect that dependency within buildroot.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/mtd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index c7ad3b3cdc9c..64a7ae19a7e2 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -139,6 +139,7 @@ config BR2_PACKAGE_MTD_UBIFORMAT
>  
>  config BR2_PACKAGE_MTD_UBIHEALTHD
>  	bool "ubihealthd"
> +	depends on BR2_PACKAGE_MTD_UBIFS_UTILS

    # make check-package
    package/mtd/Config.in:143: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  	default y
>  
>  config BR2_PACKAGE_MTD_UBIMKVOL
> -- 
> 2.25.1
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
