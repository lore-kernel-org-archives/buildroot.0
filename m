From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Jul 2018 16:09:31 +0200
Subject: [Buildroot] [PATCH] postgresql: add optional dependency on
 libxml2
In-Reply-To: <AD312B93A689234094FC24F3B98DBF33437A1740@INNO-EX-2010.innovaphone.sifi>
References: <AD312B93A689234094FC24F3B98DBF33437A1740@INNO-EX-2010.innovaphone.sifi>
Message-ID: <e1baf41a-62dc-3e2f-500b-9859cac70261@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-07-18 09:41, Thomas Ehrhardt wrote:
> The postgresql package is now built with --with-libxml if BR2_PACKAGE_LIBXML2 is selected to allow the use of XML functions in postgresql.

 Please wrap commit message lines at 72 columns. vim does this by default.

> 
> Signed-off-by: Daniel Deterding <dde@innovaphone.com>
> Signed-off-by: Thomas Ehrhardt <tehrhardt@innovaphone.com>

 Since you haven't changed the author, I guess you are the primary author and
applied the patch to master.

 Regards,
 Arnout

> ---
>  package/postgresql/postgresql.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 94b3e60e59..0940873686 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -70,6 +70,14 @@ else
>  POSTGRESQL_CONF_OPTS += --without-ldap
>  endif
> 
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +POSTGRESQL_DEPENDENCIES += libxml2
> +POSTGRESQL_CONF_OPTS += --with-libxml
> +POSTGRESQL_CONF_ENV += XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
> +else
> +POSTGRESQL_CONF_OPTS += --without-libxml
> +endif
> +
>  define POSTGRESQL_USERS
>         postgres -1 postgres -1 * /var/lib/pgsql /bin/sh - PostgreSQL Server
>  endef
> --
> 2.11.0
> 
> _______________________________________________________________________________
> 
> Thomas Ehrhardt | Development
> _______________________________________________________________________________
> 
> innovaphone AG
> PURE IP COMMUNICATIONS
> 
> B?blinger Stra?e 76 | 71065 Sindelfingen | Germany
> Tel: +49(7031)73009-648 | Fax: +49(7031)73009-9
> E-Mail: tehrhardt at innovaphone.com | http://www.innovaphone.com
> 
> [Sitz der Gesellschaft: Sindelfingen | HRB Nr. 245196 Amtsgericht Stuttgart | Vorstand: Dagmar Geer (Vorsitzende), Carsten Bode, Guntram Diehl, Gerd Hornig | Vorsitzender des Aufsichtsrates: Gebhard Michel]
> 
> 
> Campaign - https://www.youtube.com/user/innovaphoneTV
> [X]
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
