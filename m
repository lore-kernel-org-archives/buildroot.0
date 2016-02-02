From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 2 Feb 2016 14:47:14 +0100
Subject: [Buildroot] [PATCH 12/19] python-service-identity: new package
In-Reply-To: <1454373899-22481-13-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
 <1454373899-22481-13-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kvCzD_8NyyLCOEhO1CgwH5EMBU0H0tT-jyxU2B0nwj_KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 2, 2016 at 1:44 AM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                                         |  1 +
>  package/python-service-identity/Config.in                 | 11 +++++++++++
>  .../python-service-identity/python-service-identity.hash  |  3 +++
>  .../python-service-identity/python-service-identity.mk    | 15 +++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/python-service-identity/Config.in
>  create mode 100644 package/python-service-identity/python-service-identity.hash
>  create mode 100644 package/python-service-identity/python-service-identity.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 345a512..8b3304c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -709,6 +709,7 @@ menu "External python modules"
>         source "package/python-requests/Config.in"
>         source "package/python-rtslib-fb/Config.in"
>         source "package/python-serial/Config.in"
> +       source "package/python-service-identity/Config.in"
>         source "package/python-setuptools/Config.in"
>         source "package/python-simplejson/Config.in"
>         source "package/python-singledispatch/Config.in"
> diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
> new file mode 100644
> index 0000000..fbf34c0
> --- /dev/null
> +++ b/package/python-service-identity/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
> +       bool "python-service-identity"
> +       select BR2_PACKAGE_PYTHON_CHARACTERISTIC
> +       select BR2_PACKAGE_PYTHON_PYASN
> +       select BR2_PACKAGE_PYTHON_PYASN_MODULES
> +       select BR2_PACKAGE_PYTHON_PYOPENSSL

mark dependencies as # runtime

> +       help
> +         Service identity verification for pyOpenSSL.
> +
> +         https://pypi.python.org/pypi/service_identity
> +
> diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
> new file mode 100644
> index 0000000..caf29dc
> --- /dev/null
> +++ b/package/python-service-identity/python-service-identity.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=cea0b0156d73b025ecef660fb51f0d9a, sha256 locally computed.
> +md5    cea0b0156d73b025ecef660fb51f0d9a  service_identity-14.0.0.tar.gz
> +sha256 3105a319a7c558490666694f599be0c377ad54824eefb404cde4ce49e74a4f5a  service_identity-14.0.0.tar.gz
> diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
> new file mode 100644
> index 0000000..a1c4072
> --- /dev/null
> +++ b/package/python-service-identity/python-service-identity.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-service-identity
> +#
> +################################################################################
> +
> +PYTHON_SERVICE_IDENTITY_VERSION = 14.0.0
> +PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
> +PYTHON_SERVICE_IDENTITY_SITE = http://pypi.python.org/packages/source/s/service_identity
> +PYTHON_SERVICE_IDENTITY_LICENSE = BSD
> +PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
> +PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
> +PYTHON_SERVICE_IDENTITY_DEPENDENCIES = python-characteristic python-pyasn1 python-pyasn-modules python-pyopenssl

remove runtime dependencies

> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
