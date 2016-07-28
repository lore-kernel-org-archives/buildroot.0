From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jul 2016 23:32:56 +0200
Subject: [Buildroot] [PATCH 1/1] libpqxx: new package
In-Reply-To: <20160728212031.14768-1-james.knight@rockwellcollins.com>
References: <20160728212031.14768-1-james.knight@rockwellcollins.com>
Message-ID: <20160728233256.4b5aacdf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 17:20:31 -0400, James Knight wrote:

> diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
> new file mode 100644
> index 0000000..a4fd4a1
> --- /dev/null
> +++ b/package/libpqxx/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LIBPQXX
> +	bool "libpqxx"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_POSTGRESQL
> +	help
> +	  libpqxx is the official C++ client API for ?PostgreSQL, the
> +	  enterprise-strength open-source relational database.
> +
> +	  http://pqxx.org/development/libpqxx/
> +
> +comment "libpqxx needs postgresql and toolchain w/ C++ support"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_PACKAGE_POSTGRESQL
> +	depends on !BR2_STATIC_LIBS # postgresql depends on static

I would make this comment only visible if postgresql is enabled, i.e:

comment "libpqxx needs postgresql and toolchain w/ C++ support"
	depends on !BR2_INSTALL_LIBSTDCPP
	depends on BR2_PACKAGE_POSTGRESQL

Indeed, to me it seems obvious for the user that if he wants a C++
client API for postgresql, then postgresql should be enabled first.
Otherwise, this package should be "select"-ing postgresql.

> +LIBPQXX_VERSION = 4.0.1
> +LIBPQXX_SITE = http://pqxx.org/download/software/libpqxx
> +LIBPQXX_SOURCE = libpqxx-$(LIBPQXX_VERSION).tar.gz

Not needed, this is the default.

> +LIBPQXX_INSTALL_STAGING = YES
> +LIBPQXX_DEPENDENCIES = postgresql
> +LIBPQXX_LICENSE = BSD

Please be more specific about the license: BSD-2c, BSD-3c, etc.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
