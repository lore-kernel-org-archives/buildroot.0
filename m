From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 15:51:30 +0100
Subject: [Buildroot] [PATCH 17/22] package/python-msgpack-python: new
	package.
In-Reply-To: <1454335541-14224-18-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-18-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_ktk7YfTknSc85Lxds9KBCn1E-ahXdq+6gXunkGzDiezKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hu Mauro,

just rename the package to be 'python-msgpack'

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                                        |  1 +
>  package/python-msgpack-python/Config.in                  |  8 ++++++++
>  package/python-msgpack-python/python-msgpack-python.hash |  3 +++
>  package/python-msgpack-python/python-msgpack-python.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-msgpack-python/Config.in
>  create mode 100644 package/python-msgpack-python/python-msgpack-python.hash
>  create mode 100644 package/python-msgpack-python/python-msgpack-python.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 44a65d1..606dacc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -666,6 +666,7 @@ menu "External python modules"
>         source "package/python-meld3/Config.in"
>         source "package/python-mistune/Config.in"
>         source "package/python-msgpack/Config.in"
> +       source "package/python-msgpack-python/Config.in"
>         source "package/python-netaddr/Config.in"
>         source "package/python-netifaces/Config.in"
>         source "package/python-networkmanager/Config.in"
> diff --git a/package/python-msgpack-python/Config.in b/package/python-msgpack-python/Config.in
> new file mode 100644
> index 0000000..d101cee
> --- /dev/null
> +++ b/package/python-msgpack-python/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_MSGPACK_PYTHON
> +       bool "python-msgpack_python"
> +       depends on BR2_PACKAGE_PYTHON

remove depends line

> +       help
> +         MessagePack (de)serializer.
> +
> +         https://pypi.python.org/pypi/msgpack-python
> +
> diff --git a/package/python-msgpack-python/python-msgpack-python.hash b/package/python-msgpack-python/python-msgpack-python.hash
> new file mode 100644
> index 0000000..77b8490
> --- /dev/null
> +++ b/package/python-msgpack-python/python-msgpack-python.hash
> @@ -0,0 +1,3 @@
> +# Locally computed.
> +md5    eb2aad1081534ef3a9f32a0ecd350b9b  msgpack-python-0.4.7.tar.gz
> +sha256 5e001229a54180a02dcdd59db23c9978351af55b1290c27bc549e381f43acd6b  msgpack-python-0.4.7.tar.gz
> diff --git a/package/python-msgpack-python/python-msgpack-python.mk b/package/python-msgpack-python/python-msgpack-python.mk
> new file mode 100644
> index 0000000..c05b1c5
> --- /dev/null
> +++ b/package/python-msgpack-python/python-msgpack-python.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-msgpack-python
> +#
> +################################################################################
> +
> +PYTHON_MSGPACK_PYTHON_VERSION = 0.4.7
> +PYTHON_MSGPACK_PYTHON_SOURCE = msgpack-python-$(PYTHON_MSGPACK_PYTHON_VERSION).tar.gz
> +PYTHON_MSGPACK_PYTHON_SITE = http://pypi.python.org/packages/source/m/msgpack-python
> +PYTHON_MSGPACK_PYTHON_LICENSE = Apache
> +#PYTHON_MSGPACK_PYTHON_LICENSE_FILES = LICENSE
> +PYTHON_MSGPACK_PYTHON_SETUP_TYPE = setuptools
> +#PYTHON_MSGPACK_PYTHON_DEPENDENCIES =
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
