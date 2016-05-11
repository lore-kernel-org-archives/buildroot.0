From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 11 May 2016 16:56:50 +0200
Subject: [Buildroot] [PATCH 1/2] python-flask-jsonrpc: new package
In-Reply-To: <1462975669-18032-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1462975669-18032-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <CAGm1_kt-cUJPEU6yv-k3bkz0GxJ5p5ctKoyUW_x2kiuEnafpPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?bastien,

On Wed, May 11, 2016 at 4:07 PM, S?bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/Config.in                                      |  1 +
>  package/python-flask-jsonrpc/Config.in                 |  7 +++++++
>  package/python-flask-jsonrpc/python-flask-jsonrpc.hash |  3 +++
>  package/python-flask-jsonrpc/python-flask-jsonrpc.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-flask-jsonrpc/Config.in
>  create mode 100644 package/python-flask-jsonrpc/python-flask-jsonrpc.hash
>  create mode 100644 package/python-flask-jsonrpc/python-flask-jsonrpc.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 9d668bf..804df8b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -658,6 +658,7 @@ menu "External python modules"
>         source "package/python-enum/Config.in"
>         source "package/python-enum34/Config.in"
>         source "package/python-flask/Config.in"
> +       source "package/python-flask-jsonrpc/Config.in"
>         source "package/python-flup/Config.in"
>         source "package/python-gobject/Config.in"
>         source "package/python-html5lib/Config.in"
> diff --git a/package/python-flask-jsonrpc/Config.in b/package/python-flask-jsonrpc/Config.in
> new file mode 100644
> index 0000000..2100d10
> --- /dev/null
> +++ b/package/python-flask-jsonrpc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_FLASK_JSONRPC
> +       bool "python-flask-jsonrpc"
> +       select BR2_PACKAGE_PYTHON_FLASK
> +       help
> +         A basic JSON-RPC implementation for your Flask-powered sites.
> +
> +         https://github.com/cenobites/flask-jsonrpc
> diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
> new file mode 100644
> index 0000000..8b91af7
> --- /dev/null
> +++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi/Flask-JSONRPC/0.3, sha256 locally computed:
> +md5    a5beca4c3a882315f9b81acb57e83c68                                 Flask-JSONRPC-0.3.tar.gz
> +sha256 5baf70bf9cf955e95c02316982026a122b89a5f4c78c5b26f9f476abdb3e13bc Flask-JSONRPC-0.3.tar.gz
> diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
> new file mode 100644
> index 0000000..6d188ee
> --- /dev/null
> +++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-flask-jsonrpc
> +#
> +################################################################################
> +
> +PYTHON_FLASK_JSONRPC_VERSION = 0.3
> +PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
> +PYTHON_FLASK_JSONRPC_SITE = http://pypi.python.org/packages/source/F/Flask-JSONRPC
> +PYTHON_FLASK_JSONRPC_LICENSE = BSD-3c

Could you ask the project maintainer to add
https://github.com/cenobites/flask-jsonrpc/blob/master/COPYING to the
release tar.gz?

> +PYTHON_FLASK_JSONRPC_DEPENDENCIES = python-flask

Remove this dependency as it is a run-time dependency

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> +PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.3.6
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
