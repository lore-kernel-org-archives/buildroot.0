From: Johnny Beardsmore <jny0@hotmail.com>
Date: Mon, 13 Sep 2010 08:45:56 +0000
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <20100913102031.03481d63@surf>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>,
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>,
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>,
	<20100913102031.03481d63@surf>
Message-ID: <SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


My understanding of running e2fsck is that it should only be done on an
unmounted file system (or setting to read-only, but I've never actually
done this).  I've only ever run it on hda (usually a hard disk or flash
drive) or sda (usually a usb stick) after a umount.  For me to e2fsck
on the build machine means that I'm applying it to files on a mounted
file system, not a complete unmounted drive.  This is where I'm getting
confused.



I'm obviously lacking some fundermental understanding of what e2fsck
does.  I know to run it when advised to after repartitionning (entire)
drives with fdisk, and if I don't then sooner or later, inode errors
start popping up, and data gets lost.  I'm getting the advisory on
start-up and as I'd expect, I'm getting inode errors on occasion.  What
I can't seem to do is use the fix I'd normally apply.

> Date: Mon, 13 Sep 2010 10:20:31 +0200
> From: thomas.petazzoni at free-electrons.com
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] EXT2-fs error
> 
> Hello,
> 
> On Mon, 13 Sep 2010 07:51:55 +0000
> Johnny Beardsmore <jny0@hotmail.com> wrote:
> 
> > 1) e2fsck the rootfs file on the build machine.  This creates an error thus:
> 
> Yann Morin has already told you that you are trying to run e2fsck on a
> tarball. A tarball is not an ext2 image, so obviously it cannot work.
> 
> What you're doing is exactly as if your trying to run an image
> verification program on a text document. It doesn't work because it
> makes no sense to try it in the first place.
> 
> Regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100913/dc32184d/attachment.html>
