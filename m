From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Oct 2011 23:55:50 +0200
Subject: [Buildroot] error building kernel with initramfs
In-Reply-To: <1318027748.4647.3.camel@bender> (Sven Neumann's message of "Sat, 
 08 Oct 2011 00:49:08 +0200")
References: <1318027748.4647.3.camel@bender>
Message-ID: <877h4ff8rd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> if you select gzip compression for the rootfs.cpio file
 Sven> (BR2_TARGET_ROOTFS_CPIO_GZIP), then the rebuild of the kernel with
 Sven> initramfs is going to fail:

Odd, that's not what I'm seeing here.

in fs/common.mk the compression stuff is handled by creating the
compressed variant IN ADDITION to the uncompressed file, E.G.:

gzip -9 -c /home/peko/source/buildroot/test/images/rootfs.cpio > \
     /home/peko/source/buildroot/test/images/rootfs.cpio.gz

So output/images/rootfs.cpio still exists when the kernel is rebuilt.

-- 
Bye, Peter Korsgaard
