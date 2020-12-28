From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:36:27 +0100
Subject: [Buildroot] [PATCH 2/2] package/php: needs pcre2
In-Reply-To: <20201227183145.1965023-2-bernd.kuhls@t-online.de>
References: <20201227183145.1965023-1-bernd.kuhls@t-online.de>
 <20201227183145.1965023-2-bernd.kuhls@t-online.de>
Message-ID: <20201228223627.51a0a518@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Dec 2020 19:31:45 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> -### Use external PCRE if it's available
> -ifeq ($(BR2_PACKAGE_PCRE2),y)
> -PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
> -PHP_DEPENDENCIES += pcre2
> -
> -ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
> -PHP_CONF_OPTS += --with-pcre-jit=yes
> -PHP_CONF_ENV += ac_cv_have_pcre2_jit=yes
> -else
> -PHP_CONF_OPTS += --with-pcre-jit=no
> -PHP_CONF_ENV += ac_cv_have_pcre2_jit=no
> -endif

Are you sure this is no longer needed ? According to
https://github.com/php/php-src/commit/c1a22f3d4e69cb87f8deeed7d03d9434e6901537
that you are pointing, the --with-pcre-jit option is not only for the
bundled PCRE.

This PCRE JIT stuff was relatively recently added by Buildroot commit
58896f5c976bb61391ab34bb5826f429346f9a6a.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
