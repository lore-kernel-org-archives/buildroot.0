From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Dec 2014 19:30:02 +0100
Subject: [Buildroot] [PATCH 1/3] package/aiccu: disable broken
 toolchains on nios2
In-Reply-To: <1417366134-2098-1-git-send-email-bernd.kuhls@t-online.de>
References: <1417366134-2098-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141203183002.GB4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-30 17:48 +0100, Bernd Kuhls spake thusly:
> As discussed with Thomas
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/100998
> only the current toolchains are broken:
> "it's better to blacklist the individual toolchains that are known
> to be broken, so that if we add another toolchain, we will be able
> to see if the same bug happens as well or not."
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/aiccu/Config.in |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
> index 51e5fb7..ce5cea6 100644
> --- a/package/aiccu/Config.in
> +++ b/package/aiccu/Config.in
> @@ -11,7 +11,8 @@ config BR2_PACKAGE_AICCU
>  	# toolchains.
>  	depends on !BR2_avr32
>  	# Triggers the _gp link issue
> -	depends on !BR2_nios2
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
>  	select BR2_PACKAGE_GNUTLS
>  	help
>  	  SixXS Automatic IPv6 Connectivity Client Utility
> @@ -31,4 +32,5 @@ comment "aiccu needs a toolchain w/ IPv6, wchar, threads"
>  	depends on BR2_USE_MMU
>  	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
>  	depends on !BR2_avr32
> -	depends on !BR2_nios2
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
> -- 
> 1.7.10.4
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
