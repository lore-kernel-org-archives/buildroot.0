From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 23 Mar 2020 16:31:38 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/python-pysftp: add
 python-pysftp
In-Reply-To: <20200323150537.37866-1-jared.bents@rockwellcollins.com>
References: <20200323150537.37866-1-jared.bents@rockwellcollins.com>
Message-ID: <CAGm1_ktRQHcbnB+ygNaKcWd2L9U4qgiMdGNfL4uZ3Lj5zp1qZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jared,

the commit message should be:

python-pystfp: new package

On Mon, Mar 23, 2020 at 4:05 PM Jared Bents
<jared.bents@rockwellcollins.com> wrote:
>
> Update to add python-pysftp. A simple interface to SFTP. The
> module offers high level abstractions and task based routines
> to handle your SFTP needs.
>
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-pysftp/Config.in          |  7 +++++++
>  package/python-pysftp/python-pysftp.hash |  5 +++++
>  package/python-pysftp/python-pysftp.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-pysftp/Config.in
>  create mode 100644 package/python-pysftp/python-pysftp.hash
>  create mode 100644 package/python-pysftp/python-pysftp.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8ea08739f7..56e8e23221 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1230,6 +1230,7 @@ F:        package/zynq-boot-bin/
>
>  N:     Jared Bents <jared.bents@rockwellcollins.com>
>  F:     package/davici/
> +F:     package/python-pysftp/
>
>  N:     Jarkko Sakkinen <jarkko.sakkinen@intel.com>
>  F:     package/quota/
> diff --git a/package/Config.in b/package/Config.in
> index 2b903140df..8be07d001a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1094,6 +1094,7 @@ menu "External python modules"
>         source "package/python-pyro/Config.in"
>         source "package/python-pyroute2/Config.in"
>         source "package/python-pysendfile/Config.in"
> +       source "package/python-pysftp/Config.in"
>         source "package/python-pysmb/Config.in"
>         source "package/python-pysmi/Config.in"
>         source "package/python-pysnmp/Config.in"
> diff --git a/package/python-pysftp/Config.in b/package/python-pysftp/Config.in
> new file mode 100644
> index 0000000000..06f883f602
> --- /dev/null
> +++ b/package/python-pysftp/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PYSFTP
> +       bool "python-pysftp"
> +       select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
> +       help
> +         A friendly face on SFTP.

Put this text instead:

A simple interface to SFTP. The
module offers high level abstractions and task based routines
to handle your SFTP needs.

> +
> +         https://bitbucket.org/dundeemt/pysftp
> diff --git a/package/python-pysftp/python-pysftp.hash b/package/python-pysftp/python-pysftp.hash
> new file mode 100644
> index 0000000000..75102ab8a5
> --- /dev/null
> +++ b/package/python-pysftp/python-pysftp.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/pysftp/json
> +md5  abc55b7122de3e86f0d547301f4ddf0c  pysftp-0.2.9.tar.gz
> +sha256  fbf55a802e74d663673400acd92d5373c1c7ee94d765b428d9f977567ac4854a  pysftp-0.2.9.tar.gz
> +# Locally computed sha256 checksums
> +sha256  e648e3c7f439b52222a785a590223a0f7bad1a8a5fb89157d80d13123c7dcd25  LICENSE.txt
> diff --git a/package/python-pysftp/python-pysftp.mk b/package/python-pysftp/python-pysftp.mk
> new file mode 100644
> index 0000000000..c4ac070efd
> --- /dev/null
> +++ b/package/python-pysftp/python-pysftp.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pysftp
> +#
> +################################################################################
> +
> +PYTHON_PYSFTP_VERSION = 0.2.9
> +PYTHON_PYSFTP_SOURCE = pysftp-$(PYTHON_PYSFTP_VERSION).tar.gz
> +PYTHON_PYSFTP_SITE = https://files.pythonhosted.org/packages/36/60/45f30390a38b1f92e0a8cf4de178cd7c2bc3f874c85430e40ccf99df8fe7
> +PYTHON_PYSFTP_SETUP_TYPE = setuptools
> +PYTHON_PYSFTP_LICENSE = FIXME: please specify the exact BSD version

The license is BSD-3-Clause

My concern is that the library wasn't updated for a long time and it
is on Bitbucket's Mercurial repository.

Yegor

> +PYTHON_PYSFTP_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(python-package))
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
