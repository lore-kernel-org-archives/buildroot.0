From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 31 Aug 2009 22:48:17 +0200
Subject: [Buildroot] [PATCH] libarchive package added
In-Reply-To: <1251209096-31922-1-git-send-email-daniel@caiaq.de>
References: <1251209096-31922-1-git-send-email-daniel@caiaq.de>
Message-ID: <20090831204817.GX4200@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping

On Tue, Aug 25, 2009 at 04:04:56PM +0200, Daniel Mack wrote:
> See http://code.google.com/p/libarchive/
> 
> Signed-off-by: Daniel Mack <daniel@caiaq.de>
> ---
>  package/Config.in                |    1 +
>  package/libarchive/Config.in     |   15 +++++++++++++++
>  package/libarchive/libarchive.mk |   19 +++++++++++++++++++
>  3 files changed, 35 insertions(+), 0 deletions(-)
>  create mode 100644 package/libarchive/Config.in
>  create mode 100644 package/libarchive/libarchive.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 02ffb2d..a53e09a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -386,6 +386,7 @@ menu "Compressors / decompressors"
>  if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
>  source "package/gzip/Config.in"
>  endif
> +source "package/libarchive/Config.in"
>  source "package/lzo/Config.in"
>  source "package/lzop/Config.in"
>  source "package/lzma/Config.in"
> diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
> new file mode 100644
> index 0000000..93bfec2
> --- /dev/null
> +++ b/package/libarchive/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBARCHIVE
> +	bool "libarchive"
> +	help
> +	  Libarchive is a reusable C library for reading and writing a
> +	  variety of streaming archive formats.
> +
> +	  http://code.google.com/p/libarchive/
> +
> +config BR2_LIBARCHIVE_INSTALL_TO_TARGET
> +	bool "install libarchive to target"
> +	depends on BR2_PACKAGE_LIBARCHIVE
> +	default y
> +	help
> +	  Say Y here to make BR2 copy the libarchive files to the target
> +	  destination folder.
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> new file mode 100644
> index 0000000..e3f019b
> --- /dev/null
> +++ b/package/libarchive/libarchive.mk
> @@ -0,0 +1,19 @@
> +#############################################################
> +#
> +# libarchive (reusable C library for archive formats)
> +#
> +#############################################################
> +LIBARCHIVE_VERSION:=2.7.1
> +LIBARCHIVE_SITE = http://libarchive.googlecode.com/files/
> +LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
> +LIBARCHIVE_LIBTOOL_PATCH = NO
> +LIBARCHIVE_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_LIBARCHIVE_INSTALL_TO_TARGET),y)
> +	LIBARCHIVE_INSTALL_TARGET := YES
> +endif
> +
> +LIBARCHIVE_DEPENDENCIES = uclibc
> +
> +$(eval $(call AUTOTARGETS,package,libarchive))
> +
> -- 
> 1.6.3.3
> 
