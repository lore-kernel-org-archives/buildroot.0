From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 30 Oct 2018 20:56:15 +0200
Subject: [Buildroot] [PATCH 1/3] python-wrapt: new package
In-Reply-To: <20181012080650.2793-1-yegorslists@googlemail.com>
References: <20181012080650.2793-1-yegorslists@googlemail.com>
Message-ID: <CALFsTFVHT7q4ceTQFHGSotkgF02bB8uMWkw-+VfBh6F=f1YMGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 12, 2018 at 11:06 AM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/Config.in                      |  1 +
>  package/python-wrapt/Config.in         |  6 ++++++
>  package/python-wrapt/python-wrapt.hash |  5 +++++
>  package/python-wrapt/python-wrapt.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-wrapt/Config.in
>  create mode 100644 package/python-wrapt/python-wrapt.hash
>  create mode 100644 package/python-wrapt/python-wrapt.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 8d995f82e6..9092a9e237 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1057,6 +1057,7 @@ menu "External python modules"
>         source "package/python-websockets/Config.in"
>         source "package/python-werkzeug/Config.in"
>         source "package/python-whoosh/Config.in"
> +       source "package/python-wrapt/Config.in"
>         source "package/python-ws4py/Config.in"
>         source "package/python-wsaccel/Config.in"
>         source "package/python-xlib/Config.in"
> diff --git a/package/python-wrapt/Config.in b/package/python-wrapt/Config.in
> new file mode 100644
> index 0000000000..da315c9a77
> --- /dev/null
> +++ b/package/python-wrapt/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_WRAPT
> +       bool "python-wrapt"
> +       help
> +         Module for decorators, wrappers and monkey patching.
> +
> +         https://github.com/GrahamDumpleton/wrapt
> diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
> new file mode 100644
> index 0000000000..dbf8932956
> --- /dev/null
> +++ b/package/python-wrapt/python-wrapt.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/wrapt/json
> +md5    e1346f31782d50401f81c2345b037076  wrapt-1.10.11.tar.gz
> +sha256 d4d560d479f2c21e1b5443bbd15fe7ec4b37fe7e53d335d3b9b0a7b1226fe3c6  wrapt-1.10.11.tar.gz
> +# Locally computed sha256 checksums
> +sha256 b6d2e5d228202a11bc5e5988661fc5d8acc1ba4f27256c37e19029131a30b1f2  LICENSE
> diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
> new file mode 100644
> index 0000000000..dd8b9a58e4
> --- /dev/null
> +++ b/package/python-wrapt/python-wrapt.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-wrapt
> +#
> +################################################################################
> +
> +PYTHON_WRAPT_VERSION = 1.10.11
> +PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
> +PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/a0/47/66897906448185fcb77fc3c2b1bc20ed0ecca81a0f2f88eda3fc5a34fc3d
> +PYTHON_WRAPT_SETUP_TYPE = distutils
> +PYTHON_WRAPT_LICENSE = BSD-2-Clause
> +PYTHON_WRAPT_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.17.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
