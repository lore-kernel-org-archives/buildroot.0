From: Julien Letessier <julien.letessier@technosens.fr>
Date: Wed, 27 Jun 2007 11:35:02 +0200
Subject: [Buildroot] where is the initrd image?
In-Reply-To: <1497cb6d0706270226o6f86fe31lcfa31ba8d8740982@mail.gmail.com>
References: <mailman.136.1182935450.1099.buildroot@uclibc.org>
	<1497cb6d0706270226o6f86fe31lcfa31ba8d8740982@mail.gmail.com>
Message-ID: <f0528b5b0706270235w2b25920j5f37ec067ae5fbfc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As far as I known there is no support for initrd in buildroot.
And you don't need one for an embedded system!

In desktop distributions, the initrd is used e.g. to load device/filesystem
drivers before mounting the root filesystem (which may reside on a
nonstandard device/filesystem). [1]

In an embedded system, you should include all appropriate drivers in the
kernel itself, so an initrd is useless.
Just compile a proper kernel, and configure grub on your target with e.g.

kernel /boot/bzImage root=/dev/hda1

[1] http://en.wikipedia.org/wiki/Initrd

2007/6/27, Lee JJ <jengjr@gmail.com>:
>
> Dear All Guru :
>
>      I can generate the target achi rootfs , and kernel
> but I can't find the initrd file
>
> Thus I met the booting problem , VFS cannot open root device "hdxx"
>
> Do I nust have the initrd file , or not ?
> If do , how and where to build it ?
>
> Thanks !!
>
> ps: I am using buildroot snapshot , June 23 '07
> and the target archi is i386
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>



-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070627/b68163c2/attachment-0001.htm 
