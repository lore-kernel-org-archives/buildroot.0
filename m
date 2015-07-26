From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 22:10:33 +0200
Subject: [Buildroot] [PATCH 3/4] nmap: remove redundant --static flag to
	pkg-config
In-Reply-To: <1437937112-13269-3-git-send-email-patrickdepinguin@gmail.com>
References: <1437937112-13269-1-git-send-email-patrickdepinguin@gmail.com>
 <1437937112-13269-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150726201033.GN3770@free.fr>
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
> Additionally, replace a missed occurrence of $(shell) with backticks.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/nmap/nmap.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index d450f5e..1a0e977 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -30,7 +30,7 @@ NMAP_POST_PATCH_HOOKS += NMAP_WRAPPER_EXEC
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  NMAP_CONF_OPTS += --with-openssl="$(STAGING_DIR)/usr"
>  NMAP_DEPENDENCIES += host-pkgconf openssl
> -NMAP_LIBS_FOR_STATIC_LINK += $(shell $(PKG_CONFIG_HOST_BINARY) --libs --static openssl)
> +NMAP_LIBS_FOR_STATIC_LINK += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
>  else
>  NMAP_CONF_OPTS += --without-openssl
>  endif
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
