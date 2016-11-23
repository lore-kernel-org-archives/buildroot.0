From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 23 Nov 2016 01:37:23 -0500
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <315eabd4-eb7f-2e83-c8f8-caa5a3cd3099@mind.be>
References: <20161122212534.GA3529@free.fr>
 <315eabd4-eb7f-2e83-c8f8-caa5a3cd3099@mind.be>
Message-ID: <20161123063723.sy6vf3vfscrtg45e@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 23, 2016 at 12:02:19AM +0100, Arnout Vandecappelle wrote:
> 
> 
> On 22-11-16 22:25, Yann E. MORIN wrote:
> > One solution that would make it work in all cases would be:
> > 
> >   - do the target-finalize actions in a copy of target/
> >   - generate, filesystem images form that copy
> >   - trash the copy
> >   - trash pseudo DB
> 
>  This could fit pretty well in a per-package-staging like approach (but then per
> package target, obviously). So each package installs in its own version of the
> target directory, and at the end everything is put together into the final
> target. The latter can be done under pseudo.
> 
>  BTW, it's not really needed to repeat all the makedevs etc. steps under pseudo
> for every filesystem, we could just do that once, and then generate each
> filesystem (under pseudo again of course). But that doesn't fix the issues with
> rebuilding, of course.
> 

Indeed... or (even better?), run makdevs every time the makedevs_table.txt is
updated.

> > Another possibility would be to always do changes in target/ under
> > pseudo:
> >   - installing packages
> >   - taget-finalize
> >   - filesystem generation
> 
>  I think this option is where we want to go long-term. Packages are meant to be
> installed under sudo, so installing them under pseudo is a good idea.
> 

Agree.

>  It's not so trivial for us, though. In openembedded they can easily do the
> equivalent of install-target under pseudo, but we can't because the commands run
> under individual shells in make. There are a few possibilities to work around
> that, but it needs some thinking.

I am not sure to understand...
