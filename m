From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 00:35:24 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi3_defconfig: fix
 filesystem size
In-Reply-To: <1530264190-9535-1-git-send-email-leon.anavi@konsulko.com>
References: <1530264190-9535-1-git-send-email-leon.anavi@konsulko.com>
Message-ID: <7061b17f-2365-592c-662b-e383f425e03c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-06-18 11:23, Leon Anavi wrote:
> Increase the filesystem size for raspberrypi3 by setting
> BR2_TARGET_ROOTFS_EXT2_SIZE to "120M". The filesystem for
> raspberrypi3_64 has the same size.
> 
> Fixes:
> Copying files into the device: __populate_fs: Could not allocate block in ext2 filesystem while writing file "services"
> mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>

 Applied to master, thanks.

 It's a pity we didn't get to the bottom of why this error was not happening
every time, or why it didn't happen before. But, as mentioned, the fix is simple
and we were close to the limit.

 I've extended the commit log a little bit.

 Regards,
 Arnout

> ---
>  configs/raspberrypi3_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index 856f321..0ef9afe 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -28,6 +28,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
>  # Filesystem / image
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
