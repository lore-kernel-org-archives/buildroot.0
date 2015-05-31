From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 31 May 2015 18:17:06 +0200
Subject: [Buildroot] [PATCH] package/python-can: new package
In-Reply-To: <1432890762-24842-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1432890762-24842-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <556B3402.1000309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/29/15 11:12, Angelo Compagnucci wrote:
> This patch provides controller area network support for Python.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/python-can/Config.in     |  6 ++++++
>  package/python-can/python-can.mk | 15 +++++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/python-can/Config.in
>  create mode 100644 package/python-can/python-can.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index d18343c..6661240 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -577,6 +577,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>  menu "external python modules"
>  	source "package/python-alsaaudio/Config.in"
>  	source "package/python-bottle/Config.in"
> +	source "package/python-can/Config.in"
>  	source "package/python-certifi/Config.in"
>  	source "package/python-cffi/Config.in"
>  	source "package/python-cheetah/Config.in"
> diff --git a/package/python-can/Config.in b/package/python-can/Config.in
> new file mode 100644
> index 0000000..6b4e0fa
> --- /dev/null
> +++ b/package/python-can/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_CAN
> +	bool "python-can"
> +	help
> +	  This module provides controller area network support for Python.
> +
> +	  https://bitbucket.org/hardbyte/python-can
> diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
> new file mode 100644
> index 0000000..50477a3
> --- /dev/null
> +++ b/package/python-can/python-can.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-can
> +#
> +################################################################################
> +
> +PYTHON_CAN_VERSION = ae5b6cf
> +PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can
> +PYTHON_CAN_SITE_METHOD = hg

 I generally prefer to use the normal http download method:

PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can/get/
PYTHON_CAN_SOURCE = $(PYTHON_CAN_VERSION).tar.bz2


 Regards,
 Arnout

> +PYTHON_CAN_LICENSE = GPLv3
> +PYTHON_CAN_LICENSE_FILES = LICENSE.txt
> +PYTHON_CAN_DEPENDENCIES = python
> +PYTHON_CAN_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
