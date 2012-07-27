From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jul 2012 10:12:53 +0200
Subject: [Buildroot] [PATCH] Added local package support.
In-Reply-To: <50124C6D.8050608@mind.be>
References: <20120724042408.GA11558@sapphire.tkos.co.il>
 <1343247448-19993-1-git-send-email-avishorp@gmail.com>
 <50107EAF.3030302@mind.be>
 <CAMkyJgA3+icHUKQ6AS==QQG--RuuptTjgy3KSdJvcwiAPxF3Rg@mail.gmail.com>
 <50124C6D.8050608@mind.be>
Message-ID: <20120727101253.15d1af71@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Jul 2012 10:08:13 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> >       I'm going to give comments on this patch, even though I'm not
> > sure if I would want to have this feature in buildroot.
> >
> >
> > Why? I think it's very convinient to leave buildroot untouched (and
> > easy to upgrade) and put the system specific packages in a
> > different place.
> 
>   That is currently usually done by (manually) adding a
> packages/<company name>/ directory which contains all the local
> packages, with a manually created Config.in.  So what this patch adds
> is mainly to build Config.in automatically.
> 
> >Anyway, if you don't intend to include the patch please let me know
> >so I won't bother to
> > make corrections.
> 
>   That's why I said immediately that I'm not a big fan of this
> feature.
> 
>   What do the others think?

I am also a bit skeptical, but it's not yet a final and definitive
opinion. Custom packages is one thing, but one also very often need to
put stuff in board/ to keep kernel config, patches and various other
stuff, though it's true nothing prevent you to use $(TOPDIR)/../ to
keep track of all those things.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
