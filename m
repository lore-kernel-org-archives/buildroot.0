From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 15 Sep 2015 18:21:41 +0200
Subject: [Buildroot] [PATCH V3 1/1] python-pyratemp: new package
In-Reply-To: <1442333229-15152-1-git-send-email-stevecalfee@gmail.com>
References: <1442333229-15152-1-git-send-email-stevecalfee@gmail.com>
Message-ID: <CAGm1_kt5K2_fy+Zttb8Ciz=amXeO8EKY1trsXhK6oNBv=fymhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 15, 2015 at 6:07 PM, Steve Calfee <stevecalfee@gmail.com> wrote:
> add python simple template module
>
> Signed-off-by: Steve Calfee <stevecalfee@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

>
> ---
> V3 - Changed to pypi source and included the original md5 as well as my sha256.
>
> Signed-off-by: Steve Calfee <stevecalfee@gmail.com>
> ---
>  package/Config.in                            |  1 +
>  package/python-pyratemp/Config.in            |  8 ++++++++
>  package/python-pyratemp/python-pyratemp.hash |  4 ++++
>  package/python-pyratemp/python-pyratemp.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-pyratemp/Config.in
>  create mode 100644 package/python-pyratemp/python-pyratemp.hash
>  create mode 100644 package/python-pyratemp/python-pyratemp.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 783fbb4..8c8d099 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -645,6 +645,7 @@ menu "external python modules"
>         source "package/python-pyparsing/Config.in"
>         source "package/python-pypcap/Config.in"
>         source "package/python-pyqt/Config.in"
> +       source "package/python-pyratemp/Config.in"
>         source "package/python-pyro/Config.in"
>         source "package/python-pysendfile/Config.in"
>         source "package/python-pysnmp/Config.in"
> diff --git a/package/python-pyratemp/Config.in b/package/python-pyratemp/Config.in
> new file mode 100644
> index 0000000..f86f6c4
> --- /dev/null
> +++ b/package/python-pyratemp/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_PYRATEMP
> +       bool "python-pyratemp"
> +       help
> +         python-pyratemp is a Python library for doing html templates.
> +         written entirely in Python, that is designed to be very easy to use
> +         and very like writing Python.
> +
> +         https://pypi.python.org/pypi/pyratemp/
> diff --git a/package/python-pyratemp/python-pyratemp.hash b/package/python-pyratemp/python-pyratemp.hash
> new file mode 100644
> index 0000000..f3f29a3
> --- /dev/null
> +++ b/package/python-pyratemp/python-pyratemp.hash
> @@ -0,0 +1,4 @@
> +#md5 from https://pypi.python.org/pypi?:action=show_md5&digest=e4bbe5d4a98016efef882b2b2f47defb
> +md5     e4bbe5d4a98016efef882b2b2f47defb pyratemp-0.3.2.tgz
> +# Locally calculated:
> +sha256 c45ed656ada482a02fe780495f37a695e7671accb04f918f7e7f18abf877bc71 pyratemp-0.3.2.tgz
> diff --git a/package/python-pyratemp/python-pyratemp.mk b/package/python-pyratemp/python-pyratemp.mk
> new file mode 100644
> index 0000000..055fb30
> --- /dev/null
> +++ b/package/python-pyratemp/python-pyratemp.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pyratemp
> +#
> +################################################################################
> +
> +PYTHON_PYRATEMP_VERSION = 0.3.2
> +PYTHON_PYRATEMP_SOURCE = pyratemp-$(PYTHON_PYRATEMP_VERSION).tgz
> +PYTHON_PYRATEMP_SITE = https://pypi.python.org/packages/source/p/pyratemp
> +PYTHON_PYRATEMP_LICENSE = MIT
> +PYTHON_PYRATEMP_LICENSE_FILES = LICENSE
> +PYTHON_PYRATEMP_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> --
> 1.9.1
>
