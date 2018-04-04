From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 21:41:50 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libupnp18: add optional
 dependency to openssl/libressl
In-Reply-To: <20180402082151.20662-1-bernd.kuhls@t-online.de>
References: <20180402082151.20662-1-bernd.kuhls@t-online.de>
Message-ID: <20180404214150.3a0c4ff8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Apr 2018 10:21:51 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Added and build-tested support for LibreSSL (Thomas)
> 
>  package/libupnp18/libupnp18.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
> index a75558e92b..07ef4382f0 100644
> --- a/package/libupnp18/libupnp18.mk
> +++ b/package/libupnp18/libupnp18.mk
> @@ -12,4 +12,12 @@ LIBUPNP18_INSTALL_STAGING = YES
>  LIBUPNP18_LICENSE = BSD-3-Clause
>  LIBUPNP18_LICENSE_FILES = LICENSE
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBUPNP18_CONF_OPTS += --enable-open-ssl
> +LIBUPNP18_DEPENDENCIES += host-pkgconf openssl
> +LIBUPNP18_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"

Weird that the configure.ac script doesn't have any logic to link
against OpenSSL, but that's indeed the case.

Therefore: applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
