From: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@freescale.com>
Date: Fri, 12 Jun 2015 18:09:59 +0200
Subject: [Buildroot] [PATCH 2/3] python-robotframework: New package
In-Reply-To: <1433170569-15031-3-git-send-email-denis.thulin@openwide.fr>
Message-ID: <20150612160958.GA12107@laptop-vstehle>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Denis THULIN wrote:
> A generic test automation framework written in python.

Hi Denis,

Thank you for this robotframework package, here are a few remarks.

..
> diff --git a/package/python-robotframework/Config.in
> b/package/python-robotframework/Config.in
> new file mode 100644
> index 0000000..a3d5ea8
> --- /dev/null
> +++ b/package/python-robotframework/Config.in
>  <at>  <at>  -0,0 +1,9  <at>  <at> 
> +config BR2_PACKAGE_PYTHON_ROBOTFRAMEWORK
> +	depends on BR2_PACKAGE_PYTHON
> +    select BR2_PACKAGE_PYTHON_ZLIB
> +    select BR2_PACKAGE_PYTHON_PYEXPAT
   ^^^

I think the previous two lines have an indentation issue.

> +	bool "python-robotframework"
> +	help
> +	  A generic test automation framework
> +	  
> +	  http://robotframework.org
..
> diff --git a/package/python-robotframework/python-robotframework.mk
> b/package/python-robotframework/python-robotframework.mk
> new file mode 100644
> index 0000000..6fc7619
> --- /dev/null
> +++ b/package/python-robotframework/python-robotframework.mk
>  <at>  <at>  -0,0 +1,14  <at>  <at> 
> +################################################################################
> +#
> +# package/python-robotframework

Shouldn't that rather be just 'python-robotframework', with no
'package/'?

> +#
> +################################################################################
> +
> +PYTHON_ROBOTFRAMEWORK_VERSION = 2.9a1
> +PYTHON_ROBOTFRAMEWORK_SOURCE =
> robotframework-$(PYTHON_ROBOTFRAMEWORK_VERSION).tar.gz
> +PYTHON_ROBOTFRAMEWORK_SITE = https://pypi.python.org/packages/source/r/robotframework/
> +PYTHON_ROBOTFRAMEWORK_SETUP_TYPE = distutils
> +PYTHON_ROBOTFRAMEWORK_LICENSE = Apache License 2.0
> +PYTHON_ROBOTFRAMEWORK_LICEiNSE_FILES = LICENSE.txt
                             ^
The 'i' there is a typo, I think.

> +
> +$(eval $(python-package))
> \ No newline at end of file

Maybe add a newline?

Best regards,

V.
