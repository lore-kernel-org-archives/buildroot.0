From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 00:37:18 +0100
Subject: [Buildroot] [PATCH 10/14] Added package Gutenprint
In-Reply-To: <639aebbbbadcf25a5e814763c5bef25ae68d1485.1364165310.git.yann.morin.1998@free.fr>
References: <cover.1364165310.git.yann.morin.1998@free.fr>
 <639aebbbbadcf25a5e814763c5bef25ae68d1485.1364165310.git.yann.morin.1998@free.fr>
Message-ID: <20130325003718.2b239943@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 24 Mar 2013 23:50:45 +0100, Yann E. MORIN wrote:

> +#############################################################
> +#
> +# gutenprint
> +#
> +#############################################################
> +
> +GUTENPRINT_VERSION = 5.2.9
> +GUTENPRINT_SITE = http://downloads.sourceforge.net/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
> +GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2

LICENSE, LICENSE_FILES ?

> +GUTENPRINT_LIBTOOL_PATCH = YES

Not needed, that's done automatically.

> +# host-gutenprint is needed to generate XML as part of compilation
> +# the program that generates the xml also links against libgutenprint
> +# so we ened to build both a host package and a target package

           need

> +GUTENPRINT_DEPENDENCIES += host-gutenprint
> +
> +GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
> +                      --disable-samples \
> +                      --without-gimp2 \
> +                      --without-foomatic \
> +                      --without-foomatic3 \
> +                      --prefix=/usr \

Not needed, prefix set automatically.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
