From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 20:31:09 +0200
Subject: [Buildroot] [PATCH] Clarify MIPS ABIs support
In-Reply-To: <20120725202503.7ecae923@skate>
References: <1343162828-13060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50102DAA.1030400@mind.be> <20120725202503.7ecae923@skate>
Message-ID: <20120725203109.5d295941@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 20:25:03 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Le Wed, 25 Jul 2012 19:32:26 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
> >   As far as I understand, the situation is a bit similar to PCs, where
> > i386 and x86_64 are in fact quite different even at instruction set
> > level.  So wouldn't it make more sense to distinguish mips and mips64
> > at the 'Target Architecture' level?  Then mips would always select
> > o32, and the ABI choice would only exist for mips64.  And there
> > would be a 1-to-1 mapping between BR2_ARCH and the user choice,
> > which makes more sense to me.
> 
> Makes sense. Gustavo, what do you think?
> 
> >   It would require a bit of research to find out which sub-architectures
> > are 64-bit, of course.
> 
> Right, but it should be doable. The linux-mips.org Wiki has some info,
> and I know someone who has quite a bit of experience with MIPS stuff,
> so I could ask.

Thinking more about this, the way we do things for i386 vs. x86_64 is
not optimal: there are two complete distinct sets of entries for the
processor types. One for i386, one for x86_64. However, there should
normally be a big overlap between the two, since all x86_64 processors
support the i386 architecture. So maybe we should have a single list,
with certain processor not being visible in the i386. This would ensure
consistency between the list of processors available on i386 and x86_64.

Thoughts?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
