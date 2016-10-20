From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 20 Oct 2016 21:47:55 +0200
Subject: [Buildroot] [PATCH 2/2] postgresql: enable ldap support for
 pg_service.conf
In-Reply-To: <1476893310-25852-2-git-send-email-cdf123@cdf123.net>
References: <1476893310-25852-1-git-send-email-cdf123@cdf123.net>
 <1476893310-25852-2-git-send-email-cdf123@cdf123.net>
Message-ID: <20161020214755.5e27504b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Wed, 19 Oct 2016 11:08:30 -0500, Chris Frederick <cdf123@cdf123.net> wrote:

> Just needed to add --with-ldap to POSTGRESQL_CONF_OPTS and add openldap
> to POSTGRESQL_DEPENDENCIES when BR2_PACKAGE_OPENLDAP is on
> 
> Signed-off-by: Chris Frederick <cdf123@cdf123.net>
> ---
>  package/postgresql/postgresql.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 7179bbe..ab615d0 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -57,6 +57,11 @@ POSTGRESQL_DEPENDENCIES += openssl
>  POSTGRESQL_CONF_OPTS += --with-openssl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENLDAP),y)
> +POSTGRESQL_DEPENDENCIES += openldap
> +POSTGRESQL_CONF_OPTS += --with-ldap
> +endif
> +
>  define POSTGRESQL_USERS
>  	postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
>  endef

Tested-by: Peter Seiderer <ps.report@gmx.net>

Compile tested (and checked for the 'build with LDAP support... yes' configure output).

Regards,
Peter
