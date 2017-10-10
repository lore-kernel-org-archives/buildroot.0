From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 23:39:36 +0200
Subject: [Buildroot] [PATCH] python-zeep: new package
In-Reply-To: <20170913095850.10710-1-jaap@jcz.nl>
References: <20170913095850.10710-1-jaap@jcz.nl>
Message-ID: <20171010233936.234d721e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Sep 2017 11:58:50 +0200, Jaap Crezee wrote:


> ---
>  package/Config.in                    |  1 +
>  package/python-zeep/Config.in        | 15 +++++++++++++++
>  package/python-zeep/python-zeep.hash |  3 +++
>  package/python-zeep/python-zeep.mk   | 14 ++++++++++++++
>  4 files changed, 33 insertions(+)


>  create mode 100644 package/python-zeep/Config.in
>  create mode 100644 package/python-zeep/python-zeep.hash
>  create mode 100644 package/python-zeep/python-zeep.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 905894fe28..fc39e64c64 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -886,6 +886,7 @@ menu "External python modules"
>  	source "package/python-xlsxwriter/Config.in"
>  	source "package/python-xlutils/Config.in"
>  	source "package/python-xlwt/Config.in"
> +	source "package/python-zeep/Config.in"
>  	source "package/python-zope-interface/Config.in"
>  endmenu
>  endif
> diff --git a/package/python-zeep/Config.in b/package/python-zeep/Config.in
> new file mode 100644
> index 0000000000..cda5318b83
> --- /dev/null
> +++ b/package/python-zeep/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_PYTHON_ZEEP
> +	bool "python-zeep"
> +	select BR2_PACKAGE_PYTHON_APPDIRS # runtime
> +	select BR2_PACKAGE_PYTHON_CACHED_PROPERTY # runtime
> +	select BR2_PACKAGE_PYTHON_DEFUSEDXML # runtime
> +	select BR2_PACKAGE_PYTHON_ISODATE # runtime
> +	select BR2_PACKAGE_PYTHON_LXML # runtime
> +	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
> +	select BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT # runtime
> +	select BR2_PACKAGE_PYTHON_SIX # runtime
> +	select BR2_PACKAGE_PYTHON_PYTZ # runtime
> +	help
> +	  A modern/fast Python SOAP client based on lxml / requests.
> +
> +	  http://docs.python-zeep.org
> diff --git a/package/python-zeep/python-zeep.hash b/package/python-zeep/python-zeep.hash
> new file mode 100644
> index 0000000000..130d45c715
> --- /dev/null
> +++ b/package/python-zeep/python-zeep.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi/zeep/json, sha256 locally computed
> +md5	126d8d94752a4cb369498056337c3e74  zeep-2.4.0.tar.gz
> +sha256	8631e2735c5f2219eb18ca4f0615ae482455628518508f69c3690dbfb8238aee  zeep-2.4.0.tar.gz
> diff --git a/package/python-zeep/python-zeep.mk b/package/python-zeep/python-zeep.mk
> new file mode 100644
> index 0000000000..52b32a236a
> --- /dev/null
> +++ b/package/python-zeep/python-zeep.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-zeep
> +#
> +################################################################################
> +
> +PYTHON_ZEEP_VERSION = 2.4.0
> +PYTHON_ZEEP_SOURCE = zeep-$(PYTHON_ZEEP_VERSION).tar.gz
> +PYTHON_ZEEP_SITE = https://pypi.python.org/packages/1b/e4/8afa4ae8398aba769df7df0ad134100cb97780faa1c951afc69068c5804d
> +PYTHON_ZEEP_SETUP_TYPE = setuptools
> +PYTHON_ZEEP_LICENSE = MIT
> +PYTHON_ZEEP_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
