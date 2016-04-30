From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:43:58 +0200
Subject: [Buildroot] Reproducible builds
Message-ID: <20160430074358.GE1781@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

some time ago, I worked on getting reproducible builds for
buildroot. I take "reproducible builds" in a broader sense than what
Debian does for instance: in the case of buildroot, we would like
the built binaries to be as independent of the build environment as
possible, so that in addition to getting identical binaries when
building twice on the same machine, we also get identical binaries
when building on a different distribution. So far, I got
reproducible builds for a (relatively reduced) subset of buildroot
packages, on a Debian jessie and Slackware 14.1, with as many
differences in the distributions configuration as I could find
(timezone, locale, date, time, etc... even the awk flavor used). The
only thing I have to get identical is the build path, this is what
Debian does, a patch has been proposed a long time ago to allow gcc
to avoid the dependence between the __FILE__ macro and the build
path, but it does not seem to have been merged:
https://mail-index.netbsd.org/tech-toolchain/2009/02/17/msg000577.html

I expected to be able to clean up the patches before submission (as
many patches do the same thing, like overriding the __DATE__ and
__TIME__ macros in order to avoid depending on the build time, so
this could probably be made generic by buildroot core), but I am not
going to have time soon to do that, so here come the patches as they
are, in order to spark discussion and gather remarks, before I have
time to do more. The patches are based on the 2015.11.1 release.

Regards.

-- 
					    Gilles.
https://click-hack.org
