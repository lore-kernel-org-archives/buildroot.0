From: Alex Hildebrand <alexander.hildebrand@googlemail.com>
Date: Mon, 19 Feb 2018 22:59:34 +0100
Subject: [Buildroot] Read only rootfs with writable (aufs) overlay
In-Reply-To: <87zi44hcuj.fsf@dell.be.48ers.dk>
Message-ID: <5a8b48c6.06581c0a.8860b.c092@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So switch_root does not work when used without an initramfs? Tried it directly from my read only rootfs but it does not change the root...
Is this the same with in-kernel overlayfs?
-------- Urspr?ngliche Nachricht --------Von: Peter Korsgaard <peter@korsgaard.com> Datum: 19.02.18  22:46  (GMT+01:00) An: Alex Hildebrand <alexander.hildebrand@googlemail.com> Cc: buildroot at buildroot.org Betreff: Re: Read only rootfs with writable (aufs) overlay 
>>>>> "Alex" == Alex Hildebrand <alexander.hildebrand@googlemail.com> writes:

 > Hi there,
 > Does anyone of you have experience with a rootfs with a writable (aufs) overlay?
 > I managed to compile aufs and mount a folder combining the read only
 > rootfs with a read write data overlay. How to switch the rootfs to
 > this mount point? Tried to move the mount point to this folder in the
 > inittab, but this fails with "Too many levels of symbolic links"

I don't have any specific experience with aufs (any specific reasons to
not use the in-kernel overlayfs instead), but you would normally need to
setup the overlay in an initramfs and then switch_root to it before
executing init.

-- 
Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180219/a977b183/attachment.html>
