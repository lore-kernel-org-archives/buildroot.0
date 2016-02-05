From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 5 Feb 2016 20:30:10 +0100
Subject: [Buildroot] [PATCH v3 06/17] python-pytrie: new package
In-Reply-To: <1454696337-9692-7-git-send-email-mc5686@mclink.it>
References: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
 <1454696337-9692-7-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kuV2d80GFcv2gyPyoABjMKSvLU-o06Twhu8BTbFeQe-tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 5, 2016 at 7:18 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                        |  1 +
>  package/python-pytrie/Config.in          |  7 +++++++
>  package/python-pytrie/python-pytrie.hash |  3 +++
>  package/python-pytrie/python-pytrie.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-pytrie/Config.in
>  create mode 100644 package/python-pytrie/python-pytrie.hash
>  create mode 100644 package/python-pytrie/python-pytrie.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index f46daea..f5665bf 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -701,6 +701,7 @@ menu "External python modules"
>         source "package/python-pysnmp/Config.in"
>         source "package/python-pysnmp-apps/Config.in"
>         source "package/python-pysnmp-mibs/Config.in"
> +       source "package/python-pytrie/Config.in"
>         source "package/python-pyudev/Config.in"
>         source "package/python-pyusb/Config.in"
>         source "package/python-pyxb/Config.in"
> diff --git a/package/python-pytrie/Config.in b/package/python-pytrie/Config.in
> new file mode 100644
> index 0000000..4f61db0
> --- /dev/null
> +++ b/package/python-pytrie/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PYTRIE
> +       bool "python-pytrie"
> +       help
> +         A pure Python implementation of the trie data structure.
> +
> +         https://pypi.python.org/pypi/PyTrie
> +

Empty line, other than that

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> diff --git a/package/python-pytrie/python-pytrie.hash b/package/python-pytrie/python-pytrie.hash
> new file mode 100644
> index 0000000..88d2542
> --- /dev/null
> +++ b/package/python-pytrie/python-pytrie.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5997b46c854a68bc588f4527c987663a, sha256 locally computed.
> +md5    5997b46c854a68bc588f4527c987663a  PyTrie-0.2.tar.gz
> +sha256 b272021351efadc6757591aac03ed4794bdfd091122204a4673e94bfb66cc500  PyTrie-0.2.tar.gz
> diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
> new file mode 100644
> index 0000000..e3bea4f
> --- /dev/null
> +++ b/package/python-pytrie/python-pytrie.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pytrie
> +#
> +################################################################################
> +
> +PYTHON_PYTRIE_VERSION = 0.2
> +PYTHON_PYTRIE_SITE = http://pypi.python.org/packages/source/P/PyTrie
> +PYTHON_PYTRIE_SOURCE = PyTrie-$(PYTHON_PYTRIE_VERSION).tar.gz
> +PYTHON_PYTRIE_LICENSE = BSD-3c
> +PYTHON_PYTRIE_LICENSE_FILES = LICENSE
> +PYTHON_PYTRIE_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
