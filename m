From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Feb 2019 15:51:23 +0100
Subject: [Buildroot] [PATCH v2 1/6] intel-gmmlib: new package.
In-Reply-To: <20190131121526.11816-2-lpdev@cordier.org>
References: <20190131121526.11816-1-lpdev@cordier.org>
 <20190131121526.11816-2-lpdev@cordier.org>
Message-ID: <20190202155123.7200cc06@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Nit: there shouldn't be a final dot at end of commit title.

On Thu, 31 Jan 2019 13:15:21 +0100
Louis-Paul Cordier <lpdev@cordier.org> wrote:

>  package/Config.in                      |  1 +
>  package/intel-gmmlib/Config.in         |  8 ++++++++
>  package/intel-gmmlib/intel-gmmlib.hash |  2 ++
>  package/intel-gmmlib/intel-gmmlib.mk   | 17 +++++++++++++++++

Missing update to the DEVELOPERS file

> +sha256 e3114d7ddd429f1b9aa43a1b1d0086d881fbf4d90e4a90ab8577c369d2e3a5e1  intel-gmmlib-18.3.0.tar.gz
> diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
> new file mode 100644
> index 0000000000..e6ca3e5c5e
> --- /dev/null
> +++ b/package/intel-gmmlib/intel-gmmlib.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# intel-gmmlib
> +#
> +################################################################################
> +
> +INTEL_GMMLIB_VERSION = 18.3.0

There is an ewer 18.4.1 version available.

> +INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
> +INTEL_GMMLIB_LICENSE = MIT
> +INTEL_GMMLIB_LICENSE_FILES = COPYING
> +
> +INTEL_GMMLIB_INSTALL_STAGING = YES
> +INTEL_GMMLIB_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +INTEL_GMMLIB_CONF_OPTS += -DRUN_TEST_SUITE=OFF

+= can be made just =.

Other than those minor nits, looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
