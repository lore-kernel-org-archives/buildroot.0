From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Jul 2013 17:22:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyro: adding Pyro 3.14
In-Reply-To: <1374479727-2105-2-git-send-email-fabien.marteau@armadeus.com>
 (Fabien Marteau's message of "Mon, 22 Jul 2013 09:55:27 +0200")
References: <1374479727-2105-1-git-send-email-fabien.marteau@armadeus.com>
 <1374479727-2105-2-git-send-email-fabien.marteau@armadeus.com>
Message-ID: <878v0ypqku.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "F" == Fabien Marteau <fabien.marteau@armadeus.com> writes:

 F> Signed-off-by: Fabien Marteau <fabien.marteau@armadeus.com>
 F> ---
 F>  package/Config.in                  |    1 +
 F>  package/python-pyro/Config.in      |    9 +++++++++
 F>  package/python-pyro/python-pyro.mk |   18 ++++++++++++++++++
 F>  3 files changed, 28 insertions(+)
 F>  create mode 100644 package/python-pyro/Config.in
 F>  create mode 100644 package/python-pyro/python-pyro.mk

 F> diff --git a/package/Config.in b/package/Config.in
 F> index 7730317..9e1c0ae 100644
 F> --- a/package/Config.in
 F> +++ b/package/Config.in
 F> @@ -358,6 +358,7 @@ source "package/python-nfc/Config.in"
 F>  source "package/python-protobuf/Config.in"
 F>  source "package/python-pygame/Config.in"
 F>  source "package/python-pyparsing/Config.in"
 F> +source "package/python-pyro/Config.in"
 F>  source "package/python-serial/Config.in"
 F>  source "package/python-setuptools/Config.in"
 F>  source "package/python-thrift/Config.in"
 F> diff --git a/package/python-pyro/Config.in b/package/python-pyro/Config.in
 F> new file mode 100644
 F> index 0000000..60a3b22
 F> --- /dev/null
 F> +++ b/package/python-pyro/Config.in
 F> @@ -0,0 +1,9 @@
 F> +config BR2_PACKAGE_PYTHON_PYRO
 F> +	bool "python-pyro"
 F> +	depends on BR2_PACKAGE_PYTHON
 F> +	help
 F> +	  python-pyro is a Python library stands for PYthon Remote Objects.
 F> +	  It is an advanced and powerful Distributed Object Technology system
 F> +	  written entirely in Python, that is designed to be very easy to use..
 F> +
 F> +	  https://pypi.python.org/pypi/Pyro/3.14

I dropped the 3.14 here so it doesn't get out of sync when/if we ever
upgrade.

 F> +++ b/package/python-pyro/python-pyro.mk
 F> @@ -0,0 +1,18 @@
 F> +################################################################################
 F> +#
 F> +# python-pyro
 F> +#
 F> +################################################################################
 F> +
 F> +PYTHON_PYRO_VERSION = 3.14
 F> +PYTHON_PYRO_SOURCE  = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
 F> +PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro/
 F> +PYTHON_PYRO_LICENSE = MIT
 F> +PYTHON_PYRO_LICENSE_FILE = LICENSE

The variable is called _LICENSE_FILES

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
