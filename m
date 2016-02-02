From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 2 Feb 2016 10:11:34 +0100
Subject: [Buildroot] [PATCH 14/19] python-treq: new package
In-Reply-To: <1454373899-22481-15-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
 <1454373899-22481-15-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kv2c6PmnGLuLfVbJzZ13jFFfOmxc2On+-xLUizPCxUyMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 2, 2016 at 1:44 AM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                    |  1 +
>  package/python-treq/Config.in        | 11 +++++++++++
>  package/python-treq/python-treq.hash |  3 +++
>  package/python-treq/python-treq.mk   | 15 +++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/python-treq/Config.in
>  create mode 100644 package/python-treq/python-treq.hash
>  create mode 100644 package/python-treq/python-treq.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 0d91863..56a56a8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -719,6 +719,7 @@ menu "External python modules"
>         source "package/python-spidev/Config.in"
>         source "package/python-thrift/Config.in"
>         source "package/python-tornado/Config.in"
> +       source "package/python-treq/Config.in"
>         source "package/python-twisted/Config.in"
>         source "package/python-urllib3/Config.in"
>         source "package/python-urwid/Config.in"
> diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
> new file mode 100644
> index 0000000..32d1ecf
> --- /dev/null
> +++ b/package/python-treq/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_TREQ
> +       bool "python-treq"
> +       select BR2_PACKAGE_PYTHON_REQUESTS
> +       select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
> +       select BR2_PACKAGE_PYTHON_SIX
> +       select BR2_PACKAGE_PYTHON_TWISTED

add "# runtime" comment to all this packages

> +       help
> +         treq is an HTTP library inspired by requests but written on top of Twisted's Agents.
> +         It provides a simple, higher level API for making HTTP requests when using Twisted.
> +
> +         https://github.com/twisted/treq
> diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
> new file mode 100644
> index 0000000..f4cc4d6
> --- /dev/null
> +++ b/package/python-treq/python-treq.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b1fb60759ad5a885cb8ea562553f2d4c, sha256 locally computed
> +md5    b1fb60759ad5a885cb8ea562553f2d4c  treq-15.1.0.tar.gz
> +sha256 425a47d5d52a993d51211028fb6ade252e5fbea094e878bb4b644096a7322de8  treq-15.1.0.tar.gz
> diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
> new file mode 100644
> index 0000000..cea9f59
> --- /dev/null
> +++ b/package/python-treq/python-treq.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-treq
> +#
> +################################################################################
> +
> +PYTHON_TREQ_VERSION = 15.1.0
> +PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
> +PYTHON_TREQ_SITE = http://pypi.python.org/packages/source/t/treq
> +PYTHON_TREQ_LICENSE = MIT
> +PYTHON_TREQ_LICENSE_FILES = LICENSE
> +PYTHON_TREQ_SETUP_TYPE = setuptools
> +PYTHON_TREQ_DEPENDENCIES = python-requests python-service-identity python-six python-twisted

all these packages are run-time dependencies, so remove this line completely

> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
