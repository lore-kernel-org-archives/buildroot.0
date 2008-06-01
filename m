From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2008 21:31:07 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
In-Reply-To: <20080601180414.033A73C836@busybox.net> (antab@uclibc.org's
	message of "Sun\, 1 Jun 2008 11\:04\:13 -0700 \(PDT\)")
References: <20080601180414.033A73C836@busybox.net>
Message-ID: <8763stkl50.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "antab" == antab  <antab@uclibc.org> writes:

 antab> Author: antab
 antab> Date: 2008-06-01 11:04:13 -0700 (Sun, 01 Jun 2008)
 antab> New Revision: 22164

 antab> Log:
 antab> Dump php to version 5.2.6 and add SimpleXML extension to config menu

...

 antab>  config BR2_PACKAGE_PHP_EXT_OPENSSL
 antab> -        bool "openssl"
 antab> -        depends on BR2_PACKAGE_PHP && BR2_PACKAGE_OPENSSL
 antab> -        default n
 antab> -        help
 antab> -          openssl support
 antab> +	bool "openssl"
 antab> +	depends on BR2_PACKAGE_PHP && BR2_PACKAGE_OPENSSL
 antab> +	default n
 antab> +	help
 antab> +	  openssl support

Please don't do white space and functional changes in the same commit.

 antab> @@ -3,7 +3,7 @@
 antab>  # php
 antab>  #
 antab>  #############################################################
 antab> -PHP_VER:=5.2.5
 antab> +PHP_VER:=5.2.6
 antab>  PHP_SOURCE:=php-$(PHP_VER).tar.bz2
 antab>  PHP_SITE:=http://us.php.net/get/${PHP_SOURCE}/from/us2.php.net/mirror
 antab>  PHP_DIR:=$(BUILD_DIR)/php-$(PHP_VER)
 antab> @@ -58,6 +58,9 @@
 antab>  		 --enable-xmlwriter
 antab>  	PHP_DEPS+=libxml2
 antab>  endif
 antab> +ifeq ($(BR2_PACKAGE_PHP_EXT_SIMPLEXML),y)
 antab> +	PHP_CONFIGURE+=--enable-simplexml
 antab> +endif
 antab>  ifeq ($(BR2_PACKAGE_PHP_EXT_ZLIB),y)
 antab>  	PHP_CONFIGURE+=--with-zlib=$(STAGING_DIR)/usr
 antab>  	PHP_DEPS+=zlib
 antab> @@ -105,20 +108,20 @@
 
 antab>  ### Database extensions
 antab>  ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 antab> -	PHP_CONFIGURE+=--with-sql
 antab> +	PHP_CONFIGURE+=--with-sqlite

Don't you need a depends on BR2_PACKAGE_SQLITE?

-- 
Bye, Peter Korsgaard
