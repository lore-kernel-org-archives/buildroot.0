From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 18 Jul 2020 16:27:54 +0200
Subject: [Buildroot] [PATCH 2/4 v5] package/systemd: do not force dbus
 if dbus-broker is available
In-Reply-To: <d9828f5163b5a344b943c70cc69a36bc3b8e8abe.1595072897.git.yann.morin.1998@free.fr>
References: <cover.1595072897.git.yann.morin.1998@free.fr>
 <d9828f5163b5a344b943c70cc69a36bc3b8e8abe.1595072897.git.yann.morin.1998@free.fr>
Message-ID: <CADYdroMeYNXwUdo4adaWwXjuFR-XskT70yUiqXhLHi0oGyav9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sa., 18. Juli 2020 um 13:48 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> dbus-broker fits the bill as a message bus daemon, so only enable the
> original dbus if dbus-broker is not enabled.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index dd3b8c534d..37f9d04850 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -25,7 +25,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>         depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
>         select BR2_PACKAGE_HAS_UDEV
> -       select BR2_PACKAGE_DBUS # runtime dependency only
> +       select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
>         select BR2_PACKAGE_LIBCAP
>         select BR2_PACKAGE_UTIL_LINUX
>         select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> --
> 2.20.1
>

Reviewed-by: Norbert Lange <nolange79@gmail.com>
