From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2021 17:58:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/wine: add WINE_CPE_ID_VENDOR
In-Reply-To: <20210126211539.2497979-1-fontaine.fabrice@gmail.com>
References: <20210126211539.2497979-1-fontaine.fabrice@gmail.com>
Message-ID: <20210128165807.GT2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-26 22:15 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:winehq:wine is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awinehq%3Awine
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

However, the last CVE against wine was against version 3.13, while we're
already using 5.12, and 6.0 is already out...

Regards,
Yann E. MORIN.

> ---
>  package/wine/wine.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> index 7eafe9b06d..80c9d20d3d 100644
> --- a/package/wine/wine.mk
> +++ b/package/wine/wine.mk
> @@ -9,6 +9,7 @@ WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
>  WINE_SITE = https://dl.winehq.org/wine/source/5.x
>  WINE_LICENSE = LGPL-2.1+
>  WINE_LICENSE_FILES = COPYING.LIB LICENSE
> +WINE_CPE_ID_VENDOR = winehq
>  WINE_DEPENDENCIES = host-bison host-flex host-wine
>  HOST_WINE_DEPENDENCIES = host-bison host-flex
>  
> -- 
> 2.29.2
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
