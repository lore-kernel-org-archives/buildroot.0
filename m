From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 5 Feb 2016 20:32:53 +0100
Subject: [Buildroot] [PATCH v3 14/17] python-wsaccel: new package
In-Reply-To: <1454696337-9692-15-git-send-email-mc5686@mclink.it>
References: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
 <1454696337-9692-15-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_ktZmNsOAoOUSPvQjTrhT-16KN37nTvJYn7k_X18wxi91g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 5, 2016 at 7:18 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                          |  1 +
>  package/python-wsaccel/Config.in           |  7 +++++++
>  package/python-wsaccel/python-wsaccel.hash |  3 +++
>  package/python-wsaccel/python-wsaccel.mk   | 13 +++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 package/python-wsaccel/Config.in
>  create mode 100644 package/python-wsaccel/python-wsaccel.hash
>  create mode 100644 package/python-wsaccel/python-wsaccel.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e3e621e..ef0ce7b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -733,6 +733,7 @@ menu "External python modules"
>         source "package/python-webpy/Config.in"
>         source "package/python-werkzeug/Config.in"
>         source "package/python-ws4py/Config.in"
> +       source "package/python-wsaccel/Config.in"
>         source "package/python-zope-interface/Config.in"
>  endmenu
>  endif
> diff --git a/package/python-wsaccel/Config.in b/package/python-wsaccel/Config.in
> new file mode 100644
> index 0000000..19090e8
> --- /dev/null
> +++ b/package/python-wsaccel/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_WSACCEL
> +       bool "python-wsaccel"
> +       depends on BR2_PACKAGE_PYTHON

Package is Python 3 compatible.

> +       help
> +         Accelerator for ws4py and AutobahnPython.
> +
> +         https://pypi.python.org/pypi/wsaccel
> diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
> new file mode 100644
> index 0000000..a02b5a8
> --- /dev/null
> +++ b/package/python-wsaccel/python-wsaccel.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2b4ea3d6847855c0587d37fca9db0557, sha256 locally computed.
> +md5    2b4ea3d6847855c0587d37fca9db0557  wsaccel-0.6.2.tar.gz
> +sha256 425706acf0724d2f6bfa391ec37b4ef121d3432c956029de3cea4e101c218e0c  wsaccel-0.6.2.tar.gz
> diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
> new file mode 100644
> index 0000000..869aaa5
> --- /dev/null
> +++ b/package/python-wsaccel/python-wsaccel.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-wsaccel
> +#
> +################################################################################
> +
> +PYTHON_WSACCEL_VERSION = 0.6.2
> +PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
> +PYTHON_WSACCEL_SITE = http://pypi.python.org/packages/source/w/wsaccel
> +PYTHON_WSACCEL_LICENSE = Apache

Apache-2.0

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> +PYTHON_WSACCEL_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
