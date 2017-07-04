From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 00:41:26 +0200
Subject: [Buildroot] [PATCH v5 2/5] fs/ext2: use mkfs to generate rootfs
 image
In-Reply-To: <20170704144729.19753-3-s.martin49@gmail.com>
References: <20170704144729.19753-1-s.martin49@gmail.com>
 <20170704144729.19753-3-s.martin49@gmail.com>
Message-ID: <20170705004126.6659097b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 16:47:26 +0200, Samuel Martin wrote:
> From: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> mkfs is now capable of generating rootfs images. Use mkfs instead of
> genext2fs.
> 
> If not set, we now let mkfs calculate the block size and the number of
> inodes needed.
> 
> This change also adjusts the options to meet those of mkfs.
> 
> Notes:
> * Passing a null inode number to mkfs triggers its automatic calculation.
> * Passing a fs-size with no unit suffix to mkfs is interpreted as using
>   1K block size.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> changes v4->v5:
> - remove BR2_TARGET_ROOTFS_EXT2_BLOCKS renaming
> - update commit log

I've made the minor improvement suggested by Arnout: passing
PATH=$(BR_PATH) is no longer needed, and instead mkfs.ext is called
directly using its $(HOST_DIR)/usr/sbin/ path.

Applied to master with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
