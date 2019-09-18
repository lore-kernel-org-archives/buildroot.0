From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Sep 2019 17:48:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: add support for mbedtls
 crypto backend
In-Reply-To: <20190918110609.7172-1-gliga.mircea@gmail.com>
References: <20190918110609.7172-1-gliga.mircea@gmail.com>
Message-ID: <20190918174859.1627727d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mircea,

Thanks for this contribution!

On Wed, 18 Sep 2019 14:06:09 +0300
Mircea Gliga <gliga.mircea@gmail.com> wrote:

> +choice
> +	prompt "Crypto Backend"
> +	default BR2_PACKAGE_LIBSSH_LIBGCRYPT if BR2_PACKAGE_LIBGCRYPT
> +	default BR2_PACKAGE_LIBSSH_OPENSSL if BR2_PACKAGE_OPENSSL
> +	default BR2_PACKAGE_LIBSSH_MBEDTLS if BR2_PACKAGE_MBEDTLS
> +	help
> +	  Select crypto library to be used in libssh.
> +
> +config BR2_PACKAGE_LIBSSH_MBEDTLS
> +	bool "mbedtls"
> +	depends on BR2_PACKAGE_MBEDTLS
> +
> +config BR2_PACKAGE_LIBSSH_LIBGCRYPT
> +	bool "gcrypt"
> +	depends on BR2_PACKAGE_LIBGCRYPT
> +
> +config BR2_PACKAGE_LIBSSH_OPENSSL
> +	bool "openssl"
> +	depends on BR2_PACKAGE_OPENSSL
> +
> +endchoice
> +endif

I am wondering if we really need an explicit choice option here. Can't
we just use one of the three crypto libraries, depending on which one
is available ? Is there a good benefit in being able to explicitly
select which crypto backend to use ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
