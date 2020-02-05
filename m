From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 16:20:13 +0100
Subject: [Buildroot] [PATCH v3] package/python-imutils: new package
In-Reply-To: <20190802144503.23601-1-alexandre.payen@smile.fr>
References: <20190802144503.23601-1-alexandre.payen@smile.fr>
Message-ID: <20200205162013.2749e009@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexandre,

On Fri,  2 Aug 2019 16:45:03 +0200
Aalx <alexandre.payen@smile.fr> wrote:

> diff --git a/package/python-imutils/Config.in b/package/python-imutils/Config.in
> new file mode 100644
> index 0000000000..0c8ffbda56
> --- /dev/null
> +++ b/package/python-imutils/Config.in
> @@ -0,0 +1,36 @@
> +config BR2_PACKAGE_PYTHON_IMUTILS
> +	bool "python-imutils"
> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-scipy
> +	depends on BR2_PACKAGE_PYTHON3 # python-scipy
> +	depends on BR2_TOOLCHAIN_HAS_FORTRAN # python-scipy
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC # opencv3
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # opencv3
> +	depends on BR2_INSTALL_LIBSTDCPP # opencv3
> +	depends on BR2_USE_WCHAR # opencv3
> +	depends on !BR2_STATIC_LIBS  # opencv3
> +	depends on !BR2_PACKAGE_OPENCV # opencv3
> +	depends on BR2_PACKAGE_OPENCV3

If you "depends on BR2_PACKAGE_OPENCV3", there is no need to replicate
all the dependencies of opencv3 inside this package.

> +	select BR2_PACKAGE_PYTHON_SCIPY

We don't have this package in Buildroot, this needs to be added before
we can merge python-imutils.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
