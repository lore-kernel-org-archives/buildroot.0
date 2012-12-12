From: Ted Wood <ted@fgh.co.uk>
Date: Wed, 12 Dec 2012 16:12:49 -0000
Subject: [Buildroot] Getting It into Compact Flash
Message-ID: <000901cdd883$889a6e70$99cf4b50$@co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK Next question:

 

I've built a kernel image and a file system image.

 

I've manually installed Grub 2 and a grub.cfg file which looks like this:

 

menuentry 'Buildroot'

{

set root='(hd0,msdos1)'

echo 'Loading Kernel')

linux /boot/bzimage

echo 'Loading Root FS'

initrd /boot/rootfs.ext2

}

 

It starts up OK, loads the kernel and uncompresses it.

It mounts sda and sda1

Then "No filesystem could mount root, tried ext3 vfat msdos iso9660"

 

I've tried it with various different types of filesystem image (iso9660,
cramfs, ext2) and they all fail in a similar way...

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121212/33ed9ecd/attachment.html>
