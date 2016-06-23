From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Jun 2016 22:56:55 +0200
Subject: [Buildroot] [PATCH v2 1/3] python-xlrd: new package
In-Reply-To: <1466673311-15845-1-git-send-email-yegorslists@googlemail.com>
References: <1466673311-15845-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <66d1d741-7ea9-d671-3163-701f6a0448de@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23-06-16 11:15, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                    |  1 +
>  package/python-xlrd/Config.in        | 11 +++++++++++
>  package/python-xlrd/python-xlrd.hash |  4 ++++
>  package/python-xlrd/python-xlrd.mk   | 14 ++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/python-xlrd/Config.in
>  create mode 100644 package/python-xlrd/python-xlrd.hash
>  create mode 100644 package/python-xlrd/python-xlrd.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a2a02a8..e5ddc3e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -776,6 +776,7 @@ menu "External python modules"
>  	source "package/python-werkzeug/Config.in"
>  	source "package/python-ws4py/Config.in"
>  	source "package/python-wsaccel/Config.in"
> +	source "package/python-xlrd/Config.in"
>  	source "package/python-xlsxwriter/Config.in"
>  	source "package/python-zope-interface/Config.in"
>  endmenu
> diff --git a/package/python-xlrd/Config.in b/package/python-xlrd/Config.in
> new file mode 100644
> index 0000000..81331f9
> --- /dev/null
> +++ b/package/python-xlrd/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_XLRD
> +	bool "python-xlrd"
> +	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
> +	help
> +	  Library for developers to extract data from Microsoft Excel (tm)
> +	  spreadsheet files.

 I think it would be better to specify explicitly which Excel versions are
supported. It's all of them, but still, better to be explicit about it.

> +
> +	  http://www.python-excel.org/
> diff --git a/package/python-xlrd/python-xlrd.hash b/package/python-xlrd/python-xlrd.hash
> new file mode 100644
> index 0000000..8075605
> --- /dev/null
> +++ b/package/python-xlrd/python-xlrd.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/xlrd/json
> +md5	9a91b688cd4945477ac28187a54f9a3b  xlrd-1.0.0.tar.gz
> +# sha256 calculated by scanpypi
> +sha256	0ff87dd5d50425084f7219cb6f86bb3eb5aa29063f53d50bf270ed007e941069  xlrd-1.0.0.tar.gz
> diff --git a/package/python-xlrd/python-xlrd.mk b/package/python-xlrd/python-xlrd.mk
> new file mode 100644
> index 0000000..a31657a
> --- /dev/null
> +++ b/package/python-xlrd/python-xlrd.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-xlrd
> +#
> +################################################################################
> +
> +PYTHON_XLRD_VERSION = 1.0.0
> +PYTHON_XLRD_SOURCE = xlrd-$(PYTHON_XLRD_VERSION).tar.gz
> +PYTHON_XLRD_SITE = https://pypi.python.org/packages/42/85/25caf967c2d496067489e0bb32df069a8361e1fd96a7e9f35408e56b3aab
> +PYTHON_XLRD_SETUP_TYPE = setuptools
> +PYTHON_XLRD_LICENSE = BSD-3c, BSD-4c

 Even though licenses.py specifies BSD-4c, the actual source code doesn't. In
fact, several files explicitly mention that they are not derived from Giffin's
code. So I would say: just keep BSD-3c. licenses.py still contains the -4c so an
attentive legal department will still do vetting on their own.

 Regards,
 Arnout

> +PYTHON_XLRD_LICENSE_FILES = xlrd/licences.py
> +
> +$(eval $(python-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
