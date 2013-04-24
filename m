From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Apr 2013 16:08:45 +0200
Subject: [Buildroot] [PATCH 2/2] libxml++: new package
In-Reply-To: <1366791236-22718-2-git-send-email-nicolas.menegale@openwide.fr>
References: <1366791236-22718-1-git-send-email-nicolas.menegale@openwide.fr>
 <1366791236-22718-2-git-send-email-nicolas.menegale@openwide.fr>
Message-ID: <20130424160845.4677af42@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear nmenegale,

On Wed, 24 Apr 2013 10:13:56 +0200, nmenegale wrote:

> +#############################################################
> +#
> +# LibXML++
> +#
> +#############################################################

One empty line between headers and variables.

> +LIBXMLPP_VERSION_MAJOR = 2.34
> +LIBXMLPP_VERSION_MINOR = 2
> +LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).$(LIBXMLPP_VERSION_MINOR)
> +LIBXMLPP_LICENSE = LGPLv2+

License wise, this package is funky. The COPYING file contains the text
of LGPLv2.1. The source files of the library in the libxml++/ directory
just say "are covered by the GNU Lesser General Public License, which
should be included with libxml++ as the file COPYING." without
specifying the version, and whether is 'or later' or not.

And the examples in the examples/ directory are under "GNU Library
General Public License as published by the Free Software Foundation;
either version 2 of the License, or (at your option) any later
version.".

So this looks a package for which the licensing question was not really
handled properly. If we want to express what I found, it should
probably be something like:

LIBXMLPP_LICENSE = LGPLv2.1 (library), LGPLv2+ (examples)
LIBXMLPP_LICENSE_FILES = COPYING

But I am not sure this is actually the intention of the libxml++
authors.

> +LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.bz2

Use .tar.xz instead?

> +LIBXMLPP_SITE = http://ftp.gnome.org/pub/GNOME/sources/libxml++/$(LIBXMLPP_VERSION_MAJOR)
> +LIBXMLPP_INSTALL_STAGING = YES
> +LIBXMLPP_DEPENDENCIES = libxml2 glibmm host-pkgconf
> +
> +$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
