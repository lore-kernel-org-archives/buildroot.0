From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 8 Apr 2019 10:25:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/gettext-gnu: Fix typo
 BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL
In-Reply-To: <20190408002821.12763-1-vadim4j@gmail.com>
References: <20190408002821.12763-1-vadim4j@gmail.com>
Message-ID: <eacc8f98-630b-933f-f5c5-d0e3446b64f9@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vadim, All,

Le 08/04/2019 ? 02:28, Vadim Kochan a ?crit?:
> After commit:
> 
> 	ea1e7ee606 package/gettext: turn into virtual package
> 
> package/gettext was renamed to package/gettext-gnu and introduced typo
> BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL which should be
> BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL (w/o "_GNU" part).
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> ---
>  package/gettext-gnu/gettext-gnu.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
> index 61adf72738..c63ad8cb36 100644
> --- a/package/gettext-gnu/gettext-gnu.mk
> +++ b/package/gettext-gnu/gettext-gnu.mk
> @@ -42,7 +42,7 @@ HOST_GETTEXT_GNU_CONF_OPTS = \
>  
>  # Force the build of libintl, even if the C library provides a stub
>  # gettext implementation
> -ifeq ($(BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL),y)
> +ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
>  GETTEXT_GNU_CONF_OPTS += --with-included-gettext
>  else
>  GETTEXT_GNU_CONF_OPTS += --without-included-gettext
> 
