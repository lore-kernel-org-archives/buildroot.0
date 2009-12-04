From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 4 Dec 2009 10:12:49 -0600
Subject: [Buildroot] Trying to build in an usual place: /opt instead of /
In-Reply-To: <5cd84ac80912040749h6ab022b8nc221d7ccc5298d7d@mail.gmail.com>
References: <5cd84ac80912010510k26f4af64x6234af2e35adbde1@mail.gmail.com>
	<200912011242.47113.minimod@morethan.org>
	<5cd84ac80912040749h6ab022b8nc221d7ccc5298d7d@mail.gmail.com>
Message-ID: <200912041012.52192.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri December 4 2009, Olivier Perron wrote:
> On Tue, Dec 1, 2009 at 7:42 PM, Michael S. Zick <minimod@morethan.org> wrote:
> > On Tue December 1 2009, Olivier Perron wrote:
> >> [...]
> >> >>>
> >> >>
> >> >> Why not using chroot ?
> >> >>
> >> >
> >> > Because I still need to access /dev ?
> >> >
> >>
> >> Hum... bad answer !
> >> # mkdir /opt/dev
> >> # mount -o bind /dev /opt/dev
> >> before chrooting should do the trick.
> >>
> >
> > You don't need that, unless you want the changes made in
> > the chroot/dev to show up outside of the chroot.
> >
> > Just initialize the device nodes in chroot/dev, they will
> > work just fine there (the kernel uses the device numbers,
> > not the path).
> >
> > Presuming a bare busybox in chroot/bin - (/opt/test/bin)
> > Here is the short version:
> >
> > mount -t proc proc /opt/test/proc
> > mount -t sysfs sysfs /opt/test/sys
> > chroot /opt/test /bin/busybox sh
> > /bin/busybox --install -s
> > mdev -s
> >
> > Your done. ?Have fun.
> >
> > Mike
> 
> Mike,
> 
> this doesn't work (well not completely).
> Once chrooted, when I want to start X I got an error which says:
> Fatal server error:
> xf86OpenConsole: Cannot find a free VT: Inappropriate ioctl for device
> 
> My solution (to mount with the -bind option) works ok.
> 

Allow me to repeat myself:
> > Here is the short version:

Now, I can't see where you mentioned that you wanted anything
*other than* the minimum set of devices.

So, the longer answer:
http://minimodding.com/tiki-index.php?page=FirmwareEvalSystem

And if you really want to learn about what you are trying to do:
http://www.linuxfromscratch.org/

And remember that Google is your friend if the system turns out
to be missing the VT (virtual terminals).  ;)

Mike
> Cheers
> Olivier
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
