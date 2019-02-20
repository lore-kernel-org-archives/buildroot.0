From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Feb 2019 22:34:24 +0100
Subject: [Buildroot] [PATCH] libcurl: fix typo in configure option w/o
 OpenSSL
In-Reply-To: <20190220013958.24225-1-tpiepho@impinj.com>
References: <20190220013958.24225-1-tpiepho@impinj.com>
Message-ID: <f8da7da1-0860-547f-e172-f57d7b6f8ad2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/02/2019 02:40, Trent Piepho wrote:
> When not using OpenSSL, the correct option to configure is --without-ssl
> with two dashes.
> 
> Fixes: b8b78e7e6a ("libcurl: Allow selection of TLS package libcurl will use")
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

 Applied to master, thanks.

 Peter, this is for 2018.11.x

 Regards,
 Arnout

> ---
>  package/libcurl/libcurl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 1fae41ea3a..509dbdb54e 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -46,7 +46,7 @@ LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)
>  LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
>  	--with-ca-path=/etc/ssl/certs
>  else
> -LIBCURL_CONF_OPTS += -without-ssl
> +LIBCURL_CONF_OPTS += --without-ssl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
> 
