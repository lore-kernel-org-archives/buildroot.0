From: Arnar Mar Sig <antab@valka.is>
Date: Sun, 1 Jun 2008 19:35:14 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package: database
	database/mysql_client
In-Reply-To: <87abi5klws.fsf@macbook.be.48ers.dk>
References: <20080601180849.37DEE3C814@busybox.net>
	<87abi5klws.fsf@macbook.be.48ers.dk>
Message-ID: <17D35AC9-FC86-45C6-90AE-874D275697F3@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Jun 1, 2008, at 7:14 PM, Peter Korsgaard wrote:
> antab> Added: trunk/buildroot/package/database/Config.in
> antab>  
> ===================================================================
> antab> --- trunk/buildroot/package/database/ 
> Config.in	                        (rev 0)
> antab> +++ trunk/buildroot/package/database/Config.in	2008-06-01  
> 18:08:48 UTC (rev 22165)
> antab> @@ -0,0 +1,5 @@
> antab> +menu "Database"
> antab> +
> antab> +source "package/database/mysql_client/Config.in"
> antab> +
> antab> +endmenu
>
> The other sub menus use menuconfig instead of menu, please do as well.
Sorry about that, fixed

> antab> Added: trunk/buildroot/package/database/mysql_client/Config.in
> antab>  
> ===================================================================
> antab> --- trunk/buildroot/package/database/mysql_client/ 
> Config.in	                        (rev 0)
> antab> +++ trunk/buildroot/package/database/mysql_client/Config.in	 
> 2008-06-01 18:08:48 UTC (rev 22165)
> antab> @@ -0,0 +1,5 @@
> antab> +config BR2_PACKAGE_MYSQL_CLIENT
> antab> +	bool "MySQL 5.1 client"
> antab> +	default n
> antab> +	help
> antab> +	  MySQL 5.1 client
>
> Please don't add the version number to the help text.
Removed from the helptext, Keeping it in the menu text, There are so  
many changes between the 4.x - 5.x versions that one needs to know the  
major version number.
>
> antab> Added: trunk/buildroot/package/database/mysql_client/ 
> mysql_client.mk
> antab>  
> ===================================================================
> antab> --- trunk/buildroot/package/database/mysql_client/ 
> mysql_client.mk	                        (rev 0)
> antab> +++ trunk/buildroot/package/database/mysql_client/ 
> mysql_client.mk	2008-06-01 18:08:48 UTC (rev 22165)
> antab> @@ -0,0 +1,30 @@
> antab> +#############################################################
> antab> +#
> antab> +# MySQL 5.1 Client
> antab> +#
> antab> +#############################################################
> antab> +MYSQL_CLIENT_VERSION = 5.1.23-rc
> antab> +MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
> antab> +MYSQL_CLIENT_SITE = http://mirrors.24-7-solutions.net/pub/mysql/Downloads/MySQL-5.1
>
> Is that the official download URL?
This mirror was found after searching the mysql.com site.

>
>
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Greets
	Arnar Mar Sig
	Valka ehf
