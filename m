From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Feb 2014 09:32:21 +0100
Subject: [Buildroot] Supporting multiple versions of toolchain components?
In-Reply-To: <52F9D9D0.8090409@mind.be>
References: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52F936C7.4040300@mind.be> <20140210234117.352533a5@skate>
 <52F9D9D0.8090409@mind.be>
Message-ID: <20140211093221.28248844@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

(Renaming the thread topic to attract readers!)

On Tue, 11 Feb 2014 09:05:36 +0100, Arnout Vandecappelle wrote:

> > My plan was to offer no more than two versions: N-1 and N, so that we
> > can add N, and give it some testing before having all users move
> 
>  I don't think there will be a lot of testing happening there...

That is indeed true, but I'm pretty sure some advanced users test the
latest versions of the various components.

> > Do we have a reason to keep multiple versions for binutils, gcc and
> > gdb, but not for glibc?
> 
>  No, I don't think we have a reason to keep multiple versions for
> binutils, gdb, and also busybox BTW.

Having multiple versions of busybox seems clearly useless to me. For
the other ones, my opinion is more balanced.

But switching to only one version for binutils, gcc and gdb would
certainly be a change from the Buildroot tradition. Not saying whether
this is good or bad, but it's clearly moving away from what we have
been doing for a long time.

>  For gcc it's a bit more appropriate. I have seen (proprietary) packages
> that fail to build with a different gcc version - usually because of
> -Werror and different warnings in -Wall.

Or also because of things like:
http://git.buildroot.net/buildroot/commit/package/gcc?id=c443c2be1768ebbdcb76c55d0a08fd7c983488c8.
And because very often, the .0 of a gcc release is broken on some
architectures.

>  Having multiple versions also means that you need:
> 
> - multiple autobuilder instances (preferably for all architectures) to
> cover both versions;

That's not true. A single autobuilder instance can work on as many
toolchain configurations as you want. My autobuilder instance chooses
randomly between the configurations at
http://autobuild.buildroot.org/toolchains/configs/free-electrons/.

> - legacy stuff for the old versions;

Right.

> - a deprecation path for the old versions.

I don't really see why. For all packages, we're just bumping. For
gcc/binutils/gdb/uClibc, we're keeping older versions around a little
bit longer. Provided with have the Config.in.legacy safety net, I don't
see why we should go through a deprecation path for those old versions,
while we aggressively bump all other packages without any deprecation.

>  So it's really quite a bit of overhead for IMHO limited advantage.

Again, I believe what you're proposing is a fairly radical move from
the Buildroot tradition. So we need to get some consensus or decision
here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
