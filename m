From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 13 Oct 2013 18:44:31 +0800
Subject: [Buildroot] Bumping packages: some comments/suggestions
In-Reply-To: <20131013114246.440c3831@skate>
References: <20131013114246.440c3831@skate>
Message-ID: <CAFRkauCECxjxqB5=ufBW5Sve+2aGyMBKSOY+9vpPe0gueV7S1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/10/13 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hello Jerzy and Axel,
>
> Recently, both of you have worked on and contributed a number of
> patches bumping a significant number of Buildroot packages. This is of
> course really great, and I'd like to thank you for those contributions.
>
> That being said, I would have two suggestions:
>
>  *) It would be great if you could check that the reverse dependencies
>     of the package you're bumping still continue to build. For example,
>     Axel bumped 'ortp', but didn't realize bumping it would break
>     the linphone and mediastreamer. While we certainly cannot expect
This is my bad.
I did try to compile ortp with various combination of build config.
I didn't realize the reverse dependencies issue when
I sent the patch bumping ortp version.
A lesson learnt. I'll be more careful when bump version.

>     contributors to test package bumps in all possible configurations
>     (especially for packages having a large number of
>     reverse dependencies), checking at least a few of them is a good
>     idea. Also, when bumping from one major release to another (such as
>     berkeleydb 5.x to berkeleydb 6.x), even more care should be taken.
Also my bad. Will be checking licenses as well when bump versions.

Regards,
Axel

>
>  *) To make this "bumping" effort a bit more systematic, I believe it
>     would be useful to introduce an infrastructure in Buildroot to
>     automatically check if upstream has a new package. In many cases,
>     the upstream site has a directory with all the different versions
>     of the tarball, so checking if there's a newer one in an automated
>     way would be possible. If we do this for many packages, then we can
>     run a script every day, and check if there are new upstream
>     releases available. Debian has such a mechanism with the 'watch'
>     mechanism (see https://wiki.debian.org/debian/watch/). Gentoo has
>     the euscan utility (see https://github.com/iksaif/euscan). It would
>     be nice having something like this, that we could integrate in the
>     Buildroot per-package stats at
>     http://autobuild.buildroot.org/stats/ to get a clear vision of
>     which packages need to be upgraded. If one of you is interested in
>     doing this, it'd be great!
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
