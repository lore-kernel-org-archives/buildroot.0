From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 08:25:30 +0100
Subject: [Buildroot] [PATCH 4/7] croosbar moved to buildroot (2).
In-Reply-To: <1454289936-10654-5-git-send-email-mc5686@mclink.it>
References: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
 <1454289936-10654-5-git-send-email-mc5686@mclink.it>
Message-ID: <20160201082530.1ae6f132@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Mon,  1 Feb 2016 02:25:33 +0100, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/python-crossbar/Config.in          | 10 ++++++++++
>  package/python-crossbar/python-crossbar.mk | 15 +++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 package/python-crossbar/Config.in
>  create mode 100644 package/python-crossbar/python-crossbar.mk

As explained before, this patch should be merged with the previous one.
Also, the title of the commit adding new packages should always be:

	<package>: new package

So in this case, it should be:

	python-crossbar: new package

> diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
> new file mode 100644
> index 0000000..b8fae30
> --- /dev/null
> +++ b/package/python-crossbar/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_CROSSBAR
> +	bool "python-crossbar"
> +	depends on BR2_PACKAGE_PYTHON

So it only works with Python 2.x and not Python 3.x ?

> diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
> new file mode 100644
> index 0000000..8a64cda
> --- /dev/null
> +++ b/package/python-crossbar/python-crossbar.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-crossbar
> +#
> +################################################################################
> +
> +PYTHON_CROSSBAR_VERSION = 0.11.2
> +PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
> +PYTHON_CROSSBAR_SITE = http://pypi.python.org/packages/source/c/crossbar
> +PYTHON_CROSSBAR_LICENSE = AGPL2

Should be AGPLv2

> +PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
> +PYTHON_CROSSBAR_SETUP_TYPE = setuptools
> +#PYTHON_CROSSBAR_DEPENDENCIES = 

Remove this commented line here.

Also, the .hash file is missing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
