From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 Jun 2010 07:33:05 +0300
Subject: [Buildroot] [PATCH] skeleton: remove loopback interface
 configuration from inittab
In-Reply-To: <acc7c503a6179494174d8225e121b23d69a24b61.1275543349.git.baruch@tkos.co.il>
References: <acc7c503a6179494174d8225e121b23d69a24b61.1275543349.git.baruch@tkos.co.il>
Message-ID: <20100607043305.GD14583@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

Ping?
Any comment on this?

baruch

On Thu, Jun 03, 2010 at 08:36:50AM +0300, Baruch Siach wrote:
> The lo interface is marked auto in /etc/network/interfaces, so the
> configuration of the loopback network interface is part of the
> S40network init script. This causes the "RTNETLINK answers: File exists" error
> message to appear at startup time.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../Atmel/root/target_busybox_skeleton/etc/inittab |    2 --
>  .../device/Atmel/root/target_skeleton/etc/inittab  |    2 --
>  target/device/xtensa/skeleton-patch/etc/inittab    |    2 --
>  target/generic/target_busybox_skeleton/etc/inittab |    2 --
>  target/generic/target_skeleton/etc/inittab         |    2 --
>  5 files changed, 0 insertions(+), 10 deletions(-)
> 
> diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/inittab b/target/device/Atmel/root/target_busybox_skeleton/etc/inittab
> index bb18305..b394548 100644
> --- a/target/device/Atmel/root/target_busybox_skeleton/etc/inittab
> +++ b/target/device/Atmel/root/target_busybox_skeleton/etc/inittab
> @@ -24,8 +24,6 @@
>  ::sysinit:/bin/mount -o remount,rw /
>  ::sysinit:/bin/mount -a
>  ::sysinit:/bin/hostname -F /etc/hostname
> -::sysinit:/sbin/ifconfig lo 127.0.0.1 up
> -::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
>  # now run any rc scripts
>  ::sysinit:/etc/init.d/rcS
>  
> diff --git a/target/device/Atmel/root/target_skeleton/etc/inittab b/target/device/Atmel/root/target_skeleton/etc/inittab
> index 69e4df1..2e3b9a4 100644
> --- a/target/device/Atmel/root/target_skeleton/etc/inittab
> +++ b/target/device/Atmel/root/target_skeleton/etc/inittab
> @@ -18,8 +18,6 @@ null::sysinit:/bin/mount -o remount,rw /
>  null::sysinit:/bin/mount -t proc proc /proc
>  null::sysinit:/bin/mount -a
>  null::sysinit:/bin/hostname -F /etc/hostname
> -null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
> -null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
>  # now run any rc scripts
>  ::sysinit:/etc/init.d/rcS
>  
> diff --git a/target/device/xtensa/skeleton-patch/etc/inittab b/target/device/xtensa/skeleton-patch/etc/inittab
> index b336ff6..de3ce70 100644
> --- a/target/device/xtensa/skeleton-patch/etc/inittab
> +++ b/target/device/xtensa/skeleton-patch/etc/inittab
> @@ -18,8 +18,6 @@ null::sysinit:/bin/mount -t proc proc /proc
>  null::sysinit:/bin/mount -o remount,rw /
>  null::sysinit:/bin/mount -a
>  null::sysinit:/bin/hostname -F /etc/hostname
> -null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
> -null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
>  # now run any rc scripts
>  ::sysinit:/etc/init.d/rcS
>  
> diff --git a/target/generic/target_busybox_skeleton/etc/inittab b/target/generic/target_busybox_skeleton/etc/inittab
> index 7c7bf7a..bd3912b 100644
> --- a/target/generic/target_busybox_skeleton/etc/inittab
> +++ b/target/generic/target_busybox_skeleton/etc/inittab
> @@ -24,8 +24,6 @@
>  ::sysinit:/bin/mount -o remount,rw /
>  ::sysinit:/bin/mount -a
>  ::sysinit:/bin/hostname -F /etc/hostname
> -::sysinit:/sbin/ifconfig lo 127.0.0.1 up
> -::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
>  # now run any rc scripts
>  ::sysinit:/etc/init.d/rcS
>  
> diff --git a/target/generic/target_skeleton/etc/inittab b/target/generic/target_skeleton/etc/inittab
> index 2949c91..4be14b8 100644
> --- a/target/generic/target_skeleton/etc/inittab
> +++ b/target/generic/target_skeleton/etc/inittab
> @@ -19,8 +19,6 @@ null::sysinit:/bin/mount -t proc proc /proc
>  null::sysinit:/bin/mkdir -p /dev/pts
>  null::sysinit:/bin/mount -a
>  null::sysinit:/bin/hostname -F /etc/hostname
> -null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
> -null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
>  # now run any rc scripts
>  ::sysinit:/etc/init.d/rcS
>  
> -- 
> 1.7.1
> 

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
