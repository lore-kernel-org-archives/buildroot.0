From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 20 Jul 2011 10:44:31 +0300
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <201107191323.36347.arnout@mind.be>
References: <201107191222.19313.arnout@mind.be>
 <87aaca4l1y.fsf@macbook.be.48ers.dk>
 <201107191323.36347.arnout@mind.be>
Message-ID: <CALR4fE+x+juTYQfZyjzK+je_MAU59pJSarKSxNLR_iRvdy-1qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 19, 2011 at 2:23 PM, Arnout Vandecappelle <arnout@mind.be>wrote:

>
> On Tuesday 19 July 2011 12:33:13, Peter Korsgaard wrote:
> > >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> >  Arnout>  I ended up adding the following to my inittab:
> >
> >  Arnout> null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
> >
> >  Arnout>  Does anyone know a more elegant solution?
> >
> > Not really - Besides adding a devtmps_mount() call in kernel_init(), but
> > that's kind of icky as well.
>
>  We could of course use the same trick as for GENERIC_SERIAL...
>
>  Regards,
>  Arnout
>
>
.. or... we can revert ca520507fc15a8213334a76339a3e6d567e91ea0 ... as I
have seen 2-3 people have been reporting similar problems is the last few
months.

see:
http://lists.busybox.net/pipermail/buildroot/2011-May/043266.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110720/62208c11/attachment.html>
