From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 2 Nov 2018 23:11:21 +0100
Subject: [Buildroot] [PATCH] package/bdwgc: drop AUTORECONF = YES
In-Reply-To: <20181102203338.23534-1-thomas.petazzoni@bootlin.com>
References: <20181102203338.23534-1-thomas.petazzoni@bootlin.com>
Message-ID: <CAPi7W82m75-mmEA2JQZY7YkjnJwE_FGku2awQ7H24AHjBPHJ_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le ven. 2 nov. 2018 ? 21:33, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Since commit 4e1dbd063d1f3ea7dfc95698320f6fd40139085d ("package/bdwgc:
> bump to version 8.0.0"), we no longer have any patch that requires
> autoreconf. In addition, the libtool shipped with the package seems to
> no longer be bogus, because it builds perfectly fine without
> autoreconf. Therefore, let's drop this autoreconf.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bdwgc/bdwgc.mk | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
> index 8607234e5d..8ffac476f3 100644
> --- a/package/bdwgc/bdwgc.mk
> +++ b/package/bdwgc/bdwgc.mk
> @@ -13,12 +13,6 @@ BDWGC_LICENSE_FILES = README.QUICK
>  BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
>  HOST_BDWGC_DEPENDENCIES = host-libatomic_ops host-pkgconf
>
> -# The libtool shipped with the package is bogus and generates some
> -# -L/usr/lib flags. It uses a version not supported by Buildroot
> -# libtool patches, so autoreconfiguring the packages is the easiest
> -# solution.
> -BDWGC_AUTORECONF = YES
> -
>  BDWGC_CONF_OPTS = CFLAGS_EXTRA="$(BDWGC_CFLAGS_EXTRA)"
>  ifeq ($(BR2_sparc),y)
>  BDWGC_CFLAGS_EXTRA += -DAO_NO_SPARC_V9
> --
> 2.14.4
>
Best Regards,

Fabrice
