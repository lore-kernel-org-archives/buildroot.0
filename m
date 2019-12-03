From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Dec 2019 00:04:20 +0100
Subject: [Buildroot] [Next] package/python-wsgiref: new package
In-Reply-To: <20191113224429.30980-1-matthew.weber@rockwellcollins.com>
References: <20191113224429.30980-1-matthew.weber@rockwellcollins.com>
Message-ID: <0461df46-1b9b-baa1-4323-91e54d95c149@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/11/2019 23:44, Matt Weber wrote:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 wsgiref has been in the Python standard library since Python 3.3 (and Python
2.something as well, but I didn't find which one exactly). So this patch is not
needed.

 Marked as Rejected.

 Regards,
 Arnout

> ---
>  package/Config.in                          |  1 +
>  package/python-wsgiref/Config.in           |  6 ++++++
>  package/python-wsgiref/python-wsgiref.hash |  3 +++
>  package/python-wsgiref/python-wsgiref.mk   | 18 ++++++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-wsgiref/Config.in
>  create mode 100644 package/python-wsgiref/python-wsgiref.hash
>  create mode 100644 package/python-wsgiref/python-wsgiref.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e87b5a57d7..c150ee2473 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1133,6 +1133,7 @@ menu "External python modules"
>  	source "package/python-wrapt/Config.in"
>  	source "package/python-ws4py/Config.in"
>  	source "package/python-wsaccel/Config.in"
> +	source "package/python-wsgiref/Config.in"
>  	source "package/python-wtforms/Config.in"
>  	source "package/python-xlib/Config.in"
>  	source "package/python-xlrd/Config.in"
> diff --git a/package/python-wsgiref/Config.in b/package/python-wsgiref/Config.in
> new file mode 100644
> index 0000000000..2fde92cab0
> --- /dev/null
> +++ b/package/python-wsgiref/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_WSGIREF
> +	bool "python-wsgiref"
> +	help
> +	  WSGI (PEP 333) Reference Library.
> +
> +	  http://cheeseshop.python.org/pypi/wsgiref
> diff --git a/package/python-wsgiref/python-wsgiref.hash b/package/python-wsgiref/python-wsgiref.hash
> new file mode 100644
> index 0000000000..0c9a4fecd8
> --- /dev/null
> +++ b/package/python-wsgiref/python-wsgiref.hash
> @@ -0,0 +1,3 @@
> +# md5, sha256 from https://pypi.org/pypi/wsgiref/json
> +md5	29b146e6ebd0f9fb119fe321f7bcf6cb  wsgiref-0.1.2.zip
> +sha256	c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349e57c1f7cabf40e79  wsgiref-0.1.2.zip
> diff --git a/package/python-wsgiref/python-wsgiref.mk b/package/python-wsgiref/python-wsgiref.mk
> new file mode 100644
> index 0000000000..e30f4c6a31
> --- /dev/null
> +++ b/package/python-wsgiref/python-wsgiref.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# python-wsgiref
> +#
> +################################################################################
> +
> +PYTHON_WSGIREF_VERSION = 0.1.2
> +PYTHON_WSGIREF_SOURCE = wsgiref-$(PYTHON_WSGIREF_VERSION).zip
> +PYTHON_WSGIREF_SITE = https://files.pythonhosted.org/packages/41/9e/309259ce8dff8c596e8c26df86dbc4e848b9249fd36797fd60be456f03fc
> +PYTHON_WSGIREF_SETUP_TYPE = setuptools
> +PYTHON_WSGIREF_LICENSE = PSF or ZPL
> +
> +define PYTHON_WSGIREF_EXTRACT_CMDS
> +	$(UNZIP) -d $(@D) $(PYTHON_WSGIREF_DL_DIR)/$(PYTHON_WSGIREF_SOURCE)
> +	mv $(@D)/wsgiref-$(PYTHON_WSGIREF_VERSION)/* $(@D)/
> +endef
> +
> +$(eval $(python-package))
> 
