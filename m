From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Nov 2019 21:13:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/minizip: fix options
In-Reply-To: <20191106175957.32565-1-fontaine.fabrice@gmail.com>
References: <20191106175957.32565-1-fontaine.fabrice@gmail.com>
Message-ID: <20191107201346.GF3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-06 18:59 +0100, Fabrice Fontaine spake thusly:
> Options have been prefixed by MZ_ since version 2.8.3 and
> https://github.com/nmoinvaz/minizip/commit/cdedc087e7306fbe2c73d4302920846f5c4a8a11
> 
> This will fix a build failure with php due to the compat headers being
> enabled
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fee97d1879b5ea2d9630b2ae629f12b0e202a50e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/minizip/minizip.mk | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
> index bf0b6198b0..3ae8d1d6f0 100644
> --- a/package/minizip/minizip.mk
> +++ b/package/minizip/minizip.mk
> @@ -12,30 +12,30 @@ MINIZIP_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  MINIZIP_INSTALL_STAGING = YES
>  MINIZIP_CONF_OPTS = \
> -	$(if $(BR2_PACKAGE_MINIZIP_DEMOS),-DBUILD_TEST=ON) \
> -	-DUSE_COMPAT=OFF
> +	$(if $(BR2_PACKAGE_MINIZIP_DEMOS),-DMZ_BUILD_TEST=ON) \
> +	-DMZ_COMPAT=OFF
>  MINIZIP_LICENSE = Zlib
>  MINIZIP_LICENSE_FILES = LICENSE
>  
>  ifeq ($(BR2_PACKAGE_BZIP2),y)
>  MINIZIP_DEPENDENCIES += bzip2
> -MINIZIP_CONF_OPTS += -DUSE_BZIP2=ON
> +MINIZIP_CONF_OPTS += -DMZ_BZIP2=ON
>  else
> -MINIZIP_CONF_OPTS += -DUSE_BZIP2=OFF
> +MINIZIP_CONF_OPTS += -DMZ_BZIP2=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  MINIZIP_DEPENDENCIES += openssl
> -MINIZIP_CONF_OPTS += -DUSE_OPENSSL=ON
> +MINIZIP_CONF_OPTS += -DMZ_OPENSSL=ON
>  else
> -MINIZIP_CONF_OPTS += -DUSE_OPENSSL=OFF
> +MINIZIP_CONF_OPTS += -DMZ_OPENSSL=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  MINIZIP_DEPENDENCIES += zlib
> -MINIZIP_CONF_OPTS += -DUSE_ZLIB=ON
> +MINIZIP_CONF_OPTS += -DMZ_ZLIB=ON
>  else
> -MINIZIP_CONF_OPTS += -DUSE_ZLIB=OFF
> +MINIZIP_CONF_OPTS += -DMZ_ZLIB=OFF
>  endif
>  
>  $(eval $(cmake-package))
> -- 
> 2.23.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
