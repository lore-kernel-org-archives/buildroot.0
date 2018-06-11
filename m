From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 11 Jun 2018 22:19:09 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql --with-libxml configure
 option added
In-Reply-To: <549ffe67-ad9f-b607-6735-09faa86f0b09@gmx.de>
References: <549ffe67-ad9f-b607-6735-09faa86f0b09@gmx.de>
Message-ID: <20180611221909.662ad5ad@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

On Fri, 8 Jun 2018 08:46:42 +0200, Daniel Deterding <daniel.deterding@gmx.de> wrote:

> The postgresql package is now built with --with-libxml if 
> BR2_PACKAGE_LIBXML2 is selected to allow the use of XML functions in 
> postgresql.

Minor nit, maybe add:

  Fixes https://bugs.busybox.net/show_bug.cgi?id=11071

> 
> Signed-off-by: Daniel Deterding <dde@innovaphone.com>

Thanks for the patch, you can add my
Reviewed-by: Peter Seiderer <ps.report@gmx.net>

But I believe your email did not yet hit the mailing list/patchwork
(I did not find it there [1], [2])...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2018-June/date.html
[2] https://patchwork.ozlabs.org/project/buildroot/list/

> ---
>  ?package/postgresql/postgresql.mk | 8 ++++++++
>  ?1 file changed, 8 insertions(+)
> 
> diff --git a/package/postgresql/postgresql.mk 
> b/package/postgresql/postgresql.mk
> index 94b3e60e59..0940873686 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -70,6 +70,14 @@ else
>  ?POSTGRESQL_CONF_OPTS += --without-ldap
>  ?endif
> 
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +POSTGRESQL_DEPENDENCIES += libxml2
> +POSTGRESQL_CONF_OPTS += --with-libxml
> +POSTGRESQL_CONF_ENV += XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
> +else
> +POSTGRESQL_CONF_OPTS += --without-libxml
> +endif
> +
>  ?define POSTGRESQL_USERS
>  ??????? postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL 
> Server
>  ?endef
> --
> 2.11.0
> 
> 
