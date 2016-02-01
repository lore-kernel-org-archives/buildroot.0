From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 16:16:38 +0100
Subject: [Buildroot] [PATCH 07/22] package/python-netaddr: new package.
In-Reply-To: <1454335541-14224-8-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-8-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kvM0G5v9ExjmTw6o6=fRtwXW6c=q4WmxePeNR-PiRy-GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                          |  1 +
>  package/python-netaddr/Config.in           |  8 ++++++++
>  package/python-netaddr/python-netaddr.hash |  3 +++
>  package/python-netaddr/python-netaddr.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-netaddr/Config.in
>  create mode 100644 package/python-netaddr/python-netaddr.hash
>  create mode 100644 package/python-netaddr/python-netaddr.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index dd82ab3..80b4868 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -666,6 +666,7 @@ menu "External python modules"
>         source "package/python-meld3/Config.in"
>         source "package/python-mistune/Config.in"
>         source "package/python-msgpack/Config.in"
> +       source "package/python-netaddr/Config.in"
>         source "package/python-netifaces/Config.in"
>         source "package/python-networkmanager/Config.in"
>         source "package/python-nfc/Config.in"
> diff --git a/package/python-netaddr/Config.in b/package/python-netaddr/Config.in
> new file mode 100644
> index 0000000..b60aa28
> --- /dev/null
> +++ b/package/python-netaddr/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_NETADDR
> +       bool "python-netaddr"
> +       depends on BR2_PACKAGE_PYTHON

remove depends

> +       help
> +         A network address manipulation library for Python.
> +
> +         https://pypi.python.org/pypi/netaddr
> +
> diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
> new file mode 100644
> index 0000000..d2e1c91
> --- /dev/null
> +++ b/package/python-netaddr/python-netaddr.hash
> @@ -0,0 +1,3 @@
> +# Locally computed.
> +md5    c65bb34f8bedfbbca0b316c490cd13a0  netaddr-0.7.18.tar.gz
> +sha256 a1f5c9fcf75ac2579b9995c843dade33009543c04f218ff7c007b3c81695bd19  netaddr-0.7.18.tar.gz
> diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
> new file mode 100644
> index 0000000..1b4588a
> --- /dev/null
> +++ b/package/python-netaddr/python-netaddr.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-netaddr
> +#
> +################################################################################
> +
> +PYTHON_NETADDR_VERSION = 0.7.18
> +PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
> +PYTHON_NETADDR_SITE = http://pypi.python.org/packages/source/n/netaddr
> +PYTHON_NETADDR_LICENSE = BSD
> +#PYTHON_NETADDR_LICENSE_FILES = LICENSE
> +PYTHON_NETADDR_SETUP_TYPE = distutils
> +#PYTHON_NETADDR_DEPENDENCIES =
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
