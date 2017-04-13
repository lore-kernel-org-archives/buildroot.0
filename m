From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 21:59:59 +0200
Subject: [Buildroot] [PATCH] mpir: new package
In-Reply-To: <1492091374-5028-1-git-send-email-semenak94@mail.ru>
References: <mpir: new package>
 <1492091374-5028-1-git-send-email-semenak94@mail.ru>
Message-ID: <20170413215959.6e221b3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Apr 2017 16:49:34 +0300, Semyon Kolganov wrote:
> Signed-off-by: Semyon Kolganov <semenak94@mail.ru>

Thanks for this new contribution. It generally looks good, just a few
comments, see below.

>  package/Config.in      |  1 +
>  package/mpir/Config.in |  8 ++++++++
>  package/mpir/mpir.hash |  2 ++
>  package/mpir/mpir.mk   | 18 ++++++++++++++++++

You forgot to change the DEVELOPERS file to add yourself as the
developer for this package.

> diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
> new file mode 100644
> index 0000000..fbce887
> --- /dev/null
> +++ b/package/mpir/mpir.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# mpir
> +#
> +################################################################################
> +
> +MPIR_VERSION = 3.0.0
> +MPIR_SITE = http://www.mpir.org
> +MPIR_SOURCE = mpir-$(MPIR_VERSION).tar.bz2
> +MPIR_LICENSE = LGPL-3.0+
> +MPIR_LICENSE_FILES = COPYING.LIB
> +MPIR_INSTALL_STAGING = YES
> +MPIR_DEPENDENCIES = gmp
> +HOST_MPIR_DEPENDENCIES = host-gmp
> +MPIR_MAKE_OPTS = RANLIB=$(TARGET_RANLIB)
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Why is a host variant of this package needed? It should at the very
least be explained in the commit log.

The rest looks good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
