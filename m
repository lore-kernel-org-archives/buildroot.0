From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:02:22 +0200
Subject: [Buildroot] [PATCH] autobuild-run: remove only tarballs from
 download dir
In-Reply-To: <20180415194915.GE21958@scaer>
References: <20180413133431.19449-1-ricardo.martincoski@gmail.com>
 <20180415214257.1e90704a@windsurf.numericable.fr>
 <20180415194915.GE21958@scaer>
Message-ID: <20180415220222.6413547a@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Apr 2018 21:49:15 +0200, Yann E. MORIN wrote:

> > Just to check how this is supposed to work. We have this:
> > 
> >  dl/<package>/git/.git
> > 
> > Correct ?
> > 
> > So you're idea is that when we are inside dl/<package>/git/, one of the
> > sub-directories is .git, and therefore we shouldn't remove anything in
> > dl/<package>/git/ ?
> > 
> > My concern is that I'm not sure if what you've done prevents from
> > removing files inside dl/<package>/git or only inside
> > dl/<package>/git/.git. I would find it more to do something like:
> > 
> > 	if "git" in d:
> > 		d.remove("git")
> > 
> > but perhaps you haven't done this for some good reason ?
> > 
> > Another concern is how to fix those autobuilders that have already
> > removed some random files from their cached Git repositories? Should we
> > ask the people who run those autobuilders to entirely wipe the download
> > folders of their autobuilder instances ? Or do we have a smart (but
> > simple) thing to do to avoid this ?  
> 
> For this last part, we've already discused this with Ricardo in another
> thread: we run git-fsck, and if there is an error, we ditch the git tree
> and clone from scratch.

OK, so in practice removing random files inside the git/ folders should
not cause any problem ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
