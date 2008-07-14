From: Leonardo Giordano <lgiordano@gmail.com>
Date: Mon, 14 Jul 2008 10:02:41 -0300
Subject: [Buildroot] Simple buildroot question
Message-ID: <487B4E71.8010102@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,
I have compiled a toolchain using buildroot without trouble. I am 
testing it with qemu using:
qemu -hda rootfs.i386.ext2 -kernel linux-kernel-2.6.25.6-i386 -append 
"root=/dev/hda"
and it works fine.
Now, I am trying to copy it to a compact flash to test it in my target 
hardware (a small pc, which can boots from CF, for instance with DOS). 
Then, I have the following quesitons:
1) How/what should I copy to the CF?
I created just one partition on CF, and then I did:
dd if=rootfs.i386.ext2 of=/dev/sdb1
where /dev/sdb1 is the partition on CF.
Then when I mount it, I can see the file system has been copied.
Is that ok?

2) Make it bootable
When I try to boot from it, it doesn't. It makes sense because I haven't 
installed a bootloader. Then I checked the 'grub' option at menuconfig 
from buildroot and re-build it fine. However I dont know how to make 
grub work (who writes the MBR?). Maybe this is a grub question, but I am 
sure someone in this mailing list can help.

I am not a linux expert, so maybe the solution is just there but I can't 
see it!

Anyway, my congratulations to the buildroot team.
Regards,
