From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Jul 2013 23:12:06 +0200
Subject: [Buildroot] [PATCH] package/libsvg-cairo: new package
In-Reply-To: <1373917958-838-1-git-send-email-c.schoenert@gmail.com> (Carsten
 Schoenert's message of "Mon, 15 Jul 2013 21:52:38 +0200")
References: <1373917958-838-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <878v17a5p5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> Libsvg-cairo provides the ability to render SVG content from files or
 Carsten> buffers. All rendering is performed using the cairo rendering library.

 Carsten> Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> ---
 Carsten>  package/Config.in                    |    1 +
 Carsten>  package/libsvg-cairo/Config.in       |   11 +++++++++++
 Carsten>  package/libsvg-cairo/libsvg-cairo.mk |   14 ++++++++++++++
 Carsten>  3 files changed, 26 insertions(+)
 Carsten>  create mode 100644 package/libsvg-cairo/Config.in
 Carsten>  create mode 100644 package/libsvg-cairo/libsvg-cairo.mk

 Carsten> diff --git a/package/Config.in b/package/Config.in
 Carsten> index 6d5ff01..aac31bf 100644
 Carsten> --- a/package/Config.in
 Carsten> +++ b/package/Config.in
 Carsten> @@ -465,6 +465,7 @@ source "package/libqrencode/Config.in"
 Carsten>  source "package/libraw/Config.in"
 Carsten>  source "package/librsvg/Config.in"
 Carsten>  source "package/libsvg/Config.in"
 Carsten> +source "package/libsvg-cairo/Config.in"
 Carsten>  source "package/libsvgtiny/Config.in"
 Carsten>  source "package/libungif/Config.in"
 Carsten>  source "package/opencv/Config.in"
 Carsten> diff --git a/package/libsvg-cairo/Config.in b/package/libsvg-cairo/Config.in
 Carsten> new file mode 100644
 Carsten> index 0000000..9577c69
 Carsten> --- /dev/null
 Carsten> +++ b/package/libsvg-cairo/Config.in
 Carsten> @@ -0,0 +1,11 @@
 Carsten> +config BR2_PACKAGE_LIBSVG_CAIRO
 Carsten> +	bool "libsvg-cairo"
 Carsten> +	select BR2_PACKAGE_CAIRO
 Carsten> +	select BR2_PACKAGE_CAIRO_SVG
 Carsten> +	select BR2_PACKAGE_LIBSVG
 Carsten> +	help
 Carsten> +	  Libsvg-cairo provides the ability to render SVG content from
 Carsten> +	  files or buffers. All rendering is performed using the cairo
 Carsten> +	  rendering library.
 Carsten> +
 Carsten> +	  http://cairographics.org
 Carsten> diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
 Carsten> new file mode 100644
 Carsten> index 0000000..a41e859
 Carsten> --- /dev/null
 Carsten> +++ b/package/libsvg-cairo/libsvg-cairo.mk
 Carsten> @@ -0,0 +1,14 @@
 Carsten> +################################################################################
 Carsten> +#
 Carsten> +# libsvg-cairo
 Carsten> +#
 Carsten> +################################################################################
 Carsten> +
 Carsten> +LIBSVG_CAIRO_VERSION         = 0.1.6
 Carsten> +LIBSVG_CAIRO_SITE            = http://cairographics.org/snapshots/
 Carsten> +LIBSVG_CAIRO_DEPENDENCIES    = cairo libsvg
 Carsten> +LIBSVG_CAIRO_INSTALL_STAGING = YES
 Carsten> +LIBSVG_CAIRO_LICENSE         = LGPLv2+
 Carsten> +LIBSVG_CAIRO_LICENSE_FILES   = COPYING

The COPYING file is actually LGPL v2.1, so LICENSE should be LGPLv2.1+

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
