From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 15:54:49 +0100
Subject: [Buildroot] [PATCH 11/22] package/python-pyopenssl: new package.
In-Reply-To: <1454335541-14224-12-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-12-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_ku0tSbx=wptsqGO7gh20UBJMNOxE90JfxbMZdR3J2JwJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                              |  1 +
>  package/python-pyopenssl/Config.in             | 12 ++++++++++++
>  package/python-pyopenssl/python-pyopenssl.hash |  3 +++
>  package/python-pyopenssl/python-pyopenssl.mk   | 14 ++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/python-pyopenssl/Config.in
>  create mode 100644 package/python-pyopenssl/python-pyopenssl.hash
>  create mode 100644 package/python-pyopenssl/python-pyopenssl.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 320af2b..fc90edb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -687,6 +687,7 @@ menu "External python modules"
>         source "package/python-pygments/Config.in"
>         source "package/python-pyinotify/Config.in"
>         source "package/python-pynacl/Config.in"
> +       source "package/python-pyopenssl/Config.in"
>         source "package/python-pyparsing/Config.in"
>         source "package/python-pypcap/Config.in"
>         source "package/python-pyqt/Config.in"
> diff --git a/package/python-pyopenssl/Config.in b/package/python-pyopenssl/Config.in
> new file mode 100644
> index 0000000..cb59e8b
> --- /dev/null
> +++ b/package/python-pyopenssl/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PYTHON_PYOPENSSL
> +       bool "python-pyopenssl"
> +       depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
> +       select BR2_PACKAGE_PYTHON_SIX
> +       select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
> +       help
> +         Python wrapper module around the OpenSSL library.
> +
> +         https://github.com/pyca/pyopenssl
> +
> +comment "python-pyopenssl needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
> new file mode 100644
> index 0000000..0c6e25a
> --- /dev/null
> +++ b/package/python-pyopenssl/python-pyopenssl.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f447644afcbd5f0a1f47350fec63a4c6, sha256 locally computed
> +md5     f447644afcbd5f0a1f47350fec63a4c6  pyOpenSSL-0.15.1.tar.gz
> +sha256  f0a26070d6db0881de8bcc7846934b7c3c930d8f9c79d45883ee48984bc0d672  pyOpenSSL-0.15.1.tar.gz
> diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
> new file mode 100644
> index 0000000..239fd98
> --- /dev/null
> +++ b/package/python-pyopenssl/python-pyopenssl.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pyopenssl
> +#
> +################################################################################
> +
> +PYTHON_PYOPENSSL_VERSION = 0.15.1
> +PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
> +PYTHON_PYOPENSSL_SITE = https://pypi.python.org/packages/source/p/pyOpenSSL
> +PYTHON_PYOPENSSL_LICENSE = Apache-2.0
> +PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
> +PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))

drop this path, as it is already in patchwork

Yegor
