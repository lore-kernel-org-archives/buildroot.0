From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 08:48:31 +0200
Subject: [Buildroot] [buildroot][PATCH] Add cloog package. This package
 depends on ISL and GMP and is used by the GCC graphite optimisations.
In-Reply-To: <BLU436-SMTP926FE10AFAA2D9A363495FA8320@phx.gbl>
References: <BLU436-SMTP926FE10AFAA2D9A363495FA8320@phx.gbl>
Message-ID: <20140519084831.42cb3b0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Thomas,

Same comment as the other patch: improve the commit log, and remove the
target variant of the package, that is not needed.

Thanks!

Thomas

On Mon, 19 May 2014 02:36:58 +0000, Steve Thomas wrote:
> Signed-off-by: Steve Thomas <scjthm@live.com>
> ---
>  package/Config.in       |  1 +
>  package/cloog/Config.in |  8 ++++++++
>  package/cloog/cloog.mk  | 16 ++++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 package/cloog/Config.in
>  create mode 100644 package/cloog/cloog.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2e71210..d5ada2f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -779,6 +779,7 @@ source "package/flann/Config.in"
>  source "package/glibmm/Config.in"
>  source "package/gmp/Config.in"
>  source "package/isl/Config.in"
> +source "package/cloog/Config.in"
>  source "package/gsl/Config.in"
>  source "package/gtest/Config.in"
>  source "package/libargtable2/Config.in"
> diff --git a/package/cloog/Config.in b/package/cloog/Config.in
> new file mode 100644
> index 0000000..db99242
> --- /dev/null
> +++ b/package/cloog/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_CLOOG
> +	bool "cloog"
> +    select BR2_PACKAGE_GMP
> +    select BR2_PACKAGE_ISL
> +	help
> +	  Chunky LOOp Generator - Library which generates loops for scanning Z-polyhedra.
> +
> +	  http://clooglib.org/
> diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
> new file mode 100644
> index 0000000..f5e3046
> --- /dev/null
> +++ b/package/cloog/cloog.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# cloog
> +#
> +################################################################################
> +
> +CLOOG_VERSION = 0.18.1
> +CLOOG_SITE = http://www.bastoul.net/cloog/pages/download/count.php3?url=./
> +CLOOG_SOURCE = cloog-$(CLOOG_VERSION).tar.gz
> +CLOOG_INSTALL_STAGING = YES
> +CLOOG_LICENSE = LGPLv2.1
> +CLOOG_LICENSE_FILES = LICENSE
> +CLOOG_DEPENDENCIES = gmp isl
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
