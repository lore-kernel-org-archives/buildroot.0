From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 17 Sep 2019 11:09:07 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/python-kiwisolver: new
 package
In-Reply-To: <20190917085034.2509-1-esben@geanix.com>
References: <20190917085034.2509-1-esben@geanix.com>
Message-ID: <CAGm1_kspd7t70OmpfZUG5pHkDUSmiCQ3XPtx=g08iYpGRS-Hbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Esben,

On Tue, Sep 17, 2019 at 10:50 AM Esben Haabendal <esben@geanix.com> wrote:
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  DEVELOPERS                                      |  1 +
>  package/Config.in                               |  1 +
>  package/python-kiwisolver/Config.in             | 17 +++++++++++++++++
>  .../python-kiwisolver/python-kiwisolver.hash    |  3 +++
>  package/python-kiwisolver/python-kiwisolver.mk  |  7 +++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-kiwisolver/Config.in
>  create mode 100644 package/python-kiwisolver/python-kiwisolver.hash
>  create mode 100644 package/python-kiwisolver/python-kiwisolver.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3b1d03c82684..583a65b14ba9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -719,6 +719,7 @@ F:  package/szip/
>
>  N:     Esben Haabendal <esben@haabendal.dk>
>  F:     boot/gummiboot/
> +F:     package/python-kiwisolver/
>
>  N:     Etienne Carriere <etienne.carriere@linaro.org>
>  F:     boot/optee-os/
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
> index 000000000000..6d31fdc35787
> --- /dev/null
> +++ b/package/python-kiwisolver/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_PYTHON_KIWISOLVER
> +       bool "python-kiwisolver"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON
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
> diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
> new file mode 100644
> index 000000000000..9cdb27002cf2
> --- /dev/null
> +++ b/package/python-kiwisolver/python-kiwisolver.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 48168c0ace18319c649e31907f6d8586f648e503560f506f128798b99393bcdb  python-kiwisolver-1.1.0.tar.gz
> +sha256 95c32f73d43fa54d8146badbcbd73b83acb7fa2cc81a7cef7784b3cd33b146a0  LICENSE
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

Could you also mark the previous patch versions as "Superceded" in [1]. Thanks.

[1] https://patchwork.ozlabs.org/project/buildroot/list/?submitter=76514

Yegor
