From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 18 Mar 2013 11:30:18 +0100
Subject: [Buildroot] [PATCH 5/5] libcanfestival: new package
In-Reply-To: <2e13931db1a39313732a16c48f923eb4445dc3d3.1363063832.git.s.martin49@gmail.com>
References: <cover.1363063832.git.s.martin49@gmail.com>
 <2e13931db1a39313732a16c48f923eb4445dc3d3.1363063832.git.s.martin49@gmail.com>
Message-ID: <CAGm1_kt5bYhGnY1QZghkvFKhJUm610srDdfvcpS4pr0tfHFuYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 12, 2013 at 5:58 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Cc: Eric Jarrige <eric.jarrige@armadeus.org>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> Changes since v1:
> - clean/fix *.mk
> ---
>  package/Config.in                                  |   1 +
>  package/libcanfestival/Config.in                   |  90 +++
>  .../libcanfestival-allow-to-set-DESTDIR.patch      | 717 +++++++++++++++++++++
>  package/libcanfestival/libcanfestival.mk           |  43 ++
>  4 files changed, 851 insertions(+)
>  create mode 100644 package/libcanfestival/Config.in
>  create mode 100644 package/libcanfestival/libcanfestival-allow-to-set-DESTDIR.patch
>  create mode 100644 package/libcanfestival/libcanfestival.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 7d66b75..edfd4c4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -495,6 +495,7 @@ endmenu
>
>  menu "Networking"
>  source "package/glib-networking/Config.in"
> +source "package/libcanfestival/Config.in"
>  source "package/libcgi/Config.in"
>  source "package/libcgicc/Config.in"
>  source "package/libcurl/Config.in"
> diff --git a/package/libcanfestival/Config.in b/package/libcanfestival/Config.in
> new file mode 100644
> index 0000000..0be45cf
> --- /dev/null
> +++ b/package/libcanfestival/Config.in
> @@ -0,0 +1,90 @@
> +config BR2_PACKAGE_LIBCANFESTIVAL
> +       bool "CanFestival"
> +       help
> +         CanFestival is an OpenSource CANOpen framework, licensed with GPLv2
> +         and LGPLv2.
> +
> +         http://www.canfestival.org
> +
> +if BR2_PACKAGE_LIBCANFESTIVAL
> +
> +config BR2_PACKAGE_LIBCANFESTIVAL_NBMMAXCAN
> +       string "Number of can bus to use"
> +       default "4"
> +
> +choice
> +       prompt "Driver to use"
> +       default BR2_PACKAGE_LIBCANFESTIVAL_SOCKET
> +
> +config BR2_PACKAGE_LIBCANFESTIVAL_ANAGATE_LINUX
> +       bool "anagate_linux"
> +       help
> +         AnaGate CAN(duo) driver for linux
> +
> +config BR2_PACKAGE_LIBCANFESTIVAL_PEAK_LINUX
> +       bool "peak_linux"
> +       help
> +         Linux build host installed Peak driver and library
> +
> +         http://www.peak-system.com/linux/
> +
> +config BR2_PACKAGE_LIBCANFESTIVAL_VIRTUAL
> +       bool "virtual"
> +       help
> +         Unix pipe based virtual can driver
> +
> +config BR2_PACKAGE_LIBCANFESTIVAL_VIRTUAL_KERNEL
> +       bool "virtual_kernel"
> +       help
> +         Kernel module virtual can driver
> +
> +config BR2_PACKAGE_LIBCANFESTIVAL_SOCKET
> +       bool "socket"
> +       help
> +         Socket-can

s/Socket-can/SocketCAN

Yegor
