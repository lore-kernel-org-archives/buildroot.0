From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 19:43:27 +0200
Subject: [Buildroot] [PATCH 1/2] libupnpp: new package
In-Reply-To: <1413813009-20149-1-git-send-email-jkrause@posteo.de>
References: <1413813009-20149-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141020174327.GG3742@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2014-10-20 15:50 +0200, J?rg Krause spake thusly:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
[--SNIP--]
> diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
> new file mode 100644
> index 0000000..5a79452
> --- /dev/null
> +++ b/package/libupnpp/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_LIBUPNPP
> +	bool "libupnpp"
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBUPNP
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_LARGEFILE # libupnp
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto

Nice! It proves you did quite some testing! :-)

> +	help
> +	  The libupnpp C++ library wraps libupnp for easier use by upmpdcli and
> +	  upplay.
> +
> +	  http://www.lesbonscomptes.com/upmpdcli/
> +
> +comment "upmpdcli needs a toolchain w/ C++, largefile, threads"

'upmpdcli', really?

Otherwise, looks good. With the above mishap fixed, you can add my:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
> new file mode 100644
> index 0000000..d46de14
> --- /dev/null
> +++ b/package/libupnpp/libupnpp.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libupnpp
> +#
> +################################################################################
> +
> +LIBUPNPP_VERSION = 0.8.5
> +LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
> +LIBUPNPP_LICENSE = GPLv2+
> +LIBUPNPP_LICENSE_FILES = COPYING
> +LIBUPNPP_INSTALL_STAGING = YES
> +LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
> +
> +$(eval $(autotools-package))
> -- 
> 2.1.2
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
