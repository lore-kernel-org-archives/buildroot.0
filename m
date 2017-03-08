From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 8 Mar 2017 08:19:19 +0100
Subject: [Buildroot] [PATCH 3/6] qt: remove broken iBase driver
In-Reply-To: <20170307235054.25149-3-arnout@mind.be>
References: <20170307235054.25149-1-arnout@mind.be>,
 <20170307235054.25149-3-arnout@mind.be>
Message-ID: <trinity-f8215723-32a4-44fc-8031-333c19751e54-1488957559946@3capp-gmx-bs66>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

> Gesendet: Mittwoch, 08. M?rz 2017 um 00:50 Uhr
> Von: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> An: buildroot at buildroot.org
> Betreff: [Buildroot] [PATCH 3/6] qt: remove broken iBase driver
>
> This option has been marked as broken since 2010. No need for legacy
> handling.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/qt/Config.sql.in | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
> index 452edd5133..5bd63d27a0 100644
> --- a/package/qt/Config.sql.in
> +++ b/package/qt/Config.sql.in
> @@ -14,13 +14,6 @@ config BR2_PACKAGE_QT_MYSQL
>  	  Build MySQL driver
>  	  If unsure, say n.
>  
> -config BR2_PACKAGE_QT_IBASE
> -	bool "iBase Driver"
> -	depends on BROKEN # libfbclient not in BR
> -	help
> -	  Build iBase driver
> -	  If unsure, say n.
> -
>  config BR2_PACKAGE_QT_ODBC
>  	bool "ODBC Driver"
>  	select BR2_PACKAGE_UNIXODBC
> -- 
> 2.11.0
> 

Missing some code deletion from package/qt/qt.mk file:

ifeq ($(BR2_PACKAGE_QT_IBASE),y)
QT_CONFIGURE_OPTS += -qt-sql-ibase
endif

Regards,
Peter

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
