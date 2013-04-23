From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Apr 2013 23:33:19 +0200
Subject: [Buildroot] [PATCH 1/1] poppler: new package
In-Reply-To: <1366145284-29557-1-git-send-email-olivier.schonken@gmail.com>
 (Olivier Schonken's message of "Tue, 16 Apr 2013 22:48:04 +0200")
References: <1366145284-29557-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <87fvyhc4ps.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olivier" == Olivier Schonken <olivier.schonken@gmail.com> writes:

 Olivier> Poppler is a PDF rendering library based on the xpdf-3.0 code base.
 Olivier> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 Olivier> ---
 Olivier>  package/Config.in          |    1 +
 Olivier>  package/poppler/Config.in  |   46 ++++++++++++++++++++++++++++++++
 Olivier>  package/poppler/poppler.mk |   63 ++++++++++++++++++++++++++++++++++++++++++++
 Olivier>  3 files changed, 110 insertions(+)
 Olivier>  create mode 100644 package/poppler/Config.in
 Olivier>  create mode 100644 package/poppler/poppler.mk

 Olivier> diff --git a/package/Config.in b/package/Config.in
 Olivier> index f28cedd..a52705a 100644
 Olivier> --- a/package/Config.in
 Olivier> +++ b/package/Config.in
 Olivier> @@ -444,6 +444,7 @@ source "package/opencv/Config.in"
 Olivier>  source "package/opengl/Config.in"
 Olivier>  source "package/pango/Config.in"
 Olivier>  source "package/pixman/Config.in"
 Olivier> +source "package/poppler/Config.in"
 Olivier>  source "package/tiff/Config.in"
 Olivier>  source "package/webkit/Config.in"
 Olivier>  source "package/zxing/Config.in"
 Olivier> diff --git a/package/poppler/Config.in b/package/poppler/Config.in
 Olivier> new file mode 100644
 Olivier> index 0000000..ce31651
 Olivier> --- /dev/null
 Olivier> +++ b/package/poppler/Config.in
 Olivier> @@ -0,0 +1,46 @@
 Olivier> +config BR2_PACKAGE_POPPLER
 Olivier> +	bool "poppler"
 Olivier> +	depends on BR2_INSTALL_LIBSTDCPP
 Olivier> +	select BR2_PACKAGE_FONTCONFIG
 Olivier> +	help
 Olivier> +	   Poppler is a PDF rendering library based on the xpdf-3.0 code base.
 Olivier> +
 Olivier> +	   http://poppler.freedesktop.org/
 Olivier> +
 Olivier> +comment "qpdf requires a toolchain with C++ support enabled"
 Olivier> +	depends on !BR2_INSTALL_LIBSTDCPP

poppler, not qpdf.

 Olivier> +
 Olivier> +if BR2_PACKAGE_POPPLER
 Olivier> +menu "Poppler Options"

Because of the comment, this is no longer considered a suboption of
BR2_PACKAGE_POPPLER, so it doesn't get indented.

 Olivier> +config BR2_PACKAGE_POPPLER_CMS
 Olivier> +	bool "Color Management System support"
 Olivier> +	select BR2_PACKAGE_LCMS2
 Olivier> +

For most packages, we normally automatically enable library support if
those libraries are enabled, so all of these explicit options can go.

 Olivier> +#############################################################
 Olivier> +#
 Olivier> +# poppler
 Olivier> +#
 Olivier> +#############################################################
 Olivier> +
 Olivier> +POPPLER_VERSION = 0.22.3
 Olivier> +POPPLER_SITE = http://poppler.freedesktop.org
 Olivier> +POPPLER_DEPENDENCIES = fontconfig
 Olivier> +POPPLER_LICENSE = GPLv2

There's a bunch of 'any later version' references, so this should be
GPLv2+

Committed with those changes, thanks.

-- 
Bye, Peter Korsgaard
