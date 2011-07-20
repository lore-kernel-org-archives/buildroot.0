From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Jul 2011 10:03:14 +0200
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <CALR4fE+x+juTYQfZyjzK+je_MAU59pJSarKSxNLR_iRvdy-1qg@mail.gmail.com>
References: <201107191222.19313.arnout@mind.be>
 <201107191323.36347.arnout@mind.be>
 <CALR4fE+x+juTYQfZyjzK+je_MAU59pJSarKSxNLR_iRvdy-1qg@mail.gmail.com>
Message-ID: <201107201003.15136.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 20 July 2011 09:44:31, Diego Iastrubni wrote:
> On Tue, Jul 19, 2011 at 2:23 PM, Arnout Vandecappelle <arnout@mind.be>wrote:
> > On Tuesday 19 July 2011 12:33:13, Peter Korsgaard wrote:
> > > >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> > >  Arnout>  I ended up adding the following to my inittab:
> > >  
> > >  Arnout> null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
> > >  
> > >  Arnout>  Does anyone know a more elegant solution?
> > > 
> > > Not really - Besides adding a devtmps_mount() call in kernel_init(),
> > > but that's kind of icky as well.
> >  
> >  We could of course use the same trick as for GENERIC_SERIAL...
> >  
> >  Regards,
> >  Arnout
> 
> .. or... we can revert ca520507fc15a8213334a76339a3e6d567e91ea0 ... as I
> have seen 2-3 people have been reporting similar problems is the last few
> months.
> 
> see:
> http://lists.busybox.net/pipermail/buildroot/2011-May/043266.html

 Call me stupid, but I don't see how that would help: the whole point is that 
I'm not using udev but devtmpfs...

 BTW, it looks like there never was any reply to your original post: /sys is 
mounted by the 'mount -a' in inittab, which looks at /etc/fstab and finds a 
/sys line there.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
