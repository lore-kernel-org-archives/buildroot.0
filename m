From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 22:50:24 +0100
Subject: [Buildroot] [PATCH] package/php: bump version to 7.4.2
In-Reply-To: <20200131090955.7948-1-p.debruijn@unilogic.nl>
References: <20200131090955.7948-1-p.debruijn@unilogic.nl>
Message-ID: <20200201225024.52e9d067@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal,

Thanks for this update. One question below.

On Fri, 31 Jan 2020 10:09:55 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> -PHP_VERSION = 7.3.14
> +PHP_VERSION = 7.4.2
>  PHP_SITE = http://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
> @@ -119,7 +119,6 @@ PHP_CONF_OPTS += \
>  	$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
>  	$(if $(BR2_PACKAGE_PHP_EXT_FILEINFO),--enable-fileinfo) \
>  	$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath) \
> -	$(if $(BR2_PACKAGE_PHP_EXT_MBSTRING),--enable-mbstring) \
>  	$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
>  
>  ifeq ($(BR2_PACKAGE_PHP_EXT_LIBARGON2),y)
> @@ -132,6 +131,11 @@ PHP_CONF_OPTS += --with-sodium=$(STAGING_DIR)/usr
>  PHP_DEPENDENCIES += libsodium
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PHP_EXT_MBSTRING),y)
> +PHP_CONF_OPTS += --enable-mbstring
> +PHP_DEPENDENCIES += oniguruma
> +endif

Even in the current 7.3.x version it seems like mbstrings uses
oniguruma. So is this really new? Or is it that what is new is the
ability to use an external oniguruma instead of the bundled one ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
