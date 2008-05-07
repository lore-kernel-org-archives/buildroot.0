From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 May 2008 12:20:19 +0200
Subject: [Buildroot] Booting from USB Memory Stick
In-Reply-To: <B44D4D5BF344094DABB900C4E0F6E353016EB1F1A1@srv02.nortechonline.net>
	(Simon Hodgson's message of "Tue\, 6 May 2008 18\:25\:14 +0100")
References: <B44D4D5BF344094DABB900C4E0F6E353016EB1F1A1@srv02.nortechonline.net>
Message-ID: <87ej8e2z6k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Hodgson, Simon <Simon.Hodgson@nortechonline.co.uk> writes:

Hi,

 Simon> The plan is to format the memory stick with ext2 and copy my
 Simon> rootfs onto there. The Kernel will go into the 4MB DataFlash
 Simon> on the board. From u-boot I'll set bootargs so it includes
 Simon> "root=/dev/sda1"

 Simon> Only when I boot the device, it sees the memory stick but
 Simon> doesn't set "/dev/sda1" up.

What do you mean? Don't you have a /dev/sda1 device node on your ext2
file system or does it return -ENODEV when you try to open it?

 Simon> Extract of the relevant Kernel boot output provided below
 Simon> (full text attached):

It takes a while for the kernel to scan for USB sticks and read the
partition table, so it isn't available by the time the kernel tries to
mount the rootfs. You need to add rootdelay=10 (or similar) to your
kernel cmdline.

See http://peter.korsgaard.com/articles/debian-nslu2.php#usb-boot for
details.

-- 
Bye, Peter Korsgaard
