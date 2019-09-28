From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:19:34 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/libsodium: add config for
 full build
In-Reply-To: <20190923082902.28472-1-adrien@gallouet.fr>
References: <20190923082902.28472-1-adrien@gallouet.fr>
Message-ID: <20190928231934.236e5f83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Sep 2019 08:29:03 +0000
Adrien Gallou?t <adrien@gallouet.fr> wrote:

> +config BR2_PACKAGE_LIBSODIUM_FULL
> +	bool "all functions"
> +	default y
> +	help
> +	  Build all seldom used and obsolete functions. Without
> +	  this option, only the minimal set of normally used
> +	  functions is built.
> +
> +endif
> diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
> index a94a8271c5..9afa09ff37 100644
> --- a/package/libsodium/libsodium.mk
> +++ b/package/libsodium/libsodium.mk
> @@ -14,5 +14,9 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
>  LIBSODIUM_CONF_OPTS += --disable-pie
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSODIUM_FULL),)
> +LIBSODIUM_CONF_OPTS += --enable-minimal

But then, does it make sense to invert the option and name it
BR2_PACKAGE_LIBSODIUM_MINIMAL ? It would match the
--enable-minimal/--disable-minimal autoconf options of libsodium.

Also, we need to pass --disable-minimal in an "else" clause.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
