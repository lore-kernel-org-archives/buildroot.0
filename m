From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 14:31:36 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch yem-ext234
In-Reply-To: <cover.1362693453.git.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
Message-ID: <20130310143136.15eb1320@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  7 Mar 2013 23:04:37 +0100, Yann E. MORIN wrote:

> This patch series enhances the ext2 fs backend to also build ext3 and ext4
> filesystems, and differentiate between ext2 rev0 and ext2 rev1 filesystems.
> 
> This patch series is based on the previously-sent 'yem-host-image-tools'
> pull-request, and requires changes in that series.

I just tested this with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
# BR2_TARGET_ROOTFS_TAR is not set

and building the ext4 image fails:

tune2fs 1.42.7 (21-Jan-2013)

Please run e2fsck on the filesystem.

Creating journal inode: 
Journal size too big for filesystem.
make: *** [/home/thomas/projets/buildroot/output/images/rootfs.ext4] Erreur 1

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
