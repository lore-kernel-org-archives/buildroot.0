From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 09:09:04 +0200
Subject: [Buildroot] Bumping packages: some comments/suggestions
In-Reply-To: <525B0AEF.9030406@trzebnica.net>
References: <20131013114246.440c3831@skate>
	<525B0AEF.9030406@trzebnica.net>
Message-ID: <20131014090904.1f20fcf4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Sun, 13 Oct 2013 23:04:47 +0200, Jerzy Grzegorek wrote:
> 
> 
> Hi Thomas,
> 
> 
> > Hello Jerzy and Axel,
> >
> > Recently, both of you have worked on and contributed a number of
> > patches bumping a significant number of Buildroot packages. This is of
> > course really great, and I'd like to thank you for those contributions.
> >
> > That being said, I would have two suggestions:
> >
> >   *) It would be great if you could check that the reverse dependencies
> >      of the package you're bumping still continue to build. For example,
> >      Axel bumped 'ortp', but didn't realize bumping it would break
> >      the linphone and mediastreamer. While we certainly cannot expect
> >      contributors to test package bumps in all possible configurations
> >      (especially for packages having a large number of
> >      reverse dependencies), checking at least a few of them is a good
> >      idea. Also, when bumping from one major release to another (such as
> >      berkeleydb 5.x to berkeleydb 6.x), even more care should be taken.
> >
> >   *) To make this "bumping" effort a bit more systematic, I believe it
> >      would be useful to introduce an infrastructure in Buildroot to
> >      automatically check if upstream has a new package. In many cases,
> >      the upstream site has a directory with all the different versions
> >      of the tarball, so checking if there's a newer one in an automated
> >      way would be possible. If we do this for many packages, then we can
> >      run a script every day, and check if there are new upstream
> >      releases available. Debian has such a mechanism with the 'watch'
> >      mechanism (see https://wiki.debian.org/debian/watch/). Gentoo has
> >      the euscan utility (see https://github.com/iksaif/euscan). It would
> >      be nice having something like this, that we could integrate in the
> >      Buildroot per-package stats at
> >      http://autobuild.buildroot.org/stats/ to get a clear vision of
> >      which packages need to be upgraded. If one of you is interested in
> >      doing this, it'd be great!
> 
> Thanks for your suggestions.
> Do you mean something like this ?
> 
> Package name        Current version       New upstream releases Reverse 
> dependencies
> ======================================================================================= 
> 
> ...
> apr ............... 1.4.6 ........................................ 
> apr-util log4cxx
> apr ..................................... 1.4.8
> apr-util .......... 1.4.1
> apr-util ................................ 1.5.1
> apr-util ................................ 1.5.2

I'm not sure listing all reverse dependencies will actually be useful
and/or possible. But yet, the idea is to add a mechanism that allows to
automatically check, for a given package, if there is a new upstream
version available.

Also, I believe there is no need to list multiple "new" upstream
releases (as you did for apr-util above), listing the latest one
available is fine.

Again, for now, the core of the problem is to be able to *detect* when
an upstream version is available for a given package. Once that is
done, we will see at integrating that into the statistics page I
mentioned earlier, and do all the automated execution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
