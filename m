From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Dec 2010 16:05:56 -0300
Subject: [Buildroot] [PATCH 00/13] Toolchain rework, take 2
Message-ID: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the second batch of patches for the internal toolchain rework.
I've included the first batch since they're not in mainline yet.
The idea is to get testers, feedback and get it in mainline soon.

gmp: converted to package, renamed from libgmp.

php: refer to gmp instead of libgmp.

mpc: converted to package, renamed from libmpc.

mpfr: converted to package, renamed from libmpfr.

sstrip: converted to package.

binutils: converted to package, added version 2.21.

toolchain: move the sysroot to the host directory.
It's now under $HOST_DIR/usr/tuple/sysroot

gcc: minor cleanup, change target and hooks to host dir.

gdb: converted to package, added version 7.2.

uclibc: install tools to host dir,

Also fix a small bug in the package infra to avoid patch duplication between
host and target packages.

TODO: convert gcc, uclibc, kernel-headers, elf2flt & mklibs.
TODO: update documentation.

STATE: working, tested with ARM and PPC targets.
