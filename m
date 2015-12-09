From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 9 Dec 2015 15:16:36 +0100
Subject: [Buildroot] [PATCH v2 1/3] python-ptyprocess: new package
In-Reply-To: <1449670313-3613-2-git-send-email-viktorin@rehivetech.com>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-2-git-send-email-viktorin@rehivetech.com>
Message-ID: <CAGm1_ktTr7ZfcJXzKkHhkvSHs=6M=kscEon5R2aH1jKFFQP6tQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

On Wed, Dec 9, 2015 at 3:11 PM, Jan Viktorin <viktorin@rehivetech.com> wrote:
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  package/Config.in                              |  1 +
>  package/python-ptyprocess/Config.in            |  7 +++++++
>  package/python-ptyprocess/python-ptyprocess.mk | 13 +++++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 package/python-ptyprocess/Config.in
>  create mode 100644 package/python-ptyprocess/python-ptyprocess.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 2bdad01..69bc347 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -642,6 +642,7 @@ menu "External python modules"
>         source "package/python-posix-ipc/Config.in"
>         source "package/python-protobuf/Config.in"
>         source "package/python-psutil/Config.in"
> +       source "package/python-ptyprocess/Config.in"
>         source "package/python-pyasn/Config.in"
>         source "package/python-pycli/Config.in"
>         source "package/python-pycrypto/Config.in"
> diff --git a/package/python-ptyprocess/Config.in b/package/python-ptyprocess/Config.in
> new file mode 100644
> index 0000000..abf8045
> --- /dev/null
> +++ b/package/python-ptyprocess/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PTYPROCESS
> +       bool "python-ptyprocess"
> +       depends on BR2_PACKAGE_PYTHON

setup.py says, that this package can run under Python 3 too. So remove
this dependency.

> +       help
> +         Launch a subprocess in a pseudo terminal (pty), and interact with both the process and its pty.

Line too long.

> +
> +         https://github.com/pexpect/ptyprocess
> diff --git a/package/python-ptyprocess/python-ptyprocess.mk b/package/python-ptyprocess/python-ptyprocess.mk
> new file mode 100644
> index 0000000..9e6b762
> --- /dev/null
> +++ b/package/python-ptyprocess/python-ptyprocess.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-ptyprocess
> +#
> +################################################################################
> +
> +PYTHON_PTYPROCESS_VERSION = 0.5
> +PYTHON_PTYPROCESS_SITE = $(call github,pexpect,ptyprocess,$(PYTHON_PTYPROCESS_VERSION))
> +PYTHON_PTYPROCESS_LICENSE = ISC
> +PYTHON_PTYPROCESS_LICENSE_FILES = LICENSE
> +PYTHON_PTYPROCESS_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> --
> 2.6.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
