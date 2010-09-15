From: Malte Starostik <m-starostik@versanet.de>
Date: Wed, 15 Sep 2010 15:28:32 +0200
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>
References: <29591683.post@talk.nabble.com> <20100915133124.604f8b74@surf>
	<SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>
Message-ID: <201009151528.32771.m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mittwoch, 15. September 2010, 14:39:37 schrieb Johnny Beardsmore:
> > You have mistakenly unselected the generation of an ext2 image in
> > "Target filesystem options". The generation of an ext2 image is enabled
> > by default when you start a fresh configuration, so if it's not
> > enabled, it's because you have unselected it somehow.
> 
> What does creating this file allow me to do (other than apply the
> previously mentioned e2fsck to it)?  I assume I'll still be transfering
> all the same stuff to the target, but do I also include this file, and if
> so, where should it be located?

It's an EXT2 image file.  i.e. this file contains a perfect bitwise copy of 
what belongs on your device to get your rootfs.  Just like a hard 
disk/floppy/CD image.  You can dd if=rootfs.ext2 of=yourtargetdevicenode to 
transfer it.  Of course that will delete any pre-existing files from the 
target device so watch out.  What to put in place of yourtargetdevicenode 
depends on how you're accessing your target's storage device.

Cheers,
Malte
