From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 15 Apr 2021 07:31:14 +0300
Subject: [Buildroot] [PATCH v1 3/3] package/postgis: add optional pcre
 dependency
In-Reply-To: <20210414201042.3685-3-ps.report@gmx.net>
References: <20210414201042.3685-1-ps.report@gmx.net>
 <20210414201042.3685-3-ps.report@gmx.net>
Message-ID: <a553455f-663b-5543-b9f2-4de593f4c823@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

14.04.2021 23:10, Peter Seiderer ?????:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/postgis/postgis.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
> index 5a2987b182..c6c1b8ff50 100644
> --- a/package/postgis/postgis.mk
> +++ b/package/postgis/postgis.mk
> @@ -35,4 +35,8 @@ else
>   POSTGIS_CONF_OPTS += --without-json
>   endif
>   
> +ifeq ($(BR2_PACKAGE_PCRE),y)
> +POSTGIS_DEPENDENCIES += pcre
> +endif
> +
>   $(eval $(autotools-package))
> 
