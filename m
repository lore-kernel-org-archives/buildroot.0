From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 16:09:09 +0100
Subject: [Buildroot] [PATCH 06/22] package/python-mistune: new package.
In-Reply-To: <1454335541-14224-7-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-7-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kujAtYHixq8nnj6jrLZLSDqQh6bGz10V11S+pPjqMj-vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                          |  1 +
>  package/python-mistune/Config.in           |  9 +++++++++
>  package/python-mistune/python-mistune.hash |  3 +++
>  package/python-mistune/python-treq.mk      | 15 +++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-mistune/Config.in
>  create mode 100644 package/python-mistune/python-mistune.hash
>  create mode 100644 package/python-mistune/python-treq.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 8dcaef7..dd82ab3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -664,6 +664,7 @@ menu "External python modules"
>         source "package/python-markdown/Config.in"
>         source "package/python-markupsafe/Config.in"
>         source "package/python-meld3/Config.in"
> +       source "package/python-mistune/Config.in"
>         source "package/python-msgpack/Config.in"
>         source "package/python-netifaces/Config.in"
>         source "package/python-networkmanager/Config.in"
> diff --git a/package/python-mistune/Config.in b/package/python-mistune/Config.in
> new file mode 100644
> index 0000000..bac98a5
> --- /dev/null
> +++ b/package/python-mistune/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_MISTUNE
> +       bool "python-mistune"
> +       depends on BR2_PACKAGE_PYTHON

remove depends

> +       help
> +         The fastest markdown parser in pure Python
> +         with renderer features, inspired by marked.
> +
> +         https://pypi.python.org/pypi/mistune
> +
> diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
> new file mode 100644
> index 0000000..d4098b2
> --- /dev/null
> +++ b/package/python-mistune/python-mistune.hash
> @@ -0,0 +1,3 @@
> +# Locally computed.
> +md5    057bc28bf629d6a1283d680a34ed9d0f  mistune-0.7.1.tar.gz
> +sha256 6076dedf768348927d991f4371e5a799c6a0158b16091df08ee85ee231d929a7  mistune-0.7.1.tar.gz
> diff --git a/package/python-mistune/python-treq.mk b/package/python-mistune/python-treq.mk
> new file mode 100644
> index 0000000..ec99836
> --- /dev/null
> +++ b/package/python-mistune/python-treq.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-mistune
> +#
> +################################################################################
> +
> +PYTHON_MISTUNE_VERSION = 0.7.1
> +PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
> +PYTHON_MISTUNE_SITE = http://pypi.python.org/packages/source/m/mistune
> +PYTHON_MISTUNE_LICENSE = BSD
> +#PYTHON_MISTUNE_LICENSE_FILES = LICENSE
> +PYTHON_MISTUNE_SETUP_TYPE = setuptools
> +#PYTHON_MISTUNE_DEPENDENCIES =
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
