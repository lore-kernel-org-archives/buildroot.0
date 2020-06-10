From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 22:55:23 +0200
Subject: [Buildroot] [PATCH 1/1] python-pybind: new package
In-Reply-To: <20200608213043.3443-1-guillaume.bressaix@gmail.com>
References: <20200608213043.3443-1-guillaume.bressaix@gmail.com>
Message-ID: <20200610225523.5bc2d13b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guillaume,

I've applied your patch, but after a number of changes. See below.

On Mon,  8 Jun 2020 23:30:43 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> PyBind is a light (headers only) package
> for C++/Python and Python/C++ bindings.
> 
> host-python-pybind is a dependency
> of my future contribution, so I added this feature.

This sort of comment should not go in the commit log, but below the
"---" sign that follows the Signed-off-by line. And in fact, I have
dropped the host variant: it should be added in the patch series
together with your "future contribution" that will need the host
variant of python-pybind.


> diff --git a/package/python-pybind/Config.in b/package/python-pybind/Config.in
> new file mode 100644
> index 0000000000..832a9fb971
> --- /dev/null
> +++ b/package/python-pybind/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_PYBIND
> +	bool "python-pybind"
> +	depends on BR2_PACKAGE_PYTHON3

Its documentation says Python 2.x is supported, so I've dropped this
"depends on".

> new file mode 100644
> index 0000000000..03cea1c060
> --- /dev/null
> +++ b/package/python-pybind/python-pybind.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pybind
> +#
> +################################################################################
> +
> +PYTHON_PYBIND_VERSION = 2.5.0
> +PYTHON_PYBIND_SOURCE = v$(PYTHON_PYBIND_VERSION).tar.gz
> +PYTHON_PYBIND_SITE = https://github.com/pybind/pybind11/archive

Here you should have use the "github" macro, because they anyway don't
provide their own tarballs, only automatically generated ones. This
also allows to have a better tarball name than v2.5.0.tar.gz.

> +$(eval $(python-package))
> +$(eval $(host-python-package))

So I said above, I've dropped this last line.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
