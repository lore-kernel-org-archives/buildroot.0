From: Jeff Tchang <jeff.tchang@gmail.com>
Date: Sun, 23 Aug 2020 10:43:43 -0700
Subject: [Buildroot] Unable to bake in an initramfs filesystem into kernel
 image
Message-ID: <CAG+zT3rM=eaW6oykBgiVdPd4fnZF=efbgBok6Q8WCy2QQ2EnDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using an older buildroot version (2016.02) and was wondering if there
was an issue building an embedded initramfs filesystem into the kernel
image.

I am able to build an image and boot from it but I get

[    0.000000] Initrd not found or empty - disabling initrd

in the kernel log. This leads to me to believe that my image does not have
any initramfs root filesystem in it. I run mkimage to verify and it looks
like it doesn't:

# mkimage -l output/images/uImage.lzma

Image Name:   Linux-3.10.14

Created:      Sun Aug 23 16:22:20 2020

Image Type:   MIPS Linux Kernel Image (lzma compressed)

Data Size:    2488545 Bytes = 2430.22 kB = 2.37 MB

Load Address: 80010000

Entry Point:  80467a30


My expectation here is that I would see multiple images.

I did a make linux-dirclean and make again after tweaking a few things and
still got roughly the same output. My defconfig is here:
https://gist.github.com/tachang/136da666e5cf650e14be7bbca0069465

I do see output that says

>>>   Rebuilding kernel with initramfs


so not sure what is going on here. Do I need to pass in a kernel command
line to make sure the kernel reads the initramfs from the one baked in?

I am using busybox as the /init file. I have tried specifying the directory
where I have the initramfs root, manually cpio'ing it up and passing that
file, and also just telling buildroot to embed the rootfs into the image.

Kernel boot log is also in the Github gist.

-Jeff
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200823/b6d601bc/attachment.html>
