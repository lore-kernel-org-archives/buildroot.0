From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Apr 2013 16:02:17 +0200
Subject: [Buildroot] [PATCH 1/2] glibmm: new package
In-Reply-To: <1366791236-22718-1-git-send-email-nicolas.menegale@openwide.fr>
References: <1366791236-22718-1-git-send-email-nicolas.menegale@openwide.fr>
Message-ID: <20130424160217.4d8624de@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear nmenegale,

On Wed, 24 Apr 2013 10:13:55 +0200, nmenegale wrote:

> diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
> new file mode 100644
> index 0000000..f7f49bd
> --- /dev/null
> +++ b/package/glibmm/glibmm.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# Glibmm
> +#
> +#############################################################
> +GLIBMM_VERSION = 2.30.1
> +GLIBMM_LICENSE = LGPLv2.1
> +GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.bz2
> +GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/2.30
> +GLIBMM_INSTALL_STAGING = YES
> +GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf
> +
> +$(eval $(autotools-package))

A few minor comments:

 * Please add an empty new line between  the header and the the first
   variable.

 * Maybe you should split the version number in two variables in order
   to re-use it for the site:

GLIBMM_VERSION_MAJOR = 2.30
GLIBMM_VERSION_MINOR = 1
GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).$(GLIBMM_VERSION_MINOR)
GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/$(GLIBMM_VERSION_MAJOR)

 * The licensing informations is not entirely correct. I think it
   should be:

GLIBMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
GLIBMM_LICENSE_FILES = COPYING COPYING.tools

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
