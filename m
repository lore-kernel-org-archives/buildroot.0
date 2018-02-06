From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 6 Feb 2018 14:37:47 +0100
Subject: [Buildroot] [PATCH v2 3/5] python-flask-sqlalchemy: new package
In-Reply-To: <20180206132506.30389-3-aduskett@gmail.com>
References: <20180206132506.30389-1-aduskett@gmail.com>
 <20180206132506.30389-3-aduskett@gmail.com>
Message-ID: <CAGm1_ksfEAPEDTv_F5yt_jH+cZj7OFrRSwmZ=dxgqm+i70oedA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 6, 2018 at 2:25 PM, Adam Duskett <aduskett@gmail.com> wrote:
> Flask-SQLAlchemy is a Flask microframework extension which adds support for
> the SQLAlchemy SQL toolkit/ORM.
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
> Changes v1 -> v2:
>   - Changed license to BSD-3c (yegor)
>
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  package/python-flask-sqlalchemy/Config.in                  |  9 +++++++++
>  .../python-flask-sqlalchemy/python-flask-sqlalchemy.hash   |  4 ++++
>  package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-flask-sqlalchemy/Config.in
>  create mode 100644 package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
>  create mode 100644 package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f82f33a1c0..fdc4621a7f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -51,6 +51,7 @@ F:    package/libsemanage/
>  F:     package/libsepol/
>  F:     package/nginx-naxsi/
>  F:     package/policycoreutils/
> +F:     package/python-flask-sqlalchemy/
>  F:     package/python-mutagen/
>  F:     package/python-psycopg2/
>  F:     package/python-sqlalchemy/
> diff --git a/package/Config.in b/package/Config.in
> index d250b59995..583b379bcd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -774,6 +774,7 @@ menu "External python modules"
>         source "package/python-flask-babel/Config.in"
>         source "package/python-flask-jsonrpc/Config.in"
>         source "package/python-flask-login/Config.in"
> +       source "package/python-flask-sqlalchemy/Config.in"
>         source "package/python-flup/Config.in"
>         source "package/python-futures/Config.in"
>         source "package/python-gobject/Config.in"
> diff --git a/package/python-flask-sqlalchemy/Config.in b/package/python-flask-sqlalchemy/Config.in
> new file mode 100644
> index 0000000000..7ba6e6859c
> --- /dev/null
> +++ b/package/python-flask-sqlalchemy/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_FLASK_SQLALCHEMY
> +       bool "python-flask-sqlalchemy"
> +       select BR2_PACKAGE_PYTHON_FLASK # runtime
> +       select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
> +       help
> +         Flask-SQLAlchemy is a Flask microframework extension which
> +         adds support for the SQLAlchemy SQL toolkit/ORM.
> +
> +         http://github.com/mitsuhiko/flask-sqlalchemy
> diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
> new file mode 100644
> index 0000000000..9e15b5d8f0
> --- /dev/null
> +++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/Flask-SQLAlchemy/json, sha256 locally computed
> +md5    373ce61dfd03b593ad2eaba68c9fee35  Flask-SQLAlchemy-2.3.2.tar.gz
> +sha256 5971b9852b5888655f11db634e87725a9031e170f37c0ce7851cf83497f56e53  Flask-SQLAlchemy-2.3.2.tar.gz
> +sha256 de2011f25501c45f2b78bfa4f851ce021cfbab0f1e7ab763233688e0b969821f  PKG-INFO
> diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
> new file mode 100644
> index 0000000000..37fe603f1e
> --- /dev/null
> +++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-flask-sqlalchemy
> +#
> +################################################################################
> +
> +PYTHON_FLASK_SQLALCHEMY_VERSION = 2.3.2
> +PYTHON_FLASK_SQLALCHEMY_SOURCE = Flask-SQLAlchemy-$(PYTHON_FLASK_SQLALCHEMY_VERSION).tar.gz
> +PYTHON_FLASK_SQLALCHEMY_SITE = https://pypi.python.org/packages/3a/66/f5ace276517c075f102457dd2f7d8645b033758f9c6effb4e0970a90fec1
> +PYTHON_FLASK_SQLALCHEMY_SETUP_TYPE = setuptools
> +PYTHON_FLASK_SQLALCHEMY_LICENSE = BSD-3c
> +PYTHON_FLASK_SQLALCHEMY_LICENSE_FILES = PKG-INFO
> +
> +$(eval $(python-package))
> --
> 2.14.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
