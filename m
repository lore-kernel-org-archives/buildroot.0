From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 21:32:08 +0100
Subject: [Buildroot] [PATCH 1/2] package: add python-raven
In-Reply-To: <20171102163419.24155-1-joseph.kogut@gmail.com>
References: <20171102163419.24155-1-joseph.kogut@gmail.com>
Message-ID: <20171102213208.4d4236aa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new contribution! Looks pretty good, just a few minor
nits or questions.

First, the title of the commit should be:

	python-raven: new package

(We like to have consistent naming for commit titles, as it allows to
more easily grep through the Git history).

On Thu,  2 Nov 2017 09:34:18 -0700, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/Config.in                      |  1 +
>  package/python-raven/Config.in         |  6 ++++++
>  package/python-raven/python-raven.hash |  3 +++
>  package/python-raven/python-raven.mk   | 14 ++++++++++++++
>  4 files changed, 24 insertions(+)

Please include the change to the DEVELOPERS file in the same patch, no
need to make it a separate patch.

> diff --git a/package/python-raven/Config.in b/package/python-raven/Config.in
> new file mode 100644
> index 0000000000..1fbd1d8c03
> --- /dev/null
> +++ b/package/python-raven/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_RAVEN
> +	bool "python-raven"

It really doesn't have *any* runtime dependency on other Python
modules? I.e if you build just python-raven and the minimal python
interpreter, it works?

I.e, if you build:

BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_RAVEN=y

does it build and run on the target?

> +PYTHON_RAVEN_VERSION = 6.2.1

There is a 6.3.0 version available, any reason not to use this one ?

> +PYTHON_RAVEN_SOURCE = raven-$(PYTHON_RAVEN_VERSION).tar.gz
> +PYTHON_RAVEN_SITE = https://pypi.python.org/packages/c1/97/38e74c7521737c965281b43440b274955e211b1d5319c256d8525d9d2cad
> +PYTHON_RAVEN_SETUP_TYPE = setuptools
> +PYTHON_RAVEN_LICENSE = BSD-3-Clause
> +PYTHON_RAVEN_LICENSE_FILES = LICENSE

Other than that looks good. Could you respin an updated version that
takes into account those comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
