From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 May 2013 11:07:15 +0200
Subject: [Buildroot] [PATCH 1/3] libglib2: Bump libglib2 to 0.36.1
In-Reply-To: <1368056050-19285-1-git-send-email-spenser@gillilanding.com>
References: <1368056050-19285-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130509110715.1716027f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed,  8 May 2013 18:34:08 -0500, Spenser Gilliland wrote:
> This patch bumps libglib2 to version 0.36.1.

This patch is not bumping libglib2 to 0.36.1, but to 2.36.1. Ditto for
your glibmm and glib-networking patches.

> diff --git a/package/libglib2/libglib2-no-tests.patch b/package/libglib2/libglib2-no-tests.patch
> deleted file mode 100644
> index 81b5af2..0000000
> --- a/package/libglib2/libglib2-no-tests.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> -Add a --disable-tests option to the configure script
> -
> -Disabling the build of tests has two benefits:
> - * Prevents the build of a lot of code that doesn't build on noMMU
> -   platforms.
> - * Reduces the build time.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Was this patch merged upstream? From the below I see to understand they
added --disable-modular-tests, does it disable all tests?

> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index d78e8ec..ee9f470 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -3,8 +3,8 @@
>  # libglib2
>  #
>  #############################################################
> -LIBGLIB2_VERSION_MAJOR = 2.30
> -LIBGLIB2_VERSION_MINOR = 3
> +LIBGLIB2_VERSION_MAJOR = 2.36
> +LIBGLIB2_VERSION_MINOR = 1
>  LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
> @@ -44,6 +44,8 @@ LIBGLIB2_CONF_ENV = \
>  		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
>  		ac_cv_func_posix_getgrgid_r=no glib_cv_long_long_format=ll \
>  		ac_cv_func_printf_unix98=yes ac_cv_func_vsnprintf_c99=yes \
> +		ac_cv_func_newlocale=no ac_cv_func_uselocale=no \
> +		ac_cv_func_strtod_l=no ac_cv_func_strtoll_l=no ac_cv_func_strtoull_l=no \
>  		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
>  
>  # old uClibc versions don't provide qsort_r
> @@ -64,9 +66,9 @@ HOST_LIBGLIB2_CONF_OPT = \
>  		--disable-dtrace \
>  		--disable-systemtap \
>  		--disable-gcov \
> -		--disable-tests
> +		--disable-modular-tests
>  
> -LIBGLIB2_CONF_OPT += --disable-tests
> +LIBGLIB2_CONF_OPT += --disable-modular-tests
>  
>  LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext) host-gettext
>  

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
