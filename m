From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 12 May 2017 14:29:54 +0200
Subject: [Buildroot] [PATCH] lsscsi: add new package
In-Reply-To: <20170512121734.24601-1-antonynpavlov@gmail.com>
References: <20170512121734.24601-1-antonynpavlov@gmail.com>
Message-ID: <CAGm1_kutBSs6At8JvZoTsBQbDWQ6iJRSB3z_AHnLXq8+xbVPiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Antony,

On Fri, May 12, 2017 at 2:17 PM, Antony Pavlov <antonynpavlov@gmail.com> wrote:
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> ---
>  package/Config.in        |  1 +
>  package/lsscsi/Config.in |  6 ++++++
>  package/lsscsi/lsscsi.mk | 13 +++++++++++++

You forgot the hash file.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Yegor

>  3 files changed, 20 insertions(+)
>
> diff --git a/package/Config.in b/package/Config.in
> index d57813c5c7..35e047b475 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -423,6 +423,7 @@ endmenu
>         source "package/lirc-tools/Config.in"
>         source "package/lm-sensors/Config.in"
>         source "package/lshw/Config.in"
> +       source "package/lsscsi/Config.in"
>         source "package/lsuio/Config.in"
>         source "package/lvm2/Config.in"
>         source "package/mali-t76x/Config.in"
> diff --git a/package/lsscsi/Config.in b/package/lsscsi/Config.in
> new file mode 100644
> index 0000000000..1c856863a4
> --- /dev/null
> +++ b/package/lsscsi/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LSSCSI
> +       bool "lsscsi"
> +       help
> +         lsscsi - list SCSI devices (or hosts) and their attributes
> +
> +         http://sg.danny.cz/scsi/lsscsi.html
> diff --git a/package/lsscsi/lsscsi.mk b/package/lsscsi/lsscsi.mk
> new file mode 100644
> index 0000000000..f5370b1843
> --- /dev/null
> +++ b/package/lsscsi/lsscsi.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# lsscsi
> +#
> +################################################################################
> +
> +LSSCSI_VERSION = 0.28
> +LSSCSI_SOURCE = lsscsi-$(LSSCSI_VERSION).tgz
> +LSSCSI_SITE = http://sg.danny.cz/scsi
> +LSSCSI_LICENSE = GPLv2
> +LSSCSI_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
