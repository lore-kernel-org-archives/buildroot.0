From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 00:11:13 +0200
Subject: [Buildroot] [PATCH 1/2] Add pyyaml package
In-Reply-To: <1437912738-24116-1-git-send-email-geoffrey.ragot@gmail.com>
References: <1437912738-24116-1-git-send-email-geoffrey.ragot@gmail.com>
Message-ID: <20150728001113.2324729a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Geoffrey,

The commit title should have been:

	python-pyyaml: new package

(just to follow the Buildroot conventions).

On Sun, 26 Jul 2015 14:12:17 +0200, Geoffrey Ragot wrote:

> diff --git a/package/python-pyyaml/Config.in b/package/python-pyyaml/Config.in
> new file mode 100644
> index 0000000..a63c445
> --- /dev/null
> +++ b/package/python-pyyaml/Config.in
> @@ -0,0 +1,8 @@
> +comment "python-pyyaml require libyaml"
> +	depends on !BR2_PACKAGE_LIBYAML

This comment is not needed...

> +
> +config BR2_PACKAGE_PYTHON_PYYAML
> +	bool "python-pyyaml"
> +	depends on BR2_PACKAGE_LIBYAML

... because 'select' should be used instead of 'depends on' for such
dependencies.

> +	help
> +	  The PyYAML package contains binding to the libyaml API.

We normally include the URL of the upstream project here.

> diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
> new file mode 100644
> index 0000000..ef10dac
> --- /dev/null
> +++ b/package/python-pyyaml/python-pyyaml.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pyyaml
> +#
> +################################################################################
> +
> +PYTHON_PYYAML_VERSION = 3.11
> +PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
> +PYTHON_PYYAML_SITE = https://pypi.python.org/packages/source/P/PyYAML/
> +PYTHON_PYYAML_SETUP_TYPE = distutils
> +PYTHON_PYYAML_LICENSE = Python software foundation license v2
> +PYTHON_PYYAML_LICENSE_FILES = LICENSE
> +PYTHON_PYYAML_DEPENDENCIES = libyaml
> +
> +$(eval $(python-package))

The .mk file was OK, however, the .hash file was missing.

I've fixed those issues:

    [Thomas:
      - use 'select' rather than 'depends on' for the yaml library
        dependency
      - add hash file.
      - add upstream URL in Config.in help text
      - rework commit title.]

and applied.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
