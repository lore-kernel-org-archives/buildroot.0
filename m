From: John Voltz <john.voltz@gmail.com>
Date: Fri, 21 Mar 2008 11:24:58 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1:
	avr32_patches_break_x86
In-Reply-To: <d6cda7730803210814v1cbc6b73ge6e7cdf65a0b5f9@mail.gmail.com>
References: <20080321112103.A34573C2F3@busybox.net>
	<87lk4cxq51.fsf@macbook.be.48ers.dk>
	<46a136670803210455l30fffb0dx90c449c7aa5c551e@mail.gmail.com>
	<d6cda7730803210814v1cbc6b73ge6e7cdf65a0b5f9@mail.gmail.com>
Message-ID: <46a136670803210824y45035bd4u50dfa5446b9e8003@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm doing a full build for x86 right now with gcc 4.2.1 and kernel 2.6.24.3.
I'm using all of the patches except for the AVR32 900 series. I want to see
how many of the problems remain or disappear.  All of the AVR32 patches came
from Atmel's buildroot, so I don't think their version will work any
differently.

Where is the prepatched gcc available from? Is this a binary or source code?


John


On Fri, Mar 21, 2008 at 11:14 AM, Thiago A. Corr?a <thiago.correa@gmail.com>
wrote:

> Actually, it was unstable before.... I lost the a whole week's work
> trying to figure out why init crashes, and still haven't figured out.
> Even tried different gcc versions.
>
>
> VFS: Mounted root (jffs2 filesystem).
> Freeing init memory: 64K (90000000 - 90010000)
> init[1]: segfault at 00000000 pc 00000000 sp 7f9aee9c ecr 20
> init has generated signal 11 but has no handler for it
> Kernel panic - not syncing: Attempted to kill init!
>
> I'm going back revisions to find one that works (atmel's buildroot
> fork works). Perhaps we could use the external toolchain for now, as
> it was before, where it downloads a pre-patched gcc for AVR32 instead
> of applying patches. (?)
>
> Kind Regards,
>   Thiago A. Correa
>
> On Fri, Mar 21, 2008 at 8:55 AM, John Voltz <john.voltz@gmail.com> wrote:
> > I'd rather leave it unusable until Atmel (or someone else) can fix it
> > properly. It has caused way too many people headaches and wasted LOTS of
> > people's time tracking down the causes of bugs and weirdness.
> >
> > John
> >
> >
> >
> >
> > On Fri, Mar 21, 2008 at 7:39 AM, Peter Korsgaard <jacmet@uclibc.org>
> wrote:
> > > >>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:
> > >
> > >  ninevoltz> Author: ninevoltz
> > >  ninevoltz> Date: 2008-03-21 04:21:02 -0700 (Fri, 21 Mar 2008)
> > >  ninevoltz> New Revision: 21439
> > >
> > >  ninevoltz> Log:
> > >  ninevoltz> current avr32 gcc patches break x86 and possibly other
> > >  ninevoltz> systems. moving bad patches to separate directory until a
> > >  ninevoltz> proper fix is made. discovered by jacmet and Dr. Nigel
> > >  ninevoltz> Kukard
> > >
> > > Thanks!
> > >
> > > So I take it that gcc 4.2.1 is broken on AVR32 now? Perhaps you could
> > > add a conditional in gcc-uclibc-4.x.mk like the ones for ARM to apply
> > > these patches for AVR32?
> > >
> > > --
> > > Bye, Peter Korsgaard
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at uclibc.org
> > > http://busybox.net/mailman/listinfo/buildroot
> > >
> >
> >
> > _______________________________________________
> >  buildroot mailing list
> >  buildroot at uclibc.org
> >  http://busybox.net/mailman/listinfo/buildroot
> >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080321/264b9302/attachment-0001.htm 
