From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Jun 2009 10:43:24 +0200
Subject: [Buildroot] [git commit] Fix Qtopia build with external toolchain
Message-ID: <20090703112133.939BA777CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4dab10d0b2e770be63348e9ff58b9ba195d1b5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is too large, so refusing to show it


The fixes made to qmake.conf for the cross-compiling tools were not
sufficient in the case of an external toolchain, since the CFLAGS were
not taken into account. And the --sysroot option contained in the
CFLAGS are very important for external toolchains to work.

Additionally, it makes sure that Qtopia is compiled with the proper
CFLAGS, even if an external toolchain isn't used.
---
 package/qtopia4/qtopia4.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
