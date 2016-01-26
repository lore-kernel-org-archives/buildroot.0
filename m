From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2016 23:31:13 +0100
Subject: [Buildroot] [PATCH 15/21] thrift: remove BR2_ARCH_HAS_ATOMICS
 dependency
In-Reply-To: <1453676887-31236-16-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-16-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160126223113.GE3462@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-25 00:08 +0100, Thomas Petazzoni spake thusly:
> thrift builds perfectly fine on SPARC, which doesn't implement any of
> the __sync built-ins, so we can get rid of the BR2_ARCH_HAS_ATOMICS
> dependency.
> 
> The dependency on atomic operations originated in commit
> 1aaa14d84f1c920423ed0286b78f64a2b4b2b575 ("thrift: disable for ARC"),
> but there was no reference to any autobuilder failure. Our testing
> with an ARC toolchain that doesn't have atomics shows that thrift
> builds just fine, and code inspection also shows no usage of
> __sync_*() built-ins. At the time of the commit, the thrift version
> was 0.9.1, which also did not contain any __sync_*() call.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: build-tested on an ARC toolchain without
 atomics, with CPU 770D]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/thrift/Config.in | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/thrift/Config.in b/package/thrift/Config.in
> index b9960f8..54ca9b8 100644
> --- a/package/thrift/Config.in
> +++ b/package/thrift/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_THRIFT
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_LIBEVENT
> @@ -20,7 +19,6 @@ config BR2_PACKAGE_THRIFT
>  	  http://thrift.apache.org/
>  
>  comment "thrift needs a toolchain w/ C++, wchar, threads"
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
>  	depends on !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.6.4
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
