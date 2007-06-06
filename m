From: Philippe Ney <philippe.ney@pardes.ws>
Date: Wed, 6 Jun 2007 23:55:35 +0200
Subject: [Buildroot] problem with openssh
In-Reply-To: <e19d85410706061235g63cadda9s364849b0737a39ec@mail.gmail.com>
References: <e19d85410706050700s69e06497gef032dddb6eef9c9@mail.gmail.com>
	<e19d85410706051935j42739782ndf1307022f2e9031@mail.gmail.com>
	<20070606100917.e0724deb.philippe.ney@pardes.ws>
	<e19d85410706060839l6baf072cte7a5c9c9d58b67ab@mail.gmail.com>
	<e19d85410706061235g63cadda9s364849b0737a39ec@mail.gmail.com>
Message-ID: <20070606235535.ddc532ee.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just forwarding to the list as it seems to be its right destination.

> Hey all,
> 
> Well, both openssh AND samba works perfectly fine with older uclibc
> (0.9.28.3), regardless of which gcc/binutils combo (all combos ive
> tried worked), so now i can pinpoint the problem to uclibc 0.9.29
> (also the svn version fails).
> 
> Thank you so much Philippe for pointing that out - i mistakenly
> thought a newer uclibc (ie, subversion) would be the fix, but it turns
> out an older one is the solution.
> 
> Blessings to you all,
> Elia Yehuda.
> 
> On 6/6/07, z4ziggy <z4ziggy@gmail.com> wrote:
> > Hey Philippe,
> >
> > MANY thanks for that suggestion! ssh works with
> > uclibc-0.9.28.3/gcc-4.0.4/binutils-2.17.
> >
> > i will make more tests to see where it fails to pinpoint the problem
> > and report here.
> >
> > many thanks again!
> >
> > Blessings,
> > Elia.
> >
> > On 6/6/07, Philippe Ney <philippe.ney@pardes.ws> wrote:
> > > > i found a fix for openssh, and i might try it with samba as well.
> > > > although its not a good fix (imo) but it works. i simply added
> > > > "--static" to LDFLAGS in openssh.mk
> > >
> > > Hi,
> > > Did you try uClibc-0.9.28 ?
> > > It works for me with gcc-4.0.3 and binutils-2.17 on arm XScale.
> > > But it certainly works also for many people with uClibc-0.9.29.
> > > The problem must be somewhere else.
> > >
> > > Philippe
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at uclibc.org
> > > http://busybox.net/mailman/listinfo/buildroot
> > >
> >
