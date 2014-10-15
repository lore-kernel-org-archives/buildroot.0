From: Jed Evnull <jedevnull@gmail.com>
Date: Wed, 15 Oct 2014 16:58:40 -0400
Subject: [Buildroot] first boot
Message-ID: <CAFo83mF5uCs5ULg-c9pz+9JoXE5e5tBbiYZ3w+db-yEXDxnpgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list,

I;m trying to boot the buildroot system I just built.

qemu-system-arm -M versatilepb -kernel output/images/uImage -drive
file=output/images/rootfs.ext2,if=scsi -append
"root=/home/jeff/buildroot/output/images/filesystem.img
console=ttyAMA0,115200" -serial stdio -net nic,model=smc91c111 -net user

The above command boots in my console then kernel-panics; qemu starts but
remains blank. filesystem.img is a ext4 image built with dd.

VFS: Cannot open root device
"/home/jeff/buildroot/output/images/filesystem.img" or unknown-block(0,0):
error -6
Please append a correct "root=" boot option; here are the available
partitions:
1f00           65536 mtdblock0  (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

My end-goal is simply to compile statically linked programs for arm.

Thanks for any help!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141015/fa9d2cbe/attachment.html>
