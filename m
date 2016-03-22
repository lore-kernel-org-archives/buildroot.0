From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 22 Mar 2016 12:06:02 +0100
Subject: [Buildroot] [PATCH v3 2/3] python-pexpect: new package
In-Reply-To: <1458642986-32365-3-git-send-email-viktorin@rehivetech.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1458642986-32365-3-git-send-email-viktorin@rehivetech.com>
Message-ID: <CAGm1_ksby2azyYQFoZrHo6EKZyxYhV_25sBMOxtGkp__tJwuDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

On Tue, Mar 22, 2016 at 11:36 AM, Jan Viktorin <viktorin@rehivetech.com> wrote:
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  package/Config.in                        |  1 +
>  package/python-pexpect/Config.in         | 11 +++++++++++
>  package/python-pexpect/python-pexpect.mk | 14 ++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/python-pexpect/Config.in
>  create mode 100644 package/python-pexpect/python-pexpect.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index df01e55..6fc0466 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -686,6 +686,7 @@ menu "External python modules"
>         source "package/python-paho-mqtt/Config.in"
>         source "package/python-pam/Config.in"
>         source "package/python-paramiko/Config.in"
> +       source "package/python-pexpect/Config.in"
>         source "package/python-posix-ipc/Config.in"
>         source "package/python-protobuf/Config.in"
>         source "package/python-psutil/Config.in"
> diff --git a/package/python-pexpect/Config.in b/package/python-pexpect/Config.in
> new file mode 100644
> index 0000000..4d04c01
> --- /dev/null
> +++ b/package/python-pexpect/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_PEXPECT
> +       bool "python-pexpect"
> +       select BR2_PACKAGE_PYTHON_PTYPROCESS
> +       help
> +         Pexpect is a pure Python module for spawning child applications;
> +         controlling them; and responding to expected patterns in their
> +         output. Pexpect works like Don Libes? Expect. Pexpect allows your
> +         script to spawn a child application and control it as if a human
> +         were typing commands.
> +
> +         https://pexpect.readthedocs.org
> diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
> new file mode 100644
> index 0000000..9de7849
> --- /dev/null
> +++ b/package/python-pexpect/python-pexpect.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pexpect
> +#
> +################################################################################
> +
> +PYTHON_PEXPECT_VERSION = 4.0.1
> +PYTHON_PEXPECT_SITE = $(call github,pexpect,pexpect,$(PYTHON_PEXPECT_VERSION))

Please get the package from https://pypi.python.org/pypi/pexpect and
add a hash file.

> +PYTHON_PEXPECT_LICENSE = ISC
> +PYTHON_PEXPECT_LICENSE_FILES = LICENSE
> +PYTHON_PEXPECT_SETUP_TYPE = distutils
> +PYTHON_PEXPECT_DEPENDENCIES = python-ptyprocess

remove this build-time dependency

> +
> +$(eval $(python-package))
> --
> 2.7.0
>
