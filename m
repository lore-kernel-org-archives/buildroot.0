From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 12:36:43 +0200
Subject: [Buildroot] [PATCH 3/3] [DO NOT MERGE] board/beelink_gs1: add
 root passwd and eth0 auto
In-Reply-To: <20190920190813.21516-4-peron.clem@gmail.com>
References: <20190920190813.21516-1-peron.clem@gmail.com>
 <20190920190813.21516-4-peron.clem@gmail.com>
Message-ID: <fcffd262-0574-4a43-ac7f-ac1e6591862b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/09/2019 21:08, Cl?ment P?ron wrote:
> Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
> ---
>  board/beelink/gs1/rootfs_overlay/etc/network/interfaces | 7 +++++++
>  configs/beelink_gs1_defconfig                           | 2 ++
>  2 files changed, 9 insertions(+)
>  create mode 100644 board/beelink/gs1/rootfs_overlay/etc/network/interfaces
> 
> diff --git a/board/beelink/gs1/rootfs_overlay/etc/network/interfaces b/board/beelink/gs1/rootfs_overlay/etc/network/interfaces
> new file mode 100644
> index 0000000000..0af5845617
> --- /dev/null
> +++ b/board/beelink/gs1/rootfs_overlay/etc/network/interfaces
> @@ -0,0 +1,7 @@
> +# Configure Loopback
> +auto lo
> +iface lo inet loopback
> +
> +# Configure eth0 with DHCP
> +auto eth0
> +iface eth0 inet dhcp

 Doesn't BR2_SYSTEM_DHCP="eth0" work? We do that in a lot of other defconfigs.

 Regards,
 Arnout

> diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
> index ccf4771cc7..4794df7914 100644
> --- a/configs/beelink_gs1_defconfig
> +++ b/configs/beelink_gs1_defconfig
> @@ -3,6 +3,8 @@ BR2_aarch64=y
>  BR2_ARM_FPU_VFPV4=y
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Beelink GS1"
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_TARGET_GENERIC_ROOT_PASSWD="admin"
> +BR2_ROOTFS_OVERLAY="board/beelink/gs1/rootfs_overlay"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/beelink/gs1/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beelink/gs1/genimage.cfg"
> 
