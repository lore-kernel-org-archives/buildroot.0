From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 15 Aug 2020 08:12:37 +0300
Subject: [Buildroot] [PATCH v2] libbacktrace: new package
In-Reply-To: <20200814223455.629710-1-avraham.shukron@gmail.com>
References: <20200813204540.GJ13263@scaer>
 <20200814223455.629710-1-avraham.shukron@gmail.com>
Message-ID: <CALFsTFVBXOyu8_h=w2wivC2kgQvR92C+aJ=7G_CCBS0SFvOm8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Aug 15, 2020 at 1:35 AM Avi Shukron <avraham.shukron@gmail.com> wrote:
>
> A C library that may be linked into a C/C++ program to produce
> symbolic backtraces.
>
> Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
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
> index d7e79f4795..7460d3f006 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -170,6 +170,7 @@ menu "Development tools"
>         source "package/grep/Config.in"
>         source "package/jo/Config.in"
>         source "package/jq/Config.in"
> +       source "package/libbacktrace/Config.in"
Comparing to other packages in the "development tools" menu, I don't
think this is the correct place for libbacktrace.
In my opinion, it should be placed on one of the submenus under "libraries".

>         source "package/libtool/Config.in"
>         source "package/make/Config.in"
>         source "package/patch/Config.in"
> diff --git a/package/libbacktrace/Config.in b/package/libbacktrace/Config.in
> new file mode 100644
> index 0000000000..0f940dd588
> --- /dev/null
> +++ b/package/libbacktrace/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBBACKTRACE
> +       bool "libbacktrace"
> +       help
> +         A C library that may be linked into a C/C++ program to
> +         produce symbolic backtraces
> +
> +         https://github.com/ianlancetaylor/libbacktrace
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
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Regards,
Asaf.
