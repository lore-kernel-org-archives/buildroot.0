From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 13:35:43 +0100
Subject: [Buildroot] [PATCH v2] package/quickjs: new package
In-Reply-To: <20201106225115.291042-1-francois.perrad@gadz.org>
References: <20201106225115.291042-1-francois.perrad@gadz.org>
Message-ID: <20201107133543.2858b7f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Nov 2020 23:51:14 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in            |  1 +
>  package/quickjs/Config.in    | 15 +++++++++++++++
>  package/quickjs/quickjs.hash |  2 ++
>  package/quickjs/quickjs.mk   | 37 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+)
>  create mode 100644 package/quickjs/Config.in
>  create mode 100644 package/quickjs/quickjs.hash
>  create mode 100644 package/quickjs/quickjs.mk

The entry in the DEVELOPERS file was missing.

> diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
> new file mode 100644
> index 000000000..89346ceff
> --- /dev/null
> +++ b/package/quickjs/Config.in
> @@ -0,0 +1,15 @@
> +

Spurious empty line.

> +config BR2_PACKAGE_QUICKJS
> +	bool "quickjs"
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # No way to check for fenv support.
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  QuickJS is a small and embeddable Javascript engine.
> +	  It supports the ES2020 specification including modules,
> +	  asynchronous generators, proxies and BigInt.
> +
> +	  https://bellard.org/quickjs/
> +
> +comment "quickjs needs a glibc or musl toolchain w/ dynamic library"

	depends on BR2_USE_MMU

was missing here.

> +	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC

Applied to next after fixing those details. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
