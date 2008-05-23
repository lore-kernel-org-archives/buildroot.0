From: Arun Reddy <reddyac@gmail.com>
Date: Fri, 23 May 2008 12:59:38 -0700
Subject: [Buildroot] Anyone try simulating their Buildroot-created
	filesystem image in QEMU?
In-Reply-To: <c166aa9f0805231244q14df3bdaxce0f87753a5ea2a6@mail.gmail.com>
References: <326f33790805231205j302081b1oec193841dac80e0c@mail.gmail.com>
	<c166aa9f0805231244q14df3bdaxce0f87753a5ea2a6@mail.gmail.com>
Message-ID: <326f33790805231259i2dff338ct54ed1a7a3640df08@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrew,

Thanks for the suggestion. Unfortunately I get the same kernel panic error
with hda as well. I also build my image with initrd support (in the kernel
config) and when I tried booting qemu locks up right after uncompressing the
kernel. I'll play around with it more but in the meantime if any other
members have any feedback please feel free to respond. Thanks!

On Fri, May 23, 2008 at 12:44 PM, Andrew Dyer <amdyer@gmail.com> wrote:

> On Fri, May 23, 2008 at 2:05 PM, Arun Reddy <reddyac@gmail.com> wrote:
> > qemu-system-arm -M versatilepb -m 128 -kernel
> arm-linux-2.6.24.4-20080523.gz
> > -hda rootfs.arm.ext2 -nographic -append "root=/dev/hda1 console=ttyAMA0"
>
> don't know qemu, but it looks to me like you're putting the filesystem
> image at /dev/hda, but trying to boot the kernel from /dev/hda1 (the
> one implies a partitioned disk).  try the kernel command line
> 'root=/dev/hda  ...' instead.
>
> --
> Hardware, n.:
>  The parts of a computer system that can be kicked.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080523/0d2ac874/attachment.htm 
