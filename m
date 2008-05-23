From: Wayne Keenan <wayne.keenan@gmail.com>
Date: Fri, 23 May 2008 22:33:35 +0100
Subject: [Buildroot] Anyone try simulating their Buildroot-created
	filesystem image in QEMU?
In-Reply-To: <326f33790805231259i2dff338ct54ed1a7a3640df08@mail.gmail.com>
References: <326f33790805231205j302081b1oec193841dac80e0c@mail.gmail.com>
	<c166aa9f0805231244q14df3bdaxce0f87753a5ea2a6@mail.gmail.com>
	<326f33790805231259i2dff338ct54ed1a7a3640df08@mail.gmail.com>
Message-ID: <270858e90805231433x411c6337h79b2e19d2ece71c9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been looking at doing exactly this, and have found the path is trodden.
Based the info via the links below you will need to mount the RFS via NFS as
the ARM QEMU emulation doesnt support IDE/SCSI, well, one type of ARM qemu
doesn't and another one does, please have a read:

http://nepotismia.com/linux/qemu/arm/
http://www.aurel32.net/info/debian_arm_qemu.php

I haven't used the info yet, but am planning todo so this weekend, so
apologies if what I am relaying is out of date and misleading.

Regards
Wayne


On Fri, May 23, 2008 at 8:59 PM, Arun Reddy <reddyac@gmail.com> wrote:

> Hi Andrew,
>
> Thanks for the suggestion. Unfortunately I get the same kernel panic error
> with hda as well. I also build my image with initrd support (in the kernel
> config) and when I tried booting qemu locks up right after uncompressing the
> kernel. I'll play around with it more but in the meantime if any other
> members have any feedback please feel free to respond. Thanks!
>
> On Fri, May 23, 2008 at 12:44 PM, Andrew Dyer <amdyer@gmail.com> wrote:
>
>> On Fri, May 23, 2008 at 2:05 PM, Arun Reddy <reddyac@gmail.com> wrote:
>> > qemu-system-arm -M versatilepb -m 128 -kernel
>> arm-linux-2.6.24.4-20080523.gz
>> > -hda rootfs.arm.ext2 -nographic -append "root=/dev/hda1 console=ttyAMA0"
>>
>> don't know qemu, but it looks to me like you're putting the filesystem
>> image at /dev/hda, but trying to boot the kernel from /dev/hda1 (the
>> one implies a partitioned disk).  try the kernel command line
>> 'root=/dev/hda  ...' instead.
>>
>> --
>> Hardware, n.:
>>  The parts of a computer system that can be kicked.
>>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080523/89b16253/attachment-0001.htm 
