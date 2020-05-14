From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 May 2020 16:55:19 +0200
Subject: [Buildroot] [PATCH 5/6] package/libodb-mysql: new package
In-Reply-To: <20200514143325.1009253-6-kamel.bouhara@bootlin.com>
References: <20200514143325.1009253-1-kamel.bouhara@bootlin.com>
 <20200514143325.1009253-6-kamel.bouhara@bootlin.com>
Message-ID: <20200514165519.542961ba@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 May 2020 16:33:24 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> diff --git a/package/libodb-mysql/Config.in b/package/libodb-mysql/Config.in
> new file mode 100644
> index 0000000000..47daa27264
> --- /dev/null
> +++ b/package/libodb-mysql/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBODB_MYSQL
> +	bool "libodb-mysql"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_MYSQL
> +	select BR2_PACKAGE_LIBODB
> +	help
> +	  This package contains the MySQL ODB runtime library. Every application
> +	  that includes code generated for the MySQL database will need to link
> +	  to this library.
> +
> +	  https://www.codesynthesis.com/products/odb/
> +
> +comment "libodb-mysql needs a toolchain w/ C++, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

Here as well, we need a:

	depends on BR2_PACKAGE_MYSQL

> +LIBODB_MYSQL_VERSION_MAJOR = 2.4
> +LIBODB_MYSQL_VERSION = $(LIBODB_MYSQL_VERSION_MAJOR).0
> +LIBODB_MYSQL_SOURCE = libodb-mysql-$(LIBODB_MYSQL_VERSION).tar.bz2
> +LIBODB_MYSQL_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_MYSQL_VERSION_MAJOR)
> +LIBODB_MYSQL_INSTALL_STAGING = YES
> +LIBODB_MYSQL_LICENSE = GPL-2.0
> +LIBODB_MYSQL_LICENSE_FILES = LICENSE
> +LIBODB_MYSQL_DEPENDENCIES = libodb mysql

Did you test this with both Buildroot packages that provide mysql, i.e
oracle-mysql and mariadb ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
