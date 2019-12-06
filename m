From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:19:52 +0100
Subject: [Buildroot] [PATCH 2/4] package/python-twisted: add config for
 TLS support
In-Reply-To: <20191205221515.3121562-2-aduskett@gmail.com>
References: <20191205221515.3121562-1-aduskett@gmail.com>
 <20191205221515.3121562-2-aduskett@gmail.com>
Message-ID: <20191206231952.6235c9ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Dec 2019 14:15:13 -0800
aduskett at gmail.com wrote:

> +if BR2_PACKAGE_PYTHON_TWISTED
> +
> +config BR2_PACKAGE_PYTHON_TWISTED_TLS
> +	bool "TLS support"
> +	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-cryptography

We don't really care about python-cryptography here, since it's not a
direct dependencies. However, python-service-identify does have a C++
dependency, so it made more sense to list that here.

> +	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
> +	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
> +	select BR2_PACKAGE_PYTHON_IDNA # runtime

Alphabetic ordering was not good.

I fixed up both issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
