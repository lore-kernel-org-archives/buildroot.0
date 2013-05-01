From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Wed, 01 May 2013 11:08:59 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-04-30
In-Reply-To: <20130501063541.96C6052C5E5@lolut.humanoidz.org>
References: <20130501063541.96C6052C5E5@lolut.humanoidz.org>
Message-ID: <5180DBAB.1050408@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

Am 01.05.2013 08:35, schrieb Thomas Petazzoni:
> Status         : NOK
> Failure reason : directfb-1.6.3
> Architecture   : i686
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2013-04-30 09:27:43
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=7d97a09497174cbf6bd67894c361a17c61cbd41e
> End of log     : http://autobuild.buildroot.net/results/03465f0e14accc8d8f8fc2640b7a0dd8bec594e4/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/03465f0e14accc8d8f8fc2640b7a0dd8bec594e4/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/03465f0e14accc8d8f8fc2640b7a0dd8bec594e4/config
> Defconfig      : http://autobuild.buildroot.net/results/03465f0e14accc8d8f8fc2640b7a0dd8bec594e4/defconfig

this error happen in various files:

gfxdrivers/cyber5k/cyber5k.c
gfxdrivers/radeon/radeon_crtc1.c
gfxdrivers/cle266/uc_primary.c
gfxdrivers/unichrome/uc_primary.c

This error is triggered by --with-gfxdrivers or --with-inputdrivers.

There are some more little issues that can happen because of three
missing header files in the archive and a wrong usage of the
imlib2-config file. The errors are written to upstream, until now
without any response.

Locally I prepared a patch for some times for the visible errors by the
autobuilders (originally from Gentoo) an two more patches to fix the
other issues. For now I haven't much time to prepare a Buildroot patch,
hopefully I can send them at the weekend.

Regards
Carsten
