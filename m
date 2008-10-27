From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 15:28:10 +0100
Subject: [Buildroot] Unable to create files inside mounted root
	filesystem
In-Reply-To: <1225116460.30688.1281460263@webmail.messagingengine.com> (Adam
	McLaurin's message of "Mon\, 27 Oct 2008 10\:07\:40 -0400")
References: <1225112903.16248.1281448757@webmail.messagingengine.com>
	<873aiimau6.fsf@macbook.be.48ers.dk>
	<1225116460.30688.1281460263@webmail.messagingengine.com>
Message-ID: <878wsakt8l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam McLaurin <buildroot@irotas.net> writes:

Hi,

 >> config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 >> int "size in blocks (leave at 0 for auto calculation)"
 >> depends on BR2_TARGET_ROOTFS_EXT2
 >> default 0
 >> 
 >> config BR2_TARGET_ROOTFS_EXT2_INODES
 >> int "inodes (leave at 0 for auto calculation)"
 >> depends on BR2_TARGET_ROOTFS_EXT2
 >> default 0

 Adam> Yep, that was indeed the problem. However, it's not really
 Adam> clear to me how the block size is computed by genext2fs, so
 Adam> it's hard to know exactly how many blocks to allocate. I took a
 Adam> guess at 204088 blocks and 100000 inodes, which is probably
 Adam> overkill but seems to work.

True. Those options are forwarded directly to genext2fs (-b and -N
options), so have a look at the man page of genext2fs for details.

-- 
Bye, Peter Korsgaard
