From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 21:40:44 +0200
Subject: [Buildroot] [PATCH] wampcc: new package
In-Reply-To: <20180626095323.14072-1-neumann@teufel.de>
References: <20180626095323.14072-1-neumann@teufel.de>
Message-ID: <20180626214044.47839797@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jun 2018 11:53:23 +0200, Sven Neumann wrote:
> Signed-off-by: Sven Neumann <neumann@teufel.de>
> ---
>  package/Config.in          |  1 +
>  package/wampcc/Config.in   | 13 +++++++++++++
>  package/wampcc/wampcc.hash |  2 ++
>  package/wampcc/wampcc.mk   | 14 ++++++++++++++

Missing entry in DEVELOPERS file.

> diff --git a/package/wampcc/Config.in b/package/wampcc/Config.in
> new file mode 100644
> index 0000000000..055f21a43d
> --- /dev/null
> +++ b/package/wampcc/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_WAMPCC
> +	bool "wampcc"
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_LIBUV

You need to replicate the dependencies of libuv.

> +	select BR2_PACKAGE_JANSSON
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  wampcc is C++ library that implements the Web Application Messaging Protocol protocol.

This line needs to be wrapped. Please run ./utils/check-package on your
package submissions, it detects a few coding style issues.

> diff --git a/package/wampcc/wampcc.hash b/package/wampcc/wampcc.hash
> new file mode 100644
> index 0000000000..9c3af366e9
> --- /dev/null
> +++ b/package/wampcc/wampcc.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  b3c3633b4c6a74d7ac8a676a7ea30fbfde7ae19aa1fc37de3b8aa3a553b674a2  wampcc-v1.6.tar.gz

A hash for the license file would be nice to have.

> diff --git a/package/wampcc/wampcc.mk b/package/wampcc/wampcc.mk
> new file mode 100644
> index 0000000000..d8e093f679
> --- /dev/null
> +++ b/package/wampcc/wampcc.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# wampcc
> +#
> +################################################################################
> +
> +WAMPCC_VERSION = v1.6
> +WAMPCC_SITE = $(call github,darrenjs,wampcc,$(WAMPCC_VERSION))
> +WAMPCC_DEPENDENCIES = host-pkgconf libuv jansson openssl
> +WAMPCC_INSTALL_STAGING = YES
> +WAMPCC_LICENSE = MIT
> +WAMPCC_LICENSE_FILES = LICENSE
> +
> +$(eval $(cmake-package))

Otherwise, looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
