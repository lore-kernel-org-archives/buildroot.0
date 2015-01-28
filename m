From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Jan 2015 23:31:34 +0100
Subject: [Buildroot] [PATCH 1/2] libzip: new package
In-Reply-To: <1422374533-11694-2-git-send-email-bgolaszewski@baylibre.com>
References: <1422374533-11694-1-git-send-email-bgolaszewski@baylibre.com>
 <1422374533-11694-2-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <54C96346.70005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/01/15 17:02, Bartosz Golaszewski wrote:
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 One small remark below

> ---
>  package/Config.in        |  1 +
>  package/libzip/Config.in |  7 +++++++
>  package/libzip/libzip.mk | 15 +++++++++++++++
>  3 files changed, 23 insertions(+)
>  create mode 100644 package/libzip/Config.in
>  create mode 100644 package/libzip/libzip.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 51d4c15..2d0adac 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -603,6 +603,7 @@ endmenu
>  
>  menu "Compression and decompression"
>  	source "package/libarchive/Config.in"
> +	source "package/libzip/Config.in"
>  	source "package/lzo/Config.in"
>  	source "package/snappy/Config.in"
>  	source "package/szip/Config.in"
> diff --git a/package/libzip/Config.in b/package/libzip/Config.in
> new file mode 100644
> index 0000000..c07b956
> --- /dev/null
> +++ b/package/libzip/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBZIP
> +	bool "libzip"
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  C library for reading, creating, and modifying zip archives.

 Perhaps mention that also zipcmp zipmerge ziptorrent are installed.


 Regards,
 Arnout

> +
> +	  http://www.nih.at/libzip/
> diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
> new file mode 100644
> index 0000000..3a9cdb1
> --- /dev/null
> +++ b/package/libzip/libzip.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libzip
> +#
> +################################################################################
> +
> +LIBZIP_VERSION = 0.11.2
> +LIBZIP_SITE = http://www.nih.at/libzip/
> +LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
> +LIBZIP_LICENSE = special libzip license
> +LIBZIP_LICENSE_FILES = LICENSE
> +LIBZIP_INSTALL_STAGING = YES
> +LIBZIP_DEPENDENCIES = zlib
> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
