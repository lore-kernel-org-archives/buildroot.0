From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 22 Mar 2016 12:02:38 +0100
Subject: [Buildroot] [PATCH v3 1/3] python-ptyprocess: new package
In-Reply-To: <1458642986-32365-2-git-send-email-viktorin@rehivetech.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1458642986-32365-2-git-send-email-viktorin@rehivetech.com>
Message-ID: <CAGm1_ktY5Ry9SL=XmVj6_q3v+y+Tzr9fNiRF1XKG1uXS7=Vr0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

the patch looks good to me. Below some comments:

On Tue, Mar 22, 2016 at 11:36 AM, Jan Viktorin <viktorin@rehivetech.com> wrote:
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
> index 27db639..df01e55 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -689,6 +689,7 @@ menu "External python modules"
>         source "package/python-posix-ipc/Config.in"
>         source "package/python-protobuf/Config.in"
>         source "package/python-psutil/Config.in"
> +       source "package/python-ptyprocess/Config.in"
>         source "package/python-pyasn/Config.in"
>         source "package/python-pyasn-modules/Config.in"
>         source "package/python-pycli/Config.in"
> diff --git a/package/python-ptyprocess/Config.in b/package/python-ptyprocess/Config.in
> new file mode 100644
> index 0000000..4378943
> --- /dev/null
> +++ b/package/python-ptyprocess/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PTYPROCESS
> +       bool "python-ptyprocess"
> +       help
> +         Launch a subprocess in a pseudo terminal (pty), and interact with
> +         both the process and its pty.
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

There is newer version available 0.5.1

> +PYTHON_PTYPROCESS_SITE = $(call github,pexpect,ptyprocess,$(PYTHON_PTYPROCESS_VERSION))

Please get the package from https://pypi.python.org/pypi/ptyprocess
and add a hash file.

> +PYTHON_PTYPROCESS_LICENSE = ISC
> +PYTHON_PTYPROCESS_LICENSE_FILES = LICENSE
> +PYTHON_PTYPROCESS_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))

Yegor
