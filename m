From: Azra Aiyl <azraiyl@gmail.com>
Date: Fri, 18 Apr 2008 22:14:39 +0200
Subject: [Buildroot] gcj on any platform
In-Reply-To: <200804181312.08925.bcook@bpointsys.com>
References: <a9067d050804181012h7b686733i4bcfde2cfb9f253e@mail.gmail.com>
	<200804181312.08925.bcook@bpointsys.com>
Message-ID: <a9067d050804181314w76b5de27v32a6e06c9b7c93da@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your idea. Memory is not the problem (64 MB) but Flash (8
MB). Following page http://www.linuxjournal.com/article/8757 states
that you should able to strip the statically linked executable. But if
you say this is not true ("not true" means, as heavy as with shared
libs), then it's one more reason to try it with another
implementation.

2008/4/18, Brent Cook <bcook@bpointsys.com>:
> On Friday 18 April 2008 12:12:18 Azra Aiyl wrote:
> > Hi,
> >
> > While looking through this archive I can see at least 3 persons who
> > try to compile a gcj (they got no answers). I've tried the same thing
> > for ppc and i386 but always get the same compile error. While googling
> > i was able to collect the following statements.
> >
> > - libgcj needs unicode
> > - uClibc does not support unicode
> > - glibc supports unicode
> > - glibc does not support full statical linking
> >
> > I conclude from this statements:
> >
> > - it is currently not possible no build a gcj with uclibc
> > - nor is it possible to build a statically linked programm with
> > glibc-gcj and let it run on a platform with uclibc
> >
> > If anyone here says I'm wrong then I'll try to build it on my own
>
> As a workaround, you could include shared glibc with your libgcj app in a
> chroot environment on top of your uclibc environment. This would be about
> as resource-heavy as a statically linked executable, if memory is not a
> limiting factor.
>
