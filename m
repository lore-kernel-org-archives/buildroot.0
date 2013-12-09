From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 15:29:59 +0100
Subject: [Buildroot] [PATCH 29/38] python-versiontools: new package
In-Reply-To: <1386540907-7242-30-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386540907-7242-30-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWPD10K2ABF3tV5Z-Dkg9EiK06=g5x9en74-VOM1d9Cug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 8, 2013 at 11:14 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> From: Ludovic Desroches <ludovic.desroches@atmel.com>
>
> [Thomas: convert to the Python package infrastructure, added license
> informations.]
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Config.in                                  |  1 +
>  package/python-versiontools/Config.in              |  7 +++++++
>  package/python-versiontools/python-versiontools.mk | 13 +++++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 package/python-versiontools/Config.in
>  create mode 100644 package/python-versiontools/python-versiontools.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 42c5fc8..5f29c54 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -405,6 +405,7 @@ source "package/python-pyzmq/Config.in"
>  source "package/python-serial/Config.in"
>  source "package/python-setuptools/Config.in"
>  source "package/python-thrift/Config.in"
> +source "package/python-versiontools/Config.in"
>  endmenu
>  endif
>  source "package/python3/Config.in"
> diff --git a/package/python-versiontools/Config.in b/package/python-versiontools/Config.in
> new file mode 100644
> index 0000000..cb260c1
> --- /dev/null
> +++ b/package/python-versiontools/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_VERSIONTOOLS
> +       bool "python-versiontools"
> +       depends on BR2_PACKAGE_PYTHON
> +       help
> +         Smart replacement for plain tuple used in __version__.
> +
> +         https://pypi.python.org/pypi/versiontools
> diff --git a/package/python-versiontools/python-versiontools.mk b/package/python-versiontools/python-versiontools.mk
> new file mode 100644
> index 0000000..72a1d43
> --- /dev/null
> +++ b/package/python-versiontools/python-versiontools.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-versiontools
> +#
> +################################################################################
> +
> +PYTHON_VERSIONTOOLS_VERSION = 1.9.1
> +PYTHON_VERSIONTOOLS_SOURCE  = versiontools-$(PYTHON_VERSIONTOOLS_VERSION).tar.gz
> +PYTHON_VERSIONTOOLS_SITE    = http://pypi.python.org/packages/source/v/versiontools/

Same comment about extra spaces for alignment.
