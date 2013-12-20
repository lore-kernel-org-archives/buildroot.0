From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Dec 2013 17:00:36 +0100
Subject: [Buildroot] [PATCH v2 1/2] libevdev: new package
In-Reply-To: <1387551924-4824-2-git-send-email-anaumann@ultratronik.de>
References: <1387551924-4824-1-git-send-email-anaumann@ultratronik.de>
 <1387551924-4824-2-git-send-email-anaumann@ultratronik.de>
Message-ID: <20131220170036.261ad453@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Naumann,

On Fri, 20 Dec 2013 16:05:23 +0100, Andreas Naumann wrote:

> +LIBEVDEV_LICENSE = GPLv2

Are you sure? The license looks like an MIT license.

> +LIBEVDEV_LICENSE_FILES = COPYING
> +
> +# Uses PKG_CHECK_MODULES() in configure.ac
> +LIBEVDEV_DEPENDENCIES = host-pkgconf
> +# the package provides a autogen.sh, but we'd rather run buildroots autoreconf

That's not the correct reason. The real reason is the one you gave in
your cover letter:

# Package coming from Git, which doesn't provide the generated
# configure and Makefile.in files

> +LIBEVDEV_AUTORECONF = YES
> +LIBEVDEV_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
