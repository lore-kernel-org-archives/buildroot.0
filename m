From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 15 Feb 2018 15:54:52 -0600
Subject: [Buildroot] [PATCH 2/2] modem-manager: Update to version 1.7.990
In-Reply-To: <1518727506-15403-2-git-send-email-jared.bents@rockwellcollins.com>
References: <1518727506-15403-1-git-send-email-jared.bents@rockwellcollins.com>
 <1518727506-15403-2-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <CANQCQpYhsMNWTWJO0M-0_06H6ZrN7N3-XkS4vHNgVF4x3phTuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jared,

On Thu, Feb 15, 2018 at 2:45 PM, Jared Bents
<jared.bents@rockwellcollins.com> wrote:
> Update to modem manager 1.7.990 which does not require
> udev.  Added option to build without udev but if udev
> exists in the build, it will default to build with
> libgudev.
>
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/modem-manager/Config.in          | 12 +++++++++---
>  package/modem-manager/modem-manager.hash |  2 +-
>  package/modem-manager/modem-manager.mk   | 11 +++++++++--
>  3 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index 8e995b4..38e017b 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -1,12 +1,10 @@
>  config BR2_PACKAGE_MODEM_MANAGER
>         bool "modemmanager"
> -       depends on BR2_PACKAGE_HAS_UDEV
>         depends on BR2_USE_WCHAR # libglib2 and gnutls
>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>         depends on BR2_USE_MMU # dbus
>         select BR2_PACKAGE_DBUS # runtime dependency
>         select BR2_PACKAGE_LIBGLIB2
> -       select BR2_PACKAGE_LIBGUDEV
>         help
>           ModemManager is a DBus-activated daemon which controls mobile
>           broadband (2G/3G/4G) devices and connections.
> @@ -26,9 +24,17 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
>         select BR2_PACKAGE_LIBQMI
>         help
>           This option enables support for QMI protocol
> +
> +config BR2_PACKAGE_MODEM_MANAGER_UDEV
> +       bool "Use udev"
> +       default y if BR2_PACKAGE_HAS_UDEV
> +       select BR2_PACKAGE_LIBGUDEV
> +       help
> +         This option allows support for builds without udev. If udev
> +         is not included, say N.
>  endif
>
> -comment "modemmanager needs udev /dev management and a toolchain w/ wchar, threads"
> +comment "modemmanager needs /dev management and a toolchain w/ wchar, threads"
>         depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>                 !BR2_PACKAGE_HAS_UDEV
>         depends on BR2_USE_MMU
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index bc08044..52cc7a6 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  bc74326fa69ae8012f806e235f3d296144922669b952d4d4987dd0af645d5f68  ModemManager-1.6.10.tar.xz
> +sha256  d465094fc6fc173354f5a00d212049056829cc245d60a9083f3c53f86a8f90ec  ModemManager-1.7.990.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB


Please check these license hash didn't change.

Matt
