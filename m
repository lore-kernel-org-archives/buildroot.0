From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2008 21:14:27 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package: database
	database/mysql_client
In-Reply-To: <20080601180849.37DEE3C814@busybox.net> (antab@uclibc.org's
	message of "Sun\, 1 Jun 2008 11\:08\:49 -0700 \(PDT\)")
References: <20080601180849.37DEE3C814@busybox.net>
Message-ID: <87abi5klws.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "antab" == antab  <antab@uclibc.org> writes:

 antab> Author: antab
 antab> Date: 2008-06-01 11:08:48 -0700 (Sun, 01 Jun 2008)
 antab> New Revision: 22165
 antab> Log:
 antab> Added database menu to config (maybe move the other databases
 antab> under it to remove the mess from the main package menu) Added
 antab> mysql 5.1 client package, can be used to provide mysql support
 antab> for PHP. Note: This package has only been tested on AVR32.

...

 antab> Added: trunk/buildroot/package/database/Config.in
 antab> ===================================================================
 antab> --- trunk/buildroot/package/database/Config.in	                        (rev 0)
 antab> +++ trunk/buildroot/package/database/Config.in	2008-06-01 18:08:48 UTC (rev 22165)
 antab> @@ -0,0 +1,5 @@
 antab> +menu "Database"
 antab> +
 antab> +source "package/database/mysql_client/Config.in"
 antab> +
 antab> +endmenu

The other sub menus use menuconfig instead of menu, please do as well.

 antab> Added: trunk/buildroot/package/database/database.mk
 antab> ===================================================================
 antab> --- trunk/buildroot/package/database/database.mk	                        (rev 0)
 antab> +++ trunk/buildroot/package/database/database.mk	2008-06-01 18:08:48 UTC (rev 22165)
 antab> @@ -0,0 +1 @@
 antab> +include package/database/*/*.mk

 antab> Added: trunk/buildroot/package/database/mysql_client/Config.in
 antab> ===================================================================
 antab> --- trunk/buildroot/package/database/mysql_client/Config.in	                        (rev 0)
 antab> +++ trunk/buildroot/package/database/mysql_client/Config.in	2008-06-01 18:08:48 UTC (rev 22165)
 antab> @@ -0,0 +1,5 @@
 antab> +config BR2_PACKAGE_MYSQL_CLIENT
 antab> +	bool "MySQL 5.1 client"
 antab> +	default n
 antab> +	help
 antab> +	  MySQL 5.1 client

Please don't add the version number to the help text.

 antab> Added: trunk/buildroot/package/database/mysql_client/mysql_client.mk
 antab> ===================================================================
 antab> --- trunk/buildroot/package/database/mysql_client/mysql_client.mk	                        (rev 0)
 antab> +++ trunk/buildroot/package/database/mysql_client/mysql_client.mk	2008-06-01 18:08:48 UTC (rev 22165)
 antab> @@ -0,0 +1,30 @@
 antab> +#############################################################
 antab> +#
 antab> +# MySQL 5.1 Client
 antab> +#
 antab> +#############################################################
 antab> +MYSQL_CLIENT_VERSION = 5.1.23-rc
 antab> +MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
 antab> +MYSQL_CLIENT_SITE = http://mirrors.24-7-solutions.net/pub/mysql/Downloads/MySQL-5.1

Is that the official download URL?

-- 
Bye, Peter Korsgaard
