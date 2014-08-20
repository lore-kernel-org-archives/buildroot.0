From: lee choon gay <choongay@yahoo.com>
Date: Wed, 20 Aug 2014 04:37:12 -0700
Subject: [Buildroot] About i386 Architecture and Grub2
Message-ID: <1408534632.82498.YahooMailNeo@web141703.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.
I use buildroot-2014.05.tar.gz to build Linux version 3.14.4 for i386 architecture.
I am able to boot up the code using Grub2 on my PC.
That is the case if I use initrd /boot/rootfs.cpio.
My grub.cfg is as follow.

set default="0"
set timeout="0"

menuentry "any name" {
????????? Linux /boot/bzImage root=/dev/sda console=tty1
????????? initrd /boot/rootfs.cpio
????????? }

But the data is not persistent, anything that I save will be gone after reboot.
I am looking for method to make the data persistent (no?ram file system).
I try to boot up the code without using rootfs.cpio as follow.
The code won't boot up.

set default="0"
set timeout="0"

menuentry "any name" {
????????? Linux /boot/bzImage root=/dev/sda2 noinitrd?console=tty1
????????? }

For your info, I use pendrive for this.
And the bzImage and rootfs.cpio is located in partition 1 boot folder.
File system is located in partition 2.

Hope I can get some?help here.
Thank you very much. :)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140820/9bd608b2/attachment.html>
