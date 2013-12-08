From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Dec 2013 20:12:49 +0100
Subject: [Buildroot] [PATCH] php: bump to version 5.5.6
In-Reply-To: <1386528934-28676-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386528934-28676-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131208201249.2f3e89a5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun,  8 Dec 2013 15:55:34 -0300, Gustavo Zacarias wrote:

> -config BR2_PACKAGE_PHP_EXT_SQLITE
> -	bool "SQLite"
> -	help
> -	  Legacy SQLite2 support
> -
> -config BR2_PACKAGE_PHP_EXT_SQLITE_UTF8
> -	bool "sqlite UTF8 support"
> -	depends on BR2_PACKAGE_PHP_EXT_SQLITE
> -	help
> -	  UTF8 support for sqlite

Config.in.legacy maybe?

>  config BR2_PACKAGE_PHP_EXT_MYSQL
>  	bool "Mysql"
>  	depends on BR2_INSTALL_LIBSTDCPP
> @@ -227,6 +216,7 @@ config BR2_PACKAGE_PHP_EXT_FTP
>  
>  config BR2_PACKAGE_PHP_EXT_SNMP
>  	bool "SNMP"
> +	depends on BR2_USE_MMU # netsnmp fork()
>  	select BR2_PACKAGE_NETSNMP
>  	select BR2_PACKAGE_NETSNMP_ENABLE_MIBS
>  	help
> @@ -234,6 +224,7 @@ config BR2_PACKAGE_PHP_EXT_SNMP
>  
>  config BR2_PACKAGE_PHP_EXT_SOCKETS
>  	bool "sockets"
> +	depends on BR2_INET_IPV6
>  	help
>  	  Sockets support

New comment ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
