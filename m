From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Sep 2011 13:21:03 +0200
Subject: [Buildroot] [PATCH 02/15] package: enhance infrastructure to
 support source dir override
In-Reply-To: <201109021202.45783.arnout@mind.be>
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <ad6a9779e87399fbd8f70dbafa666006d8c846d1.1314826231.git.thomas.petazzoni@free-electrons.com>
 <201109021202.45783.arnout@mind.be>
Message-ID: <20110902132103.02951d58@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 2 Sep 2011 12:02:44 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> On Wednesday 31 August 2011 23:31:10, Thomas Petazzoni wrote:
> > Those <pkg>_OVERRIDE_SRCDIR variables will be defined by a local
> > makefile included by Buildroot, which will be handled in a later
> > commit.
> 
>  Or on the make command line...

Good point.

>  I use rsync -rltDO --exclude=.svn --exclude=.git:
> 
>  * -rltD instead of -a because I don't want to keep group, owner and 
> permissions (otherwise you'll probably have to fixup permissions
> anyway).
> 
>  * -O because otherwise the directory times will be reset to the
> past, which does not correspond to reality if there are still object
> files lying around. If there would be a dependency on a directory, it
> will be incorrect.
> 
>  * --exclude=.git: if you're doing this for the kernel, you know
> why :-) There should probably be a --exclude=.hg as well.

Sounds like reasonable comments, I'll integrate this for the next
version.

Have you actually tested the patches or are those comments just based
on review?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
