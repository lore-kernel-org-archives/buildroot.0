From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 22:11:55 +0200
Subject: [Buildroot] [PATCH 4/4] php: remove redundant --static flag to
	pkg-config
In-Reply-To: <1437937112-13269-4-git-send-email-patrickdepinguin@gmail.com>
References: <1437937112-13269-1-git-send-email-patrickdepinguin@gmail.com>
 <1437937112-13269-4-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150726201155.GO3770@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-26 20:58 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The pkg-config tool is automatically passing --static when BR2_STATIC_LIBS
> is set (see package/pkgconf/pkgconf.mk), so no need to pass it explicitly
> from package .mk files.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/php/php.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 39f4e2a..4b171cf 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -116,7 +116,7 @@ PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
>  PHP_DEPENDENCIES += openssl
>  # openssl needs zlib, but the configure script forgets to link against
>  # it causing detection failures with static linking
> -PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs --static openssl`
> +PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
>  endif
>  
>  ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
> @@ -187,7 +187,7 @@ endif
>  ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
>  PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
>  PHP_DEPENDENCIES += sqlite
> -PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs --static sqlite3`
> +PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs sqlite3`
>  endif
>  
>  ### PDO
> -- 
> 1.8.5.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
