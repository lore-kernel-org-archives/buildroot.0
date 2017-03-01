From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 15:34:28 +0100
Subject: [Buildroot] [PATCH v2] python-pylibftdi: new package
In-Reply-To: <1488373403-30766-1-git-send-email-christian.kellermann@solectrix.de>
References: <1488201961-15539-2-git-send-email-christian.kellermann@solectrix.de>
 <1488373403-30766-1-git-send-email-christian.kellermann@solectrix.de>
Message-ID: <20170301153428.00513b95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Mar 2017 14:03:23 +0100, Christian Kellermann wrote:

>  package/Config.in                                         |  1 +
>  .../python-pylibftdi/0001-do-not-use-find-library.patch   | 14 ++++++++++++++
>  package/python-pylibftdi/Config.in                        | 11 +++++++++++
>  package/python-pylibftdi/python-libftdi.hash              |  3 +++
>  package/python-pylibftdi/python-libftdi.mk                | 15 +++++++++++++++

Please add yourself to the DEVELOPERS file for this package.

> diff --git a/package/python-pylibftdi/0001-do-not-use-find-library.patch b/package/python-pylibftdi/0001-do-not-use-find-library.patch
> new file mode 100644
> index 0000000..2f17dc6
> --- /dev/null
> +++ b/package/python-pylibftdi/0001-do-not-use-find-library.patch
> @@ -0,0 +1,14 @@
> +diff -purN pylibftdi-0.15.0.orig/pylibftdi/driver.py pylibftdi-0.15.0/pylibftdi/driver.py
> +--- pylibftdi-0.15.0.orig/pylibftdi/driver.py	2015-04-26 22:41:39.000000000 +0200
> ++++ pylibftdi-0.15.0/pylibftdi/driver.py	2017-02-27 13:08:56.502958000 +0100

I think Yegor mentioned it in his review of your previous iteration:
there must be a description of the patch here + a Signed-off-by. See
the Buildroot manual for details, and other patches in the tree. See
for
example ./package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch.

If this project is using Git as its version control system, then we
really prefer if the patch is produced by "git format-patch".

> diff --git a/package/python-pylibftdi/Config.in b/package/python-pylibftdi/Config.in
> new file mode 100644
> index 0000000..2ab066c
> --- /dev/null
> +++ b/package/python-pylibftdi/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_PYLIBFTDI
> +	bool "python-pylibftdi"
> +	select BR2_PACKAGE_LIBFTDI
> +        depends on BR2_TOOLCHAIN_HAS_THREADS # libusb

Indentation should be one tab.

> +	help
> +	  This package contains the python language binding libftdi.
> +
> +	  https://pypi.python.org/pypi/pylibftdi
> +
> +comment "python-pylibftdi needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

> +PYTHON_PYLIBFTDI_VERSION = 0.15.0
> +PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
> +PYTHON_PYLIBFTDI_SITE = https://pypi.python.org/packages/e5/bb/d7a86dbd7685e3866ea75d21c6c726d01706fdc0aa5dc9051ce18ae65693
> +PYTHON_PYLIBFTDI_LICENSE = MIT
> +PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
> +PYTHON_PYLIBFTDI_DEPENDENCIES =libftdi

Missing space after = sign.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
