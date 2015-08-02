From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2015 17:29:03 +0200
Subject: [Buildroot] [PATCH 3/3] package/libv4l: needs argp-standalone
 with musl toolchains
In-Reply-To: <1438448118-26198-3-git-send-email-romain.naour@openwide.fr>
References: <1438448118-26198-1-git-send-email-romain.naour@openwide.fr>
 <1438448118-26198-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150802152903.GF3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-08-01 18:55 +0200, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/libv4l/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
> index 0437ba1..0ae12d1 100644
> --- a/package/libv4l/Config.in
> +++ b/package/libv4l/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBV4L
>  	depends on !BR2_STATIC_LIBS # dlopen()
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
> -	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
> +	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL

Ditto, you also need to adjust the build dependencies in the .mk .

However, that one is doing things differently than the other two. It
currently build-depends on argp-standalone and links with it as soon as
the package is enabled.

I'm nt sure that's the best soltuion; it should only do that if built
against uClibc or musl, like rng-tools and elfutils currently do.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	help
>  	  libv4l is a collection of libraries which adds a thin abstraction
> -- 
> 2.4.3
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
