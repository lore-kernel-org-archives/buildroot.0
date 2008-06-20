From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Jun 2008 21:32:25 +0200
Subject: [Buildroot] can't find root fs kernel panic
In-Reply-To: <485BC6AC.1090301@acsatlanta.com> (Joseph G. Boike's message of
	"Fri\, 20 Jun 2008 10\:03\:08 -0500")
References: <mailman.1147.1213963958.1345.buildroot@uclibc.org>
	<485BC6AC.1090301@acsatlanta.com>
Message-ID: <87bq1v2986.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joseph" == Joseph G Boike <joe.boike@acsatlanta.com> writes:

 Joseph> I'm hoping someone can help me with this.
 Joseph> I'm using this morning buildroot (How do I determine the rev #?)

type svn info

 Joseph> Built for an Atmel at91sam9260 processor and eval board.
 Joseph> I've tried using the ext2, ext2.gz and jffs root filesystems
 Joseph> with the same results.

<cut>

 Joseph> Kernel command line: mem=64M console=ttyS0,115200 
 Joseph> initrd=0x20410000,3145728 root=/dev/ram0 rw

What do you want to do? With jffs2 it sounds like you want to boot
from a flash partition, but you tell the kernel to boot from a ramdisk
(initrd).

-- 
Bye, Peter Korsgaard
