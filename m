From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 21:40:40 +0100
Subject: [Buildroot] [PATCH 1/1] Added lcms2 package
In-Reply-To: <1363437742-2562-1-git-send-email-olivier.schonken@gmail.com>
 (Olivier Schonken's message of "Sat, 16 Mar 2013 14:42:22 +0200")
References: <1362250047-26425-1-git-send-email-olivier.schonken@gmail.com>
 <1363437742-2562-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <87ip4ozbjr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olivier" == Olivier Schonken <olivier.schonken@gmail.com> writes:

 Olivier> Little CMS intends to be an OPEN SOURCE small-footprint color management engine,
 Olivier> with special focus on accuracy and performance.

 Olivier> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 Olivier> ---
 Olivier> Changelog:
 Olivier>         Removed excess empty lines from Config.in
 Olivier>         Added licensing info to lcms2.mk
 Olivier> 	Chaned LCMS2_SITE to correct url
 Olivier> 	Added options to include support for zlib, jpeg and tiff
 Olivier> 	Removed dependency on host-lcms2

 Olivier>  package/Config.in       |    1 +
 Olivier>  package/lcms2/Config.in |   11 +++++++++++
 Olivier>  package/lcms2/lcms2.mk  |   35 +++++++++++++++++++++++++++++++++++
 Olivier>  3 files changed, 47 insertions(+)
 Olivier>  create mode 100644 package/lcms2/Config.in
 Olivier>  create mode 100644 package/lcms2/lcms2.mk

 Olivier> diff --git a/package/Config.in b/package/Config.in
 Olivier> index 21c3ec9..4cf71d6 100644
 Olivier> --- a/package/Config.in
 Olivier> +++ b/package/Config.in
 Olivier> @@ -421,6 +421,7 @@ source "package/gtk2-engines/Config.in"
 Olivier>  source "package/gtk2-themes/Config.in"
 Olivier>  source "package/imlib2/Config.in"
 Olivier>  source "package/jpeg/Config.in"
 Olivier> +source "package/lcms2/Config.in"
 Olivier>  source "package/libart/Config.in"
 Olivier>  source "package/libdmtx/Config.in"
 Olivier>  source "package/libdrm/Config.in"
 Olivier> diff --git a/package/lcms2/Config.in b/package/lcms2/Config.in
 Olivier> new file mode 100644
 Olivier> index 0000000..33999fa
 Olivier> --- /dev/null
 Olivier> +++ b/package/lcms2/Config.in
 Olivier> @@ -0,0 +1,11 @@
 Olivier> +config BR2_PACKAGE_LCMS2
 Olivier> +	bool "lcms2"
 Olivier> +	help
 Olivier> +	  Little Color Management Software
 Olivier> +	  Little CMS intends to be an OPEN SOURCE small-footprint color 
 Olivier> +	  management engine, with special focus on accuracy and performance. 
 Olivier> +	  It uses the International Color Consortium standard (ICC), which is
 Olivier> +	  the modern standard when regarding to color management.
 Olivier> +
 Olivier> +	  http://www.littlecms.com/
 Olivier> +

You have trailing spaces and an empty line at the end.

 Olivier> diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
 Olivier> new file mode 100644
 Olivier> index 0000000..1766bec
 Olivier> --- /dev/null
 Olivier> +++ b/package/lcms2/lcms2.mk
 Olivier> @@ -0,0 +1,35 @@
 Olivier> +#############################################################
 Olivier> +#
 Olivier> +# lcms2
 Olivier> +#
 Olivier> +#############################################################
 Olivier> +
 Olivier> +LCMS2_VERSION = 2.4
 Olivier> +LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
 Olivier> +LCMS2_LICENSE = MIT
 Olivier> +LCMS2_LICENSE_FILES = COPYING
 Olivier> +
 Olivier> +LCMS2_CONF_OPT = \
 Olivier> +
 Olivier> +ifeq ($(BR2_PACKAGE_JPEG),y)
 Olivier> +	LCMS2_CONF_OPT += --with-jpeg 
 Olivier> +	LCMS2_DEPENDENCIES += jpeg

And the same here (multiple places).

Committed with those fixed, thanks.

-- 
Bye, Peter Korsgaard
