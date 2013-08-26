From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2013 19:21:20 +0200
Subject: [Buildroot] [PATCH 5/6] libpng12: new package
In-Reply-To: <1377373321-29732-6-git-send-email-spenser@gillilanding.com>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
 <1377373321-29732-6-git-send-email-spenser@gillilanding.com>
Message-ID: <521B8E90.6060305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/13 21:42, Spenser Gilliland wrote:
> libpng1X all have different incompatible apis therefore it is neccessary to
> have a seperate package for each branch.

  This explanation should be in either the Config.in or in the .mk file 
as well.

>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>   package/Config.in            |  1 +
>   package/libpng12/Config.in   |  8 ++++++++
>   package/libpng12/libpng12.mk | 18 ++++++++++++++++++
>   3 files changed, 27 insertions(+)
>   create mode 100644 package/libpng12/Config.in
>   create mode 100644 package/libpng12/libpng12.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 0278885..2b8bef0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -472,6 +472,7 @@ source "package/libglade/Config.in"
>   source "package/gdk-pixbuf/Config.in"
>   source "package/libgtk2/Config.in"
>   source "package/libpng/Config.in"
> +source "package/libpng12/Config.in"
>   source "package/libqrencode/Config.in"
>   source "package/libraw/Config.in"
>   source "package/librsvg/Config.in"
> diff --git a/package/libpng12/Config.in b/package/libpng12/Config.in
> new file mode 100644
> index 0000000..ff9e9b1
> --- /dev/null
> +++ b/package/libpng12/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBPNG12
> +	bool "libpng"
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Library for handling PNG (Portable Network Graphics)
> +	  images.
> +
> +	  http://www.libpng.org/
> diff --git a/package/libpng12/libpng12.mk b/package/libpng12/libpng12.mk
> new file mode 100644
> index 0000000..de4a45c
> --- /dev/null
> +++ b/package/libpng12/libpng12.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# libpng12
> +#
> +################################################################################
> +
> +LIBPNG12_VERSION = 1.2.50
> +LIBPNG12_SERIES = 12
> +LIBPNG12_SOURCE = libpng-$(LIBPNG12_VERSION).tar.bz2
> +LIBPNG12_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG12_SERIES}/$(LIBPNG12_VERSION)

  Use $(), not ${}


  Regards,
  Arnout

> +LIBPNG12_LICENSE = libpng license
> +LIBPNG12_LICENSE_FILES = LICENSE
> +LIBPNG12_INSTALL_STAGING = YES
> +LIBPNG12_DEPENDENCIES = host-pkgconf zlib
> +LIBPNG12_CONFIG_SCRIPTS = libpng$(LIBPNG12_SERIES)-config libpng-config
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
