From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 22:21:44 +0100
Subject: [Buildroot] [PATCH v4 05/17] python-pynacl: new package
In-Reply-To: <1454799603-5474-6-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
 <1454799603-5474-6-git-send-email-mc5686@mclink.it>
Message-ID: <20160219222144.3e9e3402@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Sat,  6 Feb 2016 23:59:51 +0100, Mauro Condarelli wrote:

> diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
> new file mode 100644
> index 0000000..5a53648
> --- /dev/null
> +++ b/package/python-pynacl/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_PYNACL
> +	bool "python-pynacl"
> +	select BR2_PACKAGE_LIBSODIUM
> +	select BR2_PACKAGE_PYTHON_SIX # runtime

So python-six is a runtime dependency only...

> diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
> new file mode 100644
> index 0000000..e82611e
> --- /dev/null
> +++ b/package/python-pynacl/python-pynacl.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# python-pynacl
> +#
> +################################################################################
> +
> +PYTHON_PYNACL_VERSION = 1.0.1
> +PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
> +PYTHON_PYNACL_SITE = http://pypi.python.org/packages/source/P/PyNaCl
> +PYTHON_PYNACL_LICENSE = Apache-2.0
> +PYTHON_PYNACL_LICENSE_FILES = LICENSE
> +PYTHON_PYNACL_SETUP_TYPE = setuptools
> +PYTHON_PYNACL_DEPENDENCIES = libsodium python-six

... but it is listed in PYTHON_PYNACL_DEPENDENCIES.

This is not consistent. Either the Config.in is wrong, or the .mk is
wrong.

Could you double check this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
