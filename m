From: H.Fijnvandraat at inter.nl.net <H.Fijnvandraat@inter.nl.net>
Date: Fri, 3 May 2013 14:01:04 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/2] Refactoring Freescale's iMX software
 revision levels
In-Reply-To: <1367569664-3307-1-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1367569664-3307-1-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <42565.217.149.209.147.1367582464.squirrel@webmail.internl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry,

But I have to withdraw these patches.

Due to the sequence in which the .mk files are included IMX_VERSION_LEVEL
is defined when imx-lib.mk is processed, while it is already needed for
firmware-imx (and  gpu-viv-bin-mx6q if it would be introduced)

Placing it in firmware-imx would do for now, but then no dependencies can
be placed alphabetically before it later.

It appears we need some other mechanism to rule them all.

Henk


Op Vr, 3 mei, 2013 10:27 am schreef Henk Fijnvandraat:
> imx-lib: bump to version 1.1.0
>
>
> Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
> ---
> package/imx-lib/imx-lib.mk |   14 +++++++++++++- 1 file changed, 13
> insertions(+), 1 deletion(-)
>
> diff --git a/package/imx-lib/imx-lib.mk b/package/imx-lib/imx-lib.mk index
> c168c80..c398568 100644 --- a/package/imx-lib/imx-lib.mk
> +++ b/package/imx-lib/imx-lib.mk
> @@ -1,10 +1,22 @@
> #############################################################
> #
> +# freescale's imx-version-level
> +#
> +#############################################################
> +
> +# Current version level for a number of freescale software packages
> +#
> +# firmware-imx, imx-lib and gpu-viv-bin-mx6q
> +
> +IMX_VERSION_LEVEL = 1.1.0
> +
> +#############################################################
> +#
> # imx-lib
> #
> #############################################################
>
>
> -IMX_LIB_VERSION = 12.09.01
> +IMX_LIB_VERSION = $(IMX_VERSION_LEVEL)
> # No official download site from freescale, just this mirror
> IMX_LIB_SITE    = http://download.ossystems.com.br/bsp/freescale/source
> IMX_LIB_LICENSE = LGPLv2.1+
> --
> 1.7.10.4
>
>
> _______________________________________________
> buildroot mailing list buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
