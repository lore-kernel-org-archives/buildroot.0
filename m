From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:46:32 +0200
Subject: [Buildroot] [PATCH 1/2] doxygen: new package
In-Reply-To: <1428574743-32177-2-git-send-email-bgolaszewski@baylibre.com>
References: <1428574743-32177-1-git-send-email-bgolaszewski@baylibre.com>
 <1428574743-32177-2-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150409214632.5cf61f23@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Thu,  9 Apr 2015 12:19:02 +0200, Bartosz Golaszewski wrote:

> +DOXYGEN_VERSION = 1.8.9.1
> +DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
> +DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri/
> +DOXYGEN_LICENSE = GPLv2
> +DOXYGEN_LICENSE_FILES = LICENSE
> +
> +# configure fails with default host-autotools-package parameters
> +define HOST_DOXYGEN_CONFIGURE_CMDS
> +	(cd $(@D); ./configure --shared --prefix=$(HOST_DIR)/usr)
> +endef
> +
> +$(eval $(host-autotools-package))

configure fails with the default host-autotools-package parameters,
because doxygen does not use the autotools nor even autoconf. So this
package should be handled using the host-generic-package infrastructure
instead.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
