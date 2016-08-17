From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Aug 2016 22:21:07 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/simh: new package
In-Reply-To: <1471437282-14799-1-git-send-email-lothar.felten@gmail.com>
References: <1471437282-14799-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160817222107.5e27e95e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Aug 2016 14:34:42 +0200, Lothar Felten wrote:
> This package provides the simh multi-system emulator.
> The simh makefile is replaced by a cmake project to handle cross compilation
> correctly. Only a subset of the available simulators is built.

I am a bit concerned by the fact that you are entirely replacing the
upstream build system by a CMake based one. Your patch adding CMake
based build is already 394 lines long, and doesn't support all the
simulators.

Indeed the upstream makefile seems a bit crazy. Have you talked with
upstream to see how those issues can be fixed?

I'm not sure we want to carry in Buildroot a completely new build
system for this package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
