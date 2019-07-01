From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Jul 2019 09:04:52 +0200
Subject: [Buildroot] [PATCH 2/3] package/python-jailhouse: new package
In-Reply-To: <20190621102339.22286-3-ccaione@baylibre.com>
References: <20190621102339.22286-1-ccaione@baylibre.com>
 <20190621102339.22286-3-ccaione@baylibre.com>
Message-ID: <CAGm1_ksmPzx5er=tNPF2oXWJk0W_r2fPoiwZ2NypTj8B_==ajg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlo,

On Fri, Jun 21, 2019 at 12:25 PM Carlo Caione <ccaione@baylibre.com> wrote:
>
> Add the Python interface for the Jailhouse Hypervisor.
>
> https://github.com/siemens/jailhouse
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  package/Config.in                            |  1 +
>  package/python-jailhouse/Config.in           |  7 +++++++
>  package/python-jailhouse/python-jailhouse.mk | 14 ++++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/python-jailhouse/Config.in
>  create mode 100644 package/python-jailhouse/python-jailhouse.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 8b6a9322e4..6c6e35f919 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -917,6 +917,7 @@ menu "External python modules"
>         source "package/python-ipython-genutils/Config.in"
>         source "package/python-iso8601/Config.in"
>         source "package/python-itsdangerous/Config.in"
> +       source "package/python-jailhouse/Config.in"
>         source "package/python-jaraco-classes/Config.in"
>         source "package/python-jedi/Config.in"
>         source "package/python-jinja2/Config.in"
> diff --git a/package/python-jailhouse/Config.in b/package/python-jailhouse/Config.in
> new file mode 100644
> index 0000000000..744169dc33
> --- /dev/null
> +++ b/package/python-jailhouse/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_JAILHOUSE
> +       bool "python-jailhouse"
> +       depends on BR2_PACKAGE_PYTHON
> +       help
> +         A Python interface for the Jailhouse Hypervisor.
> +
> +         https://github.com/siemens/jailhouse
> diff --git a/package/python-jailhouse/python-jailhouse.mk b/package/python-jailhouse/python-jailhouse.mk
> new file mode 100644
> index 0000000000..9a07531315
> --- /dev/null
> +++ b/package/python-jailhouse/python-jailhouse.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-jailhouse
> +#
> +################################################################################
> +
> +PYTHON_JAILHOUSE_VERSION = 0.10
> +PYTHON_JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
> +PYTHON_JAILHOUSE_LICENSE = GPL-2.0
> +PYTHON_JAILHOUSE_LICENSE_FILES = COPYING
> +
> +PYTHON_JAILHOUSE_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))

Does python-jailhouse depend on jailhouse at run-time? I would just
make one package jailhouse and compile python-jailhouse if either
Python2 or Python3 is selected. So instead of 3 patches you can make
just one.

Yegor
