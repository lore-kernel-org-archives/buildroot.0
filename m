From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 22:41:01 +0100
Subject: [Buildroot] [PATCH V2] package/c-periphery: Bump version to
 2.1.0
In-Reply-To: <20200108224034.14703-1-offougajoris@gmail.com>
References: <20200108224034.14703-1-offougajoris@gmail.com>
Message-ID: <20200110224101.7dbd25a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joris,

On Wed,  8 Jan 2020 23:40:34 +0100
Joris Offouga <offougajoris@gmail.com> wrote:

> diff --git a/package/c-periphery/Config.in b/package/c-periphery/Config.in
> index 0bfb4b1f11..bcb906da76 100644
> --- a/package/c-periphery/Config.in
> +++ b/package/c-periphery/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_C_PERIPHERY
>  	bool "c-periphery"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
>  	help
>  	  c-periphery is a set of C wrapper functions for GPIO, SPI,
>  	  I2C, MMIO, and Serial peripheral I/O interface access in
> @@ -14,3 +15,6 @@ config BR2_PACKAGE_C_PERIPHERY
>  	  integration with other projects, and is MIT licensed.
>  
>  	  https://github.com/vsergeev/c-periphery
> +
> +comment "c-periphery needs kernel headers >= 4.8"

Should have been:

comment "c-periphery needs a toolchain w/ kernel headers >= 4.8"

> +		depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8

Indentation was not good here, as reported by check-package.

> diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
> index 8f3bd8a3da..244f8f60f1 100644
> --- a/package/c-periphery/c-periphery.hash
> +++ b/package/c-periphery/c-periphery.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 50665a4f298b30e4cc8f7dbd38362fd860cc3746803d00325cb04806674e3166  c-periphery-1.1.3.tar.gz
> -sha256 6b5669a90260126f0600aae98cb10fb5e219269dc9cbd0137f63927b96d5c31d  LICENSE
> +sha256 1c455c42b26818d199ac227cd19714f265623e15d363fdfdf47a2416a4165654  c-periphery-2.1.0.tar.gz
> +sha256 e7b9464cb8511f19ddb40f9cf52fe86b3dfe38b2faed9d7bbc3d5707677ffbe3  LICENSE

Changes in the hash of the license file must be explained in the commit
log.

I have fixed the above issues and applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
