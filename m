From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 14:22:41 +0100
Subject: [Buildroot] Unable to create files inside mounted root
	filesystem
In-Reply-To: <1225112903.16248.1281448757@webmail.messagingengine.com> (Adam
	McLaurin's message of "Mon\, 27 Oct 2008 09\:08\:23 -0400")
References: <1225112903.16248.1281448757@webmail.messagingengine.com>
Message-ID: <873aiimau6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam McLaurin <buildroot@irotas.net> writes:

Hi,


 Adam> I hope this is a typical newbie question. I was finally able to
 Adam> create a root filesystem (ext2) with buildroot, and I can mount
 Adam> (-o loop) and chroot into it with no problems.

 Adam> The trouble is that I cannot create any files in the mounted
 Adam> filesystem: / # touch foo touch: foo: No space left on device

That's because genext2fs only creates the file system exactly big
enough for the buildroot files. If you want to have room for more
stuff take a look at the BR2_TARGET_ROOTFS_EXT2_BLOCKS/INODES options:
