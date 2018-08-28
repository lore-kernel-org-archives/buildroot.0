From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 28 Aug 2018 10:02:22 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-falcon: New package
In-Reply-To: <20180826192346.5590-2-grzegorz@blach.pl>
References: <20180826192346.5590-1-grzegorz@blach.pl>
 <20180826192346.5590-2-grzegorz@blach.pl>
Message-ID: <CAGm1_ks7o+WeR_hwDefquG4dt_hJ0toxmZJXkPXx75QKrLfLfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grzegorz,

On Sun, Aug 26, 2018 at 11:52 PM Grzegorz Blach <grzegorz@blach.pl> wrote:
>
> Falcon is a bare-metal Python web API framework
> for building very fast app backends and microservices.
>
> https://falconframework.org/
>
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-falcon/Config.in          |  9 +++++++++
>  package/python-falcon/python-falcon.hash |  2 ++
>  package/python-falcon/python-falcon.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-falcon/Config.in
>  create mode 100644 package/python-falcon/python-falcon.hash
>  create mode 100644 package/python-falcon/python-falcon.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a9d5942adb..af039cc2ff 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -851,6 +851,7 @@ F:  package/libwebsock/
>  F:     package/sofia-sip/
>
>  N:     Grzegorz Blach <grzegorz@blach.pl>
> +F:     package/python-falcon
>  F:     package/python-mimeparse
>
>  N:     Guillaume Gardet <guillaume.gardet@oliseo.fr>
> diff --git a/package/Config.in b/package/Config.in
> index 0640a399bb..e243db552e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -799,6 +799,7 @@ menu "External python modules"
>         source "package/python-engineio/Config.in"
>         source "package/python-enum/Config.in"
>         source "package/python-enum34/Config.in"
> +       source "package/python-falcon/Config.in"
>         source "package/python-flask/Config.in"
>         source "package/python-flask-cors/Config.in"
>         source "package/python-flask-babel/Config.in"
> diff --git a/package/python-falcon/Config.in b/package/python-falcon/Config.in
> new file mode 100644
> index 0000000000..f7c8601e07
> --- /dev/null
> +++ b/package/python-falcon/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_FALCON
> +       bool "python-falcon"
> +       select BR2_PACKAGE_PYTHON_SIX # runtime
> +       select BR2_PACKAGE_PYTHON_MIMEPARSE # runtime
> +       help
> +          Falcon is a bare-metal Python web API framework for building
> +          very fast app backends and microservices.
> +
> +         https://falconframework.org/
> diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
> new file mode 100644
> index 0000000000..d31c959f98
> --- /dev/null
> +++ b/package/python-falcon/python-falcon.hash
> @@ -0,0 +1,2 @@
> +# Copied from https://pypi.org/project/falcon
> +sha256 3981f609c0358a9fcdb25b0e7fab3d9e23019356fb429c635ce4133135ae1bc4  falcon-1.4.1.tar.gz
> diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
> new file mode 100644
> index 0000000000..106387f96f
> --- /dev/null
> +++ b/package/python-falcon/python-falcon.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-falcon
> +#
> +################################################################################
> +
> +PYTHON_FALCON_VERSION = 1.4.1
> +PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
> +PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/2f/e6/5045da9df509b9259037f065d15608930fd6c997ee930ad230f9fbfecf15
> +PYTHON_FALCON_SETUP_TYPE = setuptools
> +PYTHON_FALCON_LICENSE = Apache-2.0
> +PYTHON_FALCON_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))

Patch title should be "python-falcon: new package". Btw why don't you
use utils/scanpypi? This script would also add hash for the licence
file. Other than that everything looks good.

Please resend both patches after regenerating them with scanpypi and
don't forget to install spdx_lookup before invoking scanpypi.

Regards,
Yegor
