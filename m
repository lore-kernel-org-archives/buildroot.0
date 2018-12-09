From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:35:26 +0100
Subject: [Buildroot] [next v3 1/1] package/proftpd: add mod_sql_sqlite
In-Reply-To: <20181203143418.5153-1-jared.bents@rockwellcollins.com>
References: <20181203143418.5153-1-jared.bents@rockwellcollins.com>
Message-ID: <20181209173526.4e133c04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 08:34:18 -0600, Jared Bents wrote:
> Enable mod_sql_sqlite as a compile time option
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> --
> [v1->v2]: Update for sqlite dependency
> [v2->v3]: Update help info from mode_* to mod_* per request
>           from <ryan.barnett@collins.com>
> ---
>  package/proftpd/Config.in  | 14 ++++++++++++--
>  package/proftpd/proftpd.mk |  5 +++++
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
> index b615a5ff4c..7c57fed35a 100644
> --- a/package/proftpd/Config.in
> +++ b/package/proftpd/Config.in
> @@ -29,12 +29,22 @@ config BR2_PACKAGE_PROFTPD_MOD_SFTP
>  config BR2_PACKAGE_PROFTPD_MOD_SQL
>  	bool "mod_sql support"
>  	help
> -	  Compile ProFTPD with mode_sql support.
> +	  Compile ProFTPD with mod_sql support.

This...

> +
> +if BR2_PACKAGE_PROFTPD_MOD_SQL
> +
> +config BR2_PACKAGE_PROFTPD_MOD_SQL_SQLITE
> +	bool "mod_sql_sqlite support"
> +	select BR2_PACKAGE_SQLITE
> +	help
> +	  Compile ProFTPD with mod_sql_sqlite support.
> +
> +endif
>  
>  config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
>  	bool "mod_quotatab support"
>  	help
> -	  Compile ProFTPD with mode_quotatab support. This module
> +	  Compile ProFTPD with mod_quotatab support. This module

.. and this are unrelated changes. They should have been made as part
of a separate patch. So I did them in a separate preparatory commit,
and then applied your change adding mod_sql_sqlite support. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
