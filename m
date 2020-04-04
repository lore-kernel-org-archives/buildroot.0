From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 23:39:16 +0200
Subject: [Buildroot] [PATCH v2] unbound: new package
In-Reply-To: <20200329180016.9292-1-stefan@ott.net>
References: <20200329180016.9292-1-stefan@ott.net>
Message-ID: <20200404233916.7ab3246b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Mar 2020 20:00:16 +0200
Stefan Ott <stefan@ott.net> wrote:

> Unbound: validating, recursive & caching DNS resolver with
> DNSSEC, QNAME minimisation, DNSCrypt and DNS-over-TLS support.
> 
> Signed-off-by: Stefan Ott <stefan@ott.net>

Thanks, I've applied, after doing two small changes. See below.

> diff --git a/package/unbound/Config.in b/package/unbound/Config.in
> new file mode 100644
> index 0000000000..2d4ebed257
> --- /dev/null
> +++ b/package/unbound/Config.in
> @@ -0,0 +1,35 @@
> +config BR2_PACKAGE_UNBOUND
> +	bool "unbound"
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_OPENSSL
> +	depends on !BR2_STATIC_LIBS

By convention, we like to have "depends on" before "select". This type
of coding style convention is verified by "make check-package".

Also, when there is a dependency on a toolchain feature like this, we
add a Config.in comment:

comment "unbound needs a toolchain w/ dynamic library"
	depends on BR2_STATIC_LIBS

I've fixed both small issues and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
