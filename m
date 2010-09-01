From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 01 Sep 2010 11:53:31 +0200
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <29591683.post@talk.nabble.com> (JNY's message of "Wed, 1 Sep
	2010 02:35:51 -0700 (PDT)")
References: <29591683.post@talk.nabble.com>
Message-ID: <878w3lx010.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "JNY" == JNY  <jny0@hotmail.com> writes:

 JNY> Hi,

 JNY> I keep getting the following error when trying to access files on
 JNY> my target system:

 JNY> EXT2-fs error (device hda1): ext2_lookup: deleteed inode referenced: 31372

 JNY> (the inode reference number changes depending upon what file I'm
 JNY> interrogating)

 JNY> If I try to e2fsck /dev/hda1, I get the following warning:

 JNY> /dev/hda1 is mounted.
 JNY> WARNING!!! Running e2fsck on a mounted filesystem mat cause SEVERE
 JNY> filesystem demage.

 JNY> The device is zeroed with dd before installation, which is done
 JNY> from a USB stick containing the image.  What point is good to
 JNY> e2fsck (before installaion of the image or after)?  How do I
 JNY> unmount hda1 (which is a flash drive, and the only storage device
 JNY> on the system), or should I just do so mounted?

Why don't you just check the image before writing (E.G. on your build machine)?

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
