From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Apr 2019 23:23:00 +0200
Subject: [Buildroot] [PATCH 1/2] pkgconf: bump to version 1.6.1
In-Reply-To: <20190409175919.25833-1-aduskett@gmail.com>
References: <20190409175919.25833-1-aduskett@gmail.com>
Message-ID: <20190409232300.1b76d55c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  9 Apr 2019 13:59:18 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> This version properly works with the --variable argument.

What do you mean by "properly works with the --variable argument" ?

The pkg-config issue with variables being sometimes prefixed by the sysroot sometimes not simply cannot be fixed, because pkg-config has no idea whether the variable is meant to be used a build time (needs to be prefixed by the sysroot) or at run time (must NOT be prefixed by the sysroot).

> 
> Other changes:
>   - Change the URL to https://git.dereferenced.org/pkgconf/pkgconf/archive as
>     the current URL has a bad https certificate.
>   - Add PKGCONF_AUTORECONF = YES because the tar.gz from the above URL change
>     does not have a configure file.
>   - Add a hash for the license file.
> 
> Tested against:
>   - libsoup
>   - X11r7
>   - dbus-glib
>   - atk
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/pkgconf/pkgconf.hash | 3 ++-
>  package/pkgconf/pkgconf.mk   | 7 +++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkgconf/pkgconf.hash b/package/pkgconf/pkgconf.hash
> index 7ea7ff57a8..00965a071d 100644
> --- a/package/pkgconf/pkgconf.hash
> +++ b/package/pkgconf/pkgconf.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
> -sha256	d3468308553c94389dadfd10c4d1067269052b5364276a9d24a643c88485f715	pkgconf-1.5.3.tar.xz
> +sha256	736494ae9e6222f56ab2fdc3346f78a3b76cadf0e8d6ea8308ee7245ccd7b894	pkgconf-1.6.1.tar.gz
> +sha256	07ee94b50a41ee3fc4e13a9b9c60b26fc28488494c465639f7e5f07a3952ec04	COPYING
> diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
> index e3c73fd405..d7f1de0f73 100644
> --- a/package/pkgconf/pkgconf.mk
> +++ b/package/pkgconf/pkgconf.mk
> @@ -4,12 +4,11 @@
>  #
>  ################################################################################
>  
> -PKGCONF_VERSION = 1.5.3
> -PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
> -PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
> +PKGCONF_VERSION = 1.6.1
> +PKGCONF_SITE = https://git.dereferenced.org/pkgconf/pkgconf/archive
>  PKGCONF_LICENSE = pkgconf license
>  PKGCONF_LICENSE_FILES = COPYING
> -
> +PKGCONF_AUTORECONF = YES
>  PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
>  
>  define PKGCONF_LINK_PKGCONFIG



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
