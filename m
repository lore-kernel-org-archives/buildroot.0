From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 21:10:22 +0200
Subject: [Buildroot] [PATCH v2 13/17] configs/olpc_xo1: enable JFFS2
 image
In-Reply-To: <20200617104925.1036330-14-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
 <20200617104925.1036330-14-lkundrak@v3.sk>
Message-ID: <20200617211022.79a48a3f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Jun 2020 12:49:21 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> The machine has a NAND flash device and firmware capable of loading the
> OS from a JFFS2 file system on it. Enable creation of JFFS2 image that
> can be written to said flash device.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  configs/olpc_xo1_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/configs/olpc_xo1_defconfig b/configs/olpc_xo1_defconfig
> index 5919f6ab36..36ac051ffb 100644
> --- a/configs/olpc_xo1_defconfig
> +++ b/configs/olpc_xo1_defconfig
> @@ -21,4 +21,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_ROOTFS_EXT2_LABEL="XO1"
>  BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
>  BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O dir_index,^huge_file,^64bit,^extent"
> +BR2_TARGET_ROOTFS_JFFS2=y
> +BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
> +BR2_TARGET_ROOTFS_JFFS2_PAD=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTD=y

This last line is not needed: host-mtd is already a dependency of the
jffs2 filesystem logic, see fs/jffs2/jffs2.mk. So I dropped this last
line.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
