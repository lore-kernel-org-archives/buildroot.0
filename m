From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 11 Feb 2014 09:50:04 +0100 (CET)
Subject: [Buildroot] How to get the kernel to mount a rootfs without an
 initramfs ??
In-Reply-To: <52F9EFD9020000460004A79F@gwia2.rz.hs-offenburg.de>
Message-ID: <926191700.5269400.1392108603609.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Mail original -----
> 
> Hi everyone,
> 
> I think this is a rather easy question, yet I couldn't find any
> helpful information about it in the Internet and I'm a bit clueless
> how to solve it.
> 

This is no way buildroot specific, it's a generic linux question but i'll
try to answer anyway...

> When generating an Image based on initramfs everything works fine, my
> embedded device boots as it supposed to be. But I'd like to use
> separate files of the rootfs and the kernel.
> 
> Well the question is: how can I tell the kernel to boot without an
> initramfs but instead with a particular rootfs (e.g.
> rootfstype=squashfs) located on a SD card, same as the kernel itself
> ?
> 

since you are mentionning booting from the SD where the kernel already
is i'll assume you are using a raspberry pi. 

Most systems are not able to boot from a SD (which is already a rather 
complex peripheral so the hardwired boot firmware of CPU is not able
to boot it. You need to first load something like U-Boot on most
machines to deal with it)

The generic answer is "details about finding the position of the rootfs
are given to the kernel via its command line"

in the case of the raspberry, the command line is cmdline.txt file in
your fat partition. in my case the following section tells the kernel
where to find it root filesystem


root=/dev/mmcblk0p2 rootwait


I made a few assumptions about your setup so this mail could be
completely useless to you, but I still hope it helps :)

> I can't think that this is too tricky.
> 
> Thanks for the support
> 
> Kind regards
> 
> Frank
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
