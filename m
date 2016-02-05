From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 5 Feb 2016 20:38:37 +0100
Subject: [Buildroot] [PATCH v3 08/17] python-shutilwhich: new package
In-Reply-To: <1454696337-9692-9-git-send-email-mc5686@mclink.it>
References: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
 <1454696337-9692-9-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_ku8dWESH_hoydyiHCK0ppba=vwMhLtqTi5QcbFbqxud5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 5, 2016 at 7:18 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                                  |  1 +
>  package/python-shutilwhich/Config.in               |  8 ++++++++
>  package/python-shutilwhich/python-shutilwhich.hash |  3 +++
>  package/python-shutilwhich/python-shutilwhich.mk   | 13 +++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-shutilwhich/Config.in
>  create mode 100644 package/python-shutilwhich/python-shutilwhich.hash
>  create mode 100644 package/python-shutilwhich/python-shutilwhich.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 036de5e..6db2fe4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -712,6 +712,7 @@ menu "External python modules"
>         source "package/python-serial/Config.in"
>         source "package/python-service-identity/Config.in"
>         source "package/python-setuptools/Config.in"
> +       source "package/python-shutilwhich/Config.in"
>         source "package/python-simplejson/Config.in"
>         source "package/python-singledispatch/Config.in"
>         source "package/python-sip/Config.in"
> diff --git a/package/python-shutilwhich/Config.in b/package/python-shutilwhich/Config.in
> new file mode 100644
> index 0000000..d610cfe
> --- /dev/null
> +++ b/package/python-shutilwhich/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_SHUTILWHICH
> +       bool "python-shutilwhich"
> +       depends on BR2_PACKAGE_PYTHON
> +       help
> +         shutil.which for those not using Python 3.3 yet.
> +
> +         https://pypi.python.org/pypi/shutilwhich/
> +

Empty line

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> diff --git a/package/python-shutilwhich/python-shutilwhich.hash b/package/python-shutilwhich/python-shutilwhich.hash
> new file mode 100644
> index 0000000..b1a2c78
> --- /dev/null
> +++ b/package/python-shutilwhich/python-shutilwhich.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=915947c5cdae7afd748ac715ee547adb, sha256 locally computed.
> +md5    915947c5cdae7afd748ac715ee547adb  shutilwhich-1.1.0.tar.gz
> +sha256 db1f39c6461e42f630fa617bb8c79090f7711c9ca493e615e43d0610ecb64dc6  shutilwhich-1.1.0.tar.gz
> diff --git a/package/python-shutilwhich/python-shutilwhich.mk b/package/python-shutilwhich/python-shutilwhich.mk
> new file mode 100644
> index 0000000..b2e06d5
> --- /dev/null
> +++ b/package/python-shutilwhich/python-shutilwhich.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-shutilwhich
> +#
> +################################################################################
> +
> +PYTHON_SHUTILWHICH_VERSION = 1.1.0
> +PYTHON_SHUTILWHICH_SOURCE = shutilwhich-$(PYTHON_SHUTILWHICH_VERSION).tar.gz
> +PYTHON_SHUTILWHICH_SITE = http://pypi.python.org/packages/source/s/shutilwhich
> +PYTHON_SHUTILWHICH_LICENSE = MIT
> +PYTHON_SHUTILWHICH_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
