From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Jul 2013 00:17:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyro: adding Pyro 3.14
In-Reply-To: <1374133806-9162-2-git-send-email-fabien.marteau@armadeus.com>
 (Fabien Marteau's message of "Thu, 18 Jul 2013 09:50:06 +0200")
References: <1374133806-9162-1-git-send-email-fabien.marteau@armadeus.com>
 <1374133806-9162-2-git-send-email-fabien.marteau@armadeus.com>
Message-ID: <87hafnr21m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabien" == Fabien Marteau <fabien.marteau@armadeus.com> writes:

 Fabien> Signed-off-by: Fabien Marteau <fabien.marteau@armadeus.com>
 Fabien> ---
 Fabien>  package/python-pyro/Config.in      |    9 +++++++++
 Fabien>  package/python-pyro/python-pyro.mk |   17 +++++++++++++++++
 Fabien>  2 files changed, 26 insertions(+)
 Fabien>  create mode 100644 package/python-pyro/Config.in
 Fabien>  create mode 100644 package/python-pyro/python-pyro.mk

You seem to have forgotten to add it to package/Config.in, so it cannot
be used.

 Fabien> diff --git a/package/python-pyro/Config.in b/package/python-pyro/Config.in
 Fabien> new file mode 100644
 Fabien> index 0000000..b744c1c
 Fabien> --- /dev/null
 Fabien> +++ b/package/python-pyro/Config.in
 Fabien> @@ -0,0 +1,9 @@
 Fabien> +config BR2_PACKAGE_PYTHON_PYRO
 Fabien> +	bool "python-pyro"
 Fabien> +	depends on BR2_PACKAGE_PYTHON
 Fabien> +	help
 Fabien> +	  python-pyro is a Python library stands for PYthon Remote Objects.
 Fabien> +		It is an advanced and powerful Distributed Object Technology system
 Fabien> +		written entirely in Python, that is designed to be very easy to use..

Indentation of line 2/3 of the help text wrong (should be <tab><space><space>)

 Fabien> +++ b/package/python-pyro/python-pyro.mk
 Fabien> @@ -0,0 +1,17 @@
 Fabien> +#############################################################
 Fabien> +#
 Fabien> +# python-pyro
 Fabien> +#
 Fabien> +#############################################################

Minor nit: the #### lines should be 80 chars.

 Fabien> +
 Fabien> +PYTHON_PYRO_VERSION = 3.14
 Fabien> +PYTHON_PYRO_SOURCE  = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
 Fabien> +PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro/

Please add LICENSE / LICENSE_FILES tags

Otherwise it looks good. Care to fix this issues and resend?

-- 
Bye, Peter Korsgaard
