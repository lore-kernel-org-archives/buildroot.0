From: Herve Codina <herve.codina@bootlin.com>
Date: Fri, 25 Jun 2021 09:15:48 +0200
Subject: [Buildroot] [PATCH 06/15] package/pkg-generic.mk: Introduce
 <PKG>_PER_PACKAGE_TWEAK_HOOKS
In-Reply-To: <20210623144020.4f187c53@windsurf>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-7-herve.codina@bootlin.com>
 <20210622203909.GJ44262@scaer> <20210623144020.4f187c53@windsurf>
Message-ID: <20210625091548.6d88bc00@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 23 Jun 2021 14:40:20 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue, 22 Jun 2021 22:39:09 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Ah, yes, yes, now I see. OK, so here's a suggestion for a commit log:
> > 
> >     package/pkg-generic: add early pre-configure hooks
> > 
> >     Currently, when a package needs to modify files it inherits from its
> >     dependencies, because they contain paths, we can only do that in a
> >     pre- or post-configure hook.
> > 
> >     However, whatever is done as part of those hooks, will be accounted
> >     to the package itself, and thus will trigger file-overwrite detection.
> > 
> >     So, we need a way to be able to actually modify files before we
> >     start monitoring for them.  
> 
> "before we start monitoring changes in those files".
> 
> >     We introduce a new set of hooks that an individual package can set,
> >     or that a package infra can set, and that are called right before
> >     we snapshot the state of target, and host (to which staging belongs),  
> 
> But yes, you've perfectly understood the problem being solved here!
> 

This will be the new commit log.

Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
