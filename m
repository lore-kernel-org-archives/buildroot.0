From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2015 22:56:50 +0200
Subject: [Buildroot] [PATCH] ofono: needs dynamic library support
In-Reply-To: <22ce3bf2a6a0a4284fc350731e0e52d005e50d5b.1433622461.git.baruch@tkos.co.il>
References: <22ce3bf2a6a0a4284fc350731e0e52d005e50d5b.1433622461.git.baruch@tkos.co.il>
Message-ID: <20150606205650.GG3581@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-06-06 23:27 +0300, Baruch Siach spake thusly:
> The only package selection ofono, connman, requires dynamic library already.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c5b/c5bb44c192c076b42538f805062a465318051df4/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ofono/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ofono/Config.in b/package/ofono/Config.in
> index eb1856fdb794..f709b04180d4 100644
> --- a/package/ofono/Config.in
> +++ b/package/ofono/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_OFONO
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>  	depends on BR2_USE_MMU # dbus, libglib2
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libcap-ng
> +	depends on !BR2_STATIC_LIBS # dlopen()
>  	select BR2_PACKAGE_LIBCAP_NG
>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_LIBGLIB2
> @@ -15,7 +16,7 @@ config BR2_PACKAGE_OFONO
>  
>  	  http://ofono.org/
>  
> -comment "ofono needs a toolchain w/ wchar, threads"
> +comment "ofono needs a toolchain w/ dynamic library, wchar, threads"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
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
