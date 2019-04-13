From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:42:47 +0200
Subject: [Buildroot] [PATCH 3/3] package/pure-ftpd: add optional mysql
 dependency
In-Reply-To: <20190412205930.10268-3-fontaine.fabrice@gmail.com>
References: <20190412205930.10268-1-fontaine.fabrice@gmail.com>
 <20190412205930.10268-3-fontaine.fabrice@gmail.com>
Message-ID: <e5d2c833-c7c9-224e-5a1e-425465f16cce@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2019 22:59, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Just to be sure I did a build test with mariadb and that seems to have worked
out fine, so applied series to master, thanks.

 Regards,
 Arnout

> ---
>  package/pure-ftpd/pure-ftpd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
> index a9268b4446..93ad57c3f3 100644
> --- a/package/pure-ftpd/pure-ftpd.mk
> +++ b/package/pure-ftpd/pure-ftpd.mk
> @@ -30,6 +30,13 @@ ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
>  PURE_FTPD_DEPENDENCIES += libsodium
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MYSQL),y)
> +PURE_FTPD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
> +PURE_FTPD_DEPENDENCIES += mysql
> +else
> +PURE_FTPD_CONF_OPTS += --without-mysql
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENLDAP),y)
>  PURE_FTPD_CONF_OPTS += --with-ldap
>  PURE_FTPD_DEPENDENCIES += openldap
> 
