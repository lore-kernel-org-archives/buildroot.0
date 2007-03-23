From: William Somerset <williamsomerset@gmail.com>
Date: Fri, 23 Mar 2007 09:47:16 -0500
Subject: [Buildroot] Problems loading buildroot image to CompactFlash
In-Reply-To: <200703220739.52058.alexander.rigbo@acgnystrom.se>
References: <16732d180703211509g47d56803q56f64dce7f02329b@mail.gmail.com>
	<20070321224109.GC5468@aon.at>
	<200703220739.52058.alexander.rigbo@acgnystrom.se>
Message-ID: <16732d180703230747v38d9b4c7j1784554e9ed7a6a7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm probably missing something here since usually, I just have whatever
flavor of Linux install grub for me but the directions I found on the net
had me copy over the /boot directory I use currently to the flash card.  I'm
using Sabayon Linux 3.2 with a 2.6.18-gentoo-r5 kernel.  The kernel was also
created with genkernel.  This is probably going to be a problem, huh?

Is installing grub as easy and changing the root in the boot prompt and
doing the correct 'install' line?

I'm trying to target either VIA EPIA boards with x86 CPUs or something like
PCEngines WRAP or Soekris net4501.

Also, what is the qemu used for?  I've read it's an emulator similar to
VMware.  I'd rather do this live than emulate an environment.

On 3/22/07, Alexander Rigbo <alexander.rigbo@acgnystrom.se> wrote:
>
> Hi,
>
> AFAIK the boot loader is not "installed" (running lilo with lilo and doing
> setup(hdX) in grub).
> Also, the image created (i take it you have a roofs.<arch>.ext2) is not a
> full
> disk, it's a partition.
>
> Hope this gives you info enough to solve this.
>
> Best regards
> Alexander Rigbo
> ACG Nystr?m AB
>
> On Wednesday 21 March 2007 23.41.09 Bernhard Fischer wrote:
> > On Wed, Mar 21, 2007 at 05:09:35PM -0500, William Somerset wrote:
> > >Hello,
> > >
> > >I'm having problems getting a BuildRoot Image to boot on a
> compactflash.
> > > I got grub installed on the disk but whenever I try to boot the
> > > CompactFlash, I just get a blank screen.  I tried just dd'ing the
> image
> > > to the
> > >compactflash but I get 'missing OS' whenever I boot the compactflash
> that
> > >way.
> > >
> > >Also, I tried installing the Linux Kernel from the menu and it had
> > > problems installing.  This is from getting the copy of buildroot from
> svn
> > > at around 2pm CST today (March 21, 2007).  I loaded the grub prompt,
> > > changed the root to the compact flash and got grub to install to the
> > > compactflash but I guess without a kernel, it's kinda
> pointless.  Should
> > > I just make 1 partition or 2 (one for boot, one for main)?  Also, when
> I
> > > tried making an ISO, I got errors from it not having some place to
> copy
> > > to.
> > >
> > >Does anyone have a walkthrough or anything to help me out getting a
> > >buildroot image to compactflash?
> >
> > - install grub unto the CF
> > - mount the CF at (e.g.) /mnt/l0
> > - tar -C /mnt/l0 -xf /my/rootfs.$myarch.tar
> > - sync && umount /mnt/l0
> > - qemu -snapshot -hda /dev/$cf_device -boot c
> > - enjoy
> >
> > Procedure varies depending on your target, of course. Since you're ia32
> > compatible the above works nicely; Alternatively you can provide a e.g.
> > 512k disk to let grub boot from and use a jffs2 as -hdb or something
> > like that.
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070323/bae29b3a/attachment-0001.htm 
