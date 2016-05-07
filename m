From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 15:11:17 +0200
Subject: [Buildroot] Reproducible builds
In-Reply-To: <20160430074358.GE1781@hermes.click-hack.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
Message-ID: <20160507151117.33428d9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gilles,

On Sat, 30 Apr 2016 09:43:58 +0200, Gilles Chanteperdrix wrote:

> some time ago, I worked on getting reproducible builds for
> buildroot. I take "reproducible builds" in a broader sense than what
> Debian does for instance: in the case of buildroot, we would like
> the built binaries to be as independent of the build environment as
> possible, so that in addition to getting identical binaries when
> building twice on the same machine, we also get identical binaries
> when building on a different distribution.

First of all, thanks a lot for working on this! It's definitely an
interesting and useful topic.

> So far, I got
> reproducible builds for a (relatively reduced) subset of buildroot
> packages, on a Debian jessie and Slackware 14.1, with as many
> differences in the distributions configuration as I could find
> (timezone, locale, date, time, etc... even the awk flavor used). The
> only thing I have to get identical is the build path, this is what
> Debian does, a patch has been proposed a long time ago to allow gcc
> to avoid the dependence between the __FILE__ macro and the build
> path, but it does not seem to have been merged:
> https://mail-index.netbsd.org/tech-toolchain/2009/02/17/msg000577.html
> 
> I expected to be able to clean up the patches before submission (as
> many patches do the same thing, like overriding the __DATE__ and
> __TIME__ macros in order to avoid depending on the build time, so
> this could probably be made generic by buildroot core), but I am not
> going to have time soon to do that, so here come the patches as they
> are, in order to spark discussion and gather remarks, before I have
> time to do more. The patches are based on the 2015.11.1 release.

Indeed, as you say yourself, some of your patches are not mergeable
as-is. However, several of them are not related, or directly related to
reproducible builds (some of your patches add new packages, etc.).

One first thing that is missing is your Signed-off-by line on the
patches, which we require for all Buildroot contributions (exactly like
for the Linux kernel).

Another thing that worries me is all the patches/modifications needed
by each package to make their build "reproducible". Do you expect such
patches to be merged in the respective upstream projects?

Finally, I'm also concerned by the testability of the reproducible
build feature. To make sure such a feature work, we would need to do
some automated build testing of the same configuration in various
environments/configurations and ensure they provide the same output.
This is clearly not impossible to do, but there's quite some work
involved to set up such an infrastructure.

I'll review some of your patches (when it makes sense). However, I'll
mark them all as "RFC" in our patch tracking system: since none of them
have a Signed-off-by line, we can't even take them. It would be good if
you could resend first with your SoB line the patches that are not
related to the reproducible builds. It would help reduce your stack of
patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
