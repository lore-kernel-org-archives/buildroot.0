From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 15:30:43 +0100
Subject: [Buildroot] [PATCH 12/22] package/python-pytrie: new package.
In-Reply-To: <1454335541-14224-13-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-13-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kttG059hO6p4LDZ+xL9fG+irJd3Oj+r9v8-7bWReMKUSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mauro,

please remove '.' from patch subject line

s/package/python-pytrie: new package./package/python-pytrie: new package

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                        |  1 +
>  package/python-pytrie/Config.in          |  8 ++++++++
>  package/python-pytrie/python-pytrie.hash |  3 +++
>  package/python-pytrie/python-pytrie.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-pytrie/Config.in
>  create mode 100644 package/python-pytrie/python-pytrie.hash
>  create mode 100644 package/python-pytrie/python-pytrie.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index fc90edb..c4bc8f8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -699,6 +699,7 @@ menu "External python modules"
>         source "package/python-pysnmp/Config.in"
>         source "package/python-pysnmp-apps/Config.in"
>         source "package/python-pysnmp-mibs/Config.in"
> +       source "package/python-pytrie/Config.in"
>         source "package/python-pyudev/Config.in"
>         source "package/python-pyusb/Config.in"
>         source "package/python-pyxb/Config.in"
> diff --git a/package/python-pytrie/Config.in b/package/python-pytrie/Config.in
> new file mode 100644
> index 0000000..3b9db7f
> --- /dev/null
> +++ b/package/python-pytrie/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_PYTRIE
> +       bool "python-pytrie"
> +       depends on BR2_PACKAGE_PYTHON

You don't this dependency as PYTRIE can be run under both Python versions.

> +       help
> +         A pure Python implementation of the trie data structure.
> +
> +         https://pypi.python.org/pypi/PyTrie
> +
> diff --git a/package/python-pytrie/python-pytrie.hash b/package/python-pytrie/python-pytrie.hash
> new file mode 100644
> index 0000000..ede6e72
> --- /dev/null
> +++ b/package/python-pytrie/python-pytrie.hash
> @@ -0,0 +1,3 @@
> +# Locally computed.
> +md5    5997b46c854a68bc588f4527c987663a  PyTrie-0.2.tar.gz

Here you should place a reference to PyPi's MD5. See
https://git.busybox.net/buildroot/tree/package/python-pyudev/python-pyudev.hash
for reference.

> +sha256 b272021351efadc6757591aac03ed4794bdfd091122204a4673e94bfb66cc500  PyTrie-0.2.tar.gz
> diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
> new file mode 100644
> index 0000000..ad1ee46
> --- /dev/null
> +++ b/package/python-pytrie/python-pytrie.mk
> @@ -0,0 +1,15 @@
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
> +#PYTHON_PYTRIE_DEPENDENCIES =

remove this commented line.

Yegor

> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
