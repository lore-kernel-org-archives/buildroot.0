From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 13 Sep 2015 22:19:27 +0200
Subject: [Buildroot] [PATCH V2 1/1] python-pyratemp: new package
In-Reply-To: <1442170046-27879-1-git-send-email-stevecalfee@gmail.com>
References: <1442170046-27879-1-git-send-email-stevecalfee@gmail.com>
Message-ID: <CAGm1_kvOvaxBUQi3ffsh=-qBorf9oifBUirMJT5XBKdSxT++aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 13, 2015 at 8:47 PM, Steve Calfee <stevecalfee@gmail.com> wrote:
> add python simple template module
>
> Signed-off-by: Steve Calfee <stevecalfee@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in                            |  1 +
>  package/python-pyratemp/Config.in            |  8 ++++++++
>  package/python-pyratemp/python-pyratemp.hash |  2 ++
>  package/python-pyratemp/python-pyratemp.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
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
> index 0000000..e1cb055
> --- /dev/null
> +++ b/package/python-pyratemp/python-pyratemp.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated:
> +sha256 c45ed656ada482a02fe780495f37a695e7671accb04f918f7e7f18abf877bc71 pyratemp-0.3.2.tgz
> \ No newline at end of file
> diff --git a/package/python-pyratemp/python-pyratemp.mk b/package/python-pyratemp/python-pyratemp.mk
> new file mode 100644
> index 0000000..4c78154
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
> +PYTHON_PYRATEMP_SITE = http://www.simple-is-better.org/template
> +PYTHON_PYRATEMP_LICENSE = MIT
> +PYTHON_PYRATEMP_LICENSE_FILES = LICENSE
> +PYTHON_PYRATEMP_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
