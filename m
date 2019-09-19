From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 23:54:37 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/python-kiwisolver: new
 package
In-Reply-To: <20190917085034.2509-1-esben@geanix.com>
References: <20190917085034.2509-1-esben@geanix.com>
Message-ID: <20190919235437.3630bff6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Sep 2019 10:50:33 +0200
Esben Haabendal <esben@geanix.com> wrote:

> +config BR2_PACKAGE_PYTHON_KIWISOLVER
> +	bool "python-kiwisolver"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON

a dependency on python || python is not very useful, especially since
anyway this Config.in is already included in a python || python3
condition.

> diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
> new file mode 100644
> index 000000000000..96019fc29328
> --- /dev/null
> +++ b/package/python-kiwisolver/python-kiwisolver.mk
> @@ -0,0 +1,7 @@

You forgot our completely useless, but absolutely mandatory and lovely
comment header that we have in all packages.

I fixed both issues and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
