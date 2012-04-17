From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 17 Apr 2012 13:36:07 +0200
Subject: [Buildroot] [PATCH] Add libapr-package
In-Reply-To: <1334660370-19506-2-git-send-email-bachmann@tofwerk.com>
References: <Re:[PATCH] Add libapr-package>
 <1334660370-19506-2-git-send-email-bachmann@tofwerk.com>
Message-ID: <4F8D55A7.2090909@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for your patch!

Le 17/04/2012 12:59, Rico Bachmann a ?crit :
> Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
> ---
>  package/Config.in        |    1 +
>  package/libapr/Config.in |    7 +++++++
>  package/libapr/libapr.mk |   12 ++++++++++++
>  3 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644 package/libapr/Config.in
>  create mode 100644 package/libapr/libapr.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 4c6d4d8..ceb5f6d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -376,6 +376,7 @@ source "package/fftw/Config.in"
>  source "package/libargtable2/Config.in"
>  source "package/argp-standalone/Config.in"
>  source "package/boost/Config.in"
> +source "package/libapr/Config.in"
>  source "package/libatomic_ops/Config.in"
>  source "package/libcap/Config.in"
>  source "package/libcap-ng/Config.in"
> diff --git a/package/libapr/Config.in b/package/libapr/Config.in
> new file mode 100644
> index 0000000..51dea91
> --- /dev/null
> +++ b/package/libapr/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBAPR
> +
> +	bool "libapr"
> +	help
> +	  The mission of the Apache Portable Runtime (APR) project is to create and maintain software libraries that provide a predictable and consistent interface to underlying platform-specific implementations

Could you wrap this line to 80 characters ?

> +	  http://apr.apache.org/
> diff --git a/package/libapr/libapr.mk b/package/libapr/libapr.mk
> new file mode 100644
> index 0000000..57da8ef
> --- /dev/null
> +++ b/package/libapr/libapr.mk
> @@ -0,0 +1,12 @@
> +#############################################################
> +#
> +# libapr
> +#
> +#############################################################
> +LIBAPR_VERSION = 1.4.6
> +LIBAPR_SOURCE = apr-$(LIBAPR_VERSION).tar.gz
> +LIBAPR_SITE = http://mirror.switch.ch/mirror/apache/dist/apr
> +LIBAPR_INSTALL_STAGING = YES
> +LIBAPR_CONF_OPT = ac_cv_file__dev_zero=yes ac_cv_func_setpgrp_void=yes apr_cv_process_shared_works=yes apr_cv_mutex_robust_shared=no apr_cv_tcp_nodelay_with_cork=yes ac_cv_sizeof_struct_iovec=8 apr_cv_mutex_recursive=yes --enable-shared

All the ac_cv_* stuff should go into LIBAPR_CONF_ENV variable.
You should wrap the line to 80 characters also.
--enabled-shared is automatically set by buildroot if it needs to when
the package is built, so you don't need to set it here.

Otherwise, it looks good to me.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
