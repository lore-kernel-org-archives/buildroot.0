From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 21:58:22 +0100
Subject: [Buildroot] [PATCH 5/8] linux: add the generic help rules
In-Reply-To: <20160310203438.GF3424@free.fr>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <a92e7f048404917f9c9e7ed62c7041af04bf5934.1457561521.git.yann.morin.1998@free.fr>
 <56E0B5F5.9040109@mind.be> <3817786.Ntra8H592Z@sagittea>
 <20160310103934.0aaef6d1@free-electrons.com>
 <20160310203438.GF3424@free.fr>
Message-ID: <20160310215822.5ac5f1c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Mar 2016 21:34:38 +0100, Yann E. MORIN wrote:

> > +define BUSYBOX_HELP
> > +       @echo '  busybox-baz            - do stuff'
> > +endef
> 
> There is one thing here that bothers me: duplicating the layout of the
> help text in that many locations.
> 
> Having the macro be used means we can change that layout (e.g. to
> accomodate for larger rules) in a single place, and
> magically^Wautomatically see all the help texts all properly indented
> at once.

How often have we changed this layout over the years? I'd say probably
never. So why bother?

> > +HELP_HOOKS += BUSYBOX_HELP
> 
> To be done in pkg-generic, of course. ;-)

Well, if we are to do this in pkg-generic, then we should also do it
for TARGET_FINALIZE_HOOKS (but I agree it would be good idea).

> > This way, it is just a function call, and the package, or external.mk
> > can do whatever it wants in terms of formatting the help text.
> > Including iterating on variables, showing the contents of a file, or
> > whatever.
> 
> Well, remember that all this is *only* about documented the
> package-specific rules, not any arbitrary package help.
> 
> Do we want to allow for any arbitrary package help? No; please, no.

Of course we want. And just like any other thing in Buildroot, bad
things will not creep into the main tree because we review stuff.

It is *trivial* to realize that a bad help text is being added, much
more than many other things that we already have to check when
reviewing patches.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
