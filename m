From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Jul 2010 17:29:01 +0200
Subject: [Buildroot] [git commit master 1/1] Add support for uclibc NPTL
	toolchain.
Message-ID: <20100729154311.82063834F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cfbf8abc33d86a0cf5c1bb3e0817a22009b7f301
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch modifies current toolchain build sequence so that
NPTL enabled toolchain can be built. The new sequence works
well with linuxthreads as well.

It introduces a new pass for gcc cross compilation. The new
sequence is binutils->gcc-initial->linux-headers -> uclibc-configured
(some cheats to generate phony shared libc.so and libm.o)
-> gcc-intermediate(with shared lib support) -> uclibc -> gcc-final

I also added a new sample config arm_nptl_toolchain_defconfig which
builds the toolchain and busybox.

I have only tried it on arm. However it should work for other
architectures which support NPTL on uclibc e.g. mips, sh, x86, ppc, x86_64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
