From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 15:57:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcurl: add bearssl support
In-Reply-To: <20200315144105.2793488-1-fontaine.fabrice@gmail.com>
References: <20200315144105.2793488-1-fontaine.fabrice@gmail.com>
Message-ID: <20200315145737.GE19677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-15 15:41 +0100, Fabrice Fontaine spake thusly:
> bearssl support is available since version 7.68.0 and
> https://github.com/curl/curl/commit/9b879160df01e7ddbb4770904391d3b74114302b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcurl/Config.in  | 4 ++++
>  package/libcurl/libcurl.mk | 7 +++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> index d05cbedf77..b89c46f5ef 100644
> --- a/package/libcurl/Config.in
> +++ b/package/libcurl/Config.in
> @@ -52,6 +52,10 @@ config BR2_PACKAGE_LIBCURL_OPENSSL
>  	bool "OpenSSL"
>  	depends on BR2_PACKAGE_OPENSSL
>  
> +config BR2_PACKAGE_LIBCURL_BEARSSL
> +	bool "BearSSL"
> +	depends on BR2_PACKAGE_BEARSSL
> +
>  config BR2_PACKAGE_LIBCURL_GNUTLS
>  	bool "GnuTLS"
>  	depends on BR2_PACKAGE_GNUTLS
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 16b11ca944..5de2591178 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -51,6 +51,13 @@ else
>  LIBCURL_CONF_OPTS += --without-ssl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBCURL_BEARSSL),y)
> +LIBCURL_CONF_OPTS += --with-bearssl=$(STAGING_DIR)/usr
> +LIBCURL_DEPENDENCIES += bearssl
> +else
> +LIBCURL_CONF_OPTS += --without-bearssl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
>  LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
>  	--with-ca-fallback
> -- 
> 2.25.1
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
