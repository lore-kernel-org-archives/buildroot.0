From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Jan 2019 18:42:29 +0200
Subject: [Buildroot] [PATCH] package/gnutls: bump to version 3.6.6
In-Reply-To: <20190128160854.32691-1-peter@korsgaard.com>
References: <20190128160854.32691-1-peter@korsgaard.com>
Message-ID: <20190128164229.2mblf4wbvf5zie7g@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Jan 28, 2019 at 05:08:54PM +0100, Peter Korsgaard wrote:
> Drop now upstreamed 0001-configure.ac-check-if-libatomic-is-needed.patch and
> autoreconf.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---

[...]

> diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
> index 89e8b14597..f33d8672d4 100644
> --- a/package/gnutls/gnutls.hash
> +++ b/package/gnutls/gnutls.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.5.tar.xz.sig
> -sha256	073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35	gnutls-3.6.5.tar.xz
> +# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.6.tar.xz.sig
> +none	bb9acab8af2ac430edf45faaaa4ed2c51f86e57cb57689be6701aceef4732ca7	gnutls-3.6.6.tar.xz

Why none?

baruch

>  # Locally calculated
>  sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	doc/COPYING
>  sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index d9befa1612..c6d2d72771 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  GNUTLS_VERSION_MAJOR = 3.6
> -GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).5
> +GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>  GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
>  GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
> @@ -27,8 +27,6 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
>  	gt_cv_c_wint_t=$(if $(BR2_USE_WCHAR),yes,no) \
>  	gl_cv_func_gettimeofday_clobber=no
>  GNUTLS_INSTALL_STAGING = YES
> -# We're patching configure.ac
> -GNUTLS_AUTORECONF = YES
>  
>  # libpthread autodetection poison the linkpath
>  GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
