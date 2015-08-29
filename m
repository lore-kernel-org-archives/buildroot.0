From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2015 16:37:09 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/tvheadend: needs dynamic
 libraries
In-Reply-To: <1440855392-3323-1-git-send-email-bernd.kuhls@t-online.de>
References: <1440855392-3323-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150829143709.GE4857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-08-29 15:36 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/
> http://autobuild.buildroot.net/results/bd0/bd0e8619df7cd8f21da96ae470691b1ebb2f156c/
> http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v4: tvheadend depends on dladdr() and needs dynamic libraries (Thomas, Yann)
> v3: Changed patch to fix Makefile instead (Thomas)
> v2: Put everything in the if-static_libs-then clause (Jerzy)
> 
>  package/tvheadend/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> index 4edf014..aef5454 100644
> --- a/package/tvheadend/Config.in
> +++ b/package/tvheadend/Config.in
> @@ -1,8 +1,10 @@
> -comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_TVHEADEND
>  	bool "tvheadend"
> +	depends on !BR2_STATIC_LIBS # dladdr()
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>  	select BR2_PACKAGE_DTV_SCAN_TABLES
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
