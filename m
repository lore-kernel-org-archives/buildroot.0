From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Aug 2015 21:08:49 +0200
Subject: [Buildroot] [PATCH] libiio: test programs require threads
In-Reply-To: <254c2505374c4d6b33e13c4d4bf276ec1e4fbff5.1439268879.git.baruch@tkos.co.il>
References: <254c2505374c4d6b33e13c4d4bf276ec1e4fbff5.1439268879.git.baruch@tkos.co.il>
Message-ID: <20150813190849.GB3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-08-11 07:54 +0300, Baruch Siach spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/228/228a32167d05337acf17b0e3689aa91e8a67d8fb/
> http://autobuild.buildroot.net/results/86a/86adb968659fec56684ba80e1c4230230fd7a1c8/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libiio/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libiio/Config.in b/package/libiio/Config.in
> index 21496ed7c501..99da4c1c1000 100644
> --- a/package/libiio/Config.in
> +++ b/package/libiio/Config.in
> @@ -37,9 +37,13 @@ config BR2_PACKAGE_LIBIIO_TESTS
>  	bool "Install test programs"
>  	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
>  	select BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Although I prefer we list dependencies before we do selects:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	help
>  	  Install the test programs (iio_info, iio_genxml, iio_readdev).
>  
> +comment "IIO test programs need a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
>  config BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP
>  	bool "Install C# bindings"
>  	depends on BR2_PACKAGE_MONO
> -- 
> 2.5.0
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
