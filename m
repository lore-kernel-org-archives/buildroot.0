From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 20:09:30 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <873afwnu6n.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no> <87aba4pj4w.fsf@macbook.be.48ers.dk>
	<20090106183243.GA28479@zelow.no> <873afwnu6n.fsf@macbook.be.48ers.dk>
Message-ID: <1231268970.32308.230.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-06 klockan 19:52 +0100 skrev Peter Korsgaard:
> >>>>> "Thomas" == Thomas Lundquist <lists@zelow.no> writes:
> 
> Hi,
> 
>  >> Maybe. I would just start with the rm .config; make menuconf, select
>  >> arch, save; make
> 
>  Thomas> It's a start of course but is the resulting .config a good
>  Thomas> config or just more or less random?
> 
> Hopefully good - It's the default config of everything, just like any
> new user would see it. If anything is not sensible then we should
> change the defaults.
> 
>  Thomas> (BTW; WCHAR and LOCALE OFF is NOT a special case, it should
>  Thomas> be default.  In my view, also LARGEFILE.)
>  >> 
>  >> You mean default on? They currently default to off, simply because of
>  >> their size impact.
> 
>  Thomas> Default OFF. I haven't messed with g++ lately but it had a tendency 
>  Thomas> to not work without WCHAR ON. It may be back in 3.X days though.
> 
> It work for me here on PPC (gcc 4.2.x / 4.3.x).
> 
>  Thomas> LARGEFILE set to off is another option I'd like to have as a test 
>  Thomas> case but I have a slight feeling that will hinder a release 
>  Thomas> for quite some time..
> 
> WCHAR, LOCALE and LARGEFILE all defaults to off, so that's imho a
> pretty well tested.

I have been running with them on for a long time, since
when I last tried them OFF, there were a lot of packages
which did seemed to require at least WCHAR to build properly for ARM.

There are nice advantages if these packages could be made
to run without WHCAR of course.

A typical issue that pops up from time to time is that
people build the toolchain with a certain configuration
and then finds that they need a different configurtion
to build a package, and do not realize that they 
need to rebuild the toolchain for the changes to take effect.

It would be good to resolve this, and this is why I have
proposed to separate toolchain build.
With SYSROOT in gcc-4 there is really no reason 
to induce people to rebuild the toolchain,
and we might want to support downloading a binary toolchain as well.


Peter Korsgaard <jacmet@uclibc.org>,
BR
Ulf
