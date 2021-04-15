From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 15 Apr 2021 07:31:08 +0300
Subject: [Buildroot] [PATCH v1 2/3] package/postgis: add optional json-c
 dependency
In-Reply-To: <20210414201042.3685-2-ps.report@gmx.net>
References: <20210414201042.3685-1-ps.report@gmx.net>
 <20210414201042.3685-2-ps.report@gmx.net>
Message-ID: <6d967345-fee2-229c-9a16-8a352c628ac2@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

14.04.2021 23:10, Peter Seiderer ?????:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/postgis/postgis.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
> index 92a9968993..5a2987b182 100644
> --- a/package/postgis/postgis.mk
> +++ b/package/postgis/postgis.mk
> @@ -28,4 +28,11 @@ else
>   POSTGIS_CONF_OPTS += --without-raster
>   endif
>   
> +ifeq ($(BR2_PACKAGE_JSON_C),y)
> +POSTGIS_DEPENDENCIES += json-c
> +POSTGIS_CONF_OPTS += --with-json
> +else
> +POSTGIS_CONF_OPTS += --without-json
> +endif
> +
>   $(eval $(autotools-package))
> 
