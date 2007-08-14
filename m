From: Benjamin Tietz <benjamin@micronet24.de>
Date: Tue, 14 Aug 2007 10:21:46 +0200
Subject: [Buildroot] AUTOTARGETS is not working correctly when applying
In-Reply-To: <1186880076.4742.21.camel@elrond.sweden.atmel.com>
References: <f0528b5b0707040129j262b9e24i774fd06d8d579a2a@mail.gmail.com>
	<20070810185512.GA4186@codepoet.org> <46BE1C56.60508@promwad.com>
	<1186869672.4742.19.camel@elrond.sweden.atmel.com>
	<40546.127.0.0.1.1186870249.squirrel@localhost>
	<1186880076.4742.21.camel@elrond.sweden.atmel.com>
Message-ID: <20070814082146.GA4250@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 12, 2007 at 02:54:36AM +0200, Ulf Samuelsson wrote:
> s?n 2007-08-12 klockan 01:10 +0300 skrev Ivan Kuten:
> > > l?r 2007-08-11 klockan 23:30 +0300 skrev Ivan Kuten:
> > >>
> > > This will help, but will make the "package/Makefile.autotools.in" file
> > > x11r7 specific.
> > >
> > >
> > 
> > May be it makes sense not to introduce x11r7 specific into "package/Makefile.autotools.in"
> >  but instead add 2nd param to AUTOTARGETS - package parent. Nobody knows how many packages like
> >  x11r7 are going to be introduced.
> > 
> > $(eval $(call AUTOTARGETS,libxcb,x11r6))
> > 
> > What do you think?
> > 
> 
> This requires modifications of all the x11r7 packages
> so it is a ton of work.
> Good idea - for someone with time...
It does not, since the second parameter could either be optional and
empty as default. If you really want to change all of the Makefiles, you
could run a sed-skript, what wouldn't be mutch to do.

Benjamin
> 
> 
> > BR,
> > Ivan
> > 
> > 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
