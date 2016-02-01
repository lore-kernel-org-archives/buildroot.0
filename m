From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 16:02:34 +0100
Subject: [Buildroot] [PATCH 04/22] package/python-click: new package.
In-Reply-To: <1454335541-14224-5-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-5-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kstst0gHkZTC=+wTWNLDY30EGJYXK9K-M_AmGu9a-1Rhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                      |  1 +
>  package/python-click/Config.in         |  8 ++++++++
>  package/python-click/python-click.hash |  3 +++
>  package/python-click/python-click.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-click/Config.in
>  create mode 100644 package/python-click/python-click.hash
>  create mode 100644 package/python-click/python-click.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 2a2100a..3980c00 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -627,6 +627,7 @@ menu "External python modules"
>         source "package/python-characteristic/Config.in"
>         source "package/python-cheetah/Config.in"
>         source "package/python-cherrypy/Config.in"
> +       source "package/python-click/Config.in"
>         source "package/python-coherence/Config.in"
>         source "package/python-configobj/Config.in"
>         source "package/python-configshell-fb/Config.in"
> diff --git a/package/python-click/Config.in b/package/python-click/Config.in
> new file mode 100644
> index 0000000..54eb584
> --- /dev/null
> +++ b/package/python-click/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_CLICK
> +       bool "python-click"
> +       depends on BR2_PACKAGE_PYTHON

remove depends

> +       help
> +         A simple wrapper around optparse for powerful command line utilities.
> +
> +         https://pypi.python.org/pypi/click
> +
> diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
> new file mode 100644
> index 0000000..c0edb8b
> --- /dev/null
> +++ b/package/python-click/python-click.hash
> @@ -0,0 +1,3 @@
> +# Locally computed.
> +md5    83252a8095397b1f5f710fdd58b484d9  click-6.2.tar.gz
> +sha256 fba0ff70f5ebb4cebbf64c40a8fbc222fb7cf825237241e548354dabe3da6a82  click-6.2.tar.gz
> diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
> new file mode 100644
> index 0000000..7bc5450
> --- /dev/null
> +++ b/package/python-click/python-click.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-click
> +#
> +################################################################################
> +
> +PYTHON_CLICK_VERSION = 6.2
> +PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
> +PYTHON_CLICK_SITE = http://pypi.python.org/packages/source/c/click
> +PYTHON_CLICK_LICENSE = BSD
> +#PYTHON_CLICK_LICENSE_FILES = LICENSE
> +PYTHON_CLICK_SETUP_TYPE = setuptools
> +#PYTHON_CLICK_DEPENDENCIES =
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
