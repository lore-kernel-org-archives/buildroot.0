From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:53:57 +0100
Subject: [Buildroot] [PATCH 1/2] python-iniparse: new package
In-Reply-To: <1453594504-8725-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1453594504-8725-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20160126225357.61c3544e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoltan Gyarmati,

Thanks for this contribution. See some comments below.

On Sun, 24 Jan 2016 01:15:03 +0100, Zoltan Gyarmati wrote:

> diff --git a/package/python-iniparse/Config.in b/package/python-iniparse/Config.in
> new file mode 100644
> index 0000000..93d7ead
> --- /dev/null
> +++ b/package/python-iniparse/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_INIPARSE
> +	bool "python-iniparse"
> +	depends on BR2_PACKAGE_PYTHON
> +	help
> +	  iniparse is an INI parser for  Python which is API compatible
> +	  with the standard library's ConfigParser, preserves structure of INI
> +	  files (order of sections & options, indentation, comments, and blank
> +	  lines are preserved when data is updated), and is more convenient to
> +	  use.

Lines are too long, you should wrap at 72 characters.

> diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
> new file mode 100644
> index 0000000..0caa146
> --- /dev/null
> +++ b/package/python-iniparse/python-iniparse.hash
> @@ -0,0 +1,2 @@
> +#md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5e573e9e9733d97623881ce9bbe5eca6

Space after #

> +md5 5e573e9e9733d97623881ce9bbe5eca6 iniparse-0.4.tar.gz

Please add a locally calculated sha256 hash. See
package/python-netifaces/python-netifaces.hash for example.

> diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
> new file mode 100644
> index 0000000..b00e0c4
> --- /dev/null
> +++ b/package/python-iniparse/python-iniparse.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-iniparse
> +#
> +################################################################################
> +
> +PYTHON_INIPARSE_VERSION = 0.4
> +PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
> +PYTHON_INIPARSE_SITE = https://pypi.python.org/packages/source/i/iniparse
> +PYTHON_INIPARSE_LICENSE = Python software foundation license v2, MIT
> +PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
> +PYTHON_INIPARSE_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))

Otherwise, looks good.

Can you fix the minor comments above and resubmit an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
