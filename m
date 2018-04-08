From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 8 Apr 2018 22:59:32 +0200
Subject: [Buildroot] [PATCH 1/1] python-fastentrypoints: new package
In-Reply-To: <20180408174859.19679-1-asafka7@gmail.com>
References: <20180408174859.19679-1-asafka7@gmail.com>
Message-ID: <CAGm1_kvpoR7by7W_UtNuSeBGGcNedBrdU+VQaqM82J-CVfk7sA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Asaf,

On Sun, Apr 8, 2018 at 7:48 PM, Asaf Kahlon <asafka7@gmail.com> wrote:
> host-package that is able to shorten the load time of entry_points declared
> in setup.py of python packages.
>
> Unfortunately, license file was not found.

This comment shouldn't be part of the commit log.

> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS                                           |  1 +
>  package/Config.in                                    |  1 +
>  package/python-fastentrypoints/Config.in             |  6 ++++++
>  .../python-fastentrypoints.hash                      |  3 +++
>  .../python-fastentrypoints/python-fastentrypoints.mk | 12 ++++++++++++
>  5 files changed, 23 insertions(+)
>  create mode 100644 package/python-fastentrypoints/Config.in
>  create mode 100644 package/python-fastentrypoints/python-fastentrypoints.hash
>  create mode 100644 package/python-fastentrypoints/python-fastentrypoints.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 10b20c259b..ea33d5e730 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -189,6 +189,7 @@ F:  package/sqlcipher/
>  F:     package/stress/
>
>  N:     Asaf Kahlon <asafka7@gmail.com>
> +F:     package/python-fastentrypoints/
>  F:     package/python-jsonmodels/
>  F:     package/python-yieldfrom/
>
> diff --git a/package/Config.in b/package/Config.in
> index 5e798a4f14..d7e51b203c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -778,6 +778,7 @@ menu "External python modules"
>         source "package/python-engineio/Config.in"
>         source "package/python-enum/Config.in"
>         source "package/python-enum34/Config.in"
> +       source "package/python-fastentrypoints/Config.in"
>         source "package/python-flask/Config.in"
>         source "package/python-flask-cors/Config.in"
>         source "package/python-flask-babel/Config.in"
> diff --git a/package/python-fastentrypoints/Config.in b/package/python-fastentrypoints/Config.in
> new file mode 100644
> index 0000000000..d2c86dbc5e
> --- /dev/null
> +++ b/package/python-fastentrypoints/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_FASTENTRYPOINTS
> +       bool "python-fastentrypoints"
> +       help
> +         Makes entry_points specified in setup.py load more quickly.
> +
> +         https://github.com/ninjaaron/fast-entry_points
> diff --git a/package/python-fastentrypoints/python-fastentrypoints.hash b/package/python-fastentrypoints/python-fastentrypoints.hash
> new file mode 100644
> index 0000000000..da6e2ae9d8
> --- /dev/null
> +++ b/package/python-fastentrypoints/python-fastentrypoints.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi/fastentrypoints/json, sha256 locally computed
> +md5    9bd2a34697eb8279d87e7b927f4f7e85  fastentrypoints-0.10.tar.gz
> +sha256 ed418146ed87230694ec2d8890b9b3e2967e95d857e5ce933cafecb1067cca82  fastentrypoints-0.10.tar.gz
> diff --git a/package/python-fastentrypoints/python-fastentrypoints.mk b/package/python-fastentrypoints/python-fastentrypoints.mk
> new file mode 100644
> index 0000000000..455cfe8319
> --- /dev/null
> +++ b/package/python-fastentrypoints/python-fastentrypoints.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# python-fastentrypoints
> +#
> +################################################################################
> +
> +PYTHON_FASTENTRYPOINTS_VERSION = 0.10
> +PYTHON_FASTENTRYPOINTS_SOURCE = fastentrypoints-$(PYTHON_FASTENTRYPOINTS_VERSION).tar.gz
> +PYTHON_FASTENTRYPOINTS_SITE = https://pypi.python.org/packages/e8/c8/c2902c9c9da43d8be8c75a730f15f0c51933c42c39b91d1d7b605a88e907
> +PYTHON_FASTENTRYPOINTS_SETUP_TYPE = setuptools

The license file can be found on github and seems to be BSD-2c [1]

With these changes applied you can add my: Reviewed-by: Yegor Yefremov
<yegorslists@googlemail.com>

[1] https://github.com/ninjaaron/fast-entry_points/blob/master/LICENSE

Yegor

> +
> +$(eval $(host-python-package))
> --
> 2.17.0
>
