From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Aug 2013 11:03:12 +0200
Subject: [Buildroot] MesaLib
In-Reply-To: <521F0A7A.5010906@lucaceresoli.net>
References: <A3285828-B3A0-4875-98F8-96A2BF7DD889@deadfrog.net>
 <20130829102659.6240bcb9@skate> <521F0A7A.5010906@lucaceresoli.net>
Message-ID: <20130829110312.0cea5997@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Thu, 29 Aug 2013 10:46:50 +0200, Luca Ceresoli wrote:

> >> Should 7.10.3 be in the repository or is the buildroot source wrong?
> > The sources.buildroot.net mirror is updated only when a Buildroot
> > release is made. The last stable release is currently 2013.05, which
> > was using MesaLib 7.10.1, which explains why it is available from our
> > mirror.
> 
> Indeed not:
> 
> $ git show 2013.05:package/x11r7/mesa3d/mesa3d.mk | grep VERSION
> MESA3D_VERSION = 7.10.3
> MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
> MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
> $

Doh, you're right. The commit was from June 2012, not June 2013! So
indeed 2013.05 already pointed to 7.10.3. Sorry for the confusion :-(

So indeed, there's something wrong going on with how the mirror is
updated. We've had 7.10.3 since almost a year and it's not in our
mirror.

> But the sources on ftp.freedesktop.org have been moved from pub/mesa/7.10.3/
> topub/mesa/old_versions/7.x/7.10.3/, apparently around Aug 12th, 2013.
> This is unfortunately a recurring bad habit.:(
> 
> Has anybody here ever asked the freedesktop guys to refrain from moving
> files around?

I don't think we ever did that for Mesa.

> > The bump to 7.10.3 was done by commit
> > 53cea4462c67a6707bf8dad83fa928262e44fce9 in June 2013, i.e after the
> > 2013.05 release. Since the 2013.08 release hasn't been made yet, I
> > believe Peter has not updated the Buildroot mirror, and therefore it
> > doesn't contain for the moment all the new versions of the tarballs
> > that have been upgraded since 2013.05.
> 
> Apparently this was not done for 2013.05, or it didn't work for mesa3d.
> Peter, any idea? Otherwise, can you force the download now to fix this?
> 
> Anyway, 7.10.3 that is a pretty old release (~2 years old), there are 
> many more
> recent ones. Ryan, you may try to bump version. Releases since 8.0 are 
> in the
> "standard" download directory at ftp.freedesktop.org.

Note that Spenser Gilliland is currently reworking the Mesa package
quite significantly. In the recently posted "[Buildroot] [PATCH 4/6]
mesa3d: reorganize, modularize, and bump to version 9.1.6", he bumped
Mesa to a recent version.

> Or, for a quick workaround, you may just change the URL in
> package/x11r7/mesa3d/mesa3d.mk.

Can you cook a patch for mesa3d.mk to fix this for the 2013.08 release
(since Spenser patch will not be part of 2013.08) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
