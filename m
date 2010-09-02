From: JNY <jny0@hotmail.com>
Date: Thu, 2 Sep 2010 04:17:36 -0700 (PDT)
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <878w3lx010.fsf@macbook.be.48ers.dk>
References: <29591683.post@talk.nabble.com>
	<878w3lx010.fsf@macbook.be.48ers.dk>
Message-ID: <29603102.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Why don't you just check the image before writing (E.G. on your build
machine)?

/sbin/e2fsck -f output/images/rootfs.ext2
e2fsck 1.41.9 (22-Aug-2009)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
rootfs.ext2: 502/896 files (0.4% non-contiguous), 1453/3744 blocks

If the image is OK, then I guess your problem is either in the copying
or some I/O issue on your flash disk.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot


I don't have a file called rootfs.ext2.  I have the following files:
bzImage
rootfs.i486.tar
rootfs.i486.tar.bz2

If I try to /sbin/e2fsck -f output/images/ any of those, I get:

The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>

Which is pretty much what I'd have expected, as they're mounted files.  What
am I doing wrong.


-- 
View this message in context: http://old.nabble.com/EXT2-fs-error-tp29591683p29603102.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
