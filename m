From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 9 Mar 2015 11:16:35 +0100
Subject: [Buildroot] [PATCH] network-manager: bump version to 1.0.0
In-Reply-To: <1425894890-31411-1-git-send-email-vorel@jablocom.com>
References: <1425894890-31411-1-git-send-email-vorel@jablocom.com>
Message-ID: <CAGm1_ktRhZ0930mUF60aiOUbu7jo-6DjcXYp+TQqwVV=_ag6NQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 9, 2015 at 10:54 AM, Petr Vorel <petr.vorel@gmail.com> wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
>
> Dropped 0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch
> (accepted upstream).
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...gerUtils-fix-build-with-toolchains-not-ex.patch | 38 ----------------------
>  package/network-manager/network-manager.mk         |  4 +--
>  2 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/network-manager/0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch

Could you also provide a hash file?

Thanks.

Yegor

> diff --git a/package/network-manager/0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch b/package/network-manager/0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch
> deleted file mode 100644
> index 9286daa..0000000
> --- a/package/network-manager/0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From b8241447e2a910dde57bf5a44a4464d80c87ebca Mon Sep 17 00:00:00 2001
> -From: Peter Korsgaard <peter@korsgaard.com>
> -Date: Mon, 11 Aug 2014 09:37:05 +0200
> -Subject: [PATCH] NetworkManagerUtils: fix build with toolchains not exporting
> - CLOCK_BOOTTIME
> -
> -E.G. uClibc 0.9.33 and earlier.
> -
> -Submitted upstream: https://bugzilla.gnome.org/show_bug.cgi?id=734599
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - src/NetworkManagerUtils.c | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/src/NetworkManagerUtils.c b/src/NetworkManagerUtils.c
> -index aa689ce..fc85b00 100644
> ---- a/src/NetworkManagerUtils.c
> -+++ b/src/NetworkManagerUtils.c
> -@@ -45,6 +45,15 @@
> - #include "nm-posix-signals.h"
> -
> - /*
> -+ * Some toolchains (E.G. uClibc 0.9.33 and earlier) don't export
> -+ * CLOCK_BOOTTIME even though the kernel supports it, so provide a
> -+ * local definition
> -+ */
> -+#ifndef CLOCK_BOOTTIME
> -+#define CLOCK_BOOTTIME 7
> -+#endif
> -+
> -+/*
> -  * nm_ethernet_address_is_valid
> -  *
> -  * Compares an Ethernet address against known invalid addresses.
> ---
> -2.0.0
> -
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 5540bc4..3615c89 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -NETWORK_MANAGER_VERSION_MAJOR = 0.9
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).10.0
> +NETWORK_MANAGER_VERSION_MAJOR = 1.0
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
>  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>  NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>  NETWORK_MANAGER_INSTALL_STAGING = YES
> --
> 1.8.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
