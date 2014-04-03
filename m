From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 22:39:52 +0200
Subject: [Buildroot] [PATCH] postgresql: new package
In-Reply-To: <1396249169-14126-1-git-send-email-ps.report@gmx.net>
References: <1396249169-14126-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140403223952.37034a1a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Mon, 31 Mar 2014 08:59:29 +0200, Peter Seiderer wrote:

> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> new file mode 100644
> index 0000000..bc0305b
> --- /dev/null
> +++ b/package/postgresql/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_POSTGRESQL
> +	bool "PostgreSQL"

lower case, please.

> +	depends on BR2_INET_IPV6

Since it currently doesn't build with uClibc, can you make this package
depends on !BR2_TOOLCHAIN_USES_UCLIBC ?


> +if [ ! -f /srv/pgsql/data/PG_VERSION ]; then

I thought we changed to /var/lib/pgsql ?

Maybe you should create a variable that contains /var/lib/pgsql to
avoid this duplication.


> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +	POSTGRESQL_DEPENDENCIES += zlib
> +else
> +	POSTGRESQL_CONF_OPT += --wihtout-zlib

Typo.

> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +	POSTGRESQL_DEPENDENCIES += openssl
> +	POSTGRESQL_CONF_OPT += --with-openssl

else
	POSTGRESQL_CONF_OPT += --without-openssl

Other than that, looks good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
