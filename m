From: Juha Lumme <juha.lumme@gmail.com>
Date: Mon, 18 Mar 2013 15:45:49 +0900
Subject: [Buildroot] Creating JFFS2 rootfs to SPI flash,
	and mounting it from kernel
Message-ID: <CAF-Ht3xbVBXzdjL5Jc9eC6XrswaA8MjQ2Jy9apFG29tMJNEs_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Sorry for asking not directly buildroot question, but I thought this forum
would have many members who knows answer to this one.
In my project, I'm trying to migrate my file system to spi flash from
memory card, and I seem to have created filesystem image successfully. I
want my rootfs to be read-only to avoid corruption issues, and only have
application files reside on a writable file system.
(Buildroot was creating a working filesystem for memory card, and I
reconfigured it also to create JFFS2-one, and it did as told).

My question is how to move forward from here, I seem to have several gaps
in my knowledge now.

1) My board is described in dtb file, so is it correct to assume that I
should also describe my flash layout there under the SPI section for the
flash ?
My planned layout is something like this (please ignore the addresses
themselves):
0x0 - 0x9 u-boot
0x10 - 0x19 kernel
0x20 - 0x29 root fs
0x30 - 0x39 /home

2) Currently I am passing the partition info on the memory card to the
kernel from u-boot (noinitrd console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw
rootwait).
Can I now change this to: "noinitrd console=ttyAMA0,115200 root=/dev/mtdblock2
rootfstype=jffs2 ro rootwait" ?
I'm thinking the block2 is since block 0 is u-boot and 1 would be kernel ?
ro instead of rw since I don't want to write to root fs.
Or does that make any sense ? What would you recommend me to do ? Is JFFS2
a good idea ? Should I consider RAMFS for root file system ?

3) Where can I tell my kernel to mount /home as a separate file system ? I
would like that one to be read write, but I only rarely need to save
configuration files there... What would be a good idea with this ?

Thank you for any suggestions, and once again, sorry for using this mailing
list for kernel configuration related question, but I thought many people
here would be well versed in this type of configuration.

Juha
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130318/4d563c9a/attachment.html>
