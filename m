From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 14 Mar 2018 08:55:33 +0100
Subject: [Buildroot] [PATCH] Add python-pymodbus
In-Reply-To: <CAChPQeAwwwuAaqHB4+YbmAfphM_E+2CemmJL-uNZuFAK4DjSHQ@mail.gmail.com>
References: <CAChPQeAwwwuAaqHB4+YbmAfphM_E+2CemmJL-uNZuFAK4DjSHQ@mail.gmail.com>
Message-ID: <CAGm1_kuZDHZPUsYVaf7jr2TYpSYsV=GneV0keF6_82J6EDCn+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Falco,

the patch title should be: "python-pymodbus: new package"

Also please resend the patch via git send-email.

On Tue, Mar 13, 2018 at 1:26 PM, Falco Hyfing <hyfinglists@gmail.com> wrote:
> Add python-pymodbus to be used for Modbus operations
>
> Signed-off-by: Falco Hyfing <hyfinglists@gmail.com>
> ---
>  DEVELOPERS                                 |  3 +++
>  package/Config.in                          |  1 +
>  package/python-pymodbus/Config.in          |  5 +++++
>  package/python-pymodbus/python-pymodbus.mk | 12 ++++++++++++

A hash file for the tarball and license file is missing. See
http://nightly.buildroot.org/manual.html#adding-packages-hash

>  4 files changed, 21 insertions(+)
>  create mode 100644 package/python-pymodbus/Config.in
>  create mode 100644 package/python-pymodbus/python-pymodbus.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3df820e..48d3426 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -663,6 +663,9 @@ F:    package/safeclib/
>  F:    package/tinycbor/
>  F:    package/tinydtls/
>
> +N:    Falco Hyfing <hyfinglists@gmail.com>
> +F:    package/python-pymodbus/
> +
>  N:    Floris Bos <bos@je-eigen-domein.nl>
>  F:    package/ipmitool/
>  F:    package/odhcploc/
> diff --git a/package/Config.in b/package/Config.in
> index 449ffcc..a6efa1e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -872,6 +872,7 @@ menu "External python modules"
>      source "package/python-pyinotify/Config.in"
>      source "package/python-pylibftdi/Config.in"
>      source "package/python-pylru/Config.in"
> +    source "package/python-pymodbus/Config.in"
>      source "package/python-pymysql/Config.in"
>      source "package/python-pynacl/Config.in"
>      source "package/python-pyopenssl/Config.in"
> diff --git a/package/python-pymodbus/Config.in
> b/package/python-pymodbus/Config.in
> new file mode 100644
> index 0000000..493ed4e
> --- /dev/null
> +++ b/package/python-pymodbus/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_PYTHON_PYMODBUS
> +    bool "python-pymodbus"
> +    select BR2_PACKAGE_PYTHON_SIX

a "# runtime" is missing after BR2_PACKAGE_PYTHON_SIX

> +    help
> +        Pymodbus is a full Modbus protocol implementation

a dot is missing at the end of the description.

> diff --git a/package/python-pymodbus/python-pymodbus.mk
> b/package/python-pymodbus/python-pymodbus.mk
> new file mode 100644
> index 0000000..5af7803
> --- /dev/null
> +++ b/package/python-pymodbus/python-pymodbus.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# python-pymodbus
> +#
> +################################################################################
> +
> +PYTHON_PYMODBUS_VERSION = v1.4.0
> +PYTHON_PYMODBUS_SITE = $(call
> github,riptideio,pymodbus,$(PYTHON_PYMODBUS_VERSION))
> +PYTHON_PYMODBUS_LICENSE = BSD License

The license file is here
https://github.com/riptideio/pymodbus/blob/master/doc/LICENSE and it
is a BSD-3-Clause license.

Yegor

> +PYTHON_PYMODBUS_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
