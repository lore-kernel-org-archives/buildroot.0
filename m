From: Adam McLaurin <buildroot@irotas.net>
Date: Mon, 27 Oct 2008 10:07:40 -0400
Subject: [Buildroot] Unable to create files inside mounted root
	filesystem
In-Reply-To: <873aiimau6.fsf@macbook.be.48ers.dk>
References: <1225112903.16248.1281448757@webmail.messagingengine.com>
	<873aiimau6.fsf@macbook.be.48ers.dk>
Message-ID: <1225116460.30688.1281460263@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Oct 2008 14:22:41 +0100, "Peter Korsgaard"
<jacmet@uclibc.org> said:
> That's because genext2fs only creates the file system exactly big
> enough for the buildroot files. If you want to have room for more
> stuff take a look at the BR2_TARGET_ROOTFS_EXT2_BLOCKS/INODES options:
> 
> From target/ext2/Config.in:
> 
> config BR2_TARGET_ROOTFS_EXT2_BLOCKS
>         int "size in blocks (leave at 0 for auto calculation)"
>         depends on BR2_TARGET_ROOTFS_EXT2
>         default 0
> 
> config BR2_TARGET_ROOTFS_EXT2_INODES
>         int "inodes (leave at 0 for auto calculation)"
>         depends on BR2_TARGET_ROOTFS_EXT2
>         default 0

Yep, that was indeed the problem. However, it's not really clear to me
how the block size is computed by genext2fs, so it's hard to know
exactly how many blocks to allocate. I took a guess at 204088 blocks and
100000 inodes, which is probably overkill but seems to work.

Anyway, thanks for the advice!

-Adam
