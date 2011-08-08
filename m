From: Heiko Helmle <helman@gmx.net>
Date: Mon, 08 Aug 2011 22:07:15 +0200
Subject: [Buildroot] Problems with udev buildroot
Message-ID: <20110808200716.101270@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-- snip --
[hel at verflixtsl6 xtest]$ grep DEVTMPFS build/linux-2.6.39.4/.config 
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
-- snip --

I'm using i386 defconfig without any changes (yet) - this seems to enable DEVTMPFS by default.

But after a rebuild with the same .config it looks different now - I'll do a clean rebuild and check again.

> ----- Urspr?ngliche Nachricht -----
> Von: Peter Korsgaard
> Gesendet: 08.08.11 21:43 Uhr
> An: Heiko Helmle
> Betreff: Re: Problems with udev buildroot
> 
> >>>>> "Heiko" == Heiko Helmle <helman@gmx.net> writes:
> 
> ?Heiko> Hello
> ?Heiko> Hit the send button too early :)
> 
> ?Heiko> it seems like /dev/null is missing and the generated image isn't able to mount anything...
> 
> Do you have CONFIG_DEVTMPFS_MOUNT enabled in the kernel? If so, that
> should take care of /dev/null.
> 
> -- 
> Bye, Peter Korsgaard
