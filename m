From: Marc Gauthier <marc@tensilica.com>
Date: Sun, 26 Jul 2009 13:48:14 -0700
Subject: [Buildroot] Write Access to buildroot?
In-Reply-To: <4A6CBAAC.2060309@atmel.com>
References: <4A689265.6030308@atmel.com>
	<87skgmwm6h.fsf@macbook.be.48ers.dk>	<4A69741A.8010903@atmel.com>
	<20090724085603.GL13236@buzzloop.caiaq.de>
	<9E543F22BF68405185D6B77291E4E5EF@aeglos>	<20090724121641.2c4cf8bd@surf>
	<4A699CDD.7060703@atmel.com>	<20090724152448.4d1f5934@surf>
	<4A69D04E.9040408@atmel.com>	<20090724224516.15b39e30@surf>
	<4A6BEE7C.4080308@atmel.com>	<87r5w3syn7.fsf@macbook.be.48ers.dk>
	<4A6C242F.8040704@atmel.com> <878wibslsk.fsf@macbook.be.48ers.dk>
	<4A6CBAAC.2060309@atmel.com>
Message-ID: <522C1DF17AF50042AD8AE87F7887BD3D015DF9ADBA@exch.hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For what it's worth, we have a shared git tree on linux-xtensa.org
for Xtensa arch development of buildroot (we've had it there for
many months before the buildroot project itself switched over to git).

We had to be careful with file ownership/protection (and maybe umask)
to make sure it works smoothly, but once setup, it works quite well.
Everybody has their own userid, no shared user or anything.
We always use the git+ssh://... method to access the tree if we want
to be able to write to it, else anyone can access it read-only using
the usual git://... method -- if you're curious, see:

   http://wiki.linux-xtensa.org/index.php/Repository_Access

One also has to be careful to only push things to this tree.
No playing directly with the tree (such as rebase or otherwise
pointing HEAD backwards in time and possibly committing new changes
from there) which plays havoc with others' clones of the tree.
As long as it's only accessed remotely, this is pretty easy.

In case you notice it out of sync... we've only merged this tree with
the official buildroot tree once in a long while -- were waiting for
the Xtensa arch port to get submitted (which it just has, yeah! :-) and
to setup things to make it easier to catch merges that break things.

-Marc


Ulf Samuelsson wrote:
> Peter Korsgaard skrev:
> >>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> >
> > Hi,
> >
> >  >> We also don't want to require outsiders to learn git in order to
> >  >> contribute patches.
> >  >>
> >  Ulf> It it very different to require people to learn git, from
> >  Ulf> blocking people that wants to use git, to work together.
> >
> > Blocking? Noone is blocking anyone from anything. That
> particular work
> > flow is not used for the official tree, but you can do what you want
> > to with your own trees.
> >
>
> I have requested a capability where multiple people have
> write capability to a tree which can then be pulled
> to the official tree.
>
> It is possible to do this on another git server,
> but that means that it is less visible to other Buildroot users.
>
> It is simple to implement.
> Create the "common" user, and let developers have
> write access to "~common/git", possibly using a symbolic link.
>
> > Don't confuse working together with commit access. The Linux kernel
> > gets contributions from ~1000 people for each release, and yet Linus
> > is the only one having commit access to the official tree.
> >
>
> That comments is irrelevant because I am not asking for commit
> access to the official tree.
>
> BR
> Ulf Samuelsson
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
