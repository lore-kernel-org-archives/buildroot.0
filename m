From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Sep 2014 14:00:59 +0200
Subject: [Buildroot] [PATCH 3/6] python-rtslib-fb: new package
In-Reply-To: <1410953999-16520-4-git-send-email-cvubrugier@fastmail.fm>
References: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
 <1410953999-16520-4-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20140917140059.0eee9af9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Wed, 17 Sep 2014 13:39:56 +0200, Christophe Vu-Brugier wrote:

> diff --git a/package/python-rtslib-fb/Config.in b/package/python-rtslib-fb/Config.in
> new file mode 100644
> index 0000000..b2aebcf
> --- /dev/null
> +++ b/package/python-rtslib-fb/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_RTSLIB_FB
> +	bool "python-rtslib-fb"
> +	depends on BR2_PACKAGE_PYTHON

Is it for this package that you had the Python 3 issue? Could you
explain a bit more the 2to3 problems you have seen?


> +	help
> +	  rtslib-fb is an object-based Python library for configuring
> +	  the LIO generic SCSI target, present in 3.x Linux kernel
> +	  versions.
> +
> +	  https://github.com/agrover/rtslib-fb
> diff --git a/package/python-rtslib-fb/python-rtslib.mk b/package/python-rtslib-fb/python-rtslib.mk
> new file mode 100644
> index 0000000..70b0257
> --- /dev/null
> +++ b/package/python-rtslib-fb/python-rtslib.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-rtslib-fb
> +#
> +################################################################################
> +
> +PYTHON_RTSLIB_FB_VERSION = v2.1.fb49
> +PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
> +PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
> +PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
> +PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))

Other than that, the patch looks good to me, and the Python 3 support
can always be added later:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
