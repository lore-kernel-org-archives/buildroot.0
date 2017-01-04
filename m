From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 4 Jan 2017 14:21:51 +0100
Subject: [Buildroot] [PATCH 02/52] package/libpjsip: drop path to
 staging to find libsrtp
In-Reply-To: <6e1d6ebdd990ad2d9921f85b622103d7310120da.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
 <6e1d6ebdd990ad2d9921f85b622103d7310120da.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <628d9d54-3d4a-42a8-62a4-1be54da96541@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 30/12/2016 11:29, Yann E. MORIN wrote:
> As it happens, specifying the path where to look for libsrtp is not
> needed: pjsip does not use the argument to --with-external-srtp as a
> search path at all; it only checks whether it is 'no' or something
> else.

Oh dear, and it's even documented in ./configure --help! Thanks for
noticing.

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/libpjsip/libpjsip.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 7d30bbb..551dbd9 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -53,7 +53,7 @@ LIBPJSIP_CONF_OPTS = \
>  	--disable-ipp \
>  	--disable-ssl \
>  	--disable-silk \
> -	--with-external-srtp=$(STAGING_DIR)/usr
> +	--with-external-srtp

Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
