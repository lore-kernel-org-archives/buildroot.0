From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 2 Feb 2016 14:41:20 +0100
Subject: [Buildroot] [PATCH 06/19] python-mistune: new package
In-Reply-To: <1454373899-22481-7-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
 <1454373899-22481-7-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_ktwgw4BgQqxWwkLLt7Wwmu=FfCP0WyvX7SLdiHHw-E0yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 2, 2016 at 1:44 AM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in                          |  1 +
>  package/python-mistune/Config.in           |  8 ++++++++
>  package/python-mistune/python-mistune.hash |  3 +++
>  package/python-mistune/python-treq.mk      | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-mistune/Config.in
>  create mode 100644 package/python-mistune/python-mistune.hash
>  create mode 100644 package/python-mistune/python-treq.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 4294813..80a4201 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -665,6 +665,7 @@ menu "External python modules"
>         source "package/python-markdown/Config.in"
>         source "package/python-markupsafe/Config.in"
>         source "package/python-meld3/Config.in"
> +       source "package/python-mistune/Config.in"
>         source "package/python-msgpack/Config.in"
>         source "package/python-netifaces/Config.in"
>         source "package/python-networkmanager/Config.in"
> diff --git a/package/python-mistune/Config.in b/package/python-mistune/Config.in
> new file mode 100644
> index 0000000..dd56815
> --- /dev/null
> +++ b/package/python-mistune/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_MISTUNE
> +       bool "python-mistune"
> +       help
> +         The fastest markdown parser in pure Python
> +         with renderer features, inspired by marked.
> +
> +         https://pypi.python.org/pypi/mistune
> +
> diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
> new file mode 100644
> index 0000000..b161e11
> --- /dev/null
> +++ b/package/python-mistune/python-mistune.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=057bc28bf629d6a1283d680a34ed9d0f, sha256 locally computed.
> +md5    057bc28bf629d6a1283d680a34ed9d0f  mistune-0.7.1.tar.gz
> +sha256 6076dedf768348927d991f4371e5a799c6a0158b16091df08ee85ee231d929a7  mistune-0.7.1.tar.gz
> diff --git a/package/python-mistune/python-treq.mk b/package/python-mistune/python-treq.mk
> new file mode 100644
> index 0000000..385ad6d
> --- /dev/null
> +++ b/package/python-mistune/python-treq.mk
> @@ -0,0 +1,14 @@
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
> +PYTHON_MISTUNE_LICENSE_FILES = LICENSE
> +PYTHON_MISTUNE_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
