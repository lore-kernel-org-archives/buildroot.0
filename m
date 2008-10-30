From: hartleys <hartleys@visionengravers.com>
Date: Thu, 30 Oct 2008 18:28:38 -0400
Subject: [Buildroot] Question about mdev
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C28ED0@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all!

I have a question about mdev. I hope someone can offer an idea.

I have the mmc_spi.c driver build into my linux kernel. When I first
boot, and a mmc card is installed, it is detected by mdev and I get:

/mnt # ls /dev/mmc* -la
brw-rw----    1 root     disk     179,   0 Oct 30 09:10 /dev/mmcblk0
brw-rw----    1 root     disk     179,   1 Oct 30 09:10 /dev/mmcblk0p1

At this point I can mount it and everything works great.

But, if I eject the card and re-insert it I get:

/mnt # ls /dev/mmc* -la
crw-rw----    1 root     disk     179,   8 Oct 30 09:23 /dev/mmcblk1
crw-rw----    1 root     disk     179,   9 Oct 30 09:23 /dev/mmcblk1p1

Now I can no longer mount the card since it is a character device.

Any ideas why it shows up as a block device at boot, then as a character
device after that?

Thanks,
Hartley
