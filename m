From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Apr 2012 16:20:31 +0300
Subject: [Buildroot] [PATCH] Add libapr-package
In-Reply-To: <1334668612-8220-1-git-send-email-bachmann@tofwerk.com>
References: <1334668612-8220-1-git-send-email-bachmann@tofwerk.com>
Message-ID: <20120417132030.GG3629@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rico,

On Tue, Apr 17, 2012 at 03:16:52PM +0200, Rico Bachmann wrote:
> Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
> ---
>  package/Config.in     |    1 +
>  package/apr/Config.in |    7 +++++++
>  package/apr/apr.mk    |   18 ++++++++++++++++++
>  3 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 package/apr/Config.in
>  create mode 100644 package/apr/apr.mk
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

This doesn't match the location of Config.in below. Is this patch build 
tested?

baruch

>  source "package/libatomic_ops/Config.in"
>  source "package/libcap/Config.in"
>  source "package/libcap-ng/Config.in"
> diff --git a/package/apr/Config.in b/package/apr/Config.in
> new file mode 100644
> index 0000000..d156909
> --- /dev/null
> +++ b/package/apr/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBAPR
> +	bool "apr"
> +	help
> +	  The mission of the Apache Portable Runtime (APR) project is to create
> +	  and maintain software libraries that provide a predictable and
> +	  consistent interface to underlying platform-specific implementations
> +	  http://apr.apache.org/
> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
> new file mode 100644
> index 0000000..ae91eb1
> --- /dev/null
> +++ b/package/apr/apr.mk
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# apr
> +#
> +#############################################################
> +APR_VERSION = 1.4.6
> +APR_SITE = archive.apache.org/dist/apr
> +APR_INSTALL_STAGING = YES
> +APR_CONF_ENV = \
> +	ac_cv_file__dev_zero=yes \
> +	ac_cv_func_setpgrp_void=yes \
> +	apr_cv_process_shared_works=yes \
> +	apr_cv_mutex_robust_shared=no \
> +	apr_cv_tcp_nodelay_with_cork=yes \
> +	ac_cv_sizeof_struct_iovec=8 \
> +	apr_cv_mutex_recursive=yes
> +
> +$(eval $(call AUTOTARGETS))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
