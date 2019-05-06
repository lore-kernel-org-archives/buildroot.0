From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 6 May 2019 14:23:46 +0200
Subject: [Buildroot] [PATCH v3 4/7] package/python-traittypes: new
 package
In-Reply-To: <1557130548-6267-5-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557130548-6267-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557130548-6267-5-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <CAGm1_kvdw3+VTUhkQP-EE8QGzDw2KdOv2S_1+y8e0P7G6V7xFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 6, 2019 at 10:16 AM Jugurtha BELKALEM
<jugurtha.belkalem@smile.fr> wrote:
>
> bcc requires this package which is used to add
> custom trait types for scientific computing.
>
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Btw. if you have already received a reviewed-by tag and you don't
change the patch for the next series version, you can keep this tag.

Yegor

>
> ---
> Changes v1 => v2:
> Correcting typos, adding #runtime
> comment and fixing License name.
> ---
>  DEVELOPERS                                       |  1 +
>  package/Config.in                                |  1 +
>  package/python-traittypes/Config.in              |  7 +++++++
>  package/python-traittypes/python-traittypes.hash |  5 +++++
>  package/python-traittypes/python-traittypes.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-traittypes/Config.in
>  create mode 100644 package/python-traittypes/python-traittypes.hash
>  create mode 100644 package/python-traittypes/python-traittypes.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b7480c0..c64589e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1227,6 +1227,7 @@ F:        package/python-xlib/
>  N:     Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
>  F:     package/python-pytest
>  F:     package/python-pytest-runner
> +F:     package/python-traittypes
>
>  N:     Joshua Henderson <joshua.henderson@microchip.com>
>  F:     package/qt5/qt5wayland/
> diff --git a/package/Config.in b/package/Config.in
> index 4fcf4f7..4918ec5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1073,6 +1073,7 @@ menu "External python modules"
>         source "package/python-toml/Config.in"
>         source "package/python-tornado/Config.in"
>         source "package/python-traitlets/Config.in"
> +       source "package/python-traittypes/Config.in"
>         source "package/python-treq/Config.in"
>         source "package/python-twisted/Config.in"
>         source "package/python-txaio/Config.in"
> diff --git a/package/python-traittypes/Config.in b/package/python-traittypes/Config.in
> new file mode 100644
> index 0000000..0688f80
> --- /dev/null
> +++ b/package/python-traittypes/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_TRAITTYPES
> +       bool "python-traittypes"
> +       select BR2_PACKAGE_PYTHON_TRAITLETS # runtime
> +       help
> +         Custom trait types for scientific computing.
> +
> +         https://pypi.org/project/traittypes/
> diff --git a/package/python-traittypes/python-traittypes.hash b/package/python-traittypes/python-traittypes.hash
> new file mode 100644
> index 0000000..a94b256
> --- /dev/null
> +++ b/package/python-traittypes/python-traittypes.hash
> @@ -0,0 +1,5 @@
> +# sha256 from https://pypi.org/project/traittypes/#files
> +sha256 be6fa26294733e7489822ded4ae25da5b4824a8a7a0e0c2dccfde596e3489bd6 traittypes-0.2.1.tar.gz
> +
> +# Locally calculated
> +sha256 221976dfad5db283a2669efe8607e24c9c9aecca8453d6beba045e665c2f88a1 LICENSE
> diff --git a/package/python-traittypes/python-traittypes.mk b/package/python-traittypes/python-traittypes.mk
> new file mode 100644
> index 0000000..d360e2d
> --- /dev/null
> +++ b/package/python-traittypes/python-traittypes.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-traittypes
> +#
> +################################################################################
> +
> +PYTHON_TRAITTYPES_VERSION = 0.2.1
> +PYTHON_TRAITTYPES_SOURCE = traittypes-$(PYTHON_TRAITTYPES_VERSION).tar.gz
> +PYTHON_TRAITTYPES_SITE = https://files.pythonhosted.org/packages/8a/71/0578e44d2110f93c2136eb705f5b11e706e1e8ea3acaaaeac043bd40d8fd
> +PYTHON_TRAITTYPES_LICENSE = BSD-3-Clause
> +PYTHON_TRAITTYPES_LICENSE_FILES = LICENSE
> +PYTHON_TRAITTYPES_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
