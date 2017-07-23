From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Jul 2017 11:19:35 +0300
Subject: [Buildroot] [Patch v7 07/10] libssh2: add host variant
In-Reply-To: <20170723081206.7774-8-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-8-eric.le.bihan.dev@free.fr>
Message-ID: <20170723081935.5zrcwe5djywrucbi@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Sun, Jul 23, 2017 at 10:12:03AM +0200, Eric Le Bihan wrote:
> Allow build of host variant of libssh2, which depends on host-openssl.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/libssh2/libssh2.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index 338f5b4..64c59bc 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -40,4 +40,10 @@ else
>  LIBSSH2_CONF_OPTS += --without-libz
>  endif
>  
> +HOST_LIBSSH2_DEPENDENCIES += host-openssl
> +HOST_LIBSSH2_CONF_OPTS += --with-openssl \
> +	--with-libssl-prefix=$(HOST_DIR)/usr \
> +	--without-libgcrypt

You should probably also add --without-mbedtls.

baruch

> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
