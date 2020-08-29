From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 29 Aug 2020 10:14:33 +0300
Subject: [Buildroot] [PATCH 1/1] package/watchdog: new package
In-Reply-To: <20200808214815.1358140-1-alejandro.gonzalez.correo@gmail.com>
References: <20200808214815.1358140-1-alejandro.gonzalez.correo@gmail.com>
Message-ID: <CALFsTFUrqSC7jpQq+5qJ-RFTCbpizo0yi9m0ECrdLXP406YOzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Aug 9, 2020 at 12:48 AM Alejandro Gonz?lez
<alejandro.gonzalez.correo@gmail.com> wrote:
>
> watchdog is a flexible watchdog daemon that improves on the already
> available Busybox watchdog daemon by providing more advanced features,
> like defining custom system status checks and executing repair scripts
> to react upon invariants that don't hold.
>
> Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
> ---
>  package/Config.in              |  1 +
>  package/watchdog/Config.in     | 10 ++++++++++
>  package/watchdog/watchdog.hash |  3 +++
>  package/watchdog/watchdog.mk   | 13 +++++++++++++
>  4 files changed, 27 insertions(+)
when adding a new package, you should add an entry in the DEVELOPERS
file: https://buildroot.org/downloads/manual/manual.html#DEVELOPERS

>  create mode 100644 package/watchdog/Config.in
>  create mode 100644 package/watchdog/watchdog.hash
>  create mode 100644 package/watchdog/watchdog.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index d7e79f4795..768e99d9ed 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2421,6 +2421,7 @@ menu "System tools"
>         source "package/tpm2-totp/Config.in"
>         source "package/unscd/Config.in"
>         source "package/util-linux/Config.in"
> +       source "package/watchdog/Config.in"
>         source "package/xdg-dbus-proxy/Config.in"
>         source "package/xen/Config.in"
>         source "package/xvisor/Config.in"
> diff --git a/package/watchdog/Config.in b/package/watchdog/Config.in
> new file mode 100644
> index 0000000000..bf485034d7
> --- /dev/null
> +++ b/package/watchdog/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_WATCHDOG
> +       bool "watchdog"
> +       depends on BR2_USE_MMU
> +       help
> +         Watchdog is a daemon that periodically pets a watchdog device
> +         if the configured system status checks pass. If they do not,
> +         the daemon may execute repair commands, shutdown the system or
> +         reboot it.
> +
> +         https://sourceforge.net/projects/watchdog/
> diff --git a/package/watchdog/watchdog.hash b/package/watchdog/watchdog.hash
> new file mode 100644
> index 0000000000..7366c1b5e1
> --- /dev/null
> +++ b/package/watchdog/watchdog.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  b8e7c070e1b72aee2663bdc13b5cc39f76c9232669cfbb1ac0adc7275a3b019d  watchdog-5.16.tar.gz
> +sha256  af7f3f94e85080204b37f7c53717a2c94c6b54d7fa516ebd74e008cb4c0391bd  COPYING
> diff --git a/package/watchdog/watchdog.mk b/package/watchdog/watchdog.mk
> new file mode 100644
> index 0000000000..fe95c5c1ff
> --- /dev/null
> +++ b/package/watchdog/watchdog.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# watchdog
> +#
> +################################################################################
> +
> +WATCHDOG_VERSION = 5.16
> +WATCHDOG_SITE = http://downloads.sourceforge.net/sourceforge/watchdog
> +WATCHDOG_AUTORECONF = YES
Why does AUTORECONF is needed?

> +WATCHDOG_LICENSE = GPL-2.0+
> +WATCHDOG_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
> --
> 2.28.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Regards,
Asaf.
