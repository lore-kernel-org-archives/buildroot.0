From: Avishay Orpaz <avishorp@gmail.com>
Date: Sun, 29 Jul 2012 10:02:34 +0300
Subject: [Buildroot] [PATCH] Added local package support.
In-Reply-To: <20120727085350.GA8573@mail.sceen.net>
References: <20120724042408.GA11558@sapphire.tkos.co.il>
 <1343247448-19993-1-git-send-email-avishorp@gmail.com>
 <50107EAF.3030302@mind.be>
 <CAMkyJgA3+icHUKQ6AS==QQG--RuuptTjgy3KSdJvcwiAPxF3Rg@mail.gmail.com>
 <50124C6D.8050608@mind.be> <20120727101253.15d1af71@skate>
 <20120727085350.GA8573@mail.sceen.net>
Message-ID: <CAMkyJgD7JqwLaOV46YHqjOBOf4yZWBa9OkOeOqGZkktuYmOQHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let me try to make my point with an example. Let's say I'm designing a
linux based digital camera. The software stack will probably include a
bunch of standard software component (kernel, busybox, flash utils etc.),
but there would also be at least one software component that is unique to
the design, and not intended to be shared with other designs - for example,
the GUI implementation of that specific model. This is the kind of software
I expect to see in the "local" directory. Of course this software component
can be put in the "package" directory, but I would think of buildroot as a
tool, which should not be modified and can be easily upgraded.

Regarding to the comment that other files in other directories may need to
be customized - it's very easy to put those files in any directory using
make variables according to one's project organization preference.

Committed or not, I really appreciate everyone's comments.


2012/7/27 Richard Braun <rbraun@sceen.net>

> On Fri, Jul 27, 2012 at 10:12:53AM +0200, Thomas Petazzoni wrote:
> > Le Fri, 27 Jul 2012 10:08:13 +0200,
> > Arnout Vandecappelle <arnout@mind.be> a ?crit :
> > >   What do the others think?
> >
> > I am also a bit skeptical, but it's not yet a final and definitive
> > opinion. Custom packages is one thing, but one also very often need to
> > put stuff in board/ to keep kernel config, patches and various other
> > stuff, though it's true nothing prevent you to use $(TOPDIR)/../ to
> > keep track of all those things.
>
> I don't really see the point of the feature either. Keeping custom files
> in board and local packages in package/<company>/ is very easy to do and
> should suit most people fine. Local packages (those that use the local
> method) have one purpose : ease software development through the
> buildroot environment. I don't think people spend that much time on the
> .mk or Config.in files when using local packages. They spend time on
> the packaged software itself.
>
> --
> Richard Braun
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120729/f305f0e2/attachment.html>
