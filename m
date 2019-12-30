From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 12:24:16 +0100
Subject: [Buildroot] [PATCH] configs/raspberrypi3_qt5we: increase
 filesystem size
In-Reply-To: <20191230100626.1419344-1-thomas.petazzoni@bootlin.com>
References: <20191230100626.1419344-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191230112416.GK26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-12-30 11:06 +0100, Thomas Petazzoni spake thusly:
> The build of raspberrypi3_qt5we_defconfig currently fails because the
> filesystem image size is no longer large enough to contain everything:
> the filesystem image size is 360 MB, but the total filesystem size
> reported by "make graph-size" is 370 MB.
> 
> Let's increase the size to 400 MB for good measure.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/389451889
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/raspberrypi3_qt5we_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
> index 21c5d1dc4c..4e9d782c7c 100644
> --- a/configs/raspberrypi3_qt5we_defconfig
> +++ b/configs/raspberrypi3_qt5we_defconfig
> @@ -43,7 +43,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
>  # Filesystem / image
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_ROOTFS_EXT2_SIZE="360M"
> +BR2_TARGET_ROOTFS_EXT2_SIZE="400M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
