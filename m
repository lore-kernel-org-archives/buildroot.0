From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 21:18:52 +0200
Subject: [Buildroot] [PATCH 0/9] fs/ext2: cleanups and improvements
In-Reply-To: <cover.1493654310.git.yann.morin.1998@free.fr>
References: <cover.1493654310.git.yann.morin.1998@free.fr>
Message-ID: <20170501211852.6193ab52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 17:58:39 +0200, Yann E. MORIN wrote:

> J Evans (1):
>       ext2: add help text for BR2_TARGET_ROOTFS_EXT2_BLOCKS
> 
> Yann E. MORIN (8):
>       package/mke2img: check nb_blocks is specified
>       package/mke2img: specifying zero inodes means auto
>       fs/ext2: always pass the number of inodes
>       fs/ext2: always pass the label option
>       fs/ext2: allow reserving zero block for root
>       fs/ext2: simplify code
>       package/mke2img: add option to specify block size
>       fs/ext2: add option to specify block size

In general, I find this good. However, it badly conflicts with the
on-going work to move away from mke2img/genext2fs and use mkfs.ext2/3/4
instead.

For example, I believe mkfs.ext2/3/4 will automatically chose a sane
default block size depending on the filesystem size.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
