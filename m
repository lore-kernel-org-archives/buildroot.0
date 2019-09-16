From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 16 Sep 2019 14:40:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-kiwisolver: new package
In-Reply-To: <20190916121350.2796-1-esben@geanix.com>
References: <20190916121350.2796-1-esben@geanix.com>
Message-ID: <CAGm1_kugx5dTZ=eR+6cR1-X56gVzzRzBpqNTzL2MmsDj5qDaBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 16, 2019 at 2:20 PM Esben Haabendal <esben@geanix.com> wrote:
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---

An entry in the DEVELOPERS file is missing.

>  package/Config.in                              |  1 +
>  package/python-kiwisolver/Config.in            | 17 +++++++++++++++++
>  package/python-kiwisolver/python-kiwisolver.mk |  7 +++++++

package/python-kiwisolver/python-kiwisolver.hash file with license
file and source archive file hashes is missing.

Yegor

>  3 files changed, 25 insertions(+)
>  create mode 100644 package/python-kiwisolver/Config.in
>  create mode 100644 package/python-kiwisolver/python-kiwisolver.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 9336261c5d9e..dddce6636168 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -933,6 +933,7 @@ menu "External python modules"
>         source "package/python-jsonmodels/Config.in"
>         source "package/python-jsonschema/Config.in"
>         source "package/python-keyring/Config.in"
> +       source "package/python-kiwisolver/Config.in"
>         source "package/python-libconfig/Config.in"
>         source "package/python-libusb1/Config.in"
>         source "package/python-lmdb/Config.in"
> diff --git a/package/python-kiwisolver/Config.in b/package/python-kiwisolver/Config.in
> new file mode 100644
> index 000000000000..d3ce857bac2f
> --- /dev/null
> +++ b/package/python-kiwisolver/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_PYTHON_KIWISOLVER
> +       bool "python-kiwisolver"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_PACKAGE_PYTHON3
> +       help
> +         Kiwi is an efficient C++ implementation of the Cassowary constraint
> +         solving algorithm. Kiwi is an implementation of the algorithm based
> +         on the seminal Cassowary paper. It is not a refactoring of the
> +         original C++ solver. Kiwi has been designed from the ground up to be
> +         lightweight and fast. Kiwi ranges from 10x to 500x faster than the
> +         original Cassowary solver with typical use cases gaining a 40x
> +         improvement. Memory savings are consistently > 5x.
> +
> +         https://github.com/nucleic/kiwi
> +
> +comment "python-kiwisolver needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
> new file mode 100644
> index 000000000000..96019fc29328
> --- /dev/null
> +++ b/package/python-kiwisolver/python-kiwisolver.mk
> @@ -0,0 +1,7 @@
> +PYTHON_KIWISOLVER_VERSION = 1.1.0
> +PYTHON_KIWISOLVER_SITE = $(call github,nucleic,kiwi,$(PYTHON_KIWISOLVER_VERSION))
> +PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
> +PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
> +PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.23.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
