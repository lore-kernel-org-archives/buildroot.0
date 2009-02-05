From: John Voltz <john.voltz@gmail.com>
Date: Thu, 5 Feb 2009 06:39:11 -0500
Subject: [Buildroot] buildroot Digest, Vol 32, Issue 12
In-Reply-To: <889327.65678.qm@web58205.mail.re3.yahoo.com>
References: <46a136670902040433h6bb7e883mc295b6a3fce75fb9@mail.gmail.com>
	<889327.65678.qm@web58205.mail.re3.yahoo.com>
Message-ID: <46a136670902050339v7a55231ei1bcbe6b37e58c891@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
> I did hit another snag. At the end of the script is:
> # Install GRUB
>     /sbin/grub --no-floppy --batch <<EOT
>     device (hd0) ${IMAGE}
>     geometry (hd0) ${CYLINDERS} 16 63
>     root (hd0,0)
>     setup (hd0)
>     quit
>     EOT
>
> What does this do? what is (hd0)? What is the context I need to run this?
> It looks like it runs the host's grub? I don't want to install grub in my
> host's boot directory, but in the new "image" is that what this does?
>

Yes, it uses the host's grub, but it  needs you to build grub so that the
/boot/grub directory and it's contents get installed in the rootfs. It's
hackish I know, but I don't know if there is any other way to install the
buildroot generated grub. Maybe someone else does? hd0 is hard disk zero, in
image file ${IMAGE}.

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090205/3608e79c/attachment.htm>
