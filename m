From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Dec 2017 07:40:48 +0200
Subject: [Buildroot] [PATCH 7/9] libcurl: add host variant
In-Reply-To: <20171217175808.31392-8-eric.le.bihan.dev@free.fr>
References: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
 <20171217175808.31392-8-eric.le.bihan.dev@free.fr>
Message-ID: <20171218054048.mfakm2dfbaybnlz3@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Sun, Dec 17, 2017 at 06:58:06PM +0100, Eric Le Bihan wrote:
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/libcurl/libcurl.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 0aab58a7de..c95b0eea6b 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -88,4 +88,17 @@ endef
>  LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
>  endif
>  
> +HOST_LIBCURL_DEPENDENCIES = host-openssl
> +HOST_LIBCURL_CONF_OPTS = \
> +	--disable-manual \
> +	--disable-ntlm-wb \
> +	--disable-curldebug \
> +	--without-gnutls \
> +	--without-mbedtls \
> +	--without-polarssl \
> +	--without-nss

What about --with-ssl=...? Isn't that needed for the linking with 
host-openssl?

baruch

> +
> +HOST_LIBCURL_POST_PATCH_HOOKS += LIBCURL_FIX_DOT_PC
> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
