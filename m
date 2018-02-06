From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 6 Feb 2018 14:37:19 +0100
Subject: [Buildroot] [PATCH v2 5/5] python-flask-bootstrap: new package
In-Reply-To: <20180206132506.30389-5-aduskett@gmail.com>
References: <20180206132506.30389-1-aduskett@gmail.com>
 <20180206132506.30389-5-aduskett@gmail.com>
Message-ID: <CAGm1_ktVnjGSCv57AFWTjBug=zRmYvrAwJ1jV5AhB7j3cKxJVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 6, 2018 at 2:25 PM, Adam Duskett <aduskett@gmail.com> wrote:
> Flask-Bootstrap packages Bootstrap into an extension that mostly consists of a
> blueprint named 'bootstrap'. It can also create links to serve Bootstrap from
> a CDN and works with no boilerplate code in your application.
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
> Changes v1 -> v2:
>   - Changed license to BSD-3c (yegor)
>
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  package/python-flask-bootstrap/Config.in                   | 12 ++++++++++++
>  package/python-flask-bootstrap/python-flask-bootstrap.hash |  3 +++
>  package/python-flask-bootstrap/python-flask-bootstrap.mk   | 13 +++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/python-flask-bootstrap/Config.in
>  create mode 100644 package/python-flask-bootstrap/python-flask-bootstrap.hash
>  create mode 100644 package/python-flask-bootstrap/python-flask-bootstrap.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 32ae08c99a..4d80259b1b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -51,6 +51,7 @@ F:    package/libsemanage/
>  F:     package/libsepol/
>  F:     package/nginx-naxsi/
>  F:     package/policycoreutils/
> +F:     package/python-flask-bootstrap/
>  F:     package/python-flask-sqlalchemy/
>  F:     package/python-mutagen/
>  F:     package/python-psycopg2/
> diff --git a/package/Config.in b/package/Config.in
> index 2f2b13e3c0..d967b316f4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -772,6 +772,7 @@ menu "External python modules"
>         source "package/python-flask/Config.in"
>         source "package/python-flask-cors/Config.in"
>         source "package/python-flask-babel/Config.in"
> +       source "package/python-flask-bootstrap/Config.in"
>         source "package/python-flask-jsonrpc/Config.in"
>         source "package/python-flask-login/Config.in"
>         source "package/python-flask-sqlalchemy/Config.in"
> diff --git a/package/python-flask-bootstrap/Config.in b/package/python-flask-bootstrap/Config.in
> new file mode 100644
> index 0000000000..a9fecd1933
> --- /dev/null
> +++ b/package/python-flask-bootstrap/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PYTHON_FLASK_BOOTSTRAP
> +       bool "python-flask-bootstrap"
> +       select BR2_PACKAGE_PYTHON_FLASK # runtime
> +       select BR2_PACKAGE_PYTHON_DOMINATE # runtime
> +       select BR2_PACKAGE_PYTHON_VISITOR # runtime
> +       help
> +         Flask-Bootstrap packages Bootstrap into an extension that
> +         mostly consists of a blueprint named 'bootstrap'. It can also
> +         create links to serve Bootstrap from a CDN and works with no
> +         boilerplate code in your application.
> +
> +         http://github.com/mbr/flask-bootstrap
> diff --git a/package/python-flask-bootstrap/python-flask-bootstrap.hash b/package/python-flask-bootstrap/python-flask-bootstrap.hash
> new file mode 100644
> index 0000000000..56b5cf5243
> --- /dev/null
> +++ b/package/python-flask-bootstrap/python-flask-bootstrap.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi/Flask-Bootstrap/json, sha256 locally computed
> +md5    e40d50f5c5b6438c1c6200a6f2871f81  Flask-Bootstrap-3.3.7.1.tar.gz
> +sha256 cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8  Flask-Bootstrap-3.3.7.1.tar.gz
> diff --git a/package/python-flask-bootstrap/python-flask-bootstrap.mk b/package/python-flask-bootstrap/python-flask-bootstrap.mk
> new file mode 100644
> index 0000000000..1c40f70564
> --- /dev/null
> +++ b/package/python-flask-bootstrap/python-flask-bootstrap.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-flask-bootstrap
> +#
> +################################################################################
> +
> +PYTHON_FLASK_BOOTSTRAP_VERSION = 3.3.7.1
> +PYTHON_FLASK_BOOTSTRAP_SOURCE = Flask-Bootstrap-$(PYTHON_FLASK_BOOTSTRAP_VERSION).tar.gz
> +PYTHON_FLASK_BOOTSTRAP_SITE = https://pypi.python.org/packages/88/53/958ce7c2aa26280b7fd7f3eecbf13053f1302ee2acb1db58ef32e1c23c2a
> +PYTHON_FLASK_BOOTSTRAP_SETUP_TYPE = setuptools
> +PYTHON_FLASK_BOOTSTRAP_LICENSE = BSD-3c
> +
> +$(eval $(python-package))
> --
> 2.14.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
