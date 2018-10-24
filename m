From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 24 Oct 2018 15:59:13 +0200
Subject: [Buildroot] [PATCH v2 1/1] python-multidict: new package
In-Reply-To: <1540389393-3599-1-git-send-email-james.hilliard1@gmail.com>
References: <1540389393-3599-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAGm1_ksKvXvZpsdvaePaL_QCS-G8tksVoowFur72J+jXskBu_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 24, 2018 at 3:56 PM <james.hilliard1@gmail.com> wrote:
>
> From: James Hilliard <james.hilliard1@gmail.com>
>
> Multidict is dict-like collection of key-value pairs where key might be occurred more than once in the container.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in                              |  1 +
>  package/python-multidict/Config.in             |  7 +++++++
>  package/python-multidict/python-multidict.hash |  5 +++++
>  package/python-multidict/python-multidict.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-multidict/Config.in
>  create mode 100644 package/python-multidict/python-multidict.hash
>  create mode 100644 package/python-multidict/python-multidict.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 177861e..c1a917c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -909,6 +909,7 @@ menu "External python modules"
>         source "package/python-mistune/Config.in"
>         source "package/python-more-itertools/Config.in"
>         source "package/python-msgpack/Config.in"
> +       source "package/python-multidict/Config.in"
>         source "package/python-mutagen/Config.in"
>         source "package/python-mwclient/Config.in"
>         source "package/python-mwscrape/Config.in"
> diff --git a/package/python-multidict/Config.in b/package/python-multidict/Config.in
> new file mode 100644
> index 0000000..b380f29
> --- /dev/null
> +++ b/package/python-multidict/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_MULTIDICT
> +       bool "python-multidict"
> +       depends on BR2_PACKAGE_PYTHON3
> +       help
> +         multidict implementation.
> +
> +         https://github.com/aio-libs/multidict
> diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
> new file mode 100644
> index 0000000..aa15eed
> --- /dev/null
> +++ b/package/python-multidict/python-multidict.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/multidict/json
> +md5    55d19168f955e5463c6f6b530e913da3  multidict-4.4.2.tar.gz
> +sha256 3c11e92c3dfc321014e22fb442bc9eb70e01af30d6ce442026b0c35723448c66  multidict-4.4.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256 a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
> diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
> new file mode 100644
> index 0000000..f88135c
> --- /dev/null
> +++ b/package/python-multidict/python-multidict.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-multidict
> +#
> +################################################################################
> +
> +PYTHON_MULTIDICT_VERSION = 4.4.2
> +PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
> +PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/b3/5f/5c29cde8511c95fad045b9ecaf2e76f0da18761e8363a82594f5a58c2ced
> +PYTHON_MULTIDICT_SETUP_TYPE = setuptools
> +PYTHON_MULTIDICT_LICENSE = Apache-2.0
> +PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.7.4
>
