From: jeff angielski <jeff@theptrgroup.com>
Date: Tue, 03 Feb 2009 21:49:55 -0500
Subject: [Buildroot] mksquashfs for big endian
Message-ID: <1233715795.17973.14.camel@penguin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Has anybody been able to get a big endian squashfs filesystem built on a
x86 host (little endian) to run on a powerpc target (big endian)?

When I build the rootfs as big endian, the kernel always fails when it
tries to find the magic number because the bytes are swapped incorrectly
in flash.

If you look in super.c for the squashfs driver in the kernel, it would
seem that Linux always assumes the rootfs is little endian.
	
	sb->s_magic = le32_to_cpu(sblk->s_magic);
	if (sb->s_magic != SQUASHFS_MAGIC) {\
		<fail>
	}

How can this ever work?  

I recall seeing patches proposed for supporting big endian but alas,
they do not appear to have been accepted.

I was just looking for a sanity check to see if somebody else has it
working.

BTW, I am using the DENX 2.6 kernel.

TIA,


-- 
Jeff Angielski
The PTR Group
www.theptrgroup.com
