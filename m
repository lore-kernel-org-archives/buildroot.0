From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 16:17:16 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/python-pydal: new package
In-Reply-To: <1428933447-32061-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1428933447-32061-1-git-send-email-angelo.compagnucci@gmail.com>
 <1428933447-32061-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150413161716.5cd8e3ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Mon, 13 Apr 2015 15:57:26 +0200, Angelo Compagnucci wrote:

> diff --git a/package/python-pydal/Config.in b/package/python-pydal/Config.in
> new file mode 100644
> index 0000000..eda2f77
> --- /dev/null
> +++ b/package/python-pydal/Config.in
> @@ -0,0 +1,2 @@
> +config BR2_PACKAGE_PYTHON_PYDAL
> +	bool

I understand that the source code for this package is copied into the
web2py code, so that's why it's a prompt-less package. Is it the only
way of doing things?

> diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
> new file mode 100644
> index 0000000..a88bf8b
> --- /dev/null
> +++ b/package/python-pydal/python-pydal.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-pydal
> +#
> +################################################################################
> +
> +PYTHON_PYDAL_VERSION = v15.03
> +PYTHON_PYDAL_SITE = https://github.com/web2py/pydal.git
> +PYTHON_PYDAL_SITE_METHOD = git

github function?

> +PYTHON_PYDAL_LICENSE = BSDv3

BSDv3 does not exist. You're confusing GPLv3 and BSD-3c.

> +PYTHON_PYDAL_LICENSE_FILES = LICENSE
> +
> +$(eval $(generic-package))

A comment above this to explain why we have this generic-package that
doesn't do anything.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
