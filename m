From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Apr 2021 21:30:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfreefare: drop threads
 dependency
In-Reply-To: <20210425135454.2460266-1-fontaine.fabrice@gmail.com>
References: <20210425135454.2460266-1-fontaine.fabrice@gmail.com>
Message-ID: <20210425193048.GA298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-25 15:54 +0200, Fabrice Fontaine spake thusly:
> This dependency should have dropped by commit
> 1a49188a69416542087acd1246b17c0139ff0054 which removed threads
> dependency from libnfc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfreefare/Config.in | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
> index 2bb0c93ddf..b330b2256a 100644
> --- a/package/libfreefare/Config.in
> +++ b/package/libfreefare/Config.in
> @@ -1,12 +1,8 @@
>  config BR2_PACKAGE_LIBFREEFARE
>  	bool "libfreefare"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_LIBNFC
>  	help
>  	  Library for high level manipulation of MIFARE cards.
>  
>  	  http://nfc-tools.org/index.php?title=Libfreefare
> -
> -comment "libfreefare needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.30.2
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
