From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 09:13:55 +0100
Subject: [Buildroot] [PATCH 2/3] package/libupnp18: add optional
 dependency to openssl
In-Reply-To: <20171214073134.28696-2-bernd.kuhls@t-online.de>
References: <20171214073134.28696-1-bernd.kuhls@t-online.de>
 <20171214073134.28696-2-bernd.kuhls@t-online.de>
Message-ID: <20171214091355.7243dc44@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Dec 2017 08:31:33 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libupnp18/libupnp18.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
> index a75558e92b..b5d1a264a9 100644
> --- a/package/libupnp18/libupnp18.mk
> +++ b/package/libupnp18/libupnp18.mk
> @@ -12,4 +12,12 @@ LIBUPNP18_INSTALL_STAGING = YES
>  LIBUPNP18_LICENSE = BSD-3-Clause
>  LIBUPNP18_LICENSE_FILES = LICENSE
>  
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
> +LIBUPNP18_CONF_OPTS += --enable-open-ssl
> +LIBUPNP18_DEPENDENCIES += libopenssl
> +LIBUPNP18_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
> +else
> +LIBUPNP18_CONF_OPTS += --disable-open-ssl
> +endif

So, I gather than it doesn't work with LibreSSL? If so, it would have
been nice to indicate in the commit log, so we know it's intentional to
use libopenssl and not the openssl virtual package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
