From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Feb 2014 22:38:56 +0100
Subject: [Buildroot] Supporting multiple versions of toolchain
	components?
In-Reply-To: <52FBB150.3000306@mind.be>
References: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52F936C7.4040300@mind.be> <20140210234117.352533a5@skate>
 <52F9D9D0.8090409@mind.be> <20140211093221.28248844@skate>
 <52FA5AD8.4040506@mind.be> <20140212090324.4cb9fe84@skate>
 <52FBB150.3000306@mind.be>
Message-ID: <20140212223856.5d160729@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 12 Feb 2014 18:37:20 +0100, Arnout Vandecappelle wrote:

> > Obviously before sending the patch that adds 2.19, I did do a run-time
> > test of a minimal ARM glibc+Busybox system in Qemu. The amount of
> > testing is minimal, but at least it boots all the way to userspace.
> 
>  Yes, but will you do more runtime experiments with glibc 2.19 in the
> next 6 months? Probably not, because you simply don't need it.

Probably not, indeed. But by introducing 2.19 as an option, the hope is
that a few users will actually try this out.

> > Your point is not entirely moot. C library headers will be different
> > between glibc 2.18 and 2.19, so you could imagine having package build
> > failures specific to a given version of glibc. This is typically what
> > we have with uClibc (and which was discussed at length during the
> > latest meeting), where we have multiple versions of uClibc that don't
> > behave the same as they don't offer the same features. However, the
> > amount of application-visible changes between glibc 2.18 and 2.19 is
> > probably a lot smaller, but maybe not inexistent.
> 
>  I think about one third of our autobuilder configurations use an
> (e)glibc-based toolchain, with varying versions, and AFAIK we've never
> seen a failure on one glibc version but not on others. So I think we can
> safely say it is close to non-existent.

Yes, I agree.

> > I certainly agree with you on this. I would propose to:
> > 
> >  1/ Remove the multiversion selection on Busybox, because I don't
> >     really see why we have this specifically for Busybox.
> > 
> >  2/ Keep a maximum number of three gcc, binutils, gdb and C library
> >     versions. Like: the latest one, the N-1 (default), and the N-2.
> 
>  OK!

Perfect. I'll try to implement this policy, then.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
