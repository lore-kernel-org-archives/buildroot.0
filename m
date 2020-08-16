From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2020 22:47:05 +0200
Subject: [Buildroot] [PATCH v3] libbacktrace: new package
In-Reply-To: <20200815091127.638233-1-avraham.shukron@gmail.com>
References: <20200815091127.638233-1-avraham.shukron@gmail.com>
Message-ID: <20200816204705.GF24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avi, All,

On 2020-08-15 12:11 +0300, Avi Shukron spake thusly:
> A C library that may be linked into a C/C++ program to produce
> symbolic backtraces.
> 
> Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                      |  1 +
>  package/libbacktrace/Config.in         |  7 +++++++
>  package/libbacktrace/libbacktrace.hash |  3 +++
>  package/libbacktrace/libbacktrace.mk   | 15 +++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/libbacktrace/Config.in
>  create mode 100644 package/libbacktrace/libbacktrace.hash
>  create mode 100644 package/libbacktrace/libbacktrace.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index d7e79f4795..629a45fb0a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1831,6 +1831,7 @@ menu "Other"
>  	source "package/libatomic_ops/Config.in"
>  	source "package/libavl/Config.in"
>  	source "package/libb64/Config.in"
> +	source "package/libbacktrace/Config.in"
>  	source "package/libbsd/Config.in"
>  	source "package/libcap/Config.in"
>  	source "package/libcap-ng/Config.in"
> diff --git a/package/libbacktrace/Config.in b/package/libbacktrace/Config.in
> new file mode 100644
> index 0000000000..0f940dd588
> --- /dev/null
> +++ b/package/libbacktrace/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBBACKTRACE
> +	bool "libbacktrace"
> +	help
> +	  A C library that may be linked into a C/C++ program to
> +	  produce symbolic backtraces
> +
> +	  https://github.com/ianlancetaylor/libbacktrace
> diff --git a/package/libbacktrace/libbacktrace.hash b/package/libbacktrace/libbacktrace.hash
> new file mode 100644
> index 0000000000..ecd530a33b
> --- /dev/null
> +++ b/package/libbacktrace/libbacktrace.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256 13072c499c76866c188beaf3d50f3dddbf2c27ed9fd72b33d1b857acd33b1cb5  libbacktrace-9b7f216e867916594d81e8b6118f092ac3fcf704.tar.gz
> +sha256 ef8a9b3247488f8901ca60de9b17b745d7bd67e5ec1e622f80d62364572200d8  LICENSE
> diff --git a/package/libbacktrace/libbacktrace.mk b/package/libbacktrace/libbacktrace.mk
> new file mode 100644
> index 0000000000..fb1f6c058a
> --- /dev/null
> +++ b/package/libbacktrace/libbacktrace.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libbacktrace
> +#
> +################################################################################
> +
> +LIBBACKTRACE_VERSION = 9b7f216e867916594d81e8b6118f092ac3fcf704
> +LIBBACKTRACE_SITE = $(call github,ianlancetaylor,libbacktrace,$(LIBBACKTRACE_VERSION))
> +
> +LIBBACKTRACE_LICENSE = BSD-3C-like
> +LIBBACKTRACE_LICENSE_FILES = LICENSE
> +
> +LIBBACKTRACE_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> -- 
> 2.25.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
