From: Andreas Ziegler <br015@umbiko.net>
Date: Tue, 03 Nov 2020 08:05:56 +0100
Subject: [Buildroot] mkfs.ext4: Could not allocate block in ext2
 filesystem while populating file system
In-Reply-To: <mailman.926.1604348782.66322.buildroot@busybox.net>
References: <mailman.926.1604348782.66322.buildroot@busybox.net>
Message-ID: <fce5af4945c0c4ff18ed7c340d696713@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Subject: [Buildroot] mkfs.ext4: Could not allocate block in ext2
> 	filesystem while populating file system
> Message-ID:
> 	<AM0PR10MB2433AA0D0ED377CB19D8F22A82100@AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM>

Hi Kevin,

Check the hint directly below the error message:

> mkfs.ext4: Could not allocate block in ext2 filesystem while
> populating file system
> *** Maybe you need to increase the filesystem size 
> (BR2_TARGET_ROOTFS_EXT2_SIZE)

Your new root filesystem is larger than the default space in the image, 
which is specified in the buildroot config.

Regards,
Andreas
