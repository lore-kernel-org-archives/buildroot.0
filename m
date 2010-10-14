From: Abhishek Ashtekar <Abhishek.Ashtekar@ubitronix.com>
Date: Thu, 14 Oct 2010 12:59:52 +0200
Subject: [Buildroot] VFS: Cannot open root device "mtd ...
In-Reply-To: <4CB6D740.8030105@visionsystems.de>
References: <0C11C5BF0B29FD43A8D0250F711D497F7F663977FF@ex01-ubitronix.ubitronix.local>
	<4CB6D740.8030105@visionsystems.de>
Message-ID: <0C11C5BF0B29FD43A8D0250F711D497F7F66397800@ex01-ubitronix.ubitronix.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hallo Yegor,

Thanks for Your reply.

Boardfile that I am using is at91sam9260ek_defconfig.

In the file -->
output/build/linux2.6.34.1/arch/arm/mach-at91/board-sam9260ek.c

The name is mentioned as "Partition 1" and "Partition 2" for the MTD partition.

I have not altered this file

Specifying it as /dev/Partition 1 in the uboot env.... it takes it as Partition

Partition1 gives the same errors.

What should be the next try ?

Thanks and Regards,
abhiash

-----Original Message-----
From: Yegor Yefremov [mailto:yegor_sub1 at visionsystems.de]
Sent: Donnerstag, 14. Oktober 2010 12:11
To: Abhishek Ashtekar
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] VFS: Cannot open root device "mtd ...

> I am new to buildroot and this group
> I am working with the at91sam9260ek board and NAND Flash
>
> Currently I am able to compile using buildroot kernel - Linux 2.6.34.1
>
> I flashed the uImage at 0x200000 and root.jffs2 at 0x400000
> Also the uboot, uboot.env at 0x20000 and 0x60000 from the demo along with the at91bootstrap
>
>
>
> When I boot, I get the following erroneous response
>
> rtc-at91sam9 at91_rtt.0: hctosys: unable to read the hardware clock
>
> VFS: Cannot open root device "mtdblock0" or unknown-block(0,0)
>
> Please append a correct "root=" boot option; here are the available partitions:
>
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
>
>
>
> I tried with more numbers to mtdblock0/1/4 and mtd 0/1/4 etc
>
> Still I get the same error.
>
>
>
>              VFS: Cannot open root device "mtd0" or unknown-block(0,0)
>
>
> For info:
> bootcmd=nand read 0x22200000 0x00200000 0x00168CF8; bootm 0x22200000
>
> I also have made the mentioned changes in the at91sam9260ek_defconfig file for NAND ...
>
> CONFIG_MTD=y
> CONFIG_MTD_PARTITIONS=y
> CONFIG_MTD_CHAR=y
> CONFIG_MTD_BLOCK=y
> CONFIG_MTD_NAND=y
> CONFIG_MTD_NAND_YOURBOARD=y
> CONFIG_JFFS2_FS=y
> CONFIG_JFFS2_FS_DEBUG=0
> CONFIG_JFFS2_FS_NAND=y
>
>
>
> And of course ? setenv bootargs 'mem=64M console=ttyS0,115200 root=/dev/name_of_block_device rw rootfstype=jffs2'
>
>
> I cannot find my way out ....
> If any idea, then do let me know
>
> Thanks a lot.
> abhiash

Please provide your partition table as it is defined in kernel: arch/arm/mach-at91/board-sam9260ek.c
Have you altered this file? Or what board file you're using?

Complete bootlog were also good.

Best regards,
Yegor

--
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



__________ Hinweis von ESET NOD32 Antivirus, Signaturdatenbank-Version 5515 (20101008) __________

E-Mail wurde gepr?ft mit ESET NOD32 Antivirus.

http://www.eset.com



__________ Hinweis von ESET NOD32 Antivirus, Signaturdatenbank-Version 5515 (20101008) __________

E-Mail wurde gepr?ft mit ESET NOD32 Antivirus.

http://www.eset.com
