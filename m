From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 26 Aug 2015 12:07:47 +0100
Subject: [Buildroot] [PATCH] tn5250: fix static build with openssl
In-Reply-To: <88bb0424ee487e10af488dafdb30914439569076.1440584935.git.baruch@tkos.co.il>
References: <88bb0424ee487e10af488dafdb30914439569076.1440584935.git.baruch@tkos.co.il>
Message-ID: <55DD9E03.6060200@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On 08/26/2015 11:28 AM, Baruch Siach wrote:
> OpenSSL needs libz. Use pkg-config to find dependencies.
> 
> Fixes:
> http://autobuild.buildroot.net/results/95f/95f6df0d01e4944ecd84e830e2bbd8389e1d3e3d/
> http://autobuild.buildroot.net/results/432/432b1fdec1e6282d51ba1d859c0f4ab9ed2a5efc/
> http://autobuild.buildroot.net/results/d6a/d6a7125c21b4f92b69bb9e30b05c4727eedb63ba/
> 
> and more.
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/tn5250/tn5250.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
> index 213f02cb68e8..180f9225598b 100644
> --- a/package/tn5250/tn5250.mk
> +++ b/package/tn5250/tn5250.mk
> @@ -13,7 +13,8 @@ TN5250_LICENSE_FILES = COPYING
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  TN5250_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
> -TN5250_DEPENDENCIES += openssl
> +TN5250_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
> +TN5250_DEPENDENCIES += openssl host-pkgconf
>  else
>  TN5250_CONF_OPTS += --without-ssl
>  endif
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture was successful.

Regards,

Vincent.
