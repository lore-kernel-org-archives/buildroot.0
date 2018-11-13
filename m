From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 13 Nov 2018 00:35:19 +0000
Subject: [Buildroot] [PATCH] libp11: Add new package for OpenSSL PKCS#11
 engine
In-Reply-To: <20181109234640.18735-1-tpiepho@impinj.com>
References: <20181109234640.18735-1-tpiepho@impinj.com>
Message-ID: <1542069318.30311.399.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2018-11-09 at 23:47 +0000, Trent Piepho wrote:
> Library for using PKCS#11, which includes an engine for OpenSSL that
> lets it use PKCS#11 modules.  Which is really what this package is
> about, not that libp11 library itself, which has no users outside the of
> OpenSSL engine.

> 
> +LIBP11_VERSION = 0.4.9
> +LIBP11_SITE = https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FOpenSC%2Flibp11%2Freleases%2Fdownload%2Flibp11-%24(LIBP11_VERSION&amp;data=02%7C01%7Ctpiepho%40impinj.com%7Cbd8de140ec3244b8c42108d6469dc209%7C6de70f0f73574529a415d8cbb7e93e5e%7C0%7C0%7C636774040745907586&amp;sdata=IYhav3gbZ4QzBNDl%2BOxKLKP7R%2F9YysTtBH38oFcvs1w%3D&amp;reserved=0)
> +LIBP11_DEPENDENCIES = openssl
> +LIBP11_INSTALL_STAGING = YES
> +LIBP11_LICENSE = LGPLv2.1
> +LIBP11_LICENSE_FILES = COPYING
> +
> +ifeq ($(BR2_PACKAGE_P11_KIT),y)
> +LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
> +endif

Forgot to add:

HOST_LIBP11_DEPENDENCIES = host-openssl

> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
