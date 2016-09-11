From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 23:27:01 +0200
Subject: [Buildroot] [PATCH v2 1/5] freescale: genimage: Factorize
 scripts
In-Reply-To: <20160907222912.26002-1-savoundg@gmail.com>
References: <20160709064004.8844-1-savoundg@gmail.com>
 <20160907222912.26002-1-savoundg@gmail.com>
Message-ID: <20160911232701.767e87d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Sep 2016 15:29:08 -0700, Georges Savoundararadj wrote:
> For the boards imx6ulevk, imx6sabresd, mx25pdk, mx51evk, mx53loco,
> warpboard:
> * Replace genimage.cfg with a common Freescale genimage template named
>   genimage.cfg.template because they all use the same layout.  The only
>   difference comes from the device tree blobs.
> * Replace each post-image.sh script with a generic post-image.sh script
>   which is able to generate the right genimage.cfg depending on:
> ** the image type (zImage or uImage) from BR2_LINUX_KERNEL_UIMAGE
> ** the device tree blobs from BR2_LINUX_KERNEL_INTREE_DTS_NAME
> ** the rootfs type (ext2, ext3 or ext4) from BR2_TARGET_ROOTFS_EXT2

This point was not needed: rootfs.ext2 is always the correct image.
Despite its name, it might be an ext2 image, an ext3 image or an ext4
image depending on the configuration. rootfs.ext3 and rootfs.ext4 are
just symbolic links to rootfs.ext2.

So I've dropped the handling of this aspect, and applied your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
